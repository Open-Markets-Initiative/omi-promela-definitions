/*
 * Coinbase Orders Api
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
 *   - the dispatch that chooses a message by its type
 *   - a field present only on a condition
 *   - a block whose stated length holds more than its fields
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 97

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
  byte reason[64]
};

int logout_message_at;

/* every byte of Logout Message set to one value */
inline fill_logout_message(logout_message_record, logout_message_value) {
  logout_message_at = 0;
  do
  :: logout_message_at < 64 -> logout_message_record.reason[logout_message_at] = logout_message_value; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout Message set to where it lies, so a field read out of place says so */
inline ramp_logout_message(logout_message_record, logout_message_base) {
  logout_message_at = 0;
  do
  :: logout_message_at < 64 -> logout_message_record.reason[logout_message_at] = (logout_message_base + 0 + logout_message_at + 1) % 256; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message to the wire, 64 bytes from where the cursor stands */
inline encode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 64 -> wire[at] = logout_message_record.reason[logout_message_at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message off the wire, 64 bytes from where the cursor stands */
inline decode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 64 -> logout_message_record.reason[logout_message_at] = wire[at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout Message is what was written, byte for byte */
inline equal_logout_message(logout_message_read, logout_message_written) {
  logout_message_at = 0;
  do
  :: logout_message_at < 64 -> assert(logout_message_read.reason[logout_message_at] == logout_message_written.reason[logout_message_at]); logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logged Out Message: 64 bytes -------------------------------------------- */

/* LoggedOutMessage */
typedef LoggedOutMessage {
  byte reason[64]
};

int logged_out_message_at;

/* every byte of Logged Out Message set to one value */
inline fill_logged_out_message(logged_out_message_record, logged_out_message_value) {
  logged_out_message_at = 0;
  do
  :: logged_out_message_at < 64 -> logged_out_message_record.reason[logged_out_message_at] = logged_out_message_value; logged_out_message_at = logged_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logged Out Message set to where it lies, so a field read out of place says so */
inline ramp_logged_out_message(logged_out_message_record, logged_out_message_base) {
  logged_out_message_at = 0;
  do
  :: logged_out_message_at < 64 -> logged_out_message_record.reason[logged_out_message_at] = (logged_out_message_base + 0 + logged_out_message_at + 1) % 256; logged_out_message_at = logged_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logged Out Message to the wire, 64 bytes from where the cursor stands */
inline encode_logged_out_message(logged_out_message_record) {
  logged_out_message_at = 0;
  do
  :: logged_out_message_at < 64 -> wire[at] = logged_out_message_record.reason[logged_out_message_at]; at = at + 1; logged_out_message_at = logged_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logged Out Message off the wire, 64 bytes from where the cursor stands */
inline decode_logged_out_message(logged_out_message_record) {
  logged_out_message_at = 0;
  do
  :: logged_out_message_at < 64 -> logged_out_message_record.reason[logged_out_message_at] = wire[at]; at = at + 1; logged_out_message_at = logged_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logged Out Message is what was written, byte for byte */
inline equal_logged_out_message(logged_out_message_read, logged_out_message_written) {
  logged_out_message_at = 0;
  do
  :: logged_out_message_at < 64 -> assert(logged_out_message_read.reason[logged_out_message_at] == logged_out_message_written.reason[logged_out_message_at]); logged_out_message_at = logged_out_message_at + 1
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

/* ---- Instrument Info Request Message: 8 bytes -------------------------------- */

/* InstrumentInfoRequestMessage */
typedef InstrumentInfoRequestMessage {
  byte correlation_id[8]
};

int instrument_info_request_message_at;

/* every byte of Instrument Info Request Message set to one value */
inline fill_instrument_info_request_message(instrument_info_request_message_record, instrument_info_request_message_value) {
  instrument_info_request_message_at = 0;
  do
  :: instrument_info_request_message_at < 8 -> instrument_info_request_message_record.correlation_id[instrument_info_request_message_at] = instrument_info_request_message_value; instrument_info_request_message_at = instrument_info_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Info Request Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_info_request_message(instrument_info_request_message_record, instrument_info_request_message_base) {
  instrument_info_request_message_at = 0;
  do
  :: instrument_info_request_message_at < 8 -> instrument_info_request_message_record.correlation_id[instrument_info_request_message_at] = (instrument_info_request_message_base + 0 + instrument_info_request_message_at + 1) % 256; instrument_info_request_message_at = instrument_info_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_instrument_info_request_message(instrument_info_request_message_record) {
  instrument_info_request_message_at = 0;
  do
  :: instrument_info_request_message_at < 8 -> wire[at] = instrument_info_request_message_record.correlation_id[instrument_info_request_message_at]; at = at + 1; instrument_info_request_message_at = instrument_info_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_instrument_info_request_message(instrument_info_request_message_record) {
  instrument_info_request_message_at = 0;
  do
  :: instrument_info_request_message_at < 8 -> instrument_info_request_message_record.correlation_id[instrument_info_request_message_at] = wire[at]; at = at + 1; instrument_info_request_message_at = instrument_info_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Info Request Message is what was written, byte for byte */
inline equal_instrument_info_request_message(instrument_info_request_message_read, instrument_info_request_message_written) {
  instrument_info_request_message_at = 0;
  do
  :: instrument_info_request_message_at < 8 -> assert(instrument_info_request_message_read.correlation_id[instrument_info_request_message_at] == instrument_info_request_message_written.correlation_id[instrument_info_request_message_at]); instrument_info_request_message_at = instrument_info_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Info Message: 48 bytes --------------------------------------- */

/* InstrumentInfoMessage */
typedef InstrumentInfoMessage {
  byte correlation_id[8];
  byte instrument_id[4];
  byte security_type;
  byte instrument_status;
  byte is_last_message;
  byte reserved_byte;
  byte symbol[32]
};

int instrument_info_message_at;

/* every byte of Instrument Info Message set to one value */
inline fill_instrument_info_message(instrument_info_message_record, instrument_info_message_value) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.correlation_id[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 4 -> instrument_info_message_record.instrument_id[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_record.security_type = instrument_info_message_value;
  instrument_info_message_record.instrument_status = instrument_info_message_value;
  instrument_info_message_record.is_last_message = instrument_info_message_value;
  instrument_info_message_record.reserved_byte = instrument_info_message_value;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 32 -> instrument_info_message_record.symbol[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Info Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_info_message(instrument_info_message_record, instrument_info_message_base) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.correlation_id[instrument_info_message_at] = (instrument_info_message_base + 0 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 4 -> instrument_info_message_record.instrument_id[instrument_info_message_at] = (instrument_info_message_base + 8 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_record.security_type = (instrument_info_message_base + 12 + 1) % 256;
  instrument_info_message_record.instrument_status = (instrument_info_message_base + 13 + 1) % 256;
  instrument_info_message_record.is_last_message = (instrument_info_message_base + 14 + 1) % 256;
  instrument_info_message_record.reserved_byte = (instrument_info_message_base + 15 + 1) % 256;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 32 -> instrument_info_message_record.symbol[instrument_info_message_at] = (instrument_info_message_base + 16 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Message to the wire, 48 bytes from where the cursor stands */
inline encode_instrument_info_message(instrument_info_message_record) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> wire[at] = instrument_info_message_record.correlation_id[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 4 -> wire[at] = instrument_info_message_record.instrument_id[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_info_message_record.security_type; at = at + 1;
  wire[at] = instrument_info_message_record.instrument_status; at = at + 1;
  wire[at] = instrument_info_message_record.is_last_message; at = at + 1;
  wire[at] = instrument_info_message_record.reserved_byte; at = at + 1;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 32 -> wire[at] = instrument_info_message_record.symbol[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Message off the wire, 48 bytes from where the cursor stands */
inline decode_instrument_info_message(instrument_info_message_record) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.correlation_id[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 4 -> instrument_info_message_record.instrument_id[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_record.security_type = wire[at]; at = at + 1;
  instrument_info_message_record.instrument_status = wire[at]; at = at + 1;
  instrument_info_message_record.is_last_message = wire[at]; at = at + 1;
  instrument_info_message_record.reserved_byte = wire[at]; at = at + 1;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 32 -> instrument_info_message_record.symbol[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Info Message is what was written, byte for byte */
inline equal_instrument_info_message(instrument_info_message_read, instrument_info_message_written) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> assert(instrument_info_message_read.correlation_id[instrument_info_message_at] == instrument_info_message_written.correlation_id[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 4 -> assert(instrument_info_message_read.instrument_id[instrument_info_message_at] == instrument_info_message_written.instrument_id[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  assert(instrument_info_message_read.security_type == instrument_info_message_written.security_type);
  assert(instrument_info_message_read.instrument_status == instrument_info_message_written.instrument_status);
  assert(instrument_info_message_read.is_last_message == instrument_info_message_written.is_last_message);
  assert(instrument_info_message_read.reserved_byte == instrument_info_message_written.reserved_byte);
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 32 -> assert(instrument_info_message_read.symbol[instrument_info_message_at] == instrument_info_message_written.symbol[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Set Account Message: 24 bytes ------------------------------------------- */

/* SetAccountMessage */
typedef SetAccountMessage {
  byte correlation_id[8];
  byte account[16]
};

int set_account_message_at;

/* every byte of Set Account Message set to one value */
inline fill_set_account_message(set_account_message_record, set_account_message_value) {
  set_account_message_at = 0;
  do
  :: set_account_message_at < 8 -> set_account_message_record.correlation_id[set_account_message_at] = set_account_message_value; set_account_message_at = set_account_message_at + 1
  :: else -> break
  od;
  set_account_message_at = 0;
  do
  :: set_account_message_at < 16 -> set_account_message_record.account[set_account_message_at] = set_account_message_value; set_account_message_at = set_account_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Set Account Message set to where it lies, so a field read out of place says so */
inline ramp_set_account_message(set_account_message_record, set_account_message_base) {
  set_account_message_at = 0;
  do
  :: set_account_message_at < 8 -> set_account_message_record.correlation_id[set_account_message_at] = (set_account_message_base + 0 + set_account_message_at + 1) % 256; set_account_message_at = set_account_message_at + 1
  :: else -> break
  od;
  set_account_message_at = 0;
  do
  :: set_account_message_at < 16 -> set_account_message_record.account[set_account_message_at] = (set_account_message_base + 8 + set_account_message_at + 1) % 256; set_account_message_at = set_account_message_at + 1
  :: else -> break
  od;
  skip
}

/* Set Account Message to the wire, 24 bytes from where the cursor stands */
inline encode_set_account_message(set_account_message_record) {
  set_account_message_at = 0;
  do
  :: set_account_message_at < 8 -> wire[at] = set_account_message_record.correlation_id[set_account_message_at]; at = at + 1; set_account_message_at = set_account_message_at + 1
  :: else -> break
  od;
  set_account_message_at = 0;
  do
  :: set_account_message_at < 16 -> wire[at] = set_account_message_record.account[set_account_message_at]; at = at + 1; set_account_message_at = set_account_message_at + 1
  :: else -> break
  od;
  skip
}

/* Set Account Message off the wire, 24 bytes from where the cursor stands */
inline decode_set_account_message(set_account_message_record) {
  set_account_message_at = 0;
  do
  :: set_account_message_at < 8 -> set_account_message_record.correlation_id[set_account_message_at] = wire[at]; at = at + 1; set_account_message_at = set_account_message_at + 1
  :: else -> break
  od;
  set_account_message_at = 0;
  do
  :: set_account_message_at < 16 -> set_account_message_record.account[set_account_message_at] = wire[at]; at = at + 1; set_account_message_at = set_account_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Set Account Message is what was written, byte for byte */
inline equal_set_account_message(set_account_message_read, set_account_message_written) {
  set_account_message_at = 0;
  do
  :: set_account_message_at < 8 -> assert(set_account_message_read.correlation_id[set_account_message_at] == set_account_message_written.correlation_id[set_account_message_at]); set_account_message_at = set_account_message_at + 1
  :: else -> break
  od;
  set_account_message_at = 0;
  do
  :: set_account_message_at < 16 -> assert(set_account_message_read.account[set_account_message_at] == set_account_message_written.account[set_account_message_at]); set_account_message_at = set_account_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Set Trader Message: 24 bytes -------------------------------------------- */

/* SetTraderMessage */
typedef SetTraderMessage {
  byte correlation_id[8];
  byte trader[16]
};

int set_trader_message_at;

/* every byte of Set Trader Message set to one value */
inline fill_set_trader_message(set_trader_message_record, set_trader_message_value) {
  set_trader_message_at = 0;
  do
  :: set_trader_message_at < 8 -> set_trader_message_record.correlation_id[set_trader_message_at] = set_trader_message_value; set_trader_message_at = set_trader_message_at + 1
  :: else -> break
  od;
  set_trader_message_at = 0;
  do
  :: set_trader_message_at < 16 -> set_trader_message_record.trader[set_trader_message_at] = set_trader_message_value; set_trader_message_at = set_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Set Trader Message set to where it lies, so a field read out of place says so */
inline ramp_set_trader_message(set_trader_message_record, set_trader_message_base) {
  set_trader_message_at = 0;
  do
  :: set_trader_message_at < 8 -> set_trader_message_record.correlation_id[set_trader_message_at] = (set_trader_message_base + 0 + set_trader_message_at + 1) % 256; set_trader_message_at = set_trader_message_at + 1
  :: else -> break
  od;
  set_trader_message_at = 0;
  do
  :: set_trader_message_at < 16 -> set_trader_message_record.trader[set_trader_message_at] = (set_trader_message_base + 8 + set_trader_message_at + 1) % 256; set_trader_message_at = set_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* Set Trader Message to the wire, 24 bytes from where the cursor stands */
inline encode_set_trader_message(set_trader_message_record) {
  set_trader_message_at = 0;
  do
  :: set_trader_message_at < 8 -> wire[at] = set_trader_message_record.correlation_id[set_trader_message_at]; at = at + 1; set_trader_message_at = set_trader_message_at + 1
  :: else -> break
  od;
  set_trader_message_at = 0;
  do
  :: set_trader_message_at < 16 -> wire[at] = set_trader_message_record.trader[set_trader_message_at]; at = at + 1; set_trader_message_at = set_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* Set Trader Message off the wire, 24 bytes from where the cursor stands */
inline decode_set_trader_message(set_trader_message_record) {
  set_trader_message_at = 0;
  do
  :: set_trader_message_at < 8 -> set_trader_message_record.correlation_id[set_trader_message_at] = wire[at]; at = at + 1; set_trader_message_at = set_trader_message_at + 1
  :: else -> break
  od;
  set_trader_message_at = 0;
  do
  :: set_trader_message_at < 16 -> set_trader_message_record.trader[set_trader_message_at] = wire[at]; at = at + 1; set_trader_message_at = set_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Set Trader Message is what was written, byte for byte */
inline equal_set_trader_message(set_trader_message_read, set_trader_message_written) {
  set_trader_message_at = 0;
  do
  :: set_trader_message_at < 8 -> assert(set_trader_message_read.correlation_id[set_trader_message_at] == set_trader_message_written.correlation_id[set_trader_message_at]); set_trader_message_at = set_trader_message_at + 1
  :: else -> break
  od;
  set_trader_message_at = 0;
  do
  :: set_trader_message_at < 16 -> assert(set_trader_message_read.trader[set_trader_message_at] == set_trader_message_written.trader[set_trader_message_at]); set_trader_message_at = set_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Set Ack Message: 8 bytes ------------------------------------------------ */

/* SetAckMessage */
typedef SetAckMessage {
  byte correlation_id[8]
};

int set_ack_message_at;

/* every byte of Set Ack Message set to one value */
inline fill_set_ack_message(set_ack_message_record, set_ack_message_value) {
  set_ack_message_at = 0;
  do
  :: set_ack_message_at < 8 -> set_ack_message_record.correlation_id[set_ack_message_at] = set_ack_message_value; set_ack_message_at = set_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Set Ack Message set to where it lies, so a field read out of place says so */
inline ramp_set_ack_message(set_ack_message_record, set_ack_message_base) {
  set_ack_message_at = 0;
  do
  :: set_ack_message_at < 8 -> set_ack_message_record.correlation_id[set_ack_message_at] = (set_ack_message_base + 0 + set_ack_message_at + 1) % 256; set_ack_message_at = set_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Set Ack Message to the wire, 8 bytes from where the cursor stands */
inline encode_set_ack_message(set_ack_message_record) {
  set_ack_message_at = 0;
  do
  :: set_ack_message_at < 8 -> wire[at] = set_ack_message_record.correlation_id[set_ack_message_at]; at = at + 1; set_ack_message_at = set_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Set Ack Message off the wire, 8 bytes from where the cursor stands */
inline decode_set_ack_message(set_ack_message_record) {
  set_ack_message_at = 0;
  do
  :: set_ack_message_at < 8 -> set_ack_message_record.correlation_id[set_ack_message_at] = wire[at]; at = at + 1; set_ack_message_at = set_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Set Ack Message is what was written, byte for byte */
inline equal_set_ack_message(set_ack_message_read, set_ack_message_written) {
  set_ack_message_at = 0;
  do
  :: set_ack_message_at < 8 -> assert(set_ack_message_read.correlation_id[set_ack_message_at] == set_ack_message_written.correlation_id[set_ack_message_at]); set_ack_message_at = set_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Order Message: 33 bytes --------------------------------------------- */

/* NewOrderMessage */
typedef NewOrderMessage {
  byte client_order_id[8];
  byte correlation_id[8];
  byte limit_price[8];
  byte quantity[4];
  byte instrument_id[4];
  byte side
};

int new_order_message_at;

/* every byte of New Order Message set to one value */
inline fill_new_order_message(new_order_message_record, new_order_message_value) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.client_order_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.correlation_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.limit_price[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.quantity[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.instrument_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = new_order_message_value;
  skip
}

/* each byte of New Order Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_message(new_order_message_record, new_order_message_base) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.client_order_id[new_order_message_at] = (new_order_message_base + 0 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.correlation_id[new_order_message_at] = (new_order_message_base + 8 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.limit_price[new_order_message_at] = (new_order_message_base + 16 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.quantity[new_order_message_at] = (new_order_message_base + 24 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.instrument_id[new_order_message_at] = (new_order_message_base + 28 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = (new_order_message_base + 32 + 1) % 256;
  skip
}

/* New Order Message to the wire, 33 bytes from where the cursor stands */
inline encode_new_order_message(new_order_message_record) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.client_order_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.correlation_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.limit_price[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.quantity[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.instrument_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.side; at = at + 1;
  skip
}

/* New Order Message off the wire, 33 bytes from where the cursor stands */
inline decode_new_order_message(new_order_message_record) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.client_order_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.correlation_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.limit_price[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.quantity[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.instrument_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = wire[at]; at = at + 1;
  skip
}

/* what was read of New Order Message is what was written, byte for byte */
inline equal_new_order_message(new_order_message_read, new_order_message_written) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.client_order_id[new_order_message_at] == new_order_message_written.client_order_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.correlation_id[new_order_message_at] == new_order_message_written.correlation_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.limit_price[new_order_message_at] == new_order_message_written.limit_price[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.quantity[new_order_message_at] == new_order_message_written.quantity[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.instrument_id[new_order_message_at] == new_order_message_written.instrument_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.side == new_order_message_written.side);
  skip
}

/* ---- Order Entered Message: 48 bytes ----------------------------------------- */

/* OrderEnteredMessage */
typedef OrderEnteredMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte client_order_id[8];
  byte correlation_id[8];
  byte order_id[8];
  byte receive_time[8]
};

int order_entered_message_at;

/* every byte of Order Entered Message set to one value */
inline fill_order_entered_message(order_entered_message_record, order_entered_message_value) {
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.timestamp[order_entered_message_at] = order_entered_message_value; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.exec_id[order_entered_message_at] = order_entered_message_value; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.client_order_id[order_entered_message_at] = order_entered_message_value; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.correlation_id[order_entered_message_at] = order_entered_message_value; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.order_id[order_entered_message_at] = order_entered_message_value; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.receive_time[order_entered_message_at] = order_entered_message_value; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Entered Message set to where it lies, so a field read out of place says so */
inline ramp_order_entered_message(order_entered_message_record, order_entered_message_base) {
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.timestamp[order_entered_message_at] = (order_entered_message_base + 0 + order_entered_message_at + 1) % 256; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.exec_id[order_entered_message_at] = (order_entered_message_base + 8 + order_entered_message_at + 1) % 256; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.client_order_id[order_entered_message_at] = (order_entered_message_base + 16 + order_entered_message_at + 1) % 256; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.correlation_id[order_entered_message_at] = (order_entered_message_base + 24 + order_entered_message_at + 1) % 256; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.order_id[order_entered_message_at] = (order_entered_message_base + 32 + order_entered_message_at + 1) % 256; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.receive_time[order_entered_message_at] = (order_entered_message_base + 40 + order_entered_message_at + 1) % 256; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Entered Message to the wire, 48 bytes from where the cursor stands */
inline encode_order_entered_message(order_entered_message_record) {
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> wire[at] = order_entered_message_record.timestamp[order_entered_message_at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> wire[at] = order_entered_message_record.exec_id[order_entered_message_at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> wire[at] = order_entered_message_record.client_order_id[order_entered_message_at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> wire[at] = order_entered_message_record.correlation_id[order_entered_message_at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> wire[at] = order_entered_message_record.order_id[order_entered_message_at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> wire[at] = order_entered_message_record.receive_time[order_entered_message_at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Entered Message off the wire, 48 bytes from where the cursor stands */
inline decode_order_entered_message(order_entered_message_record) {
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.timestamp[order_entered_message_at] = wire[at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.exec_id[order_entered_message_at] = wire[at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.client_order_id[order_entered_message_at] = wire[at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.correlation_id[order_entered_message_at] = wire[at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.order_id[order_entered_message_at] = wire[at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> order_entered_message_record.receive_time[order_entered_message_at] = wire[at]; at = at + 1; order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Entered Message is what was written, byte for byte */
inline equal_order_entered_message(order_entered_message_read, order_entered_message_written) {
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> assert(order_entered_message_read.timestamp[order_entered_message_at] == order_entered_message_written.timestamp[order_entered_message_at]); order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> assert(order_entered_message_read.exec_id[order_entered_message_at] == order_entered_message_written.exec_id[order_entered_message_at]); order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> assert(order_entered_message_read.client_order_id[order_entered_message_at] == order_entered_message_written.client_order_id[order_entered_message_at]); order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> assert(order_entered_message_read.correlation_id[order_entered_message_at] == order_entered_message_written.correlation_id[order_entered_message_at]); order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> assert(order_entered_message_read.order_id[order_entered_message_at] == order_entered_message_written.order_id[order_entered_message_at]); order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  order_entered_message_at = 0;
  do
  :: order_entered_message_at < 8 -> assert(order_entered_message_read.receive_time[order_entered_message_at] == order_entered_message_written.receive_time[order_entered_message_at]); order_entered_message_at = order_entered_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replace Order Message: 32 bytes ----------------------------------------- */

/* ReplaceOrderMessage */
typedef ReplaceOrderMessage {
  byte client_order_id[8];
  byte correlation_id[8];
  byte new_limit_price[8];
  byte new_quantity[4];
  byte instrument_id[4]
};

int replace_order_message_at;

/* every byte of Replace Order Message set to one value */
inline fill_replace_order_message(replace_order_message_record, replace_order_message_value) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.client_order_id[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.correlation_id[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.new_limit_price[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.new_quantity[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.instrument_id[replace_order_message_at] = replace_order_message_value; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replace Order Message set to where it lies, so a field read out of place says so */
inline ramp_replace_order_message(replace_order_message_record, replace_order_message_base) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.client_order_id[replace_order_message_at] = (replace_order_message_base + 0 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.correlation_id[replace_order_message_at] = (replace_order_message_base + 8 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.new_limit_price[replace_order_message_at] = (replace_order_message_base + 16 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.new_quantity[replace_order_message_at] = (replace_order_message_base + 24 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.instrument_id[replace_order_message_at] = (replace_order_message_base + 28 + replace_order_message_at + 1) % 256; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replace Order Message to the wire, 32 bytes from where the cursor stands */
inline encode_replace_order_message(replace_order_message_record) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.client_order_id[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.correlation_id[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> wire[at] = replace_order_message_record.new_limit_price[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.new_quantity[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> wire[at] = replace_order_message_record.instrument_id[replace_order_message_at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replace Order Message off the wire, 32 bytes from where the cursor stands */
inline decode_replace_order_message(replace_order_message_record) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.client_order_id[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.correlation_id[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> replace_order_message_record.new_limit_price[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.new_quantity[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> replace_order_message_record.instrument_id[replace_order_message_at] = wire[at]; at = at + 1; replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replace Order Message is what was written, byte for byte */
inline equal_replace_order_message(replace_order_message_read, replace_order_message_written) {
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.client_order_id[replace_order_message_at] == replace_order_message_written.client_order_id[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.correlation_id[replace_order_message_at] == replace_order_message_written.correlation_id[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 8 -> assert(replace_order_message_read.new_limit_price[replace_order_message_at] == replace_order_message_written.new_limit_price[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.new_quantity[replace_order_message_at] == replace_order_message_written.new_quantity[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  replace_order_message_at = 0;
  do
  :: replace_order_message_at < 4 -> assert(replace_order_message_read.instrument_id[replace_order_message_at] == replace_order_message_written.instrument_id[replace_order_message_at]); replace_order_message_at = replace_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stream Order Message: 41 bytes ------------------------------------------ */

/* StreamOrderMessage */
typedef StreamOrderMessage {
  byte client_order_id[8];
  byte correlation_id[8];
  byte last_processed_fill_id[8];
  byte limit_price[8];
  byte quantity[4];
  byte instrument_id[4];
  byte side
};

int stream_order_message_at;

/* every byte of Stream Order Message set to one value */
inline fill_stream_order_message(stream_order_message_record, stream_order_message_value) {
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.client_order_id[stream_order_message_at] = stream_order_message_value; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.correlation_id[stream_order_message_at] = stream_order_message_value; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.last_processed_fill_id[stream_order_message_at] = stream_order_message_value; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.limit_price[stream_order_message_at] = stream_order_message_value; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 4 -> stream_order_message_record.quantity[stream_order_message_at] = stream_order_message_value; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 4 -> stream_order_message_record.instrument_id[stream_order_message_at] = stream_order_message_value; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_record.side = stream_order_message_value;
  skip
}

/* each byte of Stream Order Message set to where it lies, so a field read out of place says so */
inline ramp_stream_order_message(stream_order_message_record, stream_order_message_base) {
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.client_order_id[stream_order_message_at] = (stream_order_message_base + 0 + stream_order_message_at + 1) % 256; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.correlation_id[stream_order_message_at] = (stream_order_message_base + 8 + stream_order_message_at + 1) % 256; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.last_processed_fill_id[stream_order_message_at] = (stream_order_message_base + 16 + stream_order_message_at + 1) % 256; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.limit_price[stream_order_message_at] = (stream_order_message_base + 24 + stream_order_message_at + 1) % 256; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 4 -> stream_order_message_record.quantity[stream_order_message_at] = (stream_order_message_base + 32 + stream_order_message_at + 1) % 256; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 4 -> stream_order_message_record.instrument_id[stream_order_message_at] = (stream_order_message_base + 36 + stream_order_message_at + 1) % 256; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_record.side = (stream_order_message_base + 40 + 1) % 256;
  skip
}

/* Stream Order Message to the wire, 41 bytes from where the cursor stands */
inline encode_stream_order_message(stream_order_message_record) {
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> wire[at] = stream_order_message_record.client_order_id[stream_order_message_at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> wire[at] = stream_order_message_record.correlation_id[stream_order_message_at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> wire[at] = stream_order_message_record.last_processed_fill_id[stream_order_message_at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> wire[at] = stream_order_message_record.limit_price[stream_order_message_at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 4 -> wire[at] = stream_order_message_record.quantity[stream_order_message_at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 4 -> wire[at] = stream_order_message_record.instrument_id[stream_order_message_at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  wire[at] = stream_order_message_record.side; at = at + 1;
  skip
}

/* Stream Order Message off the wire, 41 bytes from where the cursor stands */
inline decode_stream_order_message(stream_order_message_record) {
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.client_order_id[stream_order_message_at] = wire[at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.correlation_id[stream_order_message_at] = wire[at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.last_processed_fill_id[stream_order_message_at] = wire[at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> stream_order_message_record.limit_price[stream_order_message_at] = wire[at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 4 -> stream_order_message_record.quantity[stream_order_message_at] = wire[at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 4 -> stream_order_message_record.instrument_id[stream_order_message_at] = wire[at]; at = at + 1; stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_record.side = wire[at]; at = at + 1;
  skip
}

/* what was read of Stream Order Message is what was written, byte for byte */
inline equal_stream_order_message(stream_order_message_read, stream_order_message_written) {
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> assert(stream_order_message_read.client_order_id[stream_order_message_at] == stream_order_message_written.client_order_id[stream_order_message_at]); stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> assert(stream_order_message_read.correlation_id[stream_order_message_at] == stream_order_message_written.correlation_id[stream_order_message_at]); stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> assert(stream_order_message_read.last_processed_fill_id[stream_order_message_at] == stream_order_message_written.last_processed_fill_id[stream_order_message_at]); stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 8 -> assert(stream_order_message_read.limit_price[stream_order_message_at] == stream_order_message_written.limit_price[stream_order_message_at]); stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 4 -> assert(stream_order_message_read.quantity[stream_order_message_at] == stream_order_message_written.quantity[stream_order_message_at]); stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  stream_order_message_at = 0;
  do
  :: stream_order_message_at < 4 -> assert(stream_order_message_read.instrument_id[stream_order_message_at] == stream_order_message_written.instrument_id[stream_order_message_at]); stream_order_message_at = stream_order_message_at + 1
  :: else -> break
  od;
  assert(stream_order_message_read.side == stream_order_message_written.side);
  skip
}

/* ---- Order Reject Message: 80 bytes ------------------------------------------ */

/* OrderRejectMessage */
typedef OrderRejectMessage {
  byte timestamp[8];
  byte client_order_id[8];
  byte correlation_id[8];
  byte order_id_optional[8];
  byte order_reject_reason;
  byte order_reject_details[47]
};

int order_reject_message_at;

/* every byte of Order Reject Message set to one value */
inline fill_order_reject_message(order_reject_message_record, order_reject_message_value) {
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.timestamp[order_reject_message_at] = order_reject_message_value; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.client_order_id[order_reject_message_at] = order_reject_message_value; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.correlation_id[order_reject_message_at] = order_reject_message_value; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.order_id_optional[order_reject_message_at] = order_reject_message_value; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_record.order_reject_reason = order_reject_message_value;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 47 -> order_reject_message_record.order_reject_details[order_reject_message_at] = order_reject_message_value; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Reject Message set to where it lies, so a field read out of place says so */
inline ramp_order_reject_message(order_reject_message_record, order_reject_message_base) {
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.timestamp[order_reject_message_at] = (order_reject_message_base + 0 + order_reject_message_at + 1) % 256; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.client_order_id[order_reject_message_at] = (order_reject_message_base + 8 + order_reject_message_at + 1) % 256; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.correlation_id[order_reject_message_at] = (order_reject_message_base + 16 + order_reject_message_at + 1) % 256; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.order_id_optional[order_reject_message_at] = (order_reject_message_base + 24 + order_reject_message_at + 1) % 256; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_record.order_reject_reason = (order_reject_message_base + 32 + 1) % 256;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 47 -> order_reject_message_record.order_reject_details[order_reject_message_at] = (order_reject_message_base + 33 + order_reject_message_at + 1) % 256; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Reject Message to the wire, 80 bytes from where the cursor stands */
inline encode_order_reject_message(order_reject_message_record) {
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> wire[at] = order_reject_message_record.timestamp[order_reject_message_at]; at = at + 1; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> wire[at] = order_reject_message_record.client_order_id[order_reject_message_at]; at = at + 1; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> wire[at] = order_reject_message_record.correlation_id[order_reject_message_at]; at = at + 1; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> wire[at] = order_reject_message_record.order_id_optional[order_reject_message_at]; at = at + 1; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = order_reject_message_record.order_reject_reason; at = at + 1;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 47 -> wire[at] = order_reject_message_record.order_reject_details[order_reject_message_at]; at = at + 1; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Reject Message off the wire, 80 bytes from where the cursor stands */
inline decode_order_reject_message(order_reject_message_record) {
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.timestamp[order_reject_message_at] = wire[at]; at = at + 1; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.client_order_id[order_reject_message_at] = wire[at]; at = at + 1; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.correlation_id[order_reject_message_at] = wire[at]; at = at + 1; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> order_reject_message_record.order_id_optional[order_reject_message_at] = wire[at]; at = at + 1; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_record.order_reject_reason = wire[at]; at = at + 1;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 47 -> order_reject_message_record.order_reject_details[order_reject_message_at] = wire[at]; at = at + 1; order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Reject Message is what was written, byte for byte */
inline equal_order_reject_message(order_reject_message_read, order_reject_message_written) {
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> assert(order_reject_message_read.timestamp[order_reject_message_at] == order_reject_message_written.timestamp[order_reject_message_at]); order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> assert(order_reject_message_read.client_order_id[order_reject_message_at] == order_reject_message_written.client_order_id[order_reject_message_at]); order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> assert(order_reject_message_read.correlation_id[order_reject_message_at] == order_reject_message_written.correlation_id[order_reject_message_at]); order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 8 -> assert(order_reject_message_read.order_id_optional[order_reject_message_at] == order_reject_message_written.order_id_optional[order_reject_message_at]); order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  assert(order_reject_message_read.order_reject_reason == order_reject_message_written.order_reject_reason);
  order_reject_message_at = 0;
  do
  :: order_reject_message_at < 47 -> assert(order_reject_message_read.order_reject_details[order_reject_message_at] == order_reject_message_written.order_reject_details[order_reject_message_at]); order_reject_message_at = order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replaced Message: 60 bytes ---------------------------------------- */

/* OrderReplacedMessage */
typedef OrderReplacedMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte client_order_id[8];
  byte correlation_id[8];
  byte order_id[8];
  byte receive_time[8];
  byte total_filled[4];
  byte available_qty[4];
  byte instrument_id[4]
};

int order_replaced_message_at;

/* every byte of Order Replaced Message set to one value */
inline fill_order_replaced_message(order_replaced_message_record, order_replaced_message_value) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.exec_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.client_order_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.correlation_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.receive_time[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.total_filled[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.available_qty[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.instrument_id[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_order_replaced_message(order_replaced_message_record, order_replaced_message_base) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp[order_replaced_message_at] = (order_replaced_message_base + 0 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.exec_id[order_replaced_message_at] = (order_replaced_message_base + 8 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.client_order_id[order_replaced_message_at] = (order_replaced_message_base + 16 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.correlation_id[order_replaced_message_at] = (order_replaced_message_base + 24 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_id[order_replaced_message_at] = (order_replaced_message_base + 32 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.receive_time[order_replaced_message_at] = (order_replaced_message_base + 40 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.total_filled[order_replaced_message_at] = (order_replaced_message_base + 48 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.available_qty[order_replaced_message_at] = (order_replaced_message_base + 52 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.instrument_id[order_replaced_message_at] = (order_replaced_message_base + 56 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced Message to the wire, 60 bytes from where the cursor stands */
inline encode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.timestamp[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.exec_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.client_order_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.correlation_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.order_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.receive_time[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.total_filled[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.available_qty[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.instrument_id[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced Message off the wire, 60 bytes from where the cursor stands */
inline decode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.timestamp[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.exec_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.client_order_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.correlation_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.receive_time[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.total_filled[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.available_qty[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.instrument_id[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replaced Message is what was written, byte for byte */
inline equal_order_replaced_message(order_replaced_message_read, order_replaced_message_written) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.timestamp[order_replaced_message_at] == order_replaced_message_written.timestamp[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.exec_id[order_replaced_message_at] == order_replaced_message_written.exec_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.client_order_id[order_replaced_message_at] == order_replaced_message_written.client_order_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.correlation_id[order_replaced_message_at] == order_replaced_message_written.correlation_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.order_id[order_replaced_message_at] == order_replaced_message_written.order_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.receive_time[order_replaced_message_at] == order_replaced_message_written.receive_time[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.total_filled[order_replaced_message_at] == order_replaced_message_written.total_filled[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.available_qty[order_replaced_message_at] == order_replaced_message_written.available_qty[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.instrument_id[order_replaced_message_at] == order_replaced_message_written.instrument_id[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order Message: 20 bytes ------------------------------------------ */

/* CancelOrderMessage */
typedef CancelOrderMessage {
  byte client_order_id[8];
  byte correlation_id[8];
  byte instrument_id[4]
};

int cancel_order_message_at;

/* every byte of Cancel Order Message set to one value */
inline fill_cancel_order_message(cancel_order_message_record, cancel_order_message_value) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> cancel_order_message_record.client_order_id[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> cancel_order_message_record.correlation_id[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.instrument_id[cancel_order_message_at] = cancel_order_message_value; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_message(cancel_order_message_record, cancel_order_message_base) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> cancel_order_message_record.client_order_id[cancel_order_message_at] = (cancel_order_message_base + 0 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> cancel_order_message_record.correlation_id[cancel_order_message_at] = (cancel_order_message_base + 8 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.instrument_id[cancel_order_message_at] = (cancel_order_message_base + 16 + cancel_order_message_at + 1) % 256; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message to the wire, 20 bytes from where the cursor stands */
inline encode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> wire[at] = cancel_order_message_record.client_order_id[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> wire[at] = cancel_order_message_record.correlation_id[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> wire[at] = cancel_order_message_record.instrument_id[cancel_order_message_at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Message off the wire, 20 bytes from where the cursor stands */
inline decode_cancel_order_message(cancel_order_message_record) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> cancel_order_message_record.client_order_id[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> cancel_order_message_record.correlation_id[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> cancel_order_message_record.instrument_id[cancel_order_message_at] = wire[at]; at = at + 1; cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Message is what was written, byte for byte */
inline equal_cancel_order_message(cancel_order_message_read, cancel_order_message_written) {
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> assert(cancel_order_message_read.client_order_id[cancel_order_message_at] == cancel_order_message_written.client_order_id[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 8 -> assert(cancel_order_message_read.correlation_id[cancel_order_message_at] == cancel_order_message_written.correlation_id[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  cancel_order_message_at = 0;
  do
  :: cancel_order_message_at < 4 -> assert(cancel_order_message_read.instrument_id[cancel_order_message_at] == cancel_order_message_written.instrument_id[cancel_order_message_at]); cancel_order_message_at = cancel_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Canceled Message: 57 bytes ---------------------------------------- */

/* OrderCanceledMessage */
typedef OrderCanceledMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte client_order_id[8];
  byte correlation_id[8];
  byte order_id[8];
  byte receive_time[8];
  byte total_filled[4];
  byte instrument_id[4];
  byte cancel_reason
};

int order_canceled_message_at;

/* every byte of Order Canceled Message set to one value */
inline fill_order_canceled_message(order_canceled_message_record, order_canceled_message_value) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.timestamp[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.exec_id[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.client_order_id[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.correlation_id[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.order_id[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.receive_time[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.total_filled[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.instrument_id[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.cancel_reason = order_canceled_message_value;
  skip
}

/* each byte of Order Canceled Message set to where it lies, so a field read out of place says so */
inline ramp_order_canceled_message(order_canceled_message_record, order_canceled_message_base) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.timestamp[order_canceled_message_at] = (order_canceled_message_base + 0 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.exec_id[order_canceled_message_at] = (order_canceled_message_base + 8 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.client_order_id[order_canceled_message_at] = (order_canceled_message_base + 16 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.correlation_id[order_canceled_message_at] = (order_canceled_message_base + 24 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.order_id[order_canceled_message_at] = (order_canceled_message_base + 32 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.receive_time[order_canceled_message_at] = (order_canceled_message_base + 40 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.total_filled[order_canceled_message_at] = (order_canceled_message_base + 48 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.instrument_id[order_canceled_message_at] = (order_canceled_message_base + 52 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.cancel_reason = (order_canceled_message_base + 56 + 1) % 256;
  skip
}

/* Order Canceled Message to the wire, 57 bytes from where the cursor stands */
inline encode_order_canceled_message(order_canceled_message_record) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.timestamp[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.exec_id[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.client_order_id[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.correlation_id[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.order_id[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.receive_time[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> wire[at] = order_canceled_message_record.total_filled[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> wire[at] = order_canceled_message_record.instrument_id[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_canceled_message_record.cancel_reason; at = at + 1;
  skip
}

/* Order Canceled Message off the wire, 57 bytes from where the cursor stands */
inline decode_order_canceled_message(order_canceled_message_record) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.timestamp[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.exec_id[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.client_order_id[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.correlation_id[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.order_id[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.receive_time[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.total_filled[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> order_canceled_message_record.instrument_id[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Canceled Message is what was written, byte for byte */
inline equal_order_canceled_message(order_canceled_message_read, order_canceled_message_written) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.timestamp[order_canceled_message_at] == order_canceled_message_written.timestamp[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.exec_id[order_canceled_message_at] == order_canceled_message_written.exec_id[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.client_order_id[order_canceled_message_at] == order_canceled_message_written.client_order_id[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.correlation_id[order_canceled_message_at] == order_canceled_message_written.correlation_id[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.order_id[order_canceled_message_at] == order_canceled_message_written.order_id[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.receive_time[order_canceled_message_at] == order_canceled_message_written.receive_time[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> assert(order_canceled_message_read.total_filled[order_canceled_message_at] == order_canceled_message_written.total_filled[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 4 -> assert(order_canceled_message_read.instrument_id[order_canceled_message_at] == order_canceled_message_written.instrument_id[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  assert(order_canceled_message_read.cancel_reason == order_canceled_message_written.cancel_reason);
  skip
}

/* ---- Cancel Order Reject Message: 64 bytes ----------------------------------- */

/* CancelOrderRejectMessage */
typedef CancelOrderRejectMessage {
  byte timestamp[8];
  byte client_order_id[8];
  byte correlation_id[8];
  byte order_id_optional[8];
  byte cancel_order_reject_reason;
  byte cancel_order_reject_details[31]
};

int cancel_order_reject_message_at;

/* every byte of Cancel Order Reject Message set to one value */
inline fill_cancel_order_reject_message(cancel_order_reject_message_record, cancel_order_reject_message_value) {
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.timestamp[cancel_order_reject_message_at] = cancel_order_reject_message_value; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.client_order_id[cancel_order_reject_message_at] = cancel_order_reject_message_value; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.correlation_id[cancel_order_reject_message_at] = cancel_order_reject_message_value; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.order_id_optional[cancel_order_reject_message_at] = cancel_order_reject_message_value; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_record.cancel_order_reject_reason = cancel_order_reject_message_value;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 31 -> cancel_order_reject_message_record.cancel_order_reject_details[cancel_order_reject_message_at] = cancel_order_reject_message_value; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Reject Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_reject_message(cancel_order_reject_message_record, cancel_order_reject_message_base) {
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.timestamp[cancel_order_reject_message_at] = (cancel_order_reject_message_base + 0 + cancel_order_reject_message_at + 1) % 256; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.client_order_id[cancel_order_reject_message_at] = (cancel_order_reject_message_base + 8 + cancel_order_reject_message_at + 1) % 256; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.correlation_id[cancel_order_reject_message_at] = (cancel_order_reject_message_base + 16 + cancel_order_reject_message_at + 1) % 256; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.order_id_optional[cancel_order_reject_message_at] = (cancel_order_reject_message_base + 24 + cancel_order_reject_message_at + 1) % 256; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_record.cancel_order_reject_reason = (cancel_order_reject_message_base + 32 + 1) % 256;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 31 -> cancel_order_reject_message_record.cancel_order_reject_details[cancel_order_reject_message_at] = (cancel_order_reject_message_base + 33 + cancel_order_reject_message_at + 1) % 256; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Reject Message to the wire, 64 bytes from where the cursor stands */
inline encode_cancel_order_reject_message(cancel_order_reject_message_record) {
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> wire[at] = cancel_order_reject_message_record.timestamp[cancel_order_reject_message_at]; at = at + 1; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> wire[at] = cancel_order_reject_message_record.client_order_id[cancel_order_reject_message_at]; at = at + 1; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> wire[at] = cancel_order_reject_message_record.correlation_id[cancel_order_reject_message_at]; at = at + 1; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> wire[at] = cancel_order_reject_message_record.order_id_optional[cancel_order_reject_message_at]; at = at + 1; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_order_reject_message_record.cancel_order_reject_reason; at = at + 1;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 31 -> wire[at] = cancel_order_reject_message_record.cancel_order_reject_details[cancel_order_reject_message_at]; at = at + 1; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Reject Message off the wire, 64 bytes from where the cursor stands */
inline decode_cancel_order_reject_message(cancel_order_reject_message_record) {
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.timestamp[cancel_order_reject_message_at] = wire[at]; at = at + 1; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.client_order_id[cancel_order_reject_message_at] = wire[at]; at = at + 1; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.correlation_id[cancel_order_reject_message_at] = wire[at]; at = at + 1; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> cancel_order_reject_message_record.order_id_optional[cancel_order_reject_message_at] = wire[at]; at = at + 1; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_record.cancel_order_reject_reason = wire[at]; at = at + 1;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 31 -> cancel_order_reject_message_record.cancel_order_reject_details[cancel_order_reject_message_at] = wire[at]; at = at + 1; cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Reject Message is what was written, byte for byte */
inline equal_cancel_order_reject_message(cancel_order_reject_message_read, cancel_order_reject_message_written) {
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> assert(cancel_order_reject_message_read.timestamp[cancel_order_reject_message_at] == cancel_order_reject_message_written.timestamp[cancel_order_reject_message_at]); cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> assert(cancel_order_reject_message_read.client_order_id[cancel_order_reject_message_at] == cancel_order_reject_message_written.client_order_id[cancel_order_reject_message_at]); cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> assert(cancel_order_reject_message_read.correlation_id[cancel_order_reject_message_at] == cancel_order_reject_message_written.correlation_id[cancel_order_reject_message_at]); cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 8 -> assert(cancel_order_reject_message_read.order_id_optional[cancel_order_reject_message_at] == cancel_order_reject_message_written.order_id_optional[cancel_order_reject_message_at]); cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  assert(cancel_order_reject_message_read.cancel_order_reject_reason == cancel_order_reject_message_written.cancel_order_reject_reason);
  cancel_order_reject_message_at = 0;
  do
  :: cancel_order_reject_message_at < 31 -> assert(cancel_order_reject_message_read.cancel_order_reject_details[cancel_order_reject_message_at] == cancel_order_reject_message_written.cancel_order_reject_details[cancel_order_reject_message_at]); cancel_order_reject_message_at = cancel_order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Cancel Order Message: 23 bytes ------------------------------------- */

/* MassCancelOrderMessage */
typedef MassCancelOrderMessage {
  byte correlation_id[8];
  byte limit_price[8];
  byte instrument_id[4];
  byte side;
  byte current_session_only;
  byte request_trading_lock
};

int mass_cancel_order_message_at;

/* every byte of Mass Cancel Order Message set to one value */
inline fill_mass_cancel_order_message(mass_cancel_order_message_record, mass_cancel_order_message_value) {
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> mass_cancel_order_message_record.correlation_id[mass_cancel_order_message_at] = mass_cancel_order_message_value; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> mass_cancel_order_message_record.limit_price[mass_cancel_order_message_at] = mass_cancel_order_message_value; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> mass_cancel_order_message_record.instrument_id[mass_cancel_order_message_at] = mass_cancel_order_message_value; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_record.side = mass_cancel_order_message_value;
  mass_cancel_order_message_record.current_session_only = mass_cancel_order_message_value;
  mass_cancel_order_message_record.request_trading_lock = mass_cancel_order_message_value;
  skip
}

/* each byte of Mass Cancel Order Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_order_message(mass_cancel_order_message_record, mass_cancel_order_message_base) {
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> mass_cancel_order_message_record.correlation_id[mass_cancel_order_message_at] = (mass_cancel_order_message_base + 0 + mass_cancel_order_message_at + 1) % 256; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> mass_cancel_order_message_record.limit_price[mass_cancel_order_message_at] = (mass_cancel_order_message_base + 8 + mass_cancel_order_message_at + 1) % 256; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> mass_cancel_order_message_record.instrument_id[mass_cancel_order_message_at] = (mass_cancel_order_message_base + 16 + mass_cancel_order_message_at + 1) % 256; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_record.side = (mass_cancel_order_message_base + 20 + 1) % 256;
  mass_cancel_order_message_record.current_session_only = (mass_cancel_order_message_base + 21 + 1) % 256;
  mass_cancel_order_message_record.request_trading_lock = (mass_cancel_order_message_base + 22 + 1) % 256;
  skip
}

/* Mass Cancel Order Message to the wire, 23 bytes from where the cursor stands */
inline encode_mass_cancel_order_message(mass_cancel_order_message_record) {
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> wire[at] = mass_cancel_order_message_record.correlation_id[mass_cancel_order_message_at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> wire[at] = mass_cancel_order_message_record.limit_price[mass_cancel_order_message_at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> wire[at] = mass_cancel_order_message_record.instrument_id[mass_cancel_order_message_at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_order_message_record.side; at = at + 1;
  wire[at] = mass_cancel_order_message_record.current_session_only; at = at + 1;
  wire[at] = mass_cancel_order_message_record.request_trading_lock; at = at + 1;
  skip
}

/* Mass Cancel Order Message off the wire, 23 bytes from where the cursor stands */
inline decode_mass_cancel_order_message(mass_cancel_order_message_record) {
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> mass_cancel_order_message_record.correlation_id[mass_cancel_order_message_at] = wire[at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> mass_cancel_order_message_record.limit_price[mass_cancel_order_message_at] = wire[at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> mass_cancel_order_message_record.instrument_id[mass_cancel_order_message_at] = wire[at]; at = at + 1; mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_record.side = wire[at]; at = at + 1;
  mass_cancel_order_message_record.current_session_only = wire[at]; at = at + 1;
  mass_cancel_order_message_record.request_trading_lock = wire[at]; at = at + 1;
  skip
}

/* what was read of Mass Cancel Order Message is what was written, byte for byte */
inline equal_mass_cancel_order_message(mass_cancel_order_message_read, mass_cancel_order_message_written) {
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> assert(mass_cancel_order_message_read.correlation_id[mass_cancel_order_message_at] == mass_cancel_order_message_written.correlation_id[mass_cancel_order_message_at]); mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 8 -> assert(mass_cancel_order_message_read.limit_price[mass_cancel_order_message_at] == mass_cancel_order_message_written.limit_price[mass_cancel_order_message_at]); mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_message_at = 0;
  do
  :: mass_cancel_order_message_at < 4 -> assert(mass_cancel_order_message_read.instrument_id[mass_cancel_order_message_at] == mass_cancel_order_message_written.instrument_id[mass_cancel_order_message_at]); mass_cancel_order_message_at = mass_cancel_order_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_order_message_read.side == mass_cancel_order_message_written.side);
  assert(mass_cancel_order_message_read.current_session_only == mass_cancel_order_message_written.current_session_only);
  assert(mass_cancel_order_message_read.request_trading_lock == mass_cancel_order_message_written.request_trading_lock);
  skip
}

/* ---- Mass Cancel Order Ack Message: 30 bytes --------------------------------- */

/* MassCancelOrderAckMessage */
typedef MassCancelOrderAckMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte correlation_id[8];
  byte canceled_count[4];
  byte only_current_session;
  byte trading_lock_applied
};

int mass_cancel_order_ack_message_at;

/* every byte of Mass Cancel Order Ack Message set to one value */
inline fill_mass_cancel_order_ack_message(mass_cancel_order_ack_message_record, mass_cancel_order_ack_message_value) {
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> mass_cancel_order_ack_message_record.timestamp[mass_cancel_order_ack_message_at] = mass_cancel_order_ack_message_value; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> mass_cancel_order_ack_message_record.exec_id[mass_cancel_order_ack_message_at] = mass_cancel_order_ack_message_value; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> mass_cancel_order_ack_message_record.correlation_id[mass_cancel_order_ack_message_at] = mass_cancel_order_ack_message_value; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 4 -> mass_cancel_order_ack_message_record.canceled_count[mass_cancel_order_ack_message_at] = mass_cancel_order_ack_message_value; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_record.only_current_session = mass_cancel_order_ack_message_value;
  mass_cancel_order_ack_message_record.trading_lock_applied = mass_cancel_order_ack_message_value;
  skip
}

/* each byte of Mass Cancel Order Ack Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_order_ack_message(mass_cancel_order_ack_message_record, mass_cancel_order_ack_message_base) {
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> mass_cancel_order_ack_message_record.timestamp[mass_cancel_order_ack_message_at] = (mass_cancel_order_ack_message_base + 0 + mass_cancel_order_ack_message_at + 1) % 256; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> mass_cancel_order_ack_message_record.exec_id[mass_cancel_order_ack_message_at] = (mass_cancel_order_ack_message_base + 8 + mass_cancel_order_ack_message_at + 1) % 256; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> mass_cancel_order_ack_message_record.correlation_id[mass_cancel_order_ack_message_at] = (mass_cancel_order_ack_message_base + 16 + mass_cancel_order_ack_message_at + 1) % 256; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 4 -> mass_cancel_order_ack_message_record.canceled_count[mass_cancel_order_ack_message_at] = (mass_cancel_order_ack_message_base + 24 + mass_cancel_order_ack_message_at + 1) % 256; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_record.only_current_session = (mass_cancel_order_ack_message_base + 28 + 1) % 256;
  mass_cancel_order_ack_message_record.trading_lock_applied = (mass_cancel_order_ack_message_base + 29 + 1) % 256;
  skip
}

/* Mass Cancel Order Ack Message to the wire, 30 bytes from where the cursor stands */
inline encode_mass_cancel_order_ack_message(mass_cancel_order_ack_message_record) {
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> wire[at] = mass_cancel_order_ack_message_record.timestamp[mass_cancel_order_ack_message_at]; at = at + 1; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> wire[at] = mass_cancel_order_ack_message_record.exec_id[mass_cancel_order_ack_message_at]; at = at + 1; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> wire[at] = mass_cancel_order_ack_message_record.correlation_id[mass_cancel_order_ack_message_at]; at = at + 1; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 4 -> wire[at] = mass_cancel_order_ack_message_record.canceled_count[mass_cancel_order_ack_message_at]; at = at + 1; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_order_ack_message_record.only_current_session; at = at + 1;
  wire[at] = mass_cancel_order_ack_message_record.trading_lock_applied; at = at + 1;
  skip
}

/* Mass Cancel Order Ack Message off the wire, 30 bytes from where the cursor stands */
inline decode_mass_cancel_order_ack_message(mass_cancel_order_ack_message_record) {
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> mass_cancel_order_ack_message_record.timestamp[mass_cancel_order_ack_message_at] = wire[at]; at = at + 1; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> mass_cancel_order_ack_message_record.exec_id[mass_cancel_order_ack_message_at] = wire[at]; at = at + 1; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> mass_cancel_order_ack_message_record.correlation_id[mass_cancel_order_ack_message_at] = wire[at]; at = at + 1; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 4 -> mass_cancel_order_ack_message_record.canceled_count[mass_cancel_order_ack_message_at] = wire[at]; at = at + 1; mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_record.only_current_session = wire[at]; at = at + 1;
  mass_cancel_order_ack_message_record.trading_lock_applied = wire[at]; at = at + 1;
  skip
}

/* what was read of Mass Cancel Order Ack Message is what was written, byte for byte */
inline equal_mass_cancel_order_ack_message(mass_cancel_order_ack_message_read, mass_cancel_order_ack_message_written) {
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> assert(mass_cancel_order_ack_message_read.timestamp[mass_cancel_order_ack_message_at] == mass_cancel_order_ack_message_written.timestamp[mass_cancel_order_ack_message_at]); mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> assert(mass_cancel_order_ack_message_read.exec_id[mass_cancel_order_ack_message_at] == mass_cancel_order_ack_message_written.exec_id[mass_cancel_order_ack_message_at]); mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 8 -> assert(mass_cancel_order_ack_message_read.correlation_id[mass_cancel_order_ack_message_at] == mass_cancel_order_ack_message_written.correlation_id[mass_cancel_order_ack_message_at]); mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_ack_message_at = 0;
  do
  :: mass_cancel_order_ack_message_at < 4 -> assert(mass_cancel_order_ack_message_read.canceled_count[mass_cancel_order_ack_message_at] == mass_cancel_order_ack_message_written.canceled_count[mass_cancel_order_ack_message_at]); mass_cancel_order_ack_message_at = mass_cancel_order_ack_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_order_ack_message_read.only_current_session == mass_cancel_order_ack_message_written.only_current_session);
  assert(mass_cancel_order_ack_message_read.trading_lock_applied == mass_cancel_order_ack_message_written.trading_lock_applied);
  skip
}

/* ---- Mass Cancel Order Reject Message: 48 bytes ------------------------------ */

/* MassCancelOrderRejectMessage */
typedef MassCancelOrderRejectMessage {
  byte timestamp[8];
  byte correlation_id[8];
  byte error_message[32]
};

int mass_cancel_order_reject_message_at;

/* every byte of Mass Cancel Order Reject Message set to one value */
inline fill_mass_cancel_order_reject_message(mass_cancel_order_reject_message_record, mass_cancel_order_reject_message_value) {
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 8 -> mass_cancel_order_reject_message_record.timestamp[mass_cancel_order_reject_message_at] = mass_cancel_order_reject_message_value; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 8 -> mass_cancel_order_reject_message_record.correlation_id[mass_cancel_order_reject_message_at] = mass_cancel_order_reject_message_value; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 32 -> mass_cancel_order_reject_message_record.error_message[mass_cancel_order_reject_message_at] = mass_cancel_order_reject_message_value; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Order Reject Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_order_reject_message(mass_cancel_order_reject_message_record, mass_cancel_order_reject_message_base) {
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 8 -> mass_cancel_order_reject_message_record.timestamp[mass_cancel_order_reject_message_at] = (mass_cancel_order_reject_message_base + 0 + mass_cancel_order_reject_message_at + 1) % 256; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 8 -> mass_cancel_order_reject_message_record.correlation_id[mass_cancel_order_reject_message_at] = (mass_cancel_order_reject_message_base + 8 + mass_cancel_order_reject_message_at + 1) % 256; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 32 -> mass_cancel_order_reject_message_record.error_message[mass_cancel_order_reject_message_at] = (mass_cancel_order_reject_message_base + 16 + mass_cancel_order_reject_message_at + 1) % 256; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Order Reject Message to the wire, 48 bytes from where the cursor stands */
inline encode_mass_cancel_order_reject_message(mass_cancel_order_reject_message_record) {
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 8 -> wire[at] = mass_cancel_order_reject_message_record.timestamp[mass_cancel_order_reject_message_at]; at = at + 1; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 8 -> wire[at] = mass_cancel_order_reject_message_record.correlation_id[mass_cancel_order_reject_message_at]; at = at + 1; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 32 -> wire[at] = mass_cancel_order_reject_message_record.error_message[mass_cancel_order_reject_message_at]; at = at + 1; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Order Reject Message off the wire, 48 bytes from where the cursor stands */
inline decode_mass_cancel_order_reject_message(mass_cancel_order_reject_message_record) {
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 8 -> mass_cancel_order_reject_message_record.timestamp[mass_cancel_order_reject_message_at] = wire[at]; at = at + 1; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 8 -> mass_cancel_order_reject_message_record.correlation_id[mass_cancel_order_reject_message_at] = wire[at]; at = at + 1; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 32 -> mass_cancel_order_reject_message_record.error_message[mass_cancel_order_reject_message_at] = wire[at]; at = at + 1; mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Order Reject Message is what was written, byte for byte */
inline equal_mass_cancel_order_reject_message(mass_cancel_order_reject_message_read, mass_cancel_order_reject_message_written) {
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 8 -> assert(mass_cancel_order_reject_message_read.timestamp[mass_cancel_order_reject_message_at] == mass_cancel_order_reject_message_written.timestamp[mass_cancel_order_reject_message_at]); mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 8 -> assert(mass_cancel_order_reject_message_read.correlation_id[mass_cancel_order_reject_message_at] == mass_cancel_order_reject_message_written.correlation_id[mass_cancel_order_reject_message_at]); mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  mass_cancel_order_reject_message_at = 0;
  do
  :: mass_cancel_order_reject_message_at < 32 -> assert(mass_cancel_order_reject_message_read.error_message[mass_cancel_order_reject_message_at] == mass_cancel_order_reject_message_written.error_message[mass_cancel_order_reject_message_at]); mass_cancel_order_reject_message_at = mass_cancel_order_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Unlock Trading Message: 9 bytes ----------------------------------------- */

/* UnlockTradingMessage */
typedef UnlockTradingMessage {
  byte correlation_id[8];
  byte current_session_only
};

int unlock_trading_message_at;

/* every byte of Unlock Trading Message set to one value */
inline fill_unlock_trading_message(unlock_trading_message_record, unlock_trading_message_value) {
  unlock_trading_message_at = 0;
  do
  :: unlock_trading_message_at < 8 -> unlock_trading_message_record.correlation_id[unlock_trading_message_at] = unlock_trading_message_value; unlock_trading_message_at = unlock_trading_message_at + 1
  :: else -> break
  od;
  unlock_trading_message_record.current_session_only = unlock_trading_message_value;
  skip
}

/* each byte of Unlock Trading Message set to where it lies, so a field read out of place says so */
inline ramp_unlock_trading_message(unlock_trading_message_record, unlock_trading_message_base) {
  unlock_trading_message_at = 0;
  do
  :: unlock_trading_message_at < 8 -> unlock_trading_message_record.correlation_id[unlock_trading_message_at] = (unlock_trading_message_base + 0 + unlock_trading_message_at + 1) % 256; unlock_trading_message_at = unlock_trading_message_at + 1
  :: else -> break
  od;
  unlock_trading_message_record.current_session_only = (unlock_trading_message_base + 8 + 1) % 256;
  skip
}

/* Unlock Trading Message to the wire, 9 bytes from where the cursor stands */
inline encode_unlock_trading_message(unlock_trading_message_record) {
  unlock_trading_message_at = 0;
  do
  :: unlock_trading_message_at < 8 -> wire[at] = unlock_trading_message_record.correlation_id[unlock_trading_message_at]; at = at + 1; unlock_trading_message_at = unlock_trading_message_at + 1
  :: else -> break
  od;
  wire[at] = unlock_trading_message_record.current_session_only; at = at + 1;
  skip
}

/* Unlock Trading Message off the wire, 9 bytes from where the cursor stands */
inline decode_unlock_trading_message(unlock_trading_message_record) {
  unlock_trading_message_at = 0;
  do
  :: unlock_trading_message_at < 8 -> unlock_trading_message_record.correlation_id[unlock_trading_message_at] = wire[at]; at = at + 1; unlock_trading_message_at = unlock_trading_message_at + 1
  :: else -> break
  od;
  unlock_trading_message_record.current_session_only = wire[at]; at = at + 1;
  skip
}

/* what was read of Unlock Trading Message is what was written, byte for byte */
inline equal_unlock_trading_message(unlock_trading_message_read, unlock_trading_message_written) {
  unlock_trading_message_at = 0;
  do
  :: unlock_trading_message_at < 8 -> assert(unlock_trading_message_read.correlation_id[unlock_trading_message_at] == unlock_trading_message_written.correlation_id[unlock_trading_message_at]); unlock_trading_message_at = unlock_trading_message_at + 1
  :: else -> break
  od;
  assert(unlock_trading_message_read.current_session_only == unlock_trading_message_written.current_session_only);
  skip
}

/* ---- Unlock Trading Ack Message: 20 bytes ------------------------------------ */

/* UnlockTradingAckMessage */
typedef UnlockTradingAckMessage {
  byte timestamp[8];
  byte correlation_id[8];
  byte num_users_affected[4]
};

int unlock_trading_ack_message_at;

/* every byte of Unlock Trading Ack Message set to one value */
inline fill_unlock_trading_ack_message(unlock_trading_ack_message_record, unlock_trading_ack_message_value) {
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 8 -> unlock_trading_ack_message_record.timestamp[unlock_trading_ack_message_at] = unlock_trading_ack_message_value; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 8 -> unlock_trading_ack_message_record.correlation_id[unlock_trading_ack_message_at] = unlock_trading_ack_message_value; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 4 -> unlock_trading_ack_message_record.num_users_affected[unlock_trading_ack_message_at] = unlock_trading_ack_message_value; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Unlock Trading Ack Message set to where it lies, so a field read out of place says so */
inline ramp_unlock_trading_ack_message(unlock_trading_ack_message_record, unlock_trading_ack_message_base) {
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 8 -> unlock_trading_ack_message_record.timestamp[unlock_trading_ack_message_at] = (unlock_trading_ack_message_base + 0 + unlock_trading_ack_message_at + 1) % 256; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 8 -> unlock_trading_ack_message_record.correlation_id[unlock_trading_ack_message_at] = (unlock_trading_ack_message_base + 8 + unlock_trading_ack_message_at + 1) % 256; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 4 -> unlock_trading_ack_message_record.num_users_affected[unlock_trading_ack_message_at] = (unlock_trading_ack_message_base + 16 + unlock_trading_ack_message_at + 1) % 256; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unlock Trading Ack Message to the wire, 20 bytes from where the cursor stands */
inline encode_unlock_trading_ack_message(unlock_trading_ack_message_record) {
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 8 -> wire[at] = unlock_trading_ack_message_record.timestamp[unlock_trading_ack_message_at]; at = at + 1; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 8 -> wire[at] = unlock_trading_ack_message_record.correlation_id[unlock_trading_ack_message_at]; at = at + 1; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 4 -> wire[at] = unlock_trading_ack_message_record.num_users_affected[unlock_trading_ack_message_at]; at = at + 1; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unlock Trading Ack Message off the wire, 20 bytes from where the cursor stands */
inline decode_unlock_trading_ack_message(unlock_trading_ack_message_record) {
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 8 -> unlock_trading_ack_message_record.timestamp[unlock_trading_ack_message_at] = wire[at]; at = at + 1; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 8 -> unlock_trading_ack_message_record.correlation_id[unlock_trading_ack_message_at] = wire[at]; at = at + 1; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 4 -> unlock_trading_ack_message_record.num_users_affected[unlock_trading_ack_message_at] = wire[at]; at = at + 1; unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Unlock Trading Ack Message is what was written, byte for byte */
inline equal_unlock_trading_ack_message(unlock_trading_ack_message_read, unlock_trading_ack_message_written) {
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 8 -> assert(unlock_trading_ack_message_read.timestamp[unlock_trading_ack_message_at] == unlock_trading_ack_message_written.timestamp[unlock_trading_ack_message_at]); unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 8 -> assert(unlock_trading_ack_message_read.correlation_id[unlock_trading_ack_message_at] == unlock_trading_ack_message_written.correlation_id[unlock_trading_ack_message_at]); unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  unlock_trading_ack_message_at = 0;
  do
  :: unlock_trading_ack_message_at < 4 -> assert(unlock_trading_ack_message_read.num_users_affected[unlock_trading_ack_message_at] == unlock_trading_ack_message_written.num_users_affected[unlock_trading_ack_message_at]); unlock_trading_ack_message_at = unlock_trading_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Unlock Trading Reject Message: 48 bytes --------------------------------- */

/* UnlockTradingRejectMessage */
typedef UnlockTradingRejectMessage {
  byte timestamp[8];
  byte correlation_id[8];
  byte error_message[32]
};

int unlock_trading_reject_message_at;

/* every byte of Unlock Trading Reject Message set to one value */
inline fill_unlock_trading_reject_message(unlock_trading_reject_message_record, unlock_trading_reject_message_value) {
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 8 -> unlock_trading_reject_message_record.timestamp[unlock_trading_reject_message_at] = unlock_trading_reject_message_value; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 8 -> unlock_trading_reject_message_record.correlation_id[unlock_trading_reject_message_at] = unlock_trading_reject_message_value; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 32 -> unlock_trading_reject_message_record.error_message[unlock_trading_reject_message_at] = unlock_trading_reject_message_value; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Unlock Trading Reject Message set to where it lies, so a field read out of place says so */
inline ramp_unlock_trading_reject_message(unlock_trading_reject_message_record, unlock_trading_reject_message_base) {
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 8 -> unlock_trading_reject_message_record.timestamp[unlock_trading_reject_message_at] = (unlock_trading_reject_message_base + 0 + unlock_trading_reject_message_at + 1) % 256; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 8 -> unlock_trading_reject_message_record.correlation_id[unlock_trading_reject_message_at] = (unlock_trading_reject_message_base + 8 + unlock_trading_reject_message_at + 1) % 256; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 32 -> unlock_trading_reject_message_record.error_message[unlock_trading_reject_message_at] = (unlock_trading_reject_message_base + 16 + unlock_trading_reject_message_at + 1) % 256; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unlock Trading Reject Message to the wire, 48 bytes from where the cursor stands */
inline encode_unlock_trading_reject_message(unlock_trading_reject_message_record) {
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 8 -> wire[at] = unlock_trading_reject_message_record.timestamp[unlock_trading_reject_message_at]; at = at + 1; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 8 -> wire[at] = unlock_trading_reject_message_record.correlation_id[unlock_trading_reject_message_at]; at = at + 1; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 32 -> wire[at] = unlock_trading_reject_message_record.error_message[unlock_trading_reject_message_at]; at = at + 1; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unlock Trading Reject Message off the wire, 48 bytes from where the cursor stands */
inline decode_unlock_trading_reject_message(unlock_trading_reject_message_record) {
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 8 -> unlock_trading_reject_message_record.timestamp[unlock_trading_reject_message_at] = wire[at]; at = at + 1; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 8 -> unlock_trading_reject_message_record.correlation_id[unlock_trading_reject_message_at] = wire[at]; at = at + 1; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 32 -> unlock_trading_reject_message_record.error_message[unlock_trading_reject_message_at] = wire[at]; at = at + 1; unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Unlock Trading Reject Message is what was written, byte for byte */
inline equal_unlock_trading_reject_message(unlock_trading_reject_message_read, unlock_trading_reject_message_written) {
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 8 -> assert(unlock_trading_reject_message_read.timestamp[unlock_trading_reject_message_at] == unlock_trading_reject_message_written.timestamp[unlock_trading_reject_message_at]); unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 8 -> assert(unlock_trading_reject_message_read.correlation_id[unlock_trading_reject_message_at] == unlock_trading_reject_message_written.correlation_id[unlock_trading_reject_message_at]); unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  unlock_trading_reject_message_at = 0;
  do
  :: unlock_trading_reject_message_at < 32 -> assert(unlock_trading_reject_message_read.error_message[unlock_trading_reject_message_at] == unlock_trading_reject_message_written.error_message[unlock_trading_reject_message_at]); unlock_trading_reject_message_at = unlock_trading_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Filled Message: 81 bytes ------------------------------------------ */

/* OrderFilledMessage */
typedef OrderFilledMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte match_id[8];
  byte client_order_id[8];
  byte correlation_id[8];
  byte order_id[8];
  byte filled_vwap[8];
  byte total_filled[4];
  byte available_qty[4];
  byte fill_price[8];
  byte fill_qty[4];
  byte instrument_id[4];
  byte is_aggressor
};

int order_filled_message_at;

/* every byte of Order Filled Message set to one value */
inline fill_order_filled_message(order_filled_message_record, order_filled_message_value) {
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.timestamp[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.exec_id[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.match_id[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.client_order_id[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.correlation_id[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.order_id[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.filled_vwap[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.total_filled[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.available_qty[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.fill_price[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.fill_qty[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.instrument_id[order_filled_message_at] = order_filled_message_value; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_record.is_aggressor = order_filled_message_value;
  skip
}

/* each byte of Order Filled Message set to where it lies, so a field read out of place says so */
inline ramp_order_filled_message(order_filled_message_record, order_filled_message_base) {
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.timestamp[order_filled_message_at] = (order_filled_message_base + 0 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.exec_id[order_filled_message_at] = (order_filled_message_base + 8 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.match_id[order_filled_message_at] = (order_filled_message_base + 16 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.client_order_id[order_filled_message_at] = (order_filled_message_base + 24 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.correlation_id[order_filled_message_at] = (order_filled_message_base + 32 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.order_id[order_filled_message_at] = (order_filled_message_base + 40 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.filled_vwap[order_filled_message_at] = (order_filled_message_base + 48 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.total_filled[order_filled_message_at] = (order_filled_message_base + 56 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.available_qty[order_filled_message_at] = (order_filled_message_base + 60 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.fill_price[order_filled_message_at] = (order_filled_message_base + 64 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.fill_qty[order_filled_message_at] = (order_filled_message_base + 72 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.instrument_id[order_filled_message_at] = (order_filled_message_base + 76 + order_filled_message_at + 1) % 256; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_record.is_aggressor = (order_filled_message_base + 80 + 1) % 256;
  skip
}

/* Order Filled Message to the wire, 81 bytes from where the cursor stands */
inline encode_order_filled_message(order_filled_message_record) {
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> wire[at] = order_filled_message_record.timestamp[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> wire[at] = order_filled_message_record.exec_id[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> wire[at] = order_filled_message_record.match_id[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> wire[at] = order_filled_message_record.client_order_id[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> wire[at] = order_filled_message_record.correlation_id[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> wire[at] = order_filled_message_record.order_id[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> wire[at] = order_filled_message_record.filled_vwap[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> wire[at] = order_filled_message_record.total_filled[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> wire[at] = order_filled_message_record.available_qty[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> wire[at] = order_filled_message_record.fill_price[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> wire[at] = order_filled_message_record.fill_qty[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> wire[at] = order_filled_message_record.instrument_id[order_filled_message_at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_filled_message_record.is_aggressor; at = at + 1;
  skip
}

/* Order Filled Message off the wire, 81 bytes from where the cursor stands */
inline decode_order_filled_message(order_filled_message_record) {
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.timestamp[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.exec_id[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.match_id[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.client_order_id[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.correlation_id[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.order_id[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.filled_vwap[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.total_filled[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.available_qty[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> order_filled_message_record.fill_price[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.fill_qty[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> order_filled_message_record.instrument_id[order_filled_message_at] = wire[at]; at = at + 1; order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_record.is_aggressor = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Filled Message is what was written, byte for byte */
inline equal_order_filled_message(order_filled_message_read, order_filled_message_written) {
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> assert(order_filled_message_read.timestamp[order_filled_message_at] == order_filled_message_written.timestamp[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> assert(order_filled_message_read.exec_id[order_filled_message_at] == order_filled_message_written.exec_id[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> assert(order_filled_message_read.match_id[order_filled_message_at] == order_filled_message_written.match_id[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> assert(order_filled_message_read.client_order_id[order_filled_message_at] == order_filled_message_written.client_order_id[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> assert(order_filled_message_read.correlation_id[order_filled_message_at] == order_filled_message_written.correlation_id[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> assert(order_filled_message_read.order_id[order_filled_message_at] == order_filled_message_written.order_id[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> assert(order_filled_message_read.filled_vwap[order_filled_message_at] == order_filled_message_written.filled_vwap[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> assert(order_filled_message_read.total_filled[order_filled_message_at] == order_filled_message_written.total_filled[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> assert(order_filled_message_read.available_qty[order_filled_message_at] == order_filled_message_written.available_qty[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 8 -> assert(order_filled_message_read.fill_price[order_filled_message_at] == order_filled_message_written.fill_price[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> assert(order_filled_message_read.fill_qty[order_filled_message_at] == order_filled_message_written.fill_qty[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  order_filled_message_at = 0;
  do
  :: order_filled_message_at < 4 -> assert(order_filled_message_read.instrument_id[order_filled_message_at] == order_filled_message_written.instrument_id[order_filled_message_at]); order_filled_message_at = order_filled_message_at + 1
  :: else -> break
  od;
  assert(order_filled_message_read.is_aggressor == order_filled_message_written.is_aggressor);
  skip
}

/* ---- Spread Order Filled Message: 97 bytes ----------------------------------- */

/* SpreadOrderFilledMessage */
typedef SpreadOrderFilledMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte match_id[8];
  byte client_order_id[8];
  byte correlation_id[8];
  byte order_id[8];
  byte filled_vwap[8];
  byte total_filled[4];
  byte available_qty[4];
  byte fill_price[8];
  byte leg_1_fill_price[8];
  byte leg_2_fill_price[8];
  byte fill_qty[4];
  byte instrument_id[4];
  byte is_aggressor
};

int spread_order_filled_message_at;

/* every byte of Spread Order Filled Message set to one value */
inline fill_spread_order_filled_message(spread_order_filled_message_record, spread_order_filled_message_value) {
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.timestamp[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.exec_id[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.match_id[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.client_order_id[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.correlation_id[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.order_id[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.filled_vwap[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.total_filled[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.available_qty[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.fill_price[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.leg_1_fill_price[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.leg_2_fill_price[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.fill_qty[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.instrument_id[spread_order_filled_message_at] = spread_order_filled_message_value; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_record.is_aggressor = spread_order_filled_message_value;
  skip
}

/* each byte of Spread Order Filled Message set to where it lies, so a field read out of place says so */
inline ramp_spread_order_filled_message(spread_order_filled_message_record, spread_order_filled_message_base) {
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.timestamp[spread_order_filled_message_at] = (spread_order_filled_message_base + 0 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.exec_id[spread_order_filled_message_at] = (spread_order_filled_message_base + 8 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.match_id[spread_order_filled_message_at] = (spread_order_filled_message_base + 16 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.client_order_id[spread_order_filled_message_at] = (spread_order_filled_message_base + 24 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.correlation_id[spread_order_filled_message_at] = (spread_order_filled_message_base + 32 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.order_id[spread_order_filled_message_at] = (spread_order_filled_message_base + 40 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.filled_vwap[spread_order_filled_message_at] = (spread_order_filled_message_base + 48 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.total_filled[spread_order_filled_message_at] = (spread_order_filled_message_base + 56 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.available_qty[spread_order_filled_message_at] = (spread_order_filled_message_base + 60 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.fill_price[spread_order_filled_message_at] = (spread_order_filled_message_base + 64 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.leg_1_fill_price[spread_order_filled_message_at] = (spread_order_filled_message_base + 72 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.leg_2_fill_price[spread_order_filled_message_at] = (spread_order_filled_message_base + 80 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.fill_qty[spread_order_filled_message_at] = (spread_order_filled_message_base + 88 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.instrument_id[spread_order_filled_message_at] = (spread_order_filled_message_base + 92 + spread_order_filled_message_at + 1) % 256; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_record.is_aggressor = (spread_order_filled_message_base + 96 + 1) % 256;
  skip
}

/* Spread Order Filled Message to the wire, 97 bytes from where the cursor stands */
inline encode_spread_order_filled_message(spread_order_filled_message_record) {
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> wire[at] = spread_order_filled_message_record.timestamp[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> wire[at] = spread_order_filled_message_record.exec_id[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> wire[at] = spread_order_filled_message_record.match_id[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> wire[at] = spread_order_filled_message_record.client_order_id[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> wire[at] = spread_order_filled_message_record.correlation_id[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> wire[at] = spread_order_filled_message_record.order_id[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> wire[at] = spread_order_filled_message_record.filled_vwap[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> wire[at] = spread_order_filled_message_record.total_filled[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> wire[at] = spread_order_filled_message_record.available_qty[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> wire[at] = spread_order_filled_message_record.fill_price[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> wire[at] = spread_order_filled_message_record.leg_1_fill_price[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> wire[at] = spread_order_filled_message_record.leg_2_fill_price[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> wire[at] = spread_order_filled_message_record.fill_qty[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> wire[at] = spread_order_filled_message_record.instrument_id[spread_order_filled_message_at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  wire[at] = spread_order_filled_message_record.is_aggressor; at = at + 1;
  skip
}

/* Spread Order Filled Message off the wire, 97 bytes from where the cursor stands */
inline decode_spread_order_filled_message(spread_order_filled_message_record) {
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.timestamp[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.exec_id[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.match_id[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.client_order_id[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.correlation_id[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.order_id[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.filled_vwap[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.total_filled[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.available_qty[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.fill_price[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.leg_1_fill_price[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> spread_order_filled_message_record.leg_2_fill_price[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.fill_qty[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> spread_order_filled_message_record.instrument_id[spread_order_filled_message_at] = wire[at]; at = at + 1; spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_record.is_aggressor = wire[at]; at = at + 1;
  skip
}

/* what was read of Spread Order Filled Message is what was written, byte for byte */
inline equal_spread_order_filled_message(spread_order_filled_message_read, spread_order_filled_message_written) {
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> assert(spread_order_filled_message_read.timestamp[spread_order_filled_message_at] == spread_order_filled_message_written.timestamp[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> assert(spread_order_filled_message_read.exec_id[spread_order_filled_message_at] == spread_order_filled_message_written.exec_id[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> assert(spread_order_filled_message_read.match_id[spread_order_filled_message_at] == spread_order_filled_message_written.match_id[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> assert(spread_order_filled_message_read.client_order_id[spread_order_filled_message_at] == spread_order_filled_message_written.client_order_id[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> assert(spread_order_filled_message_read.correlation_id[spread_order_filled_message_at] == spread_order_filled_message_written.correlation_id[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> assert(spread_order_filled_message_read.order_id[spread_order_filled_message_at] == spread_order_filled_message_written.order_id[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> assert(spread_order_filled_message_read.filled_vwap[spread_order_filled_message_at] == spread_order_filled_message_written.filled_vwap[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> assert(spread_order_filled_message_read.total_filled[spread_order_filled_message_at] == spread_order_filled_message_written.total_filled[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> assert(spread_order_filled_message_read.available_qty[spread_order_filled_message_at] == spread_order_filled_message_written.available_qty[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> assert(spread_order_filled_message_read.fill_price[spread_order_filled_message_at] == spread_order_filled_message_written.fill_price[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> assert(spread_order_filled_message_read.leg_1_fill_price[spread_order_filled_message_at] == spread_order_filled_message_written.leg_1_fill_price[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 8 -> assert(spread_order_filled_message_read.leg_2_fill_price[spread_order_filled_message_at] == spread_order_filled_message_written.leg_2_fill_price[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> assert(spread_order_filled_message_read.fill_qty[spread_order_filled_message_at] == spread_order_filled_message_written.fill_qty[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  spread_order_filled_message_at = 0;
  do
  :: spread_order_filled_message_at < 4 -> assert(spread_order_filled_message_read.instrument_id[spread_order_filled_message_at] == spread_order_filled_message_written.instrument_id[spread_order_filled_message_at]); spread_order_filled_message_at = spread_order_filled_message_at + 1
  :: else -> break
  od;
  assert(spread_order_filled_message_read.is_aggressor == spread_order_filled_message_written.is_aggressor);
  skip
}

/* ---- Last Exec Id Request Message: 8 bytes ----------------------------------- */

/* LastExecIdRequestMessage */
typedef LastExecIdRequestMessage {
  byte correlation_id[8]
};

int last_exec_id_request_message_at;

/* every byte of Last Exec Id Request Message set to one value */
inline fill_last_exec_id_request_message(last_exec_id_request_message_record, last_exec_id_request_message_value) {
  last_exec_id_request_message_at = 0;
  do
  :: last_exec_id_request_message_at < 8 -> last_exec_id_request_message_record.correlation_id[last_exec_id_request_message_at] = last_exec_id_request_message_value; last_exec_id_request_message_at = last_exec_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Last Exec Id Request Message set to where it lies, so a field read out of place says so */
inline ramp_last_exec_id_request_message(last_exec_id_request_message_record, last_exec_id_request_message_base) {
  last_exec_id_request_message_at = 0;
  do
  :: last_exec_id_request_message_at < 8 -> last_exec_id_request_message_record.correlation_id[last_exec_id_request_message_at] = (last_exec_id_request_message_base + 0 + last_exec_id_request_message_at + 1) % 256; last_exec_id_request_message_at = last_exec_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Last Exec Id Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_last_exec_id_request_message(last_exec_id_request_message_record) {
  last_exec_id_request_message_at = 0;
  do
  :: last_exec_id_request_message_at < 8 -> wire[at] = last_exec_id_request_message_record.correlation_id[last_exec_id_request_message_at]; at = at + 1; last_exec_id_request_message_at = last_exec_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Last Exec Id Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_last_exec_id_request_message(last_exec_id_request_message_record) {
  last_exec_id_request_message_at = 0;
  do
  :: last_exec_id_request_message_at < 8 -> last_exec_id_request_message_record.correlation_id[last_exec_id_request_message_at] = wire[at]; at = at + 1; last_exec_id_request_message_at = last_exec_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Last Exec Id Request Message is what was written, byte for byte */
inline equal_last_exec_id_request_message(last_exec_id_request_message_read, last_exec_id_request_message_written) {
  last_exec_id_request_message_at = 0;
  do
  :: last_exec_id_request_message_at < 8 -> assert(last_exec_id_request_message_read.correlation_id[last_exec_id_request_message_at] == last_exec_id_request_message_written.correlation_id[last_exec_id_request_message_at]); last_exec_id_request_message_at = last_exec_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Last Exec Id Message: 24 bytes ------------------------------------------ */

/* LastExecIdMessage */
typedef LastExecIdMessage {
  byte timestamp[8];
  byte last_exec_id[8];
  byte correlation_id[8]
};

int last_exec_id_message_at;

/* every byte of Last Exec Id Message set to one value */
inline fill_last_exec_id_message(last_exec_id_message_record, last_exec_id_message_value) {
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> last_exec_id_message_record.timestamp[last_exec_id_message_at] = last_exec_id_message_value; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> last_exec_id_message_record.last_exec_id[last_exec_id_message_at] = last_exec_id_message_value; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> last_exec_id_message_record.correlation_id[last_exec_id_message_at] = last_exec_id_message_value; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Last Exec Id Message set to where it lies, so a field read out of place says so */
inline ramp_last_exec_id_message(last_exec_id_message_record, last_exec_id_message_base) {
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> last_exec_id_message_record.timestamp[last_exec_id_message_at] = (last_exec_id_message_base + 0 + last_exec_id_message_at + 1) % 256; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> last_exec_id_message_record.last_exec_id[last_exec_id_message_at] = (last_exec_id_message_base + 8 + last_exec_id_message_at + 1) % 256; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> last_exec_id_message_record.correlation_id[last_exec_id_message_at] = (last_exec_id_message_base + 16 + last_exec_id_message_at + 1) % 256; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* Last Exec Id Message to the wire, 24 bytes from where the cursor stands */
inline encode_last_exec_id_message(last_exec_id_message_record) {
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> wire[at] = last_exec_id_message_record.timestamp[last_exec_id_message_at]; at = at + 1; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> wire[at] = last_exec_id_message_record.last_exec_id[last_exec_id_message_at]; at = at + 1; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> wire[at] = last_exec_id_message_record.correlation_id[last_exec_id_message_at]; at = at + 1; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* Last Exec Id Message off the wire, 24 bytes from where the cursor stands */
inline decode_last_exec_id_message(last_exec_id_message_record) {
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> last_exec_id_message_record.timestamp[last_exec_id_message_at] = wire[at]; at = at + 1; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> last_exec_id_message_record.last_exec_id[last_exec_id_message_at] = wire[at]; at = at + 1; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> last_exec_id_message_record.correlation_id[last_exec_id_message_at] = wire[at]; at = at + 1; last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Last Exec Id Message is what was written, byte for byte */
inline equal_last_exec_id_message(last_exec_id_message_read, last_exec_id_message_written) {
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> assert(last_exec_id_message_read.timestamp[last_exec_id_message_at] == last_exec_id_message_written.timestamp[last_exec_id_message_at]); last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> assert(last_exec_id_message_read.last_exec_id[last_exec_id_message_at] == last_exec_id_message_written.last_exec_id[last_exec_id_message_at]); last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  last_exec_id_message_at = 0;
  do
  :: last_exec_id_message_at < 8 -> assert(last_exec_id_message_read.correlation_id[last_exec_id_message_at] == last_exec_id_message_written.correlation_id[last_exec_id_message_at]); last_exec_id_message_at = last_exec_id_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Event Resend Request Message: 24 bytes ---------------------------------- */

/* EventResendRequestMessage */
typedef EventResendRequestMessage {
  byte correlation_id[8];
  byte begin_exec_id[8];
  byte end_exec_id[8]
};

int event_resend_request_message_at;

/* every byte of Event Resend Request Message set to one value */
inline fill_event_resend_request_message(event_resend_request_message_record, event_resend_request_message_value) {
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> event_resend_request_message_record.correlation_id[event_resend_request_message_at] = event_resend_request_message_value; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> event_resend_request_message_record.begin_exec_id[event_resend_request_message_at] = event_resend_request_message_value; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> event_resend_request_message_record.end_exec_id[event_resend_request_message_at] = event_resend_request_message_value; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Event Resend Request Message set to where it lies, so a field read out of place says so */
inline ramp_event_resend_request_message(event_resend_request_message_record, event_resend_request_message_base) {
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> event_resend_request_message_record.correlation_id[event_resend_request_message_at] = (event_resend_request_message_base + 0 + event_resend_request_message_at + 1) % 256; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> event_resend_request_message_record.begin_exec_id[event_resend_request_message_at] = (event_resend_request_message_base + 8 + event_resend_request_message_at + 1) % 256; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> event_resend_request_message_record.end_exec_id[event_resend_request_message_at] = (event_resend_request_message_base + 16 + event_resend_request_message_at + 1) % 256; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Event Resend Request Message to the wire, 24 bytes from where the cursor stands */
inline encode_event_resend_request_message(event_resend_request_message_record) {
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> wire[at] = event_resend_request_message_record.correlation_id[event_resend_request_message_at]; at = at + 1; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> wire[at] = event_resend_request_message_record.begin_exec_id[event_resend_request_message_at]; at = at + 1; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> wire[at] = event_resend_request_message_record.end_exec_id[event_resend_request_message_at]; at = at + 1; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Event Resend Request Message off the wire, 24 bytes from where the cursor stands */
inline decode_event_resend_request_message(event_resend_request_message_record) {
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> event_resend_request_message_record.correlation_id[event_resend_request_message_at] = wire[at]; at = at + 1; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> event_resend_request_message_record.begin_exec_id[event_resend_request_message_at] = wire[at]; at = at + 1; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> event_resend_request_message_record.end_exec_id[event_resend_request_message_at] = wire[at]; at = at + 1; event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Event Resend Request Message is what was written, byte for byte */
inline equal_event_resend_request_message(event_resend_request_message_read, event_resend_request_message_written) {
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> assert(event_resend_request_message_read.correlation_id[event_resend_request_message_at] == event_resend_request_message_written.correlation_id[event_resend_request_message_at]); event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> assert(event_resend_request_message_read.begin_exec_id[event_resend_request_message_at] == event_resend_request_message_written.begin_exec_id[event_resend_request_message_at]); event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  event_resend_request_message_at = 0;
  do
  :: event_resend_request_message_at < 8 -> assert(event_resend_request_message_read.end_exec_id[event_resend_request_message_at] == event_resend_request_message_written.end_exec_id[event_resend_request_message_at]); event_resend_request_message_at = event_resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Event Resend Complete Message: 12 bytes --------------------------------- */

/* EventResendCompleteMessage */
typedef EventResendCompleteMessage {
  byte correlation_id[8];
  byte resent_event_count[4]
};

int event_resend_complete_message_at;

/* every byte of Event Resend Complete Message set to one value */
inline fill_event_resend_complete_message(event_resend_complete_message_record, event_resend_complete_message_value) {
  event_resend_complete_message_at = 0;
  do
  :: event_resend_complete_message_at < 8 -> event_resend_complete_message_record.correlation_id[event_resend_complete_message_at] = event_resend_complete_message_value; event_resend_complete_message_at = event_resend_complete_message_at + 1
  :: else -> break
  od;
  event_resend_complete_message_at = 0;
  do
  :: event_resend_complete_message_at < 4 -> event_resend_complete_message_record.resent_event_count[event_resend_complete_message_at] = event_resend_complete_message_value; event_resend_complete_message_at = event_resend_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Event Resend Complete Message set to where it lies, so a field read out of place says so */
inline ramp_event_resend_complete_message(event_resend_complete_message_record, event_resend_complete_message_base) {
  event_resend_complete_message_at = 0;
  do
  :: event_resend_complete_message_at < 8 -> event_resend_complete_message_record.correlation_id[event_resend_complete_message_at] = (event_resend_complete_message_base + 0 + event_resend_complete_message_at + 1) % 256; event_resend_complete_message_at = event_resend_complete_message_at + 1
  :: else -> break
  od;
  event_resend_complete_message_at = 0;
  do
  :: event_resend_complete_message_at < 4 -> event_resend_complete_message_record.resent_event_count[event_resend_complete_message_at] = (event_resend_complete_message_base + 8 + event_resend_complete_message_at + 1) % 256; event_resend_complete_message_at = event_resend_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Event Resend Complete Message to the wire, 12 bytes from where the cursor stands */
inline encode_event_resend_complete_message(event_resend_complete_message_record) {
  event_resend_complete_message_at = 0;
  do
  :: event_resend_complete_message_at < 8 -> wire[at] = event_resend_complete_message_record.correlation_id[event_resend_complete_message_at]; at = at + 1; event_resend_complete_message_at = event_resend_complete_message_at + 1
  :: else -> break
  od;
  event_resend_complete_message_at = 0;
  do
  :: event_resend_complete_message_at < 4 -> wire[at] = event_resend_complete_message_record.resent_event_count[event_resend_complete_message_at]; at = at + 1; event_resend_complete_message_at = event_resend_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Event Resend Complete Message off the wire, 12 bytes from where the cursor stands */
inline decode_event_resend_complete_message(event_resend_complete_message_record) {
  event_resend_complete_message_at = 0;
  do
  :: event_resend_complete_message_at < 8 -> event_resend_complete_message_record.correlation_id[event_resend_complete_message_at] = wire[at]; at = at + 1; event_resend_complete_message_at = event_resend_complete_message_at + 1
  :: else -> break
  od;
  event_resend_complete_message_at = 0;
  do
  :: event_resend_complete_message_at < 4 -> event_resend_complete_message_record.resent_event_count[event_resend_complete_message_at] = wire[at]; at = at + 1; event_resend_complete_message_at = event_resend_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Event Resend Complete Message is what was written, byte for byte */
inline equal_event_resend_complete_message(event_resend_complete_message_read, event_resend_complete_message_written) {
  event_resend_complete_message_at = 0;
  do
  :: event_resend_complete_message_at < 8 -> assert(event_resend_complete_message_read.correlation_id[event_resend_complete_message_at] == event_resend_complete_message_written.correlation_id[event_resend_complete_message_at]); event_resend_complete_message_at = event_resend_complete_message_at + 1
  :: else -> break
  od;
  event_resend_complete_message_at = 0;
  do
  :: event_resend_complete_message_at < 4 -> assert(event_resend_complete_message_read.resent_event_count[event_resend_complete_message_at] == event_resend_complete_message_written.resent_event_count[event_resend_complete_message_at]); event_resend_complete_message_at = event_resend_complete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Event Resend Reject Message: 32 bytes ----------------------------------- */

/* EventResendRejectMessage */
typedef EventResendRejectMessage {
  byte correlation_id[8];
  byte resend_reject_reason;
  byte event_resend_reject_details[23]
};

int event_resend_reject_message_at;

/* every byte of Event Resend Reject Message set to one value */
inline fill_event_resend_reject_message(event_resend_reject_message_record, event_resend_reject_message_value) {
  event_resend_reject_message_at = 0;
  do
  :: event_resend_reject_message_at < 8 -> event_resend_reject_message_record.correlation_id[event_resend_reject_message_at] = event_resend_reject_message_value; event_resend_reject_message_at = event_resend_reject_message_at + 1
  :: else -> break
  od;
  event_resend_reject_message_record.resend_reject_reason = event_resend_reject_message_value;
  event_resend_reject_message_at = 0;
  do
  :: event_resend_reject_message_at < 23 -> event_resend_reject_message_record.event_resend_reject_details[event_resend_reject_message_at] = event_resend_reject_message_value; event_resend_reject_message_at = event_resend_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Event Resend Reject Message set to where it lies, so a field read out of place says so */
inline ramp_event_resend_reject_message(event_resend_reject_message_record, event_resend_reject_message_base) {
  event_resend_reject_message_at = 0;
  do
  :: event_resend_reject_message_at < 8 -> event_resend_reject_message_record.correlation_id[event_resend_reject_message_at] = (event_resend_reject_message_base + 0 + event_resend_reject_message_at + 1) % 256; event_resend_reject_message_at = event_resend_reject_message_at + 1
  :: else -> break
  od;
  event_resend_reject_message_record.resend_reject_reason = (event_resend_reject_message_base + 8 + 1) % 256;
  event_resend_reject_message_at = 0;
  do
  :: event_resend_reject_message_at < 23 -> event_resend_reject_message_record.event_resend_reject_details[event_resend_reject_message_at] = (event_resend_reject_message_base + 9 + event_resend_reject_message_at + 1) % 256; event_resend_reject_message_at = event_resend_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Event Resend Reject Message to the wire, 32 bytes from where the cursor stands */
inline encode_event_resend_reject_message(event_resend_reject_message_record) {
  event_resend_reject_message_at = 0;
  do
  :: event_resend_reject_message_at < 8 -> wire[at] = event_resend_reject_message_record.correlation_id[event_resend_reject_message_at]; at = at + 1; event_resend_reject_message_at = event_resend_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = event_resend_reject_message_record.resend_reject_reason; at = at + 1;
  event_resend_reject_message_at = 0;
  do
  :: event_resend_reject_message_at < 23 -> wire[at] = event_resend_reject_message_record.event_resend_reject_details[event_resend_reject_message_at]; at = at + 1; event_resend_reject_message_at = event_resend_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Event Resend Reject Message off the wire, 32 bytes from where the cursor stands */
inline decode_event_resend_reject_message(event_resend_reject_message_record) {
  event_resend_reject_message_at = 0;
  do
  :: event_resend_reject_message_at < 8 -> event_resend_reject_message_record.correlation_id[event_resend_reject_message_at] = wire[at]; at = at + 1; event_resend_reject_message_at = event_resend_reject_message_at + 1
  :: else -> break
  od;
  event_resend_reject_message_record.resend_reject_reason = wire[at]; at = at + 1;
  event_resend_reject_message_at = 0;
  do
  :: event_resend_reject_message_at < 23 -> event_resend_reject_message_record.event_resend_reject_details[event_resend_reject_message_at] = wire[at]; at = at + 1; event_resend_reject_message_at = event_resend_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Event Resend Reject Message is what was written, byte for byte */
inline equal_event_resend_reject_message(event_resend_reject_message_read, event_resend_reject_message_written) {
  event_resend_reject_message_at = 0;
  do
  :: event_resend_reject_message_at < 8 -> assert(event_resend_reject_message_read.correlation_id[event_resend_reject_message_at] == event_resend_reject_message_written.correlation_id[event_resend_reject_message_at]); event_resend_reject_message_at = event_resend_reject_message_at + 1
  :: else -> break
  od;
  assert(event_resend_reject_message_read.resend_reject_reason == event_resend_reject_message_written.resend_reject_reason);
  event_resend_reject_message_at = 0;
  do
  :: event_resend_reject_message_at < 23 -> assert(event_resend_reject_message_read.event_resend_reject_details[event_resend_reject_message_at] == event_resend_reject_message_written.event_resend_reject_details[event_resend_reject_message_at]); event_resend_reject_message_at = event_resend_reject_message_at + 1
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

/* Instrument Info Request Message: encoded, read back, and compared */
proctype check_instrument_info_request_message() {
  InstrumentInfoRequestMessage instrument_info_request_message_sent;
  InstrumentInfoRequestMessage instrument_info_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_info_request_message(instrument_info_request_message_sent, 0)
  :: pattern == 1 -> fill_instrument_info_request_message(instrument_info_request_message_sent, 32)
  :: pattern == 2 -> fill_instrument_info_request_message(instrument_info_request_message_sent, 255)
  :: else -> ramp_instrument_info_request_message(instrument_info_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_info_request_message(instrument_info_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_instrument_info_request_message(instrument_info_request_message_got);
    assert(at == 8);
    equal_instrument_info_request_message(instrument_info_request_message_got, instrument_info_request_message_sent)
  }
}

/* Instrument Info Message: encoded, read back, and compared */
proctype check_instrument_info_message() {
  InstrumentInfoMessage instrument_info_message_sent;
  InstrumentInfoMessage instrument_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_info_message(instrument_info_message_sent, 0)
  :: pattern == 1 -> fill_instrument_info_message(instrument_info_message_sent, 32)
  :: pattern == 2 -> fill_instrument_info_message(instrument_info_message_sent, 255)
  :: else -> ramp_instrument_info_message(instrument_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_info_message(instrument_info_message_sent);
    assert(at == 48);
    at = 0;
    decode_instrument_info_message(instrument_info_message_got);
    assert(at == 48);
    equal_instrument_info_message(instrument_info_message_got, instrument_info_message_sent)
  }
}

/* Set Account Message: encoded, read back, and compared */
proctype check_set_account_message() {
  SetAccountMessage set_account_message_sent;
  SetAccountMessage set_account_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_set_account_message(set_account_message_sent, 0)
  :: pattern == 1 -> fill_set_account_message(set_account_message_sent, 32)
  :: pattern == 2 -> fill_set_account_message(set_account_message_sent, 255)
  :: else -> ramp_set_account_message(set_account_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_set_account_message(set_account_message_sent);
    assert(at == 24);
    at = 0;
    decode_set_account_message(set_account_message_got);
    assert(at == 24);
    equal_set_account_message(set_account_message_got, set_account_message_sent)
  }
}

/* Set Trader Message: encoded, read back, and compared */
proctype check_set_trader_message() {
  SetTraderMessage set_trader_message_sent;
  SetTraderMessage set_trader_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_set_trader_message(set_trader_message_sent, 0)
  :: pattern == 1 -> fill_set_trader_message(set_trader_message_sent, 32)
  :: pattern == 2 -> fill_set_trader_message(set_trader_message_sent, 255)
  :: else -> ramp_set_trader_message(set_trader_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_set_trader_message(set_trader_message_sent);
    assert(at == 24);
    at = 0;
    decode_set_trader_message(set_trader_message_got);
    assert(at == 24);
    equal_set_trader_message(set_trader_message_got, set_trader_message_sent)
  }
}

/* Set Ack Message: encoded, read back, and compared */
proctype check_set_ack_message() {
  SetAckMessage set_ack_message_sent;
  SetAckMessage set_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_set_ack_message(set_ack_message_sent, 0)
  :: pattern == 1 -> fill_set_ack_message(set_ack_message_sent, 32)
  :: pattern == 2 -> fill_set_ack_message(set_ack_message_sent, 255)
  :: else -> ramp_set_ack_message(set_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_set_ack_message(set_ack_message_sent);
    assert(at == 8);
    at = 0;
    decode_set_ack_message(set_ack_message_got);
    assert(at == 8);
    equal_set_ack_message(set_ack_message_got, set_ack_message_sent)
  }
}

/* New Order Message: encoded, read back, and compared */
proctype check_new_order_message() {
  NewOrderMessage new_order_message_sent;
  NewOrderMessage new_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_message(new_order_message_sent, 0)
  :: pattern == 1 -> fill_new_order_message(new_order_message_sent, 32)
  :: pattern == 2 -> fill_new_order_message(new_order_message_sent, 255)
  :: else -> ramp_new_order_message(new_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_message(new_order_message_sent);
    assert(at == 33);
    at = 0;
    decode_new_order_message(new_order_message_got);
    assert(at == 33);
    equal_new_order_message(new_order_message_got, new_order_message_sent)
  }
}

/* Order Entered Message: encoded, read back, and compared */
proctype check_order_entered_message() {
  OrderEnteredMessage order_entered_message_sent;
  OrderEnteredMessage order_entered_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_entered_message(order_entered_message_sent, 0)
  :: pattern == 1 -> fill_order_entered_message(order_entered_message_sent, 32)
  :: pattern == 2 -> fill_order_entered_message(order_entered_message_sent, 255)
  :: else -> ramp_order_entered_message(order_entered_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_entered_message(order_entered_message_sent);
    assert(at == 48);
    at = 0;
    decode_order_entered_message(order_entered_message_got);
    assert(at == 48);
    equal_order_entered_message(order_entered_message_got, order_entered_message_sent)
  }
}

/* Replace Order Message: encoded, read back, and compared */
proctype check_replace_order_message() {
  ReplaceOrderMessage replace_order_message_sent;
  ReplaceOrderMessage replace_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replace_order_message(replace_order_message_sent, 0)
  :: pattern == 1 -> fill_replace_order_message(replace_order_message_sent, 32)
  :: pattern == 2 -> fill_replace_order_message(replace_order_message_sent, 255)
  :: else -> ramp_replace_order_message(replace_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replace_order_message(replace_order_message_sent);
    assert(at == 32);
    at = 0;
    decode_replace_order_message(replace_order_message_got);
    assert(at == 32);
    equal_replace_order_message(replace_order_message_got, replace_order_message_sent)
  }
}

/* Stream Order Message: encoded, read back, and compared */
proctype check_stream_order_message() {
  StreamOrderMessage stream_order_message_sent;
  StreamOrderMessage stream_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stream_order_message(stream_order_message_sent, 0)
  :: pattern == 1 -> fill_stream_order_message(stream_order_message_sent, 32)
  :: pattern == 2 -> fill_stream_order_message(stream_order_message_sent, 255)
  :: else -> ramp_stream_order_message(stream_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stream_order_message(stream_order_message_sent);
    assert(at == 41);
    at = 0;
    decode_stream_order_message(stream_order_message_got);
    assert(at == 41);
    equal_stream_order_message(stream_order_message_got, stream_order_message_sent)
  }
}

/* Order Reject Message: encoded, read back, and compared */
proctype check_order_reject_message() {
  OrderRejectMessage order_reject_message_sent;
  OrderRejectMessage order_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_reject_message(order_reject_message_sent, 0)
  :: pattern == 1 -> fill_order_reject_message(order_reject_message_sent, 32)
  :: pattern == 2 -> fill_order_reject_message(order_reject_message_sent, 255)
  :: else -> ramp_order_reject_message(order_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_reject_message(order_reject_message_sent);
    assert(at == 80);
    at = 0;
    decode_order_reject_message(order_reject_message_got);
    assert(at == 80);
    equal_order_reject_message(order_reject_message_got, order_reject_message_sent)
  }
}

/* Order Replaced Message: encoded, read back, and compared */
proctype check_order_replaced_message() {
  OrderReplacedMessage order_replaced_message_sent;
  OrderReplacedMessage order_replaced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replaced_message(order_replaced_message_sent, 0)
  :: pattern == 1 -> fill_order_replaced_message(order_replaced_message_sent, 32)
  :: pattern == 2 -> fill_order_replaced_message(order_replaced_message_sent, 255)
  :: else -> ramp_order_replaced_message(order_replaced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replaced_message(order_replaced_message_sent);
    assert(at == 60);
    at = 0;
    decode_order_replaced_message(order_replaced_message_got);
    assert(at == 60);
    equal_order_replaced_message(order_replaced_message_got, order_replaced_message_sent)
  }
}

/* Cancel Order Message: encoded, read back, and compared */
proctype check_cancel_order_message() {
  CancelOrderMessage cancel_order_message_sent;
  CancelOrderMessage cancel_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_message(cancel_order_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_message(cancel_order_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_message(cancel_order_message_sent, 255)
  :: else -> ramp_cancel_order_message(cancel_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_message(cancel_order_message_sent);
    assert(at == 20);
    at = 0;
    decode_cancel_order_message(cancel_order_message_got);
    assert(at == 20);
    equal_cancel_order_message(cancel_order_message_got, cancel_order_message_sent)
  }
}

/* Order Canceled Message: encoded, read back, and compared */
proctype check_order_canceled_message() {
  OrderCanceledMessage order_canceled_message_sent;
  OrderCanceledMessage order_canceled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_canceled_message(order_canceled_message_sent, 0)
  :: pattern == 1 -> fill_order_canceled_message(order_canceled_message_sent, 32)
  :: pattern == 2 -> fill_order_canceled_message(order_canceled_message_sent, 255)
  :: else -> ramp_order_canceled_message(order_canceled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_canceled_message(order_canceled_message_sent);
    assert(at == 57);
    at = 0;
    decode_order_canceled_message(order_canceled_message_got);
    assert(at == 57);
    equal_order_canceled_message(order_canceled_message_got, order_canceled_message_sent)
  }
}

/* Cancel Order Reject Message: encoded, read back, and compared */
proctype check_cancel_order_reject_message() {
  CancelOrderRejectMessage cancel_order_reject_message_sent;
  CancelOrderRejectMessage cancel_order_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_reject_message(cancel_order_reject_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_reject_message(cancel_order_reject_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_reject_message(cancel_order_reject_message_sent, 255)
  :: else -> ramp_cancel_order_reject_message(cancel_order_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_reject_message(cancel_order_reject_message_sent);
    assert(at == 64);
    at = 0;
    decode_cancel_order_reject_message(cancel_order_reject_message_got);
    assert(at == 64);
    equal_cancel_order_reject_message(cancel_order_reject_message_got, cancel_order_reject_message_sent)
  }
}

/* Mass Cancel Order Message: encoded, read back, and compared */
proctype check_mass_cancel_order_message() {
  MassCancelOrderMessage mass_cancel_order_message_sent;
  MassCancelOrderMessage mass_cancel_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_order_message(mass_cancel_order_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_order_message(mass_cancel_order_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_order_message(mass_cancel_order_message_sent, 255)
  :: else -> ramp_mass_cancel_order_message(mass_cancel_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_order_message(mass_cancel_order_message_sent);
    assert(at == 23);
    at = 0;
    decode_mass_cancel_order_message(mass_cancel_order_message_got);
    assert(at == 23);
    equal_mass_cancel_order_message(mass_cancel_order_message_got, mass_cancel_order_message_sent)
  }
}

/* Mass Cancel Order Ack Message: encoded, read back, and compared */
proctype check_mass_cancel_order_ack_message() {
  MassCancelOrderAckMessage mass_cancel_order_ack_message_sent;
  MassCancelOrderAckMessage mass_cancel_order_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_order_ack_message(mass_cancel_order_ack_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_order_ack_message(mass_cancel_order_ack_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_order_ack_message(mass_cancel_order_ack_message_sent, 255)
  :: else -> ramp_mass_cancel_order_ack_message(mass_cancel_order_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_order_ack_message(mass_cancel_order_ack_message_sent);
    assert(at == 30);
    at = 0;
    decode_mass_cancel_order_ack_message(mass_cancel_order_ack_message_got);
    assert(at == 30);
    equal_mass_cancel_order_ack_message(mass_cancel_order_ack_message_got, mass_cancel_order_ack_message_sent)
  }
}

/* Mass Cancel Order Reject Message: encoded, read back, and compared */
proctype check_mass_cancel_order_reject_message() {
  MassCancelOrderRejectMessage mass_cancel_order_reject_message_sent;
  MassCancelOrderRejectMessage mass_cancel_order_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_order_reject_message(mass_cancel_order_reject_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_order_reject_message(mass_cancel_order_reject_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_order_reject_message(mass_cancel_order_reject_message_sent, 255)
  :: else -> ramp_mass_cancel_order_reject_message(mass_cancel_order_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_order_reject_message(mass_cancel_order_reject_message_sent);
    assert(at == 48);
    at = 0;
    decode_mass_cancel_order_reject_message(mass_cancel_order_reject_message_got);
    assert(at == 48);
    equal_mass_cancel_order_reject_message(mass_cancel_order_reject_message_got, mass_cancel_order_reject_message_sent)
  }
}

/* Unlock Trading Message: encoded, read back, and compared */
proctype check_unlock_trading_message() {
  UnlockTradingMessage unlock_trading_message_sent;
  UnlockTradingMessage unlock_trading_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unlock_trading_message(unlock_trading_message_sent, 0)
  :: pattern == 1 -> fill_unlock_trading_message(unlock_trading_message_sent, 32)
  :: pattern == 2 -> fill_unlock_trading_message(unlock_trading_message_sent, 255)
  :: else -> ramp_unlock_trading_message(unlock_trading_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unlock_trading_message(unlock_trading_message_sent);
    assert(at == 9);
    at = 0;
    decode_unlock_trading_message(unlock_trading_message_got);
    assert(at == 9);
    equal_unlock_trading_message(unlock_trading_message_got, unlock_trading_message_sent)
  }
}

/* Unlock Trading Ack Message: encoded, read back, and compared */
proctype check_unlock_trading_ack_message() {
  UnlockTradingAckMessage unlock_trading_ack_message_sent;
  UnlockTradingAckMessage unlock_trading_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unlock_trading_ack_message(unlock_trading_ack_message_sent, 0)
  :: pattern == 1 -> fill_unlock_trading_ack_message(unlock_trading_ack_message_sent, 32)
  :: pattern == 2 -> fill_unlock_trading_ack_message(unlock_trading_ack_message_sent, 255)
  :: else -> ramp_unlock_trading_ack_message(unlock_trading_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unlock_trading_ack_message(unlock_trading_ack_message_sent);
    assert(at == 20);
    at = 0;
    decode_unlock_trading_ack_message(unlock_trading_ack_message_got);
    assert(at == 20);
    equal_unlock_trading_ack_message(unlock_trading_ack_message_got, unlock_trading_ack_message_sent)
  }
}

/* Unlock Trading Reject Message: encoded, read back, and compared */
proctype check_unlock_trading_reject_message() {
  UnlockTradingRejectMessage unlock_trading_reject_message_sent;
  UnlockTradingRejectMessage unlock_trading_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unlock_trading_reject_message(unlock_trading_reject_message_sent, 0)
  :: pattern == 1 -> fill_unlock_trading_reject_message(unlock_trading_reject_message_sent, 32)
  :: pattern == 2 -> fill_unlock_trading_reject_message(unlock_trading_reject_message_sent, 255)
  :: else -> ramp_unlock_trading_reject_message(unlock_trading_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unlock_trading_reject_message(unlock_trading_reject_message_sent);
    assert(at == 48);
    at = 0;
    decode_unlock_trading_reject_message(unlock_trading_reject_message_got);
    assert(at == 48);
    equal_unlock_trading_reject_message(unlock_trading_reject_message_got, unlock_trading_reject_message_sent)
  }
}

/* Order Filled Message: encoded, read back, and compared */
proctype check_order_filled_message() {
  OrderFilledMessage order_filled_message_sent;
  OrderFilledMessage order_filled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_filled_message(order_filled_message_sent, 0)
  :: pattern == 1 -> fill_order_filled_message(order_filled_message_sent, 32)
  :: pattern == 2 -> fill_order_filled_message(order_filled_message_sent, 255)
  :: else -> ramp_order_filled_message(order_filled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_filled_message(order_filled_message_sent);
    assert(at == 81);
    at = 0;
    decode_order_filled_message(order_filled_message_got);
    assert(at == 81);
    equal_order_filled_message(order_filled_message_got, order_filled_message_sent)
  }
}

/* Spread Order Filled Message: encoded, read back, and compared */
proctype check_spread_order_filled_message() {
  SpreadOrderFilledMessage spread_order_filled_message_sent;
  SpreadOrderFilledMessage spread_order_filled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spread_order_filled_message(spread_order_filled_message_sent, 0)
  :: pattern == 1 -> fill_spread_order_filled_message(spread_order_filled_message_sent, 32)
  :: pattern == 2 -> fill_spread_order_filled_message(spread_order_filled_message_sent, 255)
  :: else -> ramp_spread_order_filled_message(spread_order_filled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spread_order_filled_message(spread_order_filled_message_sent);
    assert(at == 97);
    at = 0;
    decode_spread_order_filled_message(spread_order_filled_message_got);
    assert(at == 97);
    equal_spread_order_filled_message(spread_order_filled_message_got, spread_order_filled_message_sent)
  }
}

/* Last Exec Id Request Message: encoded, read back, and compared */
proctype check_last_exec_id_request_message() {
  LastExecIdRequestMessage last_exec_id_request_message_sent;
  LastExecIdRequestMessage last_exec_id_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_last_exec_id_request_message(last_exec_id_request_message_sent, 0)
  :: pattern == 1 -> fill_last_exec_id_request_message(last_exec_id_request_message_sent, 32)
  :: pattern == 2 -> fill_last_exec_id_request_message(last_exec_id_request_message_sent, 255)
  :: else -> ramp_last_exec_id_request_message(last_exec_id_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_last_exec_id_request_message(last_exec_id_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_last_exec_id_request_message(last_exec_id_request_message_got);
    assert(at == 8);
    equal_last_exec_id_request_message(last_exec_id_request_message_got, last_exec_id_request_message_sent)
  }
}

/* Last Exec Id Message: encoded, read back, and compared */
proctype check_last_exec_id_message() {
  LastExecIdMessage last_exec_id_message_sent;
  LastExecIdMessage last_exec_id_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_last_exec_id_message(last_exec_id_message_sent, 0)
  :: pattern == 1 -> fill_last_exec_id_message(last_exec_id_message_sent, 32)
  :: pattern == 2 -> fill_last_exec_id_message(last_exec_id_message_sent, 255)
  :: else -> ramp_last_exec_id_message(last_exec_id_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_last_exec_id_message(last_exec_id_message_sent);
    assert(at == 24);
    at = 0;
    decode_last_exec_id_message(last_exec_id_message_got);
    assert(at == 24);
    equal_last_exec_id_message(last_exec_id_message_got, last_exec_id_message_sent)
  }
}

/* Event Resend Request Message: encoded, read back, and compared */
proctype check_event_resend_request_message() {
  EventResendRequestMessage event_resend_request_message_sent;
  EventResendRequestMessage event_resend_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_event_resend_request_message(event_resend_request_message_sent, 0)
  :: pattern == 1 -> fill_event_resend_request_message(event_resend_request_message_sent, 32)
  :: pattern == 2 -> fill_event_resend_request_message(event_resend_request_message_sent, 255)
  :: else -> ramp_event_resend_request_message(event_resend_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_event_resend_request_message(event_resend_request_message_sent);
    assert(at == 24);
    at = 0;
    decode_event_resend_request_message(event_resend_request_message_got);
    assert(at == 24);
    equal_event_resend_request_message(event_resend_request_message_got, event_resend_request_message_sent)
  }
}

/* Event Resend Complete Message: encoded, read back, and compared */
proctype check_event_resend_complete_message() {
  EventResendCompleteMessage event_resend_complete_message_sent;
  EventResendCompleteMessage event_resend_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_event_resend_complete_message(event_resend_complete_message_sent, 0)
  :: pattern == 1 -> fill_event_resend_complete_message(event_resend_complete_message_sent, 32)
  :: pattern == 2 -> fill_event_resend_complete_message(event_resend_complete_message_sent, 255)
  :: else -> ramp_event_resend_complete_message(event_resend_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_event_resend_complete_message(event_resend_complete_message_sent);
    assert(at == 12);
    at = 0;
    decode_event_resend_complete_message(event_resend_complete_message_got);
    assert(at == 12);
    equal_event_resend_complete_message(event_resend_complete_message_got, event_resend_complete_message_sent)
  }
}

/* Event Resend Reject Message: encoded, read back, and compared */
proctype check_event_resend_reject_message() {
  EventResendRejectMessage event_resend_reject_message_sent;
  EventResendRejectMessage event_resend_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_event_resend_reject_message(event_resend_reject_message_sent, 0)
  :: pattern == 1 -> fill_event_resend_reject_message(event_resend_reject_message_sent, 32)
  :: pattern == 2 -> fill_event_resend_reject_message(event_resend_reject_message_sent, 255)
  :: else -> ramp_event_resend_reject_message(event_resend_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_event_resend_reject_message(event_resend_reject_message_sent);
    assert(at == 32);
    at = 0;
    decode_event_resend_reject_message(event_resend_reject_message_got);
    assert(at == 32);
    equal_event_resend_reject_message(event_resend_reject_message_got, event_resend_reject_message_sent)
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
  :: run check_instrument_info_request_message()
  :: run check_instrument_info_message()
  :: run check_set_account_message()
  :: run check_set_trader_message()
  :: run check_set_ack_message()
  :: run check_new_order_message()
  :: run check_order_entered_message()
  :: run check_replace_order_message()
  :: run check_stream_order_message()
  :: run check_order_reject_message()
  :: run check_order_replaced_message()
  :: run check_cancel_order_message()
  :: run check_order_canceled_message()
  :: run check_cancel_order_reject_message()
  :: run check_mass_cancel_order_message()
  :: run check_mass_cancel_order_ack_message()
  :: run check_mass_cancel_order_reject_message()
  :: run check_unlock_trading_message()
  :: run check_unlock_trading_ack_message()
  :: run check_unlock_trading_reject_message()
  :: run check_order_filled_message()
  :: run check_spread_order_filled_message()
  :: run check_last_exec_id_request_message()
  :: run check_last_exec_id_message()
  :: run check_event_resend_request_message()
  :: run check_event_resend_complete_message()
  :: run check_event_resend_reject_message()
  fi
}
