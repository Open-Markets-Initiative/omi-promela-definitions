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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 179

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

/* Allows the Participant and server to establish a session. */
typedef LogonMessage {
  byte comp_id[25];
  byte password[25];
  byte new_password[25];
  byte message_version
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.comp_id[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
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
  :: logon_message_at < 25 -> logon_message_record.comp_id[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
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
  :: logon_message_at < 25 -> wire[at] = logon_message_record.comp_id[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
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
  :: logon_message_at < 25 -> logon_message_record.comp_id[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
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
  :: logon_message_at < 25 -> assert(logon_message_read.comp_id[logon_message_at] == logon_message_written.comp_id[logon_message_at]); logon_message_at = logon_message_at + 1
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

/* Allows the server to acknowledge a Participant's Logon. */
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

/* Allows the Participant and server to terminate a session. */
typedef LogoutMessage {
  byte logout_reason[20]
};

int logout_message_at;

/* every byte of Logout Message set to one value */
inline fill_logout_message(logout_message_record, logout_message_value) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> logout_message_record.logout_reason[logout_message_at] = logout_message_value; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout Message set to where it lies, so a field read out of place says so */
inline ramp_logout_message(logout_message_record, logout_message_base) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> logout_message_record.logout_reason[logout_message_at] = (logout_message_base + 0 + logout_message_at + 1) % 256; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message to the wire, 20 bytes from where the cursor stands */
inline encode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> wire[at] = logout_message_record.logout_reason[logout_message_at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message off the wire, 20 bytes from where the cursor stands */
inline decode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> logout_message_record.logout_reason[logout_message_at] = wire[at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout Message is what was written, byte for byte */
inline equal_logout_message(logout_message_read, logout_message_written) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> assert(logout_message_read.logout_reason[logout_message_at] == logout_message_written.logout_reason[logout_message_at]); logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Missed Message Request Message: 5 bytes --------------------------------- */

/* Allows the Participant to subscribe to missed messages through the Recovery Channel. */
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

/* Allows the server to acknowledge a Participant's Missed Message Request. */
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

/* Allows the Server to communicate the result of a Missed Message Request. */
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

/* Allows the Server to reject a message that does not comply with the Native Trading Gateway messaging protocol. */
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

/* Sent to All Native Recovery Channel Participants on the event of Order Cache Outage. */
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

/* ---- Execution Report Message: 179 bytes ------------------------------------- */

/* Indicates order accepted, rejected, executed, expired, cancelled, cancel/replaced, trade cancel, BI triggered or pending cancel. */
typedef ExecutionReportMessage {
  byte app_id;
  byte sequence_no[4];
  byte execution_id[12];
  byte client_order_id[20];
  byte order_id[12];
  byte exec_type;
  byte execution_report_ref_id[12];
  byte order_status;
  byte order_reject_code[4];
  byte executed_price[8];
  byte executed_qty[4];
  byte leaves_qty[4];
  byte waiver_flags;
  byte display_qty[4];
  byte common_symbol[8];
  byte side;
  byte secondary_order_id[8];
  byte counterparty[11];
  byte trade_liquidity_indicator;
  byte trade_match_id[8];
  TransactTime transact_time;
  byte target_book;
  byte type_of_trade;
  byte capacity;
  byte reserved_1;
  byte public_order_id[12];
  byte minimum_quantity[4];
  byte reputational_score;
  byte last_market;
  byte peg_price_type;
  byte owner_type;
  byte waiver_flags_2;
  byte reserved_21[21]
};

int execution_report_message_at;

/* every byte of Execution Report Message set to one value */
inline fill_execution_report_message(execution_report_message_record, execution_report_message_value) {
  execution_report_message_record.app_id = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.sequence_no[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.execution_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 20 -> execution_report_message_record.client_order_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.order_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.exec_type = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.execution_report_ref_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.order_status = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.order_reject_code[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.executed_price[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.executed_qty[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.leaves_qty[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.waiver_flags = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.display_qty[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.common_symbol[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.side = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.secondary_order_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 11 -> execution_report_message_record.counterparty[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.trade_liquidity_indicator = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.trade_match_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  fill_transact_time(execution_report_message_record.transact_time, execution_report_message_value);
  execution_report_message_record.target_book = execution_report_message_value;
  execution_report_message_record.type_of_trade = execution_report_message_value;
  execution_report_message_record.capacity = execution_report_message_value;
  execution_report_message_record.reserved_1 = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.public_order_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.minimum_quantity[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.reputational_score = execution_report_message_value;
  execution_report_message_record.last_market = execution_report_message_value;
  execution_report_message_record.peg_price_type = execution_report_message_value;
  execution_report_message_record.owner_type = execution_report_message_value;
  execution_report_message_record.waiver_flags_2 = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 21 -> execution_report_message_record.reserved_21[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_message(execution_report_message_record, execution_report_message_base) {
  execution_report_message_record.app_id = (execution_report_message_base + 0 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.sequence_no[execution_report_message_at] = (execution_report_message_base + 1 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.execution_id[execution_report_message_at] = (execution_report_message_base + 5 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 20 -> execution_report_message_record.client_order_id[execution_report_message_at] = (execution_report_message_base + 17 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.order_id[execution_report_message_at] = (execution_report_message_base + 37 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.exec_type = (execution_report_message_base + 49 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.execution_report_ref_id[execution_report_message_at] = (execution_report_message_base + 50 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.order_status = (execution_report_message_base + 62 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.order_reject_code[execution_report_message_at] = (execution_report_message_base + 63 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.executed_price[execution_report_message_at] = (execution_report_message_base + 67 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.executed_qty[execution_report_message_at] = (execution_report_message_base + 75 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.leaves_qty[execution_report_message_at] = (execution_report_message_base + 79 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.waiver_flags = (execution_report_message_base + 83 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.display_qty[execution_report_message_at] = (execution_report_message_base + 84 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.common_symbol[execution_report_message_at] = (execution_report_message_base + 88 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.side = (execution_report_message_base + 96 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.secondary_order_id[execution_report_message_at] = (execution_report_message_base + 97 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 11 -> execution_report_message_record.counterparty[execution_report_message_at] = (execution_report_message_base + 105 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.trade_liquidity_indicator = (execution_report_message_base + 116 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.trade_match_id[execution_report_message_at] = (execution_report_message_base + 117 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  ramp_transact_time(execution_report_message_record.transact_time, execution_report_message_base + 125);
  execution_report_message_record.target_book = (execution_report_message_base + 133 + 1) % 256;
  execution_report_message_record.type_of_trade = (execution_report_message_base + 134 + 1) % 256;
  execution_report_message_record.capacity = (execution_report_message_base + 135 + 1) % 256;
  execution_report_message_record.reserved_1 = (execution_report_message_base + 136 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.public_order_id[execution_report_message_at] = (execution_report_message_base + 137 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.minimum_quantity[execution_report_message_at] = (execution_report_message_base + 149 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.reputational_score = (execution_report_message_base + 153 + 1) % 256;
  execution_report_message_record.last_market = (execution_report_message_base + 154 + 1) % 256;
  execution_report_message_record.peg_price_type = (execution_report_message_base + 155 + 1) % 256;
  execution_report_message_record.owner_type = (execution_report_message_base + 156 + 1) % 256;
  execution_report_message_record.waiver_flags_2 = (execution_report_message_base + 157 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 21 -> execution_report_message_record.reserved_21[execution_report_message_at] = (execution_report_message_base + 158 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Message to the wire, 179 bytes from where the cursor stands */
inline encode_execution_report_message(execution_report_message_record) {
  wire[at] = execution_report_message_record.app_id; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.sequence_no[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> wire[at] = execution_report_message_record.execution_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 20 -> wire[at] = execution_report_message_record.client_order_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> wire[at] = execution_report_message_record.order_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_message_record.exec_type; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> wire[at] = execution_report_message_record.execution_report_ref_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_message_record.order_status; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.order_reject_code[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> wire[at] = execution_report_message_record.executed_price[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.executed_qty[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.leaves_qty[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_message_record.waiver_flags; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.display_qty[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> wire[at] = execution_report_message_record.common_symbol[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_message_record.side; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> wire[at] = execution_report_message_record.secondary_order_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 11 -> wire[at] = execution_report_message_record.counterparty[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_message_record.trade_liquidity_indicator; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> wire[at] = execution_report_message_record.trade_match_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  encode_transact_time(execution_report_message_record.transact_time);
  wire[at] = execution_report_message_record.target_book; at = at + 1;
  wire[at] = execution_report_message_record.type_of_trade; at = at + 1;
  wire[at] = execution_report_message_record.capacity; at = at + 1;
  wire[at] = execution_report_message_record.reserved_1; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> wire[at] = execution_report_message_record.public_order_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.minimum_quantity[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_message_record.reputational_score; at = at + 1;
  wire[at] = execution_report_message_record.last_market; at = at + 1;
  wire[at] = execution_report_message_record.peg_price_type; at = at + 1;
  wire[at] = execution_report_message_record.owner_type; at = at + 1;
  wire[at] = execution_report_message_record.waiver_flags_2; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 21 -> wire[at] = execution_report_message_record.reserved_21[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Message off the wire, 179 bytes from where the cursor stands */
inline decode_execution_report_message(execution_report_message_record) {
  execution_report_message_record.app_id = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.sequence_no[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.execution_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 20 -> execution_report_message_record.client_order_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.order_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.exec_type = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.execution_report_ref_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.order_status = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.order_reject_code[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.executed_price[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.executed_qty[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.leaves_qty[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.waiver_flags = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.display_qty[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.common_symbol[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.side = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.secondary_order_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 11 -> execution_report_message_record.counterparty[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.trade_liquidity_indicator = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.trade_match_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  decode_transact_time(execution_report_message_record.transact_time);
  execution_report_message_record.target_book = wire[at]; at = at + 1;
  execution_report_message_record.type_of_trade = wire[at]; at = at + 1;
  execution_report_message_record.capacity = wire[at]; at = at + 1;
  execution_report_message_record.reserved_1 = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> execution_report_message_record.public_order_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.minimum_quantity[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.reputational_score = wire[at]; at = at + 1;
  execution_report_message_record.last_market = wire[at]; at = at + 1;
  execution_report_message_record.peg_price_type = wire[at]; at = at + 1;
  execution_report_message_record.owner_type = wire[at]; at = at + 1;
  execution_report_message_record.waiver_flags_2 = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 21 -> execution_report_message_record.reserved_21[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report Message is what was written, byte for byte */
inline equal_execution_report_message(execution_report_message_read, execution_report_message_written) {
  assert(execution_report_message_read.app_id == execution_report_message_written.app_id);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.sequence_no[execution_report_message_at] == execution_report_message_written.sequence_no[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> assert(execution_report_message_read.execution_id[execution_report_message_at] == execution_report_message_written.execution_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 20 -> assert(execution_report_message_read.client_order_id[execution_report_message_at] == execution_report_message_written.client_order_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> assert(execution_report_message_read.order_id[execution_report_message_at] == execution_report_message_written.order_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  assert(execution_report_message_read.exec_type == execution_report_message_written.exec_type);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> assert(execution_report_message_read.execution_report_ref_id[execution_report_message_at] == execution_report_message_written.execution_report_ref_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  assert(execution_report_message_read.order_status == execution_report_message_written.order_status);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.order_reject_code[execution_report_message_at] == execution_report_message_written.order_reject_code[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> assert(execution_report_message_read.executed_price[execution_report_message_at] == execution_report_message_written.executed_price[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.executed_qty[execution_report_message_at] == execution_report_message_written.executed_qty[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.leaves_qty[execution_report_message_at] == execution_report_message_written.leaves_qty[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  assert(execution_report_message_read.waiver_flags == execution_report_message_written.waiver_flags);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.display_qty[execution_report_message_at] == execution_report_message_written.display_qty[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> assert(execution_report_message_read.common_symbol[execution_report_message_at] == execution_report_message_written.common_symbol[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  assert(execution_report_message_read.side == execution_report_message_written.side);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> assert(execution_report_message_read.secondary_order_id[execution_report_message_at] == execution_report_message_written.secondary_order_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 11 -> assert(execution_report_message_read.counterparty[execution_report_message_at] == execution_report_message_written.counterparty[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  assert(execution_report_message_read.trade_liquidity_indicator == execution_report_message_written.trade_liquidity_indicator);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> assert(execution_report_message_read.trade_match_id[execution_report_message_at] == execution_report_message_written.trade_match_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  equal_transact_time(execution_report_message_read.transact_time, execution_report_message_written.transact_time);
  assert(execution_report_message_read.target_book == execution_report_message_written.target_book);
  assert(execution_report_message_read.type_of_trade == execution_report_message_written.type_of_trade);
  assert(execution_report_message_read.capacity == execution_report_message_written.capacity);
  assert(execution_report_message_read.reserved_1 == execution_report_message_written.reserved_1);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 12 -> assert(execution_report_message_read.public_order_id[execution_report_message_at] == execution_report_message_written.public_order_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.minimum_quantity[execution_report_message_at] == execution_report_message_written.minimum_quantity[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  assert(execution_report_message_read.reputational_score == execution_report_message_written.reputational_score);
  assert(execution_report_message_read.last_market == execution_report_message_written.last_market);
  assert(execution_report_message_read.peg_price_type == execution_report_message_written.peg_price_type);
  assert(execution_report_message_read.owner_type == execution_report_message_written.owner_type);
  assert(execution_report_message_read.waiver_flags_2 == execution_report_message_written.waiver_flags_2);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 21 -> assert(execution_report_message_read.reserved_21[execution_report_message_at] == execution_report_message_written.reserved_21[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Reject Message: 59 bytes ----------------------------------- */

/* Indicates that an Order Cancel Request or Order Cancel/Replace Request has been rejected. */
typedef OrderCancelRejectMessage {
  byte app_id;
  byte sequence_no[4];
  byte client_order_id[20];
  byte order_id[12];
  byte cancel_reject_reason[4];
  TransactTime transact_time;
  byte reserved_10[10]
};

int order_cancel_reject_message_at;

/* every byte of Order Cancel Reject Message set to one value */
inline fill_order_cancel_reject_message(order_cancel_reject_message_record, order_cancel_reject_message_value) {
  order_cancel_reject_message_record.app_id = order_cancel_reject_message_value;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.sequence_no[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 20 -> order_cancel_reject_message_record.client_order_id[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 12 -> order_cancel_reject_message_record.order_id[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.cancel_reject_reason[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  fill_transact_time(order_cancel_reject_message_record.transact_time, order_cancel_reject_message_value);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 10 -> order_cancel_reject_message_record.reserved_10[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Reject Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_reject_message(order_cancel_reject_message_record, order_cancel_reject_message_base) {
  order_cancel_reject_message_record.app_id = (order_cancel_reject_message_base + 0 + 1) % 256;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.sequence_no[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 1 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 20 -> order_cancel_reject_message_record.client_order_id[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 5 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 12 -> order_cancel_reject_message_record.order_id[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 25 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.cancel_reject_reason[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 37 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  ramp_transact_time(order_cancel_reject_message_record.transact_time, order_cancel_reject_message_base + 41);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 10 -> order_cancel_reject_message_record.reserved_10[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 49 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Reject Message to the wire, 59 bytes from where the cursor stands */
inline encode_order_cancel_reject_message(order_cancel_reject_message_record) {
  wire[at] = order_cancel_reject_message_record.app_id; at = at + 1;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> wire[at] = order_cancel_reject_message_record.sequence_no[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 20 -> wire[at] = order_cancel_reject_message_record.client_order_id[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 12 -> wire[at] = order_cancel_reject_message_record.order_id[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> wire[at] = order_cancel_reject_message_record.cancel_reject_reason[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  encode_transact_time(order_cancel_reject_message_record.transact_time);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 10 -> wire[at] = order_cancel_reject_message_record.reserved_10[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Reject Message off the wire, 59 bytes from where the cursor stands */
inline decode_order_cancel_reject_message(order_cancel_reject_message_record) {
  order_cancel_reject_message_record.app_id = wire[at]; at = at + 1;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.sequence_no[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 20 -> order_cancel_reject_message_record.client_order_id[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 12 -> order_cancel_reject_message_record.order_id[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.cancel_reject_reason[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  decode_transact_time(order_cancel_reject_message_record.transact_time);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 10 -> order_cancel_reject_message_record.reserved_10[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Reject Message is what was written, byte for byte */
inline equal_order_cancel_reject_message(order_cancel_reject_message_read, order_cancel_reject_message_written) {
  assert(order_cancel_reject_message_read.app_id == order_cancel_reject_message_written.app_id);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> assert(order_cancel_reject_message_read.sequence_no[order_cancel_reject_message_at] == order_cancel_reject_message_written.sequence_no[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 20 -> assert(order_cancel_reject_message_read.client_order_id[order_cancel_reject_message_at] == order_cancel_reject_message_written.client_order_id[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 12 -> assert(order_cancel_reject_message_read.order_id[order_cancel_reject_message_at] == order_cancel_reject_message_written.order_id[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> assert(order_cancel_reject_message_read.cancel_reject_reason[order_cancel_reject_message_at] == order_cancel_reject_message_written.cancel_reject_reason[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  equal_transact_time(order_cancel_reject_message_read.transact_time, order_cancel_reject_message_written.transact_time);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 10 -> assert(order_cancel_reject_message_read.reserved_10[order_cancel_reject_message_at] == order_cancel_reject_message_written.reserved_10[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Mass Cancel Report Message: 52 bytes ------------------------------ */

/* Indicates a mass order cancel request was accepted or rejected. */
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

/* ---- Business Reject Message: 59 bytes --------------------------------------- */

/* Indicates that an application message could not be processed. */
typedef BusinessRejectMessage {
  byte app_id;
  byte sequence_no[4];
  byte reject_code[4];
  byte client_order_id[20];
  byte order_id[12];
  TransactTime transact_time;
  byte reserved_10[10]
};

int business_reject_message_at;

/* every byte of Business Reject Message set to one value */
inline fill_business_reject_message(business_reject_message_record, business_reject_message_value) {
  business_reject_message_record.app_id = business_reject_message_value;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.sequence_no[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.reject_code[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 20 -> business_reject_message_record.client_order_id[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 12 -> business_reject_message_record.order_id[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  fill_transact_time(business_reject_message_record.transact_time, business_reject_message_value);
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 10 -> business_reject_message_record.reserved_10[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Business Reject Message set to where it lies, so a field read out of place says so */
inline ramp_business_reject_message(business_reject_message_record, business_reject_message_base) {
  business_reject_message_record.app_id = (business_reject_message_base + 0 + 1) % 256;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.sequence_no[business_reject_message_at] = (business_reject_message_base + 1 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.reject_code[business_reject_message_at] = (business_reject_message_base + 5 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 20 -> business_reject_message_record.client_order_id[business_reject_message_at] = (business_reject_message_base + 9 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 12 -> business_reject_message_record.order_id[business_reject_message_at] = (business_reject_message_base + 29 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  ramp_transact_time(business_reject_message_record.transact_time, business_reject_message_base + 41);
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 10 -> business_reject_message_record.reserved_10[business_reject_message_at] = (business_reject_message_base + 49 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Business Reject Message to the wire, 59 bytes from where the cursor stands */
inline encode_business_reject_message(business_reject_message_record) {
  wire[at] = business_reject_message_record.app_id; at = at + 1;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> wire[at] = business_reject_message_record.sequence_no[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> wire[at] = business_reject_message_record.reject_code[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 20 -> wire[at] = business_reject_message_record.client_order_id[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 12 -> wire[at] = business_reject_message_record.order_id[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  encode_transact_time(business_reject_message_record.transact_time);
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 10 -> wire[at] = business_reject_message_record.reserved_10[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Business Reject Message off the wire, 59 bytes from where the cursor stands */
inline decode_business_reject_message(business_reject_message_record) {
  business_reject_message_record.app_id = wire[at]; at = at + 1;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.sequence_no[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.reject_code[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 20 -> business_reject_message_record.client_order_id[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 12 -> business_reject_message_record.order_id[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  decode_transact_time(business_reject_message_record.transact_time);
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 10 -> business_reject_message_record.reserved_10[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Business Reject Message is what was written, byte for byte */
inline equal_business_reject_message(business_reject_message_read, business_reject_message_written) {
  assert(business_reject_message_read.app_id == business_reject_message_written.app_id);
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> assert(business_reject_message_read.sequence_no[business_reject_message_at] == business_reject_message_written.sequence_no[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> assert(business_reject_message_read.reject_code[business_reject_message_at] == business_reject_message_written.reject_code[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 20 -> assert(business_reject_message_read.client_order_id[business_reject_message_at] == business_reject_message_written.client_order_id[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 12 -> assert(business_reject_message_read.order_id[business_reject_message_at] == business_reject_message_written.order_id[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  equal_transact_time(business_reject_message_read.transact_time, business_reject_message_written.transact_time);
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 10 -> assert(business_reject_message_read.reserved_10[business_reject_message_at] == business_reject_message_written.reserved_10[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
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

/* Execution Report Message: encoded, read back, and compared */
proctype check_execution_report_message() {
  ExecutionReportMessage execution_report_message_sent;
  ExecutionReportMessage execution_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_message(execution_report_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_message(execution_report_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_message(execution_report_message_sent, 255)
  :: else -> ramp_execution_report_message(execution_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_message(execution_report_message_sent);
    assert(at == 179);
    at = 0;
    decode_execution_report_message(execution_report_message_got);
    assert(at == 179);
    equal_execution_report_message(execution_report_message_got, execution_report_message_sent)
  }
}

/* Order Cancel Reject Message: encoded, read back, and compared */
proctype check_order_cancel_reject_message() {
  OrderCancelRejectMessage order_cancel_reject_message_sent;
  OrderCancelRejectMessage order_cancel_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_reject_message(order_cancel_reject_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_reject_message(order_cancel_reject_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_reject_message(order_cancel_reject_message_sent, 255)
  :: else -> ramp_order_cancel_reject_message(order_cancel_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_reject_message(order_cancel_reject_message_sent);
    assert(at == 59);
    at = 0;
    decode_order_cancel_reject_message(order_cancel_reject_message_got);
    assert(at == 59);
    equal_order_cancel_reject_message(order_cancel_reject_message_got, order_cancel_reject_message_sent)
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

/* Business Reject Message: encoded, read back, and compared */
proctype check_business_reject_message() {
  BusinessRejectMessage business_reject_message_sent;
  BusinessRejectMessage business_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_business_reject_message(business_reject_message_sent, 0)
  :: pattern == 1 -> fill_business_reject_message(business_reject_message_sent, 32)
  :: pattern == 2 -> fill_business_reject_message(business_reject_message_sent, 255)
  :: else -> ramp_business_reject_message(business_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_business_reject_message(business_reject_message_sent);
    assert(at == 59);
    at = 0;
    decode_business_reject_message(business_reject_message_got);
    assert(at == 59);
    equal_business_reject_message(business_reject_message_got, business_reject_message_sent)
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
  :: run check_execution_report_message()
  :: run check_order_cancel_reject_message()
  :: run check_order_mass_cancel_report_message()
  :: run check_business_reject_message()
  fi
}
