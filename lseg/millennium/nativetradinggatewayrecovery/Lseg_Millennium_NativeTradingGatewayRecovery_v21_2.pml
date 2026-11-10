/*
 * London Stock Exchange Native Trading Gateway Recovery
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
 *   - a length prefix framing what follows
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 143

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 4 bytes ------------------------------------------------- */

/* Native Trading Gateway Message Header */
typedef MessageHeader {
  byte start_of_message;
  byte message_length[2];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.start_of_message = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.start_of_message = (message_header_base + 0 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 1 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 3 + 1) % 256;
  skip
}

/* Message Header to the wire, 4 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.start_of_message; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 4 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.start_of_message = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.start_of_message == message_header_written.start_of_message);
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Logon Message: 76 bytes ------------------------------------------------- */

/* Allows the client and server to establish a session. */
typedef LogonMessage {
  byte user_name[25];
  byte password[25];
  byte new_password[25];
  byte message_version
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.user_name[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.password[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.new_password[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.message_version = logon_message_value;
  skip
}

/* each byte of Logon Message set to where it lies, so a field read out of place says so */
inline ramp_logon_message(logon_message_record, logon_message_base) {
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.user_name[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.password[logon_message_at] = (logon_message_base + 25 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.new_password[logon_message_at] = (logon_message_base + 50 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.message_version = (logon_message_base + 75 + 1) % 256;
  skip
}

/* Logon Message to the wire, 76 bytes from where the cursor stands */
inline encode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> wire[at] = logon_message_record.user_name[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> wire[at] = logon_message_record.password[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> wire[at] = logon_message_record.new_password[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_message_record.message_version; at = at + 1;
  skip
}

/* Logon Message off the wire, 76 bytes from where the cursor stands */
inline decode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.user_name[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.password[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.new_password[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.message_version = wire[at]; at = at + 1;
  skip
}

/* what was read of Logon Message is what was written, byte for byte */
inline equal_logon_message(logon_message_read, logon_message_written) {
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> assert(logon_message_read.user_name[logon_message_at] == logon_message_written.user_name[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> assert(logon_message_read.password[logon_message_at] == logon_message_written.password[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> assert(logon_message_read.new_password[logon_message_at] == logon_message_written.new_password[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  assert(logon_message_read.message_version == logon_message_written.message_version);
  skip
}

/* ---- Logon Reply Message: 34 bytes ------------------------------------------- */

/* Allows the server to acknowledge a client's Logon. */
typedef LogonReplyMessage {
  byte reject_code[4];
  byte password_expiry_day_count[30]
};

int logon_reply_message_at;

/* every byte of Logon Reply Message set to one value */
inline fill_logon_reply_message(logon_reply_message_record, logon_reply_message_value) {
  logon_reply_message_at = 0;
  do
  :: logon_reply_message_at < 4 -> logon_reply_message_record.reject_code[logon_reply_message_at] = logon_reply_message_value; logon_reply_message_at = logon_reply_message_at + 1
  :: else -> break
  od;
  logon_reply_message_at = 0;
  do
  :: logon_reply_message_at < 30 -> logon_reply_message_record.password_expiry_day_count[logon_reply_message_at] = logon_reply_message_value; logon_reply_message_at = logon_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Reply Message set to where it lies, so a field read out of place says so */
inline ramp_logon_reply_message(logon_reply_message_record, logon_reply_message_base) {
  logon_reply_message_at = 0;
  do
  :: logon_reply_message_at < 4 -> logon_reply_message_record.reject_code[logon_reply_message_at] = (logon_reply_message_base + 0 + logon_reply_message_at + 1) % 256; logon_reply_message_at = logon_reply_message_at + 1
  :: else -> break
  od;
  logon_reply_message_at = 0;
  do
  :: logon_reply_message_at < 30 -> logon_reply_message_record.password_expiry_day_count[logon_reply_message_at] = (logon_reply_message_base + 4 + logon_reply_message_at + 1) % 256; logon_reply_message_at = logon_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Reply Message to the wire, 34 bytes from where the cursor stands */
inline encode_logon_reply_message(logon_reply_message_record) {
  logon_reply_message_at = 0;
  do
  :: logon_reply_message_at < 4 -> wire[at] = logon_reply_message_record.reject_code[logon_reply_message_at]; at = at + 1; logon_reply_message_at = logon_reply_message_at + 1
  :: else -> break
  od;
  logon_reply_message_at = 0;
  do
  :: logon_reply_message_at < 30 -> wire[at] = logon_reply_message_record.password_expiry_day_count[logon_reply_message_at]; at = at + 1; logon_reply_message_at = logon_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Reply Message off the wire, 34 bytes from where the cursor stands */
inline decode_logon_reply_message(logon_reply_message_record) {
  logon_reply_message_at = 0;
  do
  :: logon_reply_message_at < 4 -> logon_reply_message_record.reject_code[logon_reply_message_at] = wire[at]; at = at + 1; logon_reply_message_at = logon_reply_message_at + 1
  :: else -> break
  od;
  logon_reply_message_at = 0;
  do
  :: logon_reply_message_at < 30 -> logon_reply_message_record.password_expiry_day_count[logon_reply_message_at] = wire[at]; at = at + 1; logon_reply_message_at = logon_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Reply Message is what was written, byte for byte */
inline equal_logon_reply_message(logon_reply_message_read, logon_reply_message_written) {
  logon_reply_message_at = 0;
  do
  :: logon_reply_message_at < 4 -> assert(logon_reply_message_read.reject_code[logon_reply_message_at] == logon_reply_message_written.reject_code[logon_reply_message_at]); logon_reply_message_at = logon_reply_message_at + 1
  :: else -> break
  od;
  logon_reply_message_at = 0;
  do
  :: logon_reply_message_at < 30 -> assert(logon_reply_message_read.password_expiry_day_count[logon_reply_message_at] == logon_reply_message_written.password_expiry_day_count[logon_reply_message_at]); logon_reply_message_at = logon_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Message: 20 bytes ------------------------------------------------ */

/* Allows the client and server to terminate a session. */
typedef LogoutMessage {
  byte reason[20]
};

int logout_message_at;

/* every byte of Logout Message set to one value */
inline fill_logout_message(logout_message_record, logout_message_value) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> logout_message_record.reason[logout_message_at] = logout_message_value; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout Message set to where it lies, so a field read out of place says so */
inline ramp_logout_message(logout_message_record, logout_message_base) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> logout_message_record.reason[logout_message_at] = (logout_message_base + 0 + logout_message_at + 1) % 256; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message to the wire, 20 bytes from where the cursor stands */
inline encode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> wire[at] = logout_message_record.reason[logout_message_at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message off the wire, 20 bytes from where the cursor stands */
inline decode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> logout_message_record.reason[logout_message_at] = wire[at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout Message is what was written, byte for byte */
inline equal_logout_message(logout_message_read, logout_message_written) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> assert(logout_message_read.reason[logout_message_at] == logout_message_written.reason[logout_message_at]); logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Missed Message Request Message: 5 bytes --------------------------------- */

/* Allows the client to subscribe to missed messages through the Recovery Channel. */
typedef MissedMessageRequestMessage {
  byte app_id;
  byte last_msg_seq_num[4]
};

int missed_message_request_message_at;

/* every byte of Missed Message Request Message set to one value */
inline fill_missed_message_request_message(missed_message_request_message_record, missed_message_request_message_value) {
  missed_message_request_message_record.app_id = missed_message_request_message_value;
  missed_message_request_message_at = 0;
  do
  :: missed_message_request_message_at < 4 -> missed_message_request_message_record.last_msg_seq_num[missed_message_request_message_at] = missed_message_request_message_value; missed_message_request_message_at = missed_message_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Missed Message Request Message set to where it lies, so a field read out of place says so */
inline ramp_missed_message_request_message(missed_message_request_message_record, missed_message_request_message_base) {
  missed_message_request_message_record.app_id = (missed_message_request_message_base + 0 + 1) % 256;
  missed_message_request_message_at = 0;
  do
  :: missed_message_request_message_at < 4 -> missed_message_request_message_record.last_msg_seq_num[missed_message_request_message_at] = (missed_message_request_message_base + 1 + missed_message_request_message_at + 1) % 256; missed_message_request_message_at = missed_message_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Missed Message Request Message to the wire, 5 bytes from where the cursor stands */
inline encode_missed_message_request_message(missed_message_request_message_record) {
  wire[at] = missed_message_request_message_record.app_id; at = at + 1;
  missed_message_request_message_at = 0;
  do
  :: missed_message_request_message_at < 4 -> wire[at] = missed_message_request_message_record.last_msg_seq_num[missed_message_request_message_at]; at = at + 1; missed_message_request_message_at = missed_message_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Missed Message Request Message off the wire, 5 bytes from where the cursor stands */
inline decode_missed_message_request_message(missed_message_request_message_record) {
  missed_message_request_message_record.app_id = wire[at]; at = at + 1;
  missed_message_request_message_at = 0;
  do
  :: missed_message_request_message_at < 4 -> missed_message_request_message_record.last_msg_seq_num[missed_message_request_message_at] = wire[at]; at = at + 1; missed_message_request_message_at = missed_message_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Missed Message Request Message is what was written, byte for byte */
inline equal_missed_message_request_message(missed_message_request_message_read, missed_message_request_message_written) {
  assert(missed_message_request_message_read.app_id == missed_message_request_message_written.app_id);
  missed_message_request_message_at = 0;
  do
  :: missed_message_request_message_at < 4 -> assert(missed_message_request_message_read.last_msg_seq_num[missed_message_request_message_at] == missed_message_request_message_written.last_msg_seq_num[missed_message_request_message_at]); missed_message_request_message_at = missed_message_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Missed Message Request Ack Message: 1 bytes ----------------------------- */

/* Allows the server to acknowledge a client's Missed Message Request. */
typedef MissedMessageRequestAckMessage {
  byte missed_message_request_ack_response_type
};

/* every byte of Missed Message Request Ack Message set to one value */
inline fill_missed_message_request_ack_message(missed_message_request_ack_message_record, missed_message_request_ack_message_value) {
  missed_message_request_ack_message_record.missed_message_request_ack_response_type = missed_message_request_ack_message_value;
  skip
}

/* each byte of Missed Message Request Ack Message set to where it lies, so a field read out of place says so */
inline ramp_missed_message_request_ack_message(missed_message_request_ack_message_record, missed_message_request_ack_message_base) {
  missed_message_request_ack_message_record.missed_message_request_ack_response_type = (missed_message_request_ack_message_base + 0 + 1) % 256;
  skip
}

/* Missed Message Request Ack Message to the wire, 1 bytes from where the cursor stands */
inline encode_missed_message_request_ack_message(missed_message_request_ack_message_record) {
  wire[at] = missed_message_request_ack_message_record.missed_message_request_ack_response_type; at = at + 1;
  skip
}

/* Missed Message Request Ack Message off the wire, 1 bytes from where the cursor stands */
inline decode_missed_message_request_ack_message(missed_message_request_ack_message_record) {
  missed_message_request_ack_message_record.missed_message_request_ack_response_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Missed Message Request Ack Message is what was written, byte for byte */
inline equal_missed_message_request_ack_message(missed_message_request_ack_message_read, missed_message_request_ack_message_written) {
  assert(missed_message_request_ack_message_read.missed_message_request_ack_response_type == missed_message_request_ack_message_written.missed_message_request_ack_response_type);
  skip
}

/* ---- Missed Message Report Message: 1 bytes ---------------------------------- */

/* Allows the server to communicate the result of a Missed Message Request. */
typedef MissedMessageReportMessage {
  byte missed_message_report_response_type
};

/* every byte of Missed Message Report Message set to one value */
inline fill_missed_message_report_message(missed_message_report_message_record, missed_message_report_message_value) {
  missed_message_report_message_record.missed_message_report_response_type = missed_message_report_message_value;
  skip
}

/* each byte of Missed Message Report Message set to where it lies, so a field read out of place says so */
inline ramp_missed_message_report_message(missed_message_report_message_record, missed_message_report_message_base) {
  missed_message_report_message_record.missed_message_report_response_type = (missed_message_report_message_base + 0 + 1) % 256;
  skip
}

/* Missed Message Report Message to the wire, 1 bytes from where the cursor stands */
inline encode_missed_message_report_message(missed_message_report_message_record) {
  wire[at] = missed_message_report_message_record.missed_message_report_response_type; at = at + 1;
  skip
}

/* Missed Message Report Message off the wire, 1 bytes from where the cursor stands */
inline decode_missed_message_report_message(missed_message_report_message_record) {
  missed_message_report_message_record.missed_message_report_response_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Missed Message Report Message is what was written, byte for byte */
inline equal_missed_message_report_message(missed_message_report_message_read, missed_message_report_message_written) {
  assert(missed_message_report_message_read.missed_message_report_response_type == missed_message_report_message_written.missed_message_report_response_type);
  skip
}

/* ---- Reject Message: 55 bytes ------------------------------------------------ */

/* Used to reject a message that does not comply with the Native Trading Gateway messaging protocol. */
typedef RejectMessage {
  byte reject_code[4];
  byte reject_reason[30];
  byte rejected_message_type;
  byte client_order_id[20]
};

int reject_message_at;

/* every byte of Reject Message set to one value */
inline fill_reject_message(reject_message_record, reject_message_value) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.reject_code[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 30 -> reject_message_record.reject_reason[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.rejected_message_type = reject_message_value;
  reject_message_at = 0;
  do
  :: reject_message_at < 20 -> reject_message_record.client_order_id[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reject Message set to where it lies, so a field read out of place says so */
inline ramp_reject_message(reject_message_record, reject_message_base) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.reject_code[reject_message_at] = (reject_message_base + 0 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 30 -> reject_message_record.reject_reason[reject_message_at] = (reject_message_base + 4 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.rejected_message_type = (reject_message_base + 34 + 1) % 256;
  reject_message_at = 0;
  do
  :: reject_message_at < 20 -> reject_message_record.client_order_id[reject_message_at] = (reject_message_base + 35 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reject Message to the wire, 55 bytes from where the cursor stands */
inline encode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> wire[at] = reject_message_record.reject_code[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 30 -> wire[at] = reject_message_record.reject_reason[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  wire[at] = reject_message_record.rejected_message_type; at = at + 1;
  reject_message_at = 0;
  do
  :: reject_message_at < 20 -> wire[at] = reject_message_record.client_order_id[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reject Message off the wire, 55 bytes from where the cursor stands */
inline decode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.reject_code[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 30 -> reject_message_record.reject_reason[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.rejected_message_type = wire[at]; at = at + 1;
  reject_message_at = 0;
  do
  :: reject_message_at < 20 -> reject_message_record.client_order_id[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reject Message is what was written, byte for byte */
inline equal_reject_message(reject_message_read, reject_message_written) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> assert(reject_message_read.reject_code[reject_message_at] == reject_message_written.reject_code[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 30 -> assert(reject_message_read.reject_reason[reject_message_at] == reject_message_written.reject_reason[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  assert(reject_message_read.rejected_message_type == reject_message_written.rejected_message_type);
  reject_message_at = 0;
  do
  :: reject_message_at < 20 -> assert(reject_message_read.client_order_id[reject_message_at] == reject_message_written.client_order_id[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Status Message: 2 bytes ------------------------------------------ */

/* Indicates service non availability of a partition, disseminated on the recovery and realtime channels. */
typedef SystemStatusMessage {
  byte app_id;
  byte app_status
};

/* every byte of System Status Message set to one value */
inline fill_system_status_message(system_status_message_record, system_status_message_value) {
  system_status_message_record.app_id = system_status_message_value;
  system_status_message_record.app_status = system_status_message_value;
  skip
}

/* each byte of System Status Message set to where it lies, so a field read out of place says so */
inline ramp_system_status_message(system_status_message_record, system_status_message_base) {
  system_status_message_record.app_id = (system_status_message_base + 0 + 1) % 256;
  system_status_message_record.app_status = (system_status_message_base + 1 + 1) % 256;
  skip
}

/* System Status Message to the wire, 2 bytes from where the cursor stands */
inline encode_system_status_message(system_status_message_record) {
  wire[at] = system_status_message_record.app_id; at = at + 1;
  wire[at] = system_status_message_record.app_status; at = at + 1;
  skip
}

/* System Status Message off the wire, 2 bytes from where the cursor stands */
inline decode_system_status_message(system_status_message_record) {
  system_status_message_record.app_id = wire[at]; at = at + 1;
  system_status_message_record.app_status = wire[at]; at = at + 1;
  skip
}

/* what was read of System Status Message is what was written, byte for byte */
inline equal_system_status_message(system_status_message_read, system_status_message_written) {
  assert(system_status_message_read.app_id == system_status_message_written.app_id);
  assert(system_status_message_read.app_status == system_status_message_written.app_status);
  skip
}

/* ---- Transact Time: 8 bytes -------------------------------------------------- */

/* Composite */
typedef TransactTime {
  byte seconds[4];
  byte nanoseconds[4]
};

int transact_time_at;

/* every byte of Transact Time set to one value */
inline fill_transact_time(transact_time_record, transact_time_value) {
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.seconds[transact_time_at] = transact_time_value; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.nanoseconds[transact_time_at] = transact_time_value; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transact Time set to where it lies, so a field read out of place says so */
inline ramp_transact_time(transact_time_record, transact_time_base) {
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.seconds[transact_time_at] = (transact_time_base + 0 + transact_time_at + 1) % 256; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.nanoseconds[transact_time_at] = (transact_time_base + 4 + transact_time_at + 1) % 256; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  skip
}

/* Transact Time to the wire, 8 bytes from where the cursor stands */
inline encode_transact_time(transact_time_record) {
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> wire[at] = transact_time_record.seconds[transact_time_at]; at = at + 1; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> wire[at] = transact_time_record.nanoseconds[transact_time_at]; at = at + 1; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  skip
}

/* Transact Time off the wire, 8 bytes from where the cursor stands */
inline decode_transact_time(transact_time_record) {
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.seconds[transact_time_at] = wire[at]; at = at + 1; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.nanoseconds[transact_time_at] = wire[at]; at = at + 1; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transact Time is what was written, byte for byte */
inline equal_transact_time(transact_time_read, transact_time_written) {
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> assert(transact_time_read.seconds[transact_time_at] == transact_time_written.seconds[transact_time_at]); transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> assert(transact_time_read.nanoseconds[transact_time_at] == transact_time_written.nanoseconds[transact_time_at]); transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Mass Cancel Report Message: 52 bytes ------------------------------ */

/* Indicates that a mass order cancel request was accepted or rejected. */
typedef OrderMassCancelReportMessage {
  byte app_id;
  byte sequence_no[4];
  byte client_order_id[20];
  byte mass_cancel_response;
  byte mass_cancel_reject_reason[4];
  byte reserved_4[4];
  TransactTime transact_time;
  byte reserved_10[10]
};

int order_mass_cancel_report_message_at;

/* every byte of Order Mass Cancel Report Message set to one value */
inline fill_order_mass_cancel_report_message(order_mass_cancel_report_message_record, order_mass_cancel_report_message_value) {
  order_mass_cancel_report_message_record.app_id = order_mass_cancel_report_message_value;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.sequence_no[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> order_mass_cancel_report_message_record.client_order_id[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_record.mass_cancel_response = order_mass_cancel_report_message_value;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.mass_cancel_reject_reason[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.reserved_4[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  fill_transact_time(order_mass_cancel_report_message_record.transact_time, order_mass_cancel_report_message_value);
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 10 -> order_mass_cancel_report_message_record.reserved_10[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Mass Cancel Report Message set to where it lies, so a field read out of place says so */
inline ramp_order_mass_cancel_report_message(order_mass_cancel_report_message_record, order_mass_cancel_report_message_base) {
  order_mass_cancel_report_message_record.app_id = (order_mass_cancel_report_message_base + 0 + 1) % 256;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.sequence_no[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 1 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> order_mass_cancel_report_message_record.client_order_id[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 5 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_record.mass_cancel_response = (order_mass_cancel_report_message_base + 25 + 1) % 256;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.mass_cancel_reject_reason[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 26 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.reserved_4[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 30 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  ramp_transact_time(order_mass_cancel_report_message_record.transact_time, order_mass_cancel_report_message_base + 34);
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 10 -> order_mass_cancel_report_message_record.reserved_10[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 42 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel Report Message to the wire, 52 bytes from where the cursor stands */
inline encode_order_mass_cancel_report_message(order_mass_cancel_report_message_record) {
  wire[at] = order_mass_cancel_report_message_record.app_id; at = at + 1;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> wire[at] = order_mass_cancel_report_message_record.sequence_no[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> wire[at] = order_mass_cancel_report_message_record.client_order_id[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_cancel_report_message_record.mass_cancel_response; at = at + 1;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> wire[at] = order_mass_cancel_report_message_record.mass_cancel_reject_reason[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> wire[at] = order_mass_cancel_report_message_record.reserved_4[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  encode_transact_time(order_mass_cancel_report_message_record.transact_time);
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 10 -> wire[at] = order_mass_cancel_report_message_record.reserved_10[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Mass Cancel Report Message off the wire, 52 bytes from where the cursor stands */
inline decode_order_mass_cancel_report_message(order_mass_cancel_report_message_record) {
  order_mass_cancel_report_message_record.app_id = wire[at]; at = at + 1;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.sequence_no[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> order_mass_cancel_report_message_record.client_order_id[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_record.mass_cancel_response = wire[at]; at = at + 1;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.mass_cancel_reject_reason[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.reserved_4[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  decode_transact_time(order_mass_cancel_report_message_record.transact_time);
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 10 -> order_mass_cancel_report_message_record.reserved_10[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Mass Cancel Report Message is what was written, byte for byte */
inline equal_order_mass_cancel_report_message(order_mass_cancel_report_message_read, order_mass_cancel_report_message_written) {
  assert(order_mass_cancel_report_message_read.app_id == order_mass_cancel_report_message_written.app_id);
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> assert(order_mass_cancel_report_message_read.sequence_no[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.sequence_no[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> assert(order_mass_cancel_report_message_read.client_order_id[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.client_order_id[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  assert(order_mass_cancel_report_message_read.mass_cancel_response == order_mass_cancel_report_message_written.mass_cancel_response);
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> assert(order_mass_cancel_report_message_read.mass_cancel_reject_reason[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.mass_cancel_reject_reason[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> assert(order_mass_cancel_report_message_read.reserved_4[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.reserved_4[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  equal_transact_time(order_mass_cancel_report_message_read.transact_time, order_mass_cancel_report_message_written.transact_time);
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 10 -> assert(order_mass_cancel_report_message_read.reserved_10[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.reserved_10[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Status Report Message: 143 bytes ---------------------------------- */

/* Allows the server to communicate the status of the RFQ to the Requester. */
typedef QuoteStatusReportMessage {
  byte partition_id;
  byte sequence_number[4];
  byte quote_msg_id[20];
  byte quote_req_id[10];
  byte quote_status;
  byte reject_code[4];
  byte order_book;
  byte market_makers[60];
  byte rfq_id[10];
  byte expire_time[4];
  byte bid_id[12];
  byte offer_id[12];
  byte expire_time_milliseconds[4]
};

int quote_status_report_message_at;

/* every byte of Quote Status Report Message set to one value */
inline fill_quote_status_report_message(quote_status_report_message_record, quote_status_report_message_value) {
  quote_status_report_message_record.partition_id = quote_status_report_message_value;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.sequence_number[quote_status_report_message_at] = quote_status_report_message_value; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 20 -> quote_status_report_message_record.quote_msg_id[quote_status_report_message_at] = quote_status_report_message_value; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 10 -> quote_status_report_message_record.quote_req_id[quote_status_report_message_at] = quote_status_report_message_value; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_record.quote_status = quote_status_report_message_value;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.reject_code[quote_status_report_message_at] = quote_status_report_message_value; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_record.order_book = quote_status_report_message_value;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 60 -> quote_status_report_message_record.market_makers[quote_status_report_message_at] = quote_status_report_message_value; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 10 -> quote_status_report_message_record.rfq_id[quote_status_report_message_at] = quote_status_report_message_value; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.expire_time[quote_status_report_message_at] = quote_status_report_message_value; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 12 -> quote_status_report_message_record.bid_id[quote_status_report_message_at] = quote_status_report_message_value; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 12 -> quote_status_report_message_record.offer_id[quote_status_report_message_at] = quote_status_report_message_value; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.expire_time_milliseconds[quote_status_report_message_at] = quote_status_report_message_value; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Status Report Message set to where it lies, so a field read out of place says so */
inline ramp_quote_status_report_message(quote_status_report_message_record, quote_status_report_message_base) {
  quote_status_report_message_record.partition_id = (quote_status_report_message_base + 0 + 1) % 256;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.sequence_number[quote_status_report_message_at] = (quote_status_report_message_base + 1 + quote_status_report_message_at + 1) % 256; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 20 -> quote_status_report_message_record.quote_msg_id[quote_status_report_message_at] = (quote_status_report_message_base + 5 + quote_status_report_message_at + 1) % 256; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 10 -> quote_status_report_message_record.quote_req_id[quote_status_report_message_at] = (quote_status_report_message_base + 25 + quote_status_report_message_at + 1) % 256; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_record.quote_status = (quote_status_report_message_base + 35 + 1) % 256;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.reject_code[quote_status_report_message_at] = (quote_status_report_message_base + 36 + quote_status_report_message_at + 1) % 256; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_record.order_book = (quote_status_report_message_base + 40 + 1) % 256;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 60 -> quote_status_report_message_record.market_makers[quote_status_report_message_at] = (quote_status_report_message_base + 41 + quote_status_report_message_at + 1) % 256; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 10 -> quote_status_report_message_record.rfq_id[quote_status_report_message_at] = (quote_status_report_message_base + 101 + quote_status_report_message_at + 1) % 256; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.expire_time[quote_status_report_message_at] = (quote_status_report_message_base + 111 + quote_status_report_message_at + 1) % 256; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 12 -> quote_status_report_message_record.bid_id[quote_status_report_message_at] = (quote_status_report_message_base + 115 + quote_status_report_message_at + 1) % 256; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 12 -> quote_status_report_message_record.offer_id[quote_status_report_message_at] = (quote_status_report_message_base + 127 + quote_status_report_message_at + 1) % 256; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.expire_time_milliseconds[quote_status_report_message_at] = (quote_status_report_message_base + 139 + quote_status_report_message_at + 1) % 256; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Status Report Message to the wire, 143 bytes from where the cursor stands */
inline encode_quote_status_report_message(quote_status_report_message_record) {
  wire[at] = quote_status_report_message_record.partition_id; at = at + 1;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> wire[at] = quote_status_report_message_record.sequence_number[quote_status_report_message_at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 20 -> wire[at] = quote_status_report_message_record.quote_msg_id[quote_status_report_message_at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 10 -> wire[at] = quote_status_report_message_record.quote_req_id[quote_status_report_message_at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_status_report_message_record.quote_status; at = at + 1;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> wire[at] = quote_status_report_message_record.reject_code[quote_status_report_message_at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_status_report_message_record.order_book; at = at + 1;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 60 -> wire[at] = quote_status_report_message_record.market_makers[quote_status_report_message_at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 10 -> wire[at] = quote_status_report_message_record.rfq_id[quote_status_report_message_at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> wire[at] = quote_status_report_message_record.expire_time[quote_status_report_message_at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 12 -> wire[at] = quote_status_report_message_record.bid_id[quote_status_report_message_at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 12 -> wire[at] = quote_status_report_message_record.offer_id[quote_status_report_message_at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> wire[at] = quote_status_report_message_record.expire_time_milliseconds[quote_status_report_message_at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Status Report Message off the wire, 143 bytes from where the cursor stands */
inline decode_quote_status_report_message(quote_status_report_message_record) {
  quote_status_report_message_record.partition_id = wire[at]; at = at + 1;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.sequence_number[quote_status_report_message_at] = wire[at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 20 -> quote_status_report_message_record.quote_msg_id[quote_status_report_message_at] = wire[at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 10 -> quote_status_report_message_record.quote_req_id[quote_status_report_message_at] = wire[at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_record.quote_status = wire[at]; at = at + 1;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.reject_code[quote_status_report_message_at] = wire[at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_record.order_book = wire[at]; at = at + 1;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 60 -> quote_status_report_message_record.market_makers[quote_status_report_message_at] = wire[at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 10 -> quote_status_report_message_record.rfq_id[quote_status_report_message_at] = wire[at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.expire_time[quote_status_report_message_at] = wire[at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 12 -> quote_status_report_message_record.bid_id[quote_status_report_message_at] = wire[at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 12 -> quote_status_report_message_record.offer_id[quote_status_report_message_at] = wire[at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> quote_status_report_message_record.expire_time_milliseconds[quote_status_report_message_at] = wire[at]; at = at + 1; quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Status Report Message is what was written, byte for byte */
inline equal_quote_status_report_message(quote_status_report_message_read, quote_status_report_message_written) {
  assert(quote_status_report_message_read.partition_id == quote_status_report_message_written.partition_id);
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> assert(quote_status_report_message_read.sequence_number[quote_status_report_message_at] == quote_status_report_message_written.sequence_number[quote_status_report_message_at]); quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 20 -> assert(quote_status_report_message_read.quote_msg_id[quote_status_report_message_at] == quote_status_report_message_written.quote_msg_id[quote_status_report_message_at]); quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 10 -> assert(quote_status_report_message_read.quote_req_id[quote_status_report_message_at] == quote_status_report_message_written.quote_req_id[quote_status_report_message_at]); quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  assert(quote_status_report_message_read.quote_status == quote_status_report_message_written.quote_status);
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> assert(quote_status_report_message_read.reject_code[quote_status_report_message_at] == quote_status_report_message_written.reject_code[quote_status_report_message_at]); quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  assert(quote_status_report_message_read.order_book == quote_status_report_message_written.order_book);
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 60 -> assert(quote_status_report_message_read.market_makers[quote_status_report_message_at] == quote_status_report_message_written.market_makers[quote_status_report_message_at]); quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 10 -> assert(quote_status_report_message_read.rfq_id[quote_status_report_message_at] == quote_status_report_message_written.rfq_id[quote_status_report_message_at]); quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> assert(quote_status_report_message_read.expire_time[quote_status_report_message_at] == quote_status_report_message_written.expire_time[quote_status_report_message_at]); quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 12 -> assert(quote_status_report_message_read.bid_id[quote_status_report_message_at] == quote_status_report_message_written.bid_id[quote_status_report_message_at]); quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 12 -> assert(quote_status_report_message_read.offer_id[quote_status_report_message_at] == quote_status_report_message_written.offer_id[quote_status_report_message_at]); quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  quote_status_report_message_at = 0;
  do
  :: quote_status_report_message_at < 4 -> assert(quote_status_report_message_read.expire_time_milliseconds[quote_status_report_message_at] == quote_status_report_message_written.expire_time_milliseconds[quote_status_report_message_at]); quote_status_report_message_at = quote_status_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Request Reject Message: 110 bytes --------------------------------- */

/* Rejects an RFQ. Sent by the Market Maker to reject, and by the server to reject or to relay a Market Maker rejection. */
typedef QuoteRequestRejectMessage {
  byte partition_id;
  byte sequence_number[4];
  byte quote_req_id[10];
  byte reject_code[4];
  byte order_book;
  byte instrument_id[4];
  byte side;
  byte order_quantity[4];
  byte market_makers[60];
  byte contra_trader[11];
  byte rfq_id[10]
};

int quote_request_reject_message_at;

/* every byte of Quote Request Reject Message set to one value */
inline fill_quote_request_reject_message(quote_request_reject_message_record, quote_request_reject_message_value) {
  quote_request_reject_message_record.partition_id = quote_request_reject_message_value;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.sequence_number[quote_request_reject_message_at] = quote_request_reject_message_value; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 10 -> quote_request_reject_message_record.quote_req_id[quote_request_reject_message_at] = quote_request_reject_message_value; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.reject_code[quote_request_reject_message_at] = quote_request_reject_message_value; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_record.order_book = quote_request_reject_message_value;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.instrument_id[quote_request_reject_message_at] = quote_request_reject_message_value; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_record.side = quote_request_reject_message_value;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.order_quantity[quote_request_reject_message_at] = quote_request_reject_message_value; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 60 -> quote_request_reject_message_record.market_makers[quote_request_reject_message_at] = quote_request_reject_message_value; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 11 -> quote_request_reject_message_record.contra_trader[quote_request_reject_message_at] = quote_request_reject_message_value; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 10 -> quote_request_reject_message_record.rfq_id[quote_request_reject_message_at] = quote_request_reject_message_value; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Request Reject Message set to where it lies, so a field read out of place says so */
inline ramp_quote_request_reject_message(quote_request_reject_message_record, quote_request_reject_message_base) {
  quote_request_reject_message_record.partition_id = (quote_request_reject_message_base + 0 + 1) % 256;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.sequence_number[quote_request_reject_message_at] = (quote_request_reject_message_base + 1 + quote_request_reject_message_at + 1) % 256; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 10 -> quote_request_reject_message_record.quote_req_id[quote_request_reject_message_at] = (quote_request_reject_message_base + 5 + quote_request_reject_message_at + 1) % 256; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.reject_code[quote_request_reject_message_at] = (quote_request_reject_message_base + 15 + quote_request_reject_message_at + 1) % 256; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_record.order_book = (quote_request_reject_message_base + 19 + 1) % 256;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.instrument_id[quote_request_reject_message_at] = (quote_request_reject_message_base + 20 + quote_request_reject_message_at + 1) % 256; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_record.side = (quote_request_reject_message_base + 24 + 1) % 256;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.order_quantity[quote_request_reject_message_at] = (quote_request_reject_message_base + 25 + quote_request_reject_message_at + 1) % 256; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 60 -> quote_request_reject_message_record.market_makers[quote_request_reject_message_at] = (quote_request_reject_message_base + 29 + quote_request_reject_message_at + 1) % 256; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 11 -> quote_request_reject_message_record.contra_trader[quote_request_reject_message_at] = (quote_request_reject_message_base + 89 + quote_request_reject_message_at + 1) % 256; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 10 -> quote_request_reject_message_record.rfq_id[quote_request_reject_message_at] = (quote_request_reject_message_base + 100 + quote_request_reject_message_at + 1) % 256; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request Reject Message to the wire, 110 bytes from where the cursor stands */
inline encode_quote_request_reject_message(quote_request_reject_message_record) {
  wire[at] = quote_request_reject_message_record.partition_id; at = at + 1;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> wire[at] = quote_request_reject_message_record.sequence_number[quote_request_reject_message_at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 10 -> wire[at] = quote_request_reject_message_record.quote_req_id[quote_request_reject_message_at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> wire[at] = quote_request_reject_message_record.reject_code[quote_request_reject_message_at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_request_reject_message_record.order_book; at = at + 1;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> wire[at] = quote_request_reject_message_record.instrument_id[quote_request_reject_message_at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_request_reject_message_record.side; at = at + 1;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> wire[at] = quote_request_reject_message_record.order_quantity[quote_request_reject_message_at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 60 -> wire[at] = quote_request_reject_message_record.market_makers[quote_request_reject_message_at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 11 -> wire[at] = quote_request_reject_message_record.contra_trader[quote_request_reject_message_at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 10 -> wire[at] = quote_request_reject_message_record.rfq_id[quote_request_reject_message_at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request Reject Message off the wire, 110 bytes from where the cursor stands */
inline decode_quote_request_reject_message(quote_request_reject_message_record) {
  quote_request_reject_message_record.partition_id = wire[at]; at = at + 1;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.sequence_number[quote_request_reject_message_at] = wire[at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 10 -> quote_request_reject_message_record.quote_req_id[quote_request_reject_message_at] = wire[at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.reject_code[quote_request_reject_message_at] = wire[at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_record.order_book = wire[at]; at = at + 1;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.instrument_id[quote_request_reject_message_at] = wire[at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_record.side = wire[at]; at = at + 1;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> quote_request_reject_message_record.order_quantity[quote_request_reject_message_at] = wire[at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 60 -> quote_request_reject_message_record.market_makers[quote_request_reject_message_at] = wire[at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 11 -> quote_request_reject_message_record.contra_trader[quote_request_reject_message_at] = wire[at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 10 -> quote_request_reject_message_record.rfq_id[quote_request_reject_message_at] = wire[at]; at = at + 1; quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Request Reject Message is what was written, byte for byte */
inline equal_quote_request_reject_message(quote_request_reject_message_read, quote_request_reject_message_written) {
  assert(quote_request_reject_message_read.partition_id == quote_request_reject_message_written.partition_id);
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> assert(quote_request_reject_message_read.sequence_number[quote_request_reject_message_at] == quote_request_reject_message_written.sequence_number[quote_request_reject_message_at]); quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 10 -> assert(quote_request_reject_message_read.quote_req_id[quote_request_reject_message_at] == quote_request_reject_message_written.quote_req_id[quote_request_reject_message_at]); quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> assert(quote_request_reject_message_read.reject_code[quote_request_reject_message_at] == quote_request_reject_message_written.reject_code[quote_request_reject_message_at]); quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  assert(quote_request_reject_message_read.order_book == quote_request_reject_message_written.order_book);
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> assert(quote_request_reject_message_read.instrument_id[quote_request_reject_message_at] == quote_request_reject_message_written.instrument_id[quote_request_reject_message_at]); quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  assert(quote_request_reject_message_read.side == quote_request_reject_message_written.side);
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 4 -> assert(quote_request_reject_message_read.order_quantity[quote_request_reject_message_at] == quote_request_reject_message_written.order_quantity[quote_request_reject_message_at]); quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 60 -> assert(quote_request_reject_message_read.market_makers[quote_request_reject_message_at] == quote_request_reject_message_written.market_makers[quote_request_reject_message_at]); quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 11 -> assert(quote_request_reject_message_read.contra_trader[quote_request_reject_message_at] == quote_request_reject_message_written.contra_trader[quote_request_reject_message_at]); quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  quote_request_reject_message_at = 0;
  do
  :: quote_request_reject_message_at < 10 -> assert(quote_request_reject_message_read.rfq_id[quote_request_reject_message_at] == quote_request_reject_message_written.rfq_id[quote_request_reject_message_at]); quote_request_reject_message_at = quote_request_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Ack Message: 65 bytes --------------------------------------------- */

/* Allows the server to acknowledge a new or modified RFQ Quote to the Market Maker. */
typedef QuoteAckMessage {
  byte partition_id;
  byte sequence_number[4];
  byte quote_msg_id[20];
  byte rfq_id[10];
  byte bid_id[12];
  byte offer_id[12];
  byte quote_ack_status;
  byte reject_code[4];
  byte order_book
};

int quote_ack_message_at;

/* every byte of Quote Ack Message set to one value */
inline fill_quote_ack_message(quote_ack_message_record, quote_ack_message_value) {
  quote_ack_message_record.partition_id = quote_ack_message_value;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 4 -> quote_ack_message_record.sequence_number[quote_ack_message_at] = quote_ack_message_value; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 20 -> quote_ack_message_record.quote_msg_id[quote_ack_message_at] = quote_ack_message_value; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 10 -> quote_ack_message_record.rfq_id[quote_ack_message_at] = quote_ack_message_value; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 12 -> quote_ack_message_record.bid_id[quote_ack_message_at] = quote_ack_message_value; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 12 -> quote_ack_message_record.offer_id[quote_ack_message_at] = quote_ack_message_value; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_record.quote_ack_status = quote_ack_message_value;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 4 -> quote_ack_message_record.reject_code[quote_ack_message_at] = quote_ack_message_value; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_record.order_book = quote_ack_message_value;
  skip
}

/* each byte of Quote Ack Message set to where it lies, so a field read out of place says so */
inline ramp_quote_ack_message(quote_ack_message_record, quote_ack_message_base) {
  quote_ack_message_record.partition_id = (quote_ack_message_base + 0 + 1) % 256;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 4 -> quote_ack_message_record.sequence_number[quote_ack_message_at] = (quote_ack_message_base + 1 + quote_ack_message_at + 1) % 256; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 20 -> quote_ack_message_record.quote_msg_id[quote_ack_message_at] = (quote_ack_message_base + 5 + quote_ack_message_at + 1) % 256; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 10 -> quote_ack_message_record.rfq_id[quote_ack_message_at] = (quote_ack_message_base + 25 + quote_ack_message_at + 1) % 256; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 12 -> quote_ack_message_record.bid_id[quote_ack_message_at] = (quote_ack_message_base + 35 + quote_ack_message_at + 1) % 256; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 12 -> quote_ack_message_record.offer_id[quote_ack_message_at] = (quote_ack_message_base + 47 + quote_ack_message_at + 1) % 256; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_record.quote_ack_status = (quote_ack_message_base + 59 + 1) % 256;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 4 -> quote_ack_message_record.reject_code[quote_ack_message_at] = (quote_ack_message_base + 60 + quote_ack_message_at + 1) % 256; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_record.order_book = (quote_ack_message_base + 64 + 1) % 256;
  skip
}

/* Quote Ack Message to the wire, 65 bytes from where the cursor stands */
inline encode_quote_ack_message(quote_ack_message_record) {
  wire[at] = quote_ack_message_record.partition_id; at = at + 1;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 4 -> wire[at] = quote_ack_message_record.sequence_number[quote_ack_message_at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 20 -> wire[at] = quote_ack_message_record.quote_msg_id[quote_ack_message_at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 10 -> wire[at] = quote_ack_message_record.rfq_id[quote_ack_message_at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 12 -> wire[at] = quote_ack_message_record.bid_id[quote_ack_message_at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 12 -> wire[at] = quote_ack_message_record.offer_id[quote_ack_message_at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_ack_message_record.quote_ack_status; at = at + 1;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 4 -> wire[at] = quote_ack_message_record.reject_code[quote_ack_message_at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_ack_message_record.order_book; at = at + 1;
  skip
}

/* Quote Ack Message off the wire, 65 bytes from where the cursor stands */
inline decode_quote_ack_message(quote_ack_message_record) {
  quote_ack_message_record.partition_id = wire[at]; at = at + 1;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 4 -> quote_ack_message_record.sequence_number[quote_ack_message_at] = wire[at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 20 -> quote_ack_message_record.quote_msg_id[quote_ack_message_at] = wire[at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 10 -> quote_ack_message_record.rfq_id[quote_ack_message_at] = wire[at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 12 -> quote_ack_message_record.bid_id[quote_ack_message_at] = wire[at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 12 -> quote_ack_message_record.offer_id[quote_ack_message_at] = wire[at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_record.quote_ack_status = wire[at]; at = at + 1;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 4 -> quote_ack_message_record.reject_code[quote_ack_message_at] = wire[at]; at = at + 1; quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_record.order_book = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Ack Message is what was written, byte for byte */
inline equal_quote_ack_message(quote_ack_message_read, quote_ack_message_written) {
  assert(quote_ack_message_read.partition_id == quote_ack_message_written.partition_id);
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 4 -> assert(quote_ack_message_read.sequence_number[quote_ack_message_at] == quote_ack_message_written.sequence_number[quote_ack_message_at]); quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 20 -> assert(quote_ack_message_read.quote_msg_id[quote_ack_message_at] == quote_ack_message_written.quote_msg_id[quote_ack_message_at]); quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 10 -> assert(quote_ack_message_read.rfq_id[quote_ack_message_at] == quote_ack_message_written.rfq_id[quote_ack_message_at]); quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 12 -> assert(quote_ack_message_read.bid_id[quote_ack_message_at] == quote_ack_message_written.bid_id[quote_ack_message_at]); quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 12 -> assert(quote_ack_message_read.offer_id[quote_ack_message_at] == quote_ack_message_written.offer_id[quote_ack_message_at]); quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  assert(quote_ack_message_read.quote_ack_status == quote_ack_message_written.quote_ack_status);
  quote_ack_message_at = 0;
  do
  :: quote_ack_message_at < 4 -> assert(quote_ack_message_read.reject_code[quote_ack_message_at] == quote_ack_message_written.reject_code[quote_ack_message_at]); quote_ack_message_at = quote_ack_message_at + 1
  :: else -> break
  od;
  assert(quote_ack_message_read.order_book == quote_ack_message_written.order_book);
  skip
}

/* ---- Quote Response Message: 88 bytes ---------------------------------------- */

/* Carries an RFQ response. Sent by the Requester to execute or cancel an RFQ Quote, and by the server to report quote and RFQ status. */
typedef QuoteResponseMessage {
  byte partition_id;
  byte sequence_number[4];
  byte quote_msg_id[20];
  byte rfq_id[10];
  byte quote_resp_type;
  byte instrument_id[4];
  byte side;
  byte order_quantity[4];
  byte limit_price[8];
  byte order_book;
  byte bid_id[12];
  byte offer_id[12];
  byte capacity;
  byte clearing_account;
  byte reserved_8[8]
};

int quote_response_message_at;

/* every byte of Quote Response Message set to one value */
inline fill_quote_response_message(quote_response_message_record, quote_response_message_value) {
  quote_response_message_record.partition_id = quote_response_message_value;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> quote_response_message_record.sequence_number[quote_response_message_at] = quote_response_message_value; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 20 -> quote_response_message_record.quote_msg_id[quote_response_message_at] = quote_response_message_value; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 10 -> quote_response_message_record.rfq_id[quote_response_message_at] = quote_response_message_value; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.quote_resp_type = quote_response_message_value;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> quote_response_message_record.instrument_id[quote_response_message_at] = quote_response_message_value; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.side = quote_response_message_value;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> quote_response_message_record.order_quantity[quote_response_message_at] = quote_response_message_value; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 8 -> quote_response_message_record.limit_price[quote_response_message_at] = quote_response_message_value; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.order_book = quote_response_message_value;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 12 -> quote_response_message_record.bid_id[quote_response_message_at] = quote_response_message_value; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 12 -> quote_response_message_record.offer_id[quote_response_message_at] = quote_response_message_value; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.capacity = quote_response_message_value;
  quote_response_message_record.clearing_account = quote_response_message_value;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 8 -> quote_response_message_record.reserved_8[quote_response_message_at] = quote_response_message_value; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Response Message set to where it lies, so a field read out of place says so */
inline ramp_quote_response_message(quote_response_message_record, quote_response_message_base) {
  quote_response_message_record.partition_id = (quote_response_message_base + 0 + 1) % 256;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> quote_response_message_record.sequence_number[quote_response_message_at] = (quote_response_message_base + 1 + quote_response_message_at + 1) % 256; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 20 -> quote_response_message_record.quote_msg_id[quote_response_message_at] = (quote_response_message_base + 5 + quote_response_message_at + 1) % 256; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 10 -> quote_response_message_record.rfq_id[quote_response_message_at] = (quote_response_message_base + 25 + quote_response_message_at + 1) % 256; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.quote_resp_type = (quote_response_message_base + 35 + 1) % 256;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> quote_response_message_record.instrument_id[quote_response_message_at] = (quote_response_message_base + 36 + quote_response_message_at + 1) % 256; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.side = (quote_response_message_base + 40 + 1) % 256;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> quote_response_message_record.order_quantity[quote_response_message_at] = (quote_response_message_base + 41 + quote_response_message_at + 1) % 256; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 8 -> quote_response_message_record.limit_price[quote_response_message_at] = (quote_response_message_base + 45 + quote_response_message_at + 1) % 256; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.order_book = (quote_response_message_base + 53 + 1) % 256;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 12 -> quote_response_message_record.bid_id[quote_response_message_at] = (quote_response_message_base + 54 + quote_response_message_at + 1) % 256; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 12 -> quote_response_message_record.offer_id[quote_response_message_at] = (quote_response_message_base + 66 + quote_response_message_at + 1) % 256; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.capacity = (quote_response_message_base + 78 + 1) % 256;
  quote_response_message_record.clearing_account = (quote_response_message_base + 79 + 1) % 256;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 8 -> quote_response_message_record.reserved_8[quote_response_message_at] = (quote_response_message_base + 80 + quote_response_message_at + 1) % 256; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Response Message to the wire, 88 bytes from where the cursor stands */
inline encode_quote_response_message(quote_response_message_record) {
  wire[at] = quote_response_message_record.partition_id; at = at + 1;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> wire[at] = quote_response_message_record.sequence_number[quote_response_message_at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 20 -> wire[at] = quote_response_message_record.quote_msg_id[quote_response_message_at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 10 -> wire[at] = quote_response_message_record.rfq_id[quote_response_message_at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_response_message_record.quote_resp_type; at = at + 1;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> wire[at] = quote_response_message_record.instrument_id[quote_response_message_at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_response_message_record.side; at = at + 1;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> wire[at] = quote_response_message_record.order_quantity[quote_response_message_at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 8 -> wire[at] = quote_response_message_record.limit_price[quote_response_message_at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_response_message_record.order_book; at = at + 1;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 12 -> wire[at] = quote_response_message_record.bid_id[quote_response_message_at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 12 -> wire[at] = quote_response_message_record.offer_id[quote_response_message_at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_response_message_record.capacity; at = at + 1;
  wire[at] = quote_response_message_record.clearing_account; at = at + 1;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 8 -> wire[at] = quote_response_message_record.reserved_8[quote_response_message_at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Response Message off the wire, 88 bytes from where the cursor stands */
inline decode_quote_response_message(quote_response_message_record) {
  quote_response_message_record.partition_id = wire[at]; at = at + 1;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> quote_response_message_record.sequence_number[quote_response_message_at] = wire[at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 20 -> quote_response_message_record.quote_msg_id[quote_response_message_at] = wire[at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 10 -> quote_response_message_record.rfq_id[quote_response_message_at] = wire[at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.quote_resp_type = wire[at]; at = at + 1;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> quote_response_message_record.instrument_id[quote_response_message_at] = wire[at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.side = wire[at]; at = at + 1;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> quote_response_message_record.order_quantity[quote_response_message_at] = wire[at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 8 -> quote_response_message_record.limit_price[quote_response_message_at] = wire[at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.order_book = wire[at]; at = at + 1;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 12 -> quote_response_message_record.bid_id[quote_response_message_at] = wire[at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 12 -> quote_response_message_record.offer_id[quote_response_message_at] = wire[at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_record.capacity = wire[at]; at = at + 1;
  quote_response_message_record.clearing_account = wire[at]; at = at + 1;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 8 -> quote_response_message_record.reserved_8[quote_response_message_at] = wire[at]; at = at + 1; quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Response Message is what was written, byte for byte */
inline equal_quote_response_message(quote_response_message_read, quote_response_message_written) {
  assert(quote_response_message_read.partition_id == quote_response_message_written.partition_id);
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> assert(quote_response_message_read.sequence_number[quote_response_message_at] == quote_response_message_written.sequence_number[quote_response_message_at]); quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 20 -> assert(quote_response_message_read.quote_msg_id[quote_response_message_at] == quote_response_message_written.quote_msg_id[quote_response_message_at]); quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 10 -> assert(quote_response_message_read.rfq_id[quote_response_message_at] == quote_response_message_written.rfq_id[quote_response_message_at]); quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  assert(quote_response_message_read.quote_resp_type == quote_response_message_written.quote_resp_type);
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> assert(quote_response_message_read.instrument_id[quote_response_message_at] == quote_response_message_written.instrument_id[quote_response_message_at]); quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  assert(quote_response_message_read.side == quote_response_message_written.side);
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 4 -> assert(quote_response_message_read.order_quantity[quote_response_message_at] == quote_response_message_written.order_quantity[quote_response_message_at]); quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 8 -> assert(quote_response_message_read.limit_price[quote_response_message_at] == quote_response_message_written.limit_price[quote_response_message_at]); quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  assert(quote_response_message_read.order_book == quote_response_message_written.order_book);
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 12 -> assert(quote_response_message_read.bid_id[quote_response_message_at] == quote_response_message_written.bid_id[quote_response_message_at]); quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 12 -> assert(quote_response_message_read.offer_id[quote_response_message_at] == quote_response_message_written.offer_id[quote_response_message_at]); quote_response_message_at = quote_response_message_at + 1
  :: else -> break
  od;
  assert(quote_response_message_read.capacity == quote_response_message_written.capacity);
  assert(quote_response_message_read.clearing_account == quote_response_message_written.clearing_account);
  quote_response_message_at = 0;
  do
  :: quote_response_message_at < 8 -> assert(quote_response_message_read.reserved_8[quote_response_message_at] == quote_response_message_written.reserved_8[quote_response_message_at]); quote_response_message_at = quote_response_message_at + 1
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
    assert(at == 4);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 4);
    equal_message_header(message_header_got, message_header_sent)
  }
}

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
    assert(at == 76);
    at = 0;
    decode_logon_message(logon_message_got);
    assert(at == 76);
    equal_logon_message(logon_message_got, logon_message_sent)
  }
}

/* Logon Reply Message: encoded, read back, and compared */
proctype check_logon_reply_message() {
  LogonReplyMessage logon_reply_message_sent;
  LogonReplyMessage logon_reply_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_reply_message(logon_reply_message_sent, 0)
  :: pattern == 1 -> fill_logon_reply_message(logon_reply_message_sent, 32)
  :: pattern == 2 -> fill_logon_reply_message(logon_reply_message_sent, 255)
  :: else -> ramp_logon_reply_message(logon_reply_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_reply_message(logon_reply_message_sent);
    assert(at == 34);
    at = 0;
    decode_logon_reply_message(logon_reply_message_got);
    assert(at == 34);
    equal_logon_reply_message(logon_reply_message_got, logon_reply_message_sent)
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
    assert(at == 20);
    at = 0;
    decode_logout_message(logout_message_got);
    assert(at == 20);
    equal_logout_message(logout_message_got, logout_message_sent)
  }
}

/* Missed Message Request Message: encoded, read back, and compared */
proctype check_missed_message_request_message() {
  MissedMessageRequestMessage missed_message_request_message_sent;
  MissedMessageRequestMessage missed_message_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_missed_message_request_message(missed_message_request_message_sent, 0)
  :: pattern == 1 -> fill_missed_message_request_message(missed_message_request_message_sent, 32)
  :: pattern == 2 -> fill_missed_message_request_message(missed_message_request_message_sent, 255)
  :: else -> ramp_missed_message_request_message(missed_message_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_missed_message_request_message(missed_message_request_message_sent);
    assert(at == 5);
    at = 0;
    decode_missed_message_request_message(missed_message_request_message_got);
    assert(at == 5);
    equal_missed_message_request_message(missed_message_request_message_got, missed_message_request_message_sent)
  }
}

/* Missed Message Request Ack Message: encoded, read back, and compared */
proctype check_missed_message_request_ack_message() {
  MissedMessageRequestAckMessage missed_message_request_ack_message_sent;
  MissedMessageRequestAckMessage missed_message_request_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_missed_message_request_ack_message(missed_message_request_ack_message_sent, 0)
  :: pattern == 1 -> fill_missed_message_request_ack_message(missed_message_request_ack_message_sent, 32)
  :: pattern == 2 -> fill_missed_message_request_ack_message(missed_message_request_ack_message_sent, 255)
  :: else -> ramp_missed_message_request_ack_message(missed_message_request_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_missed_message_request_ack_message(missed_message_request_ack_message_sent);
    assert(at == 1);
    at = 0;
    decode_missed_message_request_ack_message(missed_message_request_ack_message_got);
    assert(at == 1);
    equal_missed_message_request_ack_message(missed_message_request_ack_message_got, missed_message_request_ack_message_sent)
  }
}

/* Missed Message Report Message: encoded, read back, and compared */
proctype check_missed_message_report_message() {
  MissedMessageReportMessage missed_message_report_message_sent;
  MissedMessageReportMessage missed_message_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_missed_message_report_message(missed_message_report_message_sent, 0)
  :: pattern == 1 -> fill_missed_message_report_message(missed_message_report_message_sent, 32)
  :: pattern == 2 -> fill_missed_message_report_message(missed_message_report_message_sent, 255)
  :: else -> ramp_missed_message_report_message(missed_message_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_missed_message_report_message(missed_message_report_message_sent);
    assert(at == 1);
    at = 0;
    decode_missed_message_report_message(missed_message_report_message_got);
    assert(at == 1);
    equal_missed_message_report_message(missed_message_report_message_got, missed_message_report_message_sent)
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
    assert(at == 55);
    at = 0;
    decode_reject_message(reject_message_got);
    assert(at == 55);
    equal_reject_message(reject_message_got, reject_message_sent)
  }
}

/* System Status Message: encoded, read back, and compared */
proctype check_system_status_message() {
  SystemStatusMessage system_status_message_sent;
  SystemStatusMessage system_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_status_message(system_status_message_sent, 0)
  :: pattern == 1 -> fill_system_status_message(system_status_message_sent, 32)
  :: pattern == 2 -> fill_system_status_message(system_status_message_sent, 255)
  :: else -> ramp_system_status_message(system_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_status_message(system_status_message_sent);
    assert(at == 2);
    at = 0;
    decode_system_status_message(system_status_message_got);
    assert(at == 2);
    equal_system_status_message(system_status_message_got, system_status_message_sent)
  }
}

/* Transact Time: encoded, read back, and compared */
proctype check_transact_time() {
  TransactTime transact_time_sent;
  TransactTime transact_time_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transact_time(transact_time_sent, 0)
  :: pattern == 1 -> fill_transact_time(transact_time_sent, 32)
  :: pattern == 2 -> fill_transact_time(transact_time_sent, 255)
  :: else -> ramp_transact_time(transact_time_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transact_time(transact_time_sent);
    assert(at == 8);
    at = 0;
    decode_transact_time(transact_time_got);
    assert(at == 8);
    equal_transact_time(transact_time_got, transact_time_sent)
  }
}

/* Order Mass Cancel Report Message: encoded, read back, and compared */
proctype check_order_mass_cancel_report_message() {
  OrderMassCancelReportMessage order_mass_cancel_report_message_sent;
  OrderMassCancelReportMessage order_mass_cancel_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_cancel_report_message(order_mass_cancel_report_message_sent, 0)
  :: pattern == 1 -> fill_order_mass_cancel_report_message(order_mass_cancel_report_message_sent, 32)
  :: pattern == 2 -> fill_order_mass_cancel_report_message(order_mass_cancel_report_message_sent, 255)
  :: else -> ramp_order_mass_cancel_report_message(order_mass_cancel_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_cancel_report_message(order_mass_cancel_report_message_sent);
    assert(at == 52);
    at = 0;
    decode_order_mass_cancel_report_message(order_mass_cancel_report_message_got);
    assert(at == 52);
    equal_order_mass_cancel_report_message(order_mass_cancel_report_message_got, order_mass_cancel_report_message_sent)
  }
}

/* Quote Status Report Message: encoded, read back, and compared */
proctype check_quote_status_report_message() {
  QuoteStatusReportMessage quote_status_report_message_sent;
  QuoteStatusReportMessage quote_status_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_status_report_message(quote_status_report_message_sent, 0)
  :: pattern == 1 -> fill_quote_status_report_message(quote_status_report_message_sent, 32)
  :: pattern == 2 -> fill_quote_status_report_message(quote_status_report_message_sent, 255)
  :: else -> ramp_quote_status_report_message(quote_status_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_status_report_message(quote_status_report_message_sent);
    assert(at == 143);
    at = 0;
    decode_quote_status_report_message(quote_status_report_message_got);
    assert(at == 143);
    equal_quote_status_report_message(quote_status_report_message_got, quote_status_report_message_sent)
  }
}

/* Quote Request Reject Message: encoded, read back, and compared */
proctype check_quote_request_reject_message() {
  QuoteRequestRejectMessage quote_request_reject_message_sent;
  QuoteRequestRejectMessage quote_request_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_request_reject_message(quote_request_reject_message_sent, 0)
  :: pattern == 1 -> fill_quote_request_reject_message(quote_request_reject_message_sent, 32)
  :: pattern == 2 -> fill_quote_request_reject_message(quote_request_reject_message_sent, 255)
  :: else -> ramp_quote_request_reject_message(quote_request_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_request_reject_message(quote_request_reject_message_sent);
    assert(at == 110);
    at = 0;
    decode_quote_request_reject_message(quote_request_reject_message_got);
    assert(at == 110);
    equal_quote_request_reject_message(quote_request_reject_message_got, quote_request_reject_message_sent)
  }
}

/* Quote Ack Message: encoded, read back, and compared */
proctype check_quote_ack_message() {
  QuoteAckMessage quote_ack_message_sent;
  QuoteAckMessage quote_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_ack_message(quote_ack_message_sent, 0)
  :: pattern == 1 -> fill_quote_ack_message(quote_ack_message_sent, 32)
  :: pattern == 2 -> fill_quote_ack_message(quote_ack_message_sent, 255)
  :: else -> ramp_quote_ack_message(quote_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_ack_message(quote_ack_message_sent);
    assert(at == 65);
    at = 0;
    decode_quote_ack_message(quote_ack_message_got);
    assert(at == 65);
    equal_quote_ack_message(quote_ack_message_got, quote_ack_message_sent)
  }
}

/* Quote Response Message: encoded, read back, and compared */
proctype check_quote_response_message() {
  QuoteResponseMessage quote_response_message_sent;
  QuoteResponseMessage quote_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_response_message(quote_response_message_sent, 0)
  :: pattern == 1 -> fill_quote_response_message(quote_response_message_sent, 32)
  :: pattern == 2 -> fill_quote_response_message(quote_response_message_sent, 255)
  :: else -> ramp_quote_response_message(quote_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_response_message(quote_response_message_sent);
    assert(at == 88);
    at = 0;
    decode_quote_response_message(quote_response_message_got);
    assert(at == 88);
    equal_quote_response_message(quote_response_message_got, quote_response_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_logon_message()
  :: run check_logon_reply_message()
  :: run check_logout_message()
  :: run check_missed_message_request_message()
  :: run check_missed_message_request_ack_message()
  :: run check_missed_message_report_message()
  :: run check_reject_message()
  :: run check_system_status_message()
  :: run check_transact_time()
  :: run check_order_mass_cancel_report_message()
  :: run check_quote_status_report_message()
  :: run check_quote_request_reject_message()
  :: run check_quote_ack_message()
  :: run check_quote_response_message()
  fi
}
