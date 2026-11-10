/*
 * JSE Limited Enhanced Native Trading Gateway
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
#define WIRE 1188

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 4 bytes ------------------------------------------------- */

/* Jse Native Trading Gateway Message Header */
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

/* ---- Logon Message: 60 bytes ------------------------------------------------- */

/* Allows the client to login to the server. */
typedef LogonMessage {
  byte comp_id[6];
  byte password[25];
  byte new_password[25];
  byte protocol_version[4]
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> logon_message_record.comp_id[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
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
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.protocol_version[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Message set to where it lies, so a field read out of place says so */
inline ramp_logon_message(logon_message_record, logon_message_base) {
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> logon_message_record.comp_id[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.password[logon_message_at] = (logon_message_base + 6 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.new_password[logon_message_at] = (logon_message_base + 31 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.protocol_version[logon_message_at] = (logon_message_base + 56 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message to the wire, 60 bytes from where the cursor stands */
inline encode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> wire[at] = logon_message_record.comp_id[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
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
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> wire[at] = logon_message_record.protocol_version[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message off the wire, 60 bytes from where the cursor stands */
inline decode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> logon_message_record.comp_id[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
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
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.protocol_version[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Message is what was written, byte for byte */
inline equal_logon_message(logon_message_read, logon_message_written) {
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> assert(logon_message_read.comp_id[logon_message_at] == logon_message_written.comp_id[logon_message_at]); logon_message_at = logon_message_at + 1
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
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> assert(logon_message_read.protocol_version[logon_message_at] == logon_message_written.protocol_version[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logon Response Message: 8 bytes ----------------------------------------- */

/* Used by the server to accept or reject a login request. */
typedef LogonResponseMessage {
  byte reject_code[4];
  byte password_expiry[4]
};

int logon_response_message_at;

/* every byte of Logon Response Message set to one value */
inline fill_logon_response_message(logon_response_message_record, logon_response_message_value) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.reject_code[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.password_expiry[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Response Message set to where it lies, so a field read out of place says so */
inline ramp_logon_response_message(logon_response_message_record, logon_response_message_base) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.reject_code[logon_response_message_at] = (logon_response_message_base + 0 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.password_expiry[logon_response_message_at] = (logon_response_message_base + 4 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message to the wire, 8 bytes from where the cursor stands */
inline encode_logon_response_message(logon_response_message_record) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> wire[at] = logon_response_message_record.reject_code[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> wire[at] = logon_response_message_record.password_expiry[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message off the wire, 8 bytes from where the cursor stands */
inline decode_logon_response_message(logon_response_message_record) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.reject_code[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.password_expiry[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Response Message is what was written, byte for byte */
inline equal_logon_response_message(logon_response_message_read, logon_response_message_written) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> assert(logon_response_message_read.reject_code[logon_response_message_at] == logon_response_message_written.reject_code[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> assert(logon_response_message_read.password_expiry[logon_response_message_at] == logon_response_message_written.password_expiry[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Message: 20 bytes ------------------------------------------------ */

/* Used by the client or server to terminate a session. */
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

/* ---- Reject Message: 55 bytes ------------------------------------------------ */

/* Used by the server to reject a message that does not comply with the specifications. */
typedef RejectMessage {
  byte reject_code[4];
  byte reject_reason[30];
  byte message_type;
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
  reject_message_record.message_type = reject_message_value;
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
  reject_message_record.message_type = (reject_message_base + 34 + 1) % 256;
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
  wire[at] = reject_message_record.message_type; at = at + 1;
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
  reject_message_record.message_type = wire[at]; at = at + 1;
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
  assert(reject_message_read.message_type == reject_message_written.message_type);
  reject_message_at = 0;
  do
  :: reject_message_at < 20 -> assert(reject_message_read.client_order_id[reject_message_at] == reject_message_written.client_order_id[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Missed Message Request Message: 5 bytes --------------------------------- */

/* Used by the client to recover missed messages through the Recovery Channel. */
typedef MissedMessageRequestMessage {
  byte partition_id;
  byte sequence_number[4]
};

int missed_message_request_message_at;

/* every byte of Missed Message Request Message set to one value */
inline fill_missed_message_request_message(missed_message_request_message_record, missed_message_request_message_value) {
  missed_message_request_message_record.partition_id = missed_message_request_message_value;
  missed_message_request_message_at = 0;
  do
  :: missed_message_request_message_at < 4 -> missed_message_request_message_record.sequence_number[missed_message_request_message_at] = missed_message_request_message_value; missed_message_request_message_at = missed_message_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Missed Message Request Message set to where it lies, so a field read out of place says so */
inline ramp_missed_message_request_message(missed_message_request_message_record, missed_message_request_message_base) {
  missed_message_request_message_record.partition_id = (missed_message_request_message_base + 0 + 1) % 256;
  missed_message_request_message_at = 0;
  do
  :: missed_message_request_message_at < 4 -> missed_message_request_message_record.sequence_number[missed_message_request_message_at] = (missed_message_request_message_base + 1 + missed_message_request_message_at + 1) % 256; missed_message_request_message_at = missed_message_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Missed Message Request Message to the wire, 5 bytes from where the cursor stands */
inline encode_missed_message_request_message(missed_message_request_message_record) {
  wire[at] = missed_message_request_message_record.partition_id; at = at + 1;
  missed_message_request_message_at = 0;
  do
  :: missed_message_request_message_at < 4 -> wire[at] = missed_message_request_message_record.sequence_number[missed_message_request_message_at]; at = at + 1; missed_message_request_message_at = missed_message_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Missed Message Request Message off the wire, 5 bytes from where the cursor stands */
inline decode_missed_message_request_message(missed_message_request_message_record) {
  missed_message_request_message_record.partition_id = wire[at]; at = at + 1;
  missed_message_request_message_at = 0;
  do
  :: missed_message_request_message_at < 4 -> missed_message_request_message_record.sequence_number[missed_message_request_message_at] = wire[at]; at = at + 1; missed_message_request_message_at = missed_message_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Missed Message Request Message is what was written, byte for byte */
inline equal_missed_message_request_message(missed_message_request_message_read, missed_message_request_message_written) {
  assert(missed_message_request_message_read.partition_id == missed_message_request_message_written.partition_id);
  missed_message_request_message_at = 0;
  do
  :: missed_message_request_message_at < 4 -> assert(missed_message_request_message_read.sequence_number[missed_message_request_message_at] == missed_message_request_message_written.sequence_number[missed_message_request_message_at]); missed_message_request_message_at = missed_message_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Missed Message Request Ack Message: 1 bytes ----------------------------- */

/* Used by the server to accept or reject a request for missed messages. */
typedef MissedMessageRequestAckMessage {
  byte missed_message_status
};

/* every byte of Missed Message Request Ack Message set to one value */
inline fill_missed_message_request_ack_message(missed_message_request_ack_message_record, missed_message_request_ack_message_value) {
  missed_message_request_ack_message_record.missed_message_status = missed_message_request_ack_message_value;
  skip
}

/* each byte of Missed Message Request Ack Message set to where it lies, so a field read out of place says so */
inline ramp_missed_message_request_ack_message(missed_message_request_ack_message_record, missed_message_request_ack_message_base) {
  missed_message_request_ack_message_record.missed_message_status = (missed_message_request_ack_message_base + 0 + 1) % 256;
  skip
}

/* Missed Message Request Ack Message to the wire, 1 bytes from where the cursor stands */
inline encode_missed_message_request_ack_message(missed_message_request_ack_message_record) {
  wire[at] = missed_message_request_ack_message_record.missed_message_status; at = at + 1;
  skip
}

/* Missed Message Request Ack Message off the wire, 1 bytes from where the cursor stands */
inline decode_missed_message_request_ack_message(missed_message_request_ack_message_record) {
  missed_message_request_ack_message_record.missed_message_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Missed Message Request Ack Message is what was written, byte for byte */
inline equal_missed_message_request_ack_message(missed_message_request_ack_message_read, missed_message_request_ack_message_written) {
  assert(missed_message_request_ack_message_read.missed_message_status == missed_message_request_ack_message_written.missed_message_status);
  skip
}

/* ---- Transmission Complete Message: 1 bytes ---------------------------------- */

/* Used by the server to indicate that the transmission of missed messages is complete. */
typedef TransmissionCompleteMessage {
  byte transmission_status
};

/* every byte of Transmission Complete Message set to one value */
inline fill_transmission_complete_message(transmission_complete_message_record, transmission_complete_message_value) {
  transmission_complete_message_record.transmission_status = transmission_complete_message_value;
  skip
}

/* each byte of Transmission Complete Message set to where it lies, so a field read out of place says so */
inline ramp_transmission_complete_message(transmission_complete_message_record, transmission_complete_message_base) {
  transmission_complete_message_record.transmission_status = (transmission_complete_message_base + 0 + 1) % 256;
  skip
}

/* Transmission Complete Message to the wire, 1 bytes from where the cursor stands */
inline encode_transmission_complete_message(transmission_complete_message_record) {
  wire[at] = transmission_complete_message_record.transmission_status; at = at + 1;
  skip
}

/* Transmission Complete Message off the wire, 1 bytes from where the cursor stands */
inline decode_transmission_complete_message(transmission_complete_message_record) {
  transmission_complete_message_record.transmission_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Transmission Complete Message is what was written, byte for byte */
inline equal_transmission_complete_message(transmission_complete_message_read, transmission_complete_message_written) {
  assert(transmission_complete_message_read.transmission_status == transmission_complete_message_written.transmission_status);
  skip
}

/* ---- System Status Message: 2 bytes ------------------------------------------ */

/* Disseminated in the recovery channel to indicate the status of a partition. */
typedef SystemStatusMessage {
  byte partition_id;
  byte system_status
};

/* every byte of System Status Message set to one value */
inline fill_system_status_message(system_status_message_record, system_status_message_value) {
  system_status_message_record.partition_id = system_status_message_value;
  system_status_message_record.system_status = system_status_message_value;
  skip
}

/* each byte of System Status Message set to where it lies, so a field read out of place says so */
inline ramp_system_status_message(system_status_message_record, system_status_message_base) {
  system_status_message_record.partition_id = (system_status_message_base + 0 + 1) % 256;
  system_status_message_record.system_status = (system_status_message_base + 1 + 1) % 256;
  skip
}

/* System Status Message to the wire, 2 bytes from where the cursor stands */
inline encode_system_status_message(system_status_message_record) {
  wire[at] = system_status_message_record.partition_id; at = at + 1;
  wire[at] = system_status_message_record.system_status; at = at + 1;
  skip
}

/* System Status Message off the wire, 2 bytes from where the cursor stands */
inline decode_system_status_message(system_status_message_record) {
  system_status_message_record.partition_id = wire[at]; at = at + 1;
  system_status_message_record.system_status = wire[at]; at = at + 1;
  skip
}

/* what was read of System Status Message is what was written, byte for byte */
inline equal_system_status_message(system_status_message_read, system_status_message_written) {
  assert(system_status_message_read.partition_id == system_status_message_written.partition_id);
  assert(system_status_message_read.system_status == system_status_message_written.system_status);
  skip
}

/* ---- New Order Message: 121 bytes -------------------------------------------- */

/* Allows the client to submit a new order. */
typedef NewOrderMessage {
  byte client_order_id[20];
  byte security_id[4];
  byte trader_mnemonic[17];
  byte account[10];
  byte order_type;
  byte time_in_force;
  byte expire_time[17];
  byte side;
  byte order_quantity[4];
  byte display_quantity[4];
  byte minimum_quantity[4];
  byte limit_price[8];
  byte stop_price[8];
  byte capacity;
  byte cancel_on_disconnect;
  byte order_book;
  byte anonymity;
  byte trailing_offset[8];
  byte secondary_trade_report_id[10]
};

int new_order_message_at;

/* every byte of New Order Message set to one value */
inline fill_new_order_message(new_order_message_record, new_order_message_value) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 20 -> new_order_message_record.client_order_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.security_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 17 -> new_order_message_record.trader_mnemonic[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 10 -> new_order_message_record.account[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.order_type = new_order_message_value;
  new_order_message_record.time_in_force = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 17 -> new_order_message_record.expire_time[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_quantity[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.display_quantity[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.minimum_quantity[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.limit_price[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.stop_price[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.capacity = new_order_message_value;
  new_order_message_record.cancel_on_disconnect = new_order_message_value;
  new_order_message_record.order_book = new_order_message_value;
  new_order_message_record.anonymity = new_order_message_value;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.trailing_offset[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 10 -> new_order_message_record.secondary_trade_report_id[new_order_message_at] = new_order_message_value; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_message(new_order_message_record, new_order_message_base) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 20 -> new_order_message_record.client_order_id[new_order_message_at] = (new_order_message_base + 0 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.security_id[new_order_message_at] = (new_order_message_base + 20 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 17 -> new_order_message_record.trader_mnemonic[new_order_message_at] = (new_order_message_base + 24 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 10 -> new_order_message_record.account[new_order_message_at] = (new_order_message_base + 41 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.order_type = (new_order_message_base + 51 + 1) % 256;
  new_order_message_record.time_in_force = (new_order_message_base + 52 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 17 -> new_order_message_record.expire_time[new_order_message_at] = (new_order_message_base + 53 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = (new_order_message_base + 70 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_quantity[new_order_message_at] = (new_order_message_base + 71 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.display_quantity[new_order_message_at] = (new_order_message_base + 75 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.minimum_quantity[new_order_message_at] = (new_order_message_base + 79 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.limit_price[new_order_message_at] = (new_order_message_base + 83 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.stop_price[new_order_message_at] = (new_order_message_base + 91 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.capacity = (new_order_message_base + 99 + 1) % 256;
  new_order_message_record.cancel_on_disconnect = (new_order_message_base + 100 + 1) % 256;
  new_order_message_record.order_book = (new_order_message_base + 101 + 1) % 256;
  new_order_message_record.anonymity = (new_order_message_base + 102 + 1) % 256;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.trailing_offset[new_order_message_at] = (new_order_message_base + 103 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 10 -> new_order_message_record.secondary_trade_report_id[new_order_message_at] = (new_order_message_base + 111 + new_order_message_at + 1) % 256; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Message to the wire, 121 bytes from where the cursor stands */
inline encode_new_order_message(new_order_message_record) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 20 -> wire[at] = new_order_message_record.client_order_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.security_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 17 -> wire[at] = new_order_message_record.trader_mnemonic[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 10 -> wire[at] = new_order_message_record.account[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.order_type; at = at + 1;
  wire[at] = new_order_message_record.time_in_force; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 17 -> wire[at] = new_order_message_record.expire_time[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.side; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.order_quantity[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.display_quantity[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> wire[at] = new_order_message_record.minimum_quantity[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.limit_price[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.stop_price[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_message_record.capacity; at = at + 1;
  wire[at] = new_order_message_record.cancel_on_disconnect; at = at + 1;
  wire[at] = new_order_message_record.order_book; at = at + 1;
  wire[at] = new_order_message_record.anonymity; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> wire[at] = new_order_message_record.trailing_offset[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 10 -> wire[at] = new_order_message_record.secondary_trade_report_id[new_order_message_at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Message off the wire, 121 bytes from where the cursor stands */
inline decode_new_order_message(new_order_message_record) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 20 -> new_order_message_record.client_order_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.security_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 17 -> new_order_message_record.trader_mnemonic[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 10 -> new_order_message_record.account[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.order_type = wire[at]; at = at + 1;
  new_order_message_record.time_in_force = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 17 -> new_order_message_record.expire_time[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.side = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.order_quantity[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.display_quantity[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> new_order_message_record.minimum_quantity[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.limit_price[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.stop_price[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_record.capacity = wire[at]; at = at + 1;
  new_order_message_record.cancel_on_disconnect = wire[at]; at = at + 1;
  new_order_message_record.order_book = wire[at]; at = at + 1;
  new_order_message_record.anonymity = wire[at]; at = at + 1;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> new_order_message_record.trailing_offset[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 10 -> new_order_message_record.secondary_trade_report_id[new_order_message_at] = wire[at]; at = at + 1; new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Message is what was written, byte for byte */
inline equal_new_order_message(new_order_message_read, new_order_message_written) {
  new_order_message_at = 0;
  do
  :: new_order_message_at < 20 -> assert(new_order_message_read.client_order_id[new_order_message_at] == new_order_message_written.client_order_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.security_id[new_order_message_at] == new_order_message_written.security_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 17 -> assert(new_order_message_read.trader_mnemonic[new_order_message_at] == new_order_message_written.trader_mnemonic[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 10 -> assert(new_order_message_read.account[new_order_message_at] == new_order_message_written.account[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.order_type == new_order_message_written.order_type);
  assert(new_order_message_read.time_in_force == new_order_message_written.time_in_force);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 17 -> assert(new_order_message_read.expire_time[new_order_message_at] == new_order_message_written.expire_time[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.side == new_order_message_written.side);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.order_quantity[new_order_message_at] == new_order_message_written.order_quantity[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.display_quantity[new_order_message_at] == new_order_message_written.display_quantity[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 4 -> assert(new_order_message_read.minimum_quantity[new_order_message_at] == new_order_message_written.minimum_quantity[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.limit_price[new_order_message_at] == new_order_message_written.limit_price[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.stop_price[new_order_message_at] == new_order_message_written.stop_price[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  assert(new_order_message_read.capacity == new_order_message_written.capacity);
  assert(new_order_message_read.cancel_on_disconnect == new_order_message_written.cancel_on_disconnect);
  assert(new_order_message_read.order_book == new_order_message_written.order_book);
  assert(new_order_message_read.anonymity == new_order_message_written.anonymity);
  new_order_message_at = 0;
  do
  :: new_order_message_at < 8 -> assert(new_order_message_read.trailing_offset[new_order_message_at] == new_order_message_written.trailing_offset[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  new_order_message_at = 0;
  do
  :: new_order_message_at < 10 -> assert(new_order_message_read.secondary_trade_report_id[new_order_message_at] == new_order_message_written.secondary_trade_report_id[new_order_message_at]); new_order_message_at = new_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Request Message: 85 bytes ---------------------------------- */

/* Allows the client to cancel an Open or Parked order. */
typedef OrderCancelRequestMessage {
  byte client_order_id[20];
  byte orig_client_order_id[20];
  byte order_id_alpha_12[12];
  byte security_id[4];
  byte trader_mnemonic[17];
  byte side;
  byte order_book;
  byte rfq_id[10]
};

int order_cancel_request_message_at;

/* every byte of Order Cancel Request Message set to one value */
inline fill_order_cancel_request_message(order_cancel_request_message_record, order_cancel_request_message_value) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 20 -> order_cancel_request_message_record.client_order_id[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 20 -> order_cancel_request_message_record.orig_client_order_id[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 12 -> order_cancel_request_message_record.order_id_alpha_12[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> order_cancel_request_message_record.security_id[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 17 -> order_cancel_request_message_record.trader_mnemonic[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_record.side = order_cancel_request_message_value;
  order_cancel_request_message_record.order_book = order_cancel_request_message_value;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 10 -> order_cancel_request_message_record.rfq_id[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_request_message(order_cancel_request_message_record, order_cancel_request_message_base) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 20 -> order_cancel_request_message_record.client_order_id[order_cancel_request_message_at] = (order_cancel_request_message_base + 0 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 20 -> order_cancel_request_message_record.orig_client_order_id[order_cancel_request_message_at] = (order_cancel_request_message_base + 20 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 12 -> order_cancel_request_message_record.order_id_alpha_12[order_cancel_request_message_at] = (order_cancel_request_message_base + 40 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> order_cancel_request_message_record.security_id[order_cancel_request_message_at] = (order_cancel_request_message_base + 52 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 17 -> order_cancel_request_message_record.trader_mnemonic[order_cancel_request_message_at] = (order_cancel_request_message_base + 56 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_record.side = (order_cancel_request_message_base + 73 + 1) % 256;
  order_cancel_request_message_record.order_book = (order_cancel_request_message_base + 74 + 1) % 256;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 10 -> order_cancel_request_message_record.rfq_id[order_cancel_request_message_at] = (order_cancel_request_message_base + 75 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Request Message to the wire, 85 bytes from where the cursor stands */
inline encode_order_cancel_request_message(order_cancel_request_message_record) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 20 -> wire[at] = order_cancel_request_message_record.client_order_id[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 20 -> wire[at] = order_cancel_request_message_record.orig_client_order_id[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 12 -> wire[at] = order_cancel_request_message_record.order_id_alpha_12[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> wire[at] = order_cancel_request_message_record.security_id[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 17 -> wire[at] = order_cancel_request_message_record.trader_mnemonic[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_request_message_record.side; at = at + 1;
  wire[at] = order_cancel_request_message_record.order_book; at = at + 1;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 10 -> wire[at] = order_cancel_request_message_record.rfq_id[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Request Message off the wire, 85 bytes from where the cursor stands */
inline decode_order_cancel_request_message(order_cancel_request_message_record) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 20 -> order_cancel_request_message_record.client_order_id[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 20 -> order_cancel_request_message_record.orig_client_order_id[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 12 -> order_cancel_request_message_record.order_id_alpha_12[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> order_cancel_request_message_record.security_id[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 17 -> order_cancel_request_message_record.trader_mnemonic[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_record.side = wire[at]; at = at + 1;
  order_cancel_request_message_record.order_book = wire[at]; at = at + 1;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 10 -> order_cancel_request_message_record.rfq_id[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Request Message is what was written, byte for byte */
inline equal_order_cancel_request_message(order_cancel_request_message_read, order_cancel_request_message_written) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 20 -> assert(order_cancel_request_message_read.client_order_id[order_cancel_request_message_at] == order_cancel_request_message_written.client_order_id[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 20 -> assert(order_cancel_request_message_read.orig_client_order_id[order_cancel_request_message_at] == order_cancel_request_message_written.orig_client_order_id[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 12 -> assert(order_cancel_request_message_read.order_id_alpha_12[order_cancel_request_message_at] == order_cancel_request_message_written.order_id_alpha_12[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> assert(order_cancel_request_message_read.security_id[order_cancel_request_message_at] == order_cancel_request_message_written.security_id[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 17 -> assert(order_cancel_request_message_read.trader_mnemonic[order_cancel_request_message_at] == order_cancel_request_message_written.trader_mnemonic[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_request_message_read.side == order_cancel_request_message_written.side);
  assert(order_cancel_request_message_read.order_book == order_cancel_request_message_written.order_book);
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 10 -> assert(order_cancel_request_message_read.rfq_id[order_cancel_request_message_at] == order_cancel_request_message_written.rfq_id[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Mass Cancel Request Message: 33 bytes ----------------------------- */

/* Allows the client to mass cancel orders. */
typedef OrderMassCancelRequestMessage {
  byte client_order_id[20];
  byte mass_cancel_request_type;
  byte security_id[4];
  byte segment[6];
  byte order_sub_type;
  byte order_book
};

int order_mass_cancel_request_message_at;

/* every byte of Order Mass Cancel Request Message set to one value */
inline fill_order_mass_cancel_request_message(order_mass_cancel_request_message_record, order_mass_cancel_request_message_value) {
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 20 -> order_mass_cancel_request_message_record.client_order_id[order_mass_cancel_request_message_at] = order_mass_cancel_request_message_value; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.mass_cancel_request_type = order_mass_cancel_request_message_value;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> order_mass_cancel_request_message_record.security_id[order_mass_cancel_request_message_at] = order_mass_cancel_request_message_value; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 6 -> order_mass_cancel_request_message_record.segment[order_mass_cancel_request_message_at] = order_mass_cancel_request_message_value; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.order_sub_type = order_mass_cancel_request_message_value;
  order_mass_cancel_request_message_record.order_book = order_mass_cancel_request_message_value;
  skip
}

/* each byte of Order Mass Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_order_mass_cancel_request_message(order_mass_cancel_request_message_record, order_mass_cancel_request_message_base) {
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 20 -> order_mass_cancel_request_message_record.client_order_id[order_mass_cancel_request_message_at] = (order_mass_cancel_request_message_base + 0 + order_mass_cancel_request_message_at + 1) % 256; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.mass_cancel_request_type = (order_mass_cancel_request_message_base + 20 + 1) % 256;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> order_mass_cancel_request_message_record.security_id[order_mass_cancel_request_message_at] = (order_mass_cancel_request_message_base + 21 + order_mass_cancel_request_message_at + 1) % 256; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 6 -> order_mass_cancel_request_message_record.segment[order_mass_cancel_request_message_at] = (order_mass_cancel_request_message_base + 25 + order_mass_cancel_request_message_at + 1) % 256; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.order_sub_type = (order_mass_cancel_request_message_base + 31 + 1) % 256;
  order_mass_cancel_request_message_record.order_book = (order_mass_cancel_request_message_base + 32 + 1) % 256;
  skip
}

/* Order Mass Cancel Request Message to the wire, 33 bytes from where the cursor stands */
inline encode_order_mass_cancel_request_message(order_mass_cancel_request_message_record) {
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 20 -> wire[at] = order_mass_cancel_request_message_record.client_order_id[order_mass_cancel_request_message_at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_cancel_request_message_record.mass_cancel_request_type; at = at + 1;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> wire[at] = order_mass_cancel_request_message_record.security_id[order_mass_cancel_request_message_at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 6 -> wire[at] = order_mass_cancel_request_message_record.segment[order_mass_cancel_request_message_at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_cancel_request_message_record.order_sub_type; at = at + 1;
  wire[at] = order_mass_cancel_request_message_record.order_book; at = at + 1;
  skip
}

/* Order Mass Cancel Request Message off the wire, 33 bytes from where the cursor stands */
inline decode_order_mass_cancel_request_message(order_mass_cancel_request_message_record) {
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 20 -> order_mass_cancel_request_message_record.client_order_id[order_mass_cancel_request_message_at] = wire[at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.mass_cancel_request_type = wire[at]; at = at + 1;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> order_mass_cancel_request_message_record.security_id[order_mass_cancel_request_message_at] = wire[at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 6 -> order_mass_cancel_request_message_record.segment[order_mass_cancel_request_message_at] = wire[at]; at = at + 1; order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_record.order_sub_type = wire[at]; at = at + 1;
  order_mass_cancel_request_message_record.order_book = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Mass Cancel Request Message is what was written, byte for byte */
inline equal_order_mass_cancel_request_message(order_mass_cancel_request_message_read, order_mass_cancel_request_message_written) {
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 20 -> assert(order_mass_cancel_request_message_read.client_order_id[order_mass_cancel_request_message_at] == order_mass_cancel_request_message_written.client_order_id[order_mass_cancel_request_message_at]); order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  assert(order_mass_cancel_request_message_read.mass_cancel_request_type == order_mass_cancel_request_message_written.mass_cancel_request_type);
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 4 -> assert(order_mass_cancel_request_message_read.security_id[order_mass_cancel_request_message_at] == order_mass_cancel_request_message_written.security_id[order_mass_cancel_request_message_at]); order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_request_message_at = 0;
  do
  :: order_mass_cancel_request_message_at < 6 -> assert(order_mass_cancel_request_message_read.segment[order_mass_cancel_request_message_at] == order_mass_cancel_request_message_written.segment[order_mass_cancel_request_message_at]); order_mass_cancel_request_message_at = order_mass_cancel_request_message_at + 1
  :: else -> break
  od;
  assert(order_mass_cancel_request_message_read.order_sub_type == order_mass_cancel_request_message_written.order_sub_type);
  assert(order_mass_cancel_request_message_read.order_book == order_mass_cancel_request_message_written.order_book);
  skip
}

/* ---- Order Cancel Replace Request Message: 142 bytes ------------------------- */

/* Allows the client to modify an Open or Parked order. */
typedef OrderCancelReplaceRequestMessage {
  byte client_order_id[20];
  byte original_client_order_id[20];
  byte order_id_string_12[12];
  byte security_id[4];
  byte trader_mnemonic[17];
  byte account[10];
  byte order_type;
  byte time_in_force;
  byte expire_time[17];
  byte side;
  byte order_quantity[4];
  byte display_quantity[4];
  byte minimum_quantity[4];
  byte limit_price[8];
  byte stop_price[8];
  byte order_book;
  byte secondary_trade_report_id[10]
};

int order_cancel_replace_request_message_at;

/* every byte of Order Cancel Replace Request Message set to one value */
inline fill_order_cancel_replace_request_message(order_cancel_replace_request_message_record, order_cancel_replace_request_message_value) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 20 -> order_cancel_replace_request_message_record.client_order_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 20 -> order_cancel_replace_request_message_record.original_client_order_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 12 -> order_cancel_replace_request_message_record.order_id_string_12[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.security_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 17 -> order_cancel_replace_request_message_record.trader_mnemonic[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 10 -> order_cancel_replace_request_message_record.account[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.order_type = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_record.time_in_force = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 17 -> order_cancel_replace_request_message_record.expire_time[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.side = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.order_quantity[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.display_quantity[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.minimum_quantity[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.limit_price[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.stop_price[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.order_book = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 10 -> order_cancel_replace_request_message_record.secondary_trade_report_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Replace Request Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_replace_request_message(order_cancel_replace_request_message_record, order_cancel_replace_request_message_base) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 20 -> order_cancel_replace_request_message_record.client_order_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 0 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 20 -> order_cancel_replace_request_message_record.original_client_order_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 20 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 12 -> order_cancel_replace_request_message_record.order_id_string_12[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 40 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.security_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 52 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 17 -> order_cancel_replace_request_message_record.trader_mnemonic[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 56 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 10 -> order_cancel_replace_request_message_record.account[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 73 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.order_type = (order_cancel_replace_request_message_base + 83 + 1) % 256;
  order_cancel_replace_request_message_record.time_in_force = (order_cancel_replace_request_message_base + 84 + 1) % 256;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 17 -> order_cancel_replace_request_message_record.expire_time[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 85 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.side = (order_cancel_replace_request_message_base + 102 + 1) % 256;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.order_quantity[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 103 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.display_quantity[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 107 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.minimum_quantity[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 111 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.limit_price[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 115 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.stop_price[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 123 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.order_book = (order_cancel_replace_request_message_base + 131 + 1) % 256;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 10 -> order_cancel_replace_request_message_record.secondary_trade_report_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 132 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Replace Request Message to the wire, 142 bytes from where the cursor stands */
inline encode_order_cancel_replace_request_message(order_cancel_replace_request_message_record) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 20 -> wire[at] = order_cancel_replace_request_message_record.client_order_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 20 -> wire[at] = order_cancel_replace_request_message_record.original_client_order_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 12 -> wire[at] = order_cancel_replace_request_message_record.order_id_string_12[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.security_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 17 -> wire[at] = order_cancel_replace_request_message_record.trader_mnemonic[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 10 -> wire[at] = order_cancel_replace_request_message_record.account[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_replace_request_message_record.order_type; at = at + 1;
  wire[at] = order_cancel_replace_request_message_record.time_in_force; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 17 -> wire[at] = order_cancel_replace_request_message_record.expire_time[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_replace_request_message_record.side; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.order_quantity[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.display_quantity[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.minimum_quantity[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> wire[at] = order_cancel_replace_request_message_record.limit_price[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> wire[at] = order_cancel_replace_request_message_record.stop_price[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_replace_request_message_record.order_book; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 10 -> wire[at] = order_cancel_replace_request_message_record.secondary_trade_report_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Replace Request Message off the wire, 142 bytes from where the cursor stands */
inline decode_order_cancel_replace_request_message(order_cancel_replace_request_message_record) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 20 -> order_cancel_replace_request_message_record.client_order_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 20 -> order_cancel_replace_request_message_record.original_client_order_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 12 -> order_cancel_replace_request_message_record.order_id_string_12[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.security_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 17 -> order_cancel_replace_request_message_record.trader_mnemonic[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 10 -> order_cancel_replace_request_message_record.account[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.order_type = wire[at]; at = at + 1;
  order_cancel_replace_request_message_record.time_in_force = wire[at]; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 17 -> order_cancel_replace_request_message_record.expire_time[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.side = wire[at]; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.order_quantity[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.display_quantity[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.minimum_quantity[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.limit_price[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.stop_price[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.order_book = wire[at]; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 10 -> order_cancel_replace_request_message_record.secondary_trade_report_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Replace Request Message is what was written, byte for byte */
inline equal_order_cancel_replace_request_message(order_cancel_replace_request_message_read, order_cancel_replace_request_message_written) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 20 -> assert(order_cancel_replace_request_message_read.client_order_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.client_order_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 20 -> assert(order_cancel_replace_request_message_read.original_client_order_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.original_client_order_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 12 -> assert(order_cancel_replace_request_message_read.order_id_string_12[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.order_id_string_12[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.security_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.security_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 17 -> assert(order_cancel_replace_request_message_read.trader_mnemonic[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.trader_mnemonic[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 10 -> assert(order_cancel_replace_request_message_read.account[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.account[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_replace_request_message_read.order_type == order_cancel_replace_request_message_written.order_type);
  assert(order_cancel_replace_request_message_read.time_in_force == order_cancel_replace_request_message_written.time_in_force);
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 17 -> assert(order_cancel_replace_request_message_read.expire_time[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.expire_time[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_replace_request_message_read.side == order_cancel_replace_request_message_written.side);
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.order_quantity[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.order_quantity[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.display_quantity[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.display_quantity[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.minimum_quantity[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.minimum_quantity[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> assert(order_cancel_replace_request_message_read.limit_price[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.limit_price[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> assert(order_cancel_replace_request_message_read.stop_price[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.stop_price[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_replace_request_message_read.order_book == order_cancel_replace_request_message_written.order_book);
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 10 -> assert(order_cancel_replace_request_message_read.secondary_trade_report_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.secondary_trade_report_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Definition Request Message: 77 bytes --------------------------- */

/* Allows the client to request an instrument creation intra-day. */
typedef SecurityDefinitionRequestMessage {
  byte security_request_id[10];
  byte security_type;
  byte strike_price[8];
  byte maturity_date[8];
  byte reference_instrument_identifier;
  byte reference_instrument[25];
  byte reference_price[8];
  byte near_month_type[4];
  byte far_month_type[4];
  byte far_maturity_date[8]
};

int security_definition_request_message_at;

/* every byte of Security Definition Request Message set to one value */
inline fill_security_definition_request_message(security_definition_request_message_record, security_definition_request_message_value) {
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 10 -> security_definition_request_message_record.security_request_id[security_definition_request_message_at] = security_definition_request_message_value; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_record.security_type = security_definition_request_message_value;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.strike_price[security_definition_request_message_at] = security_definition_request_message_value; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.maturity_date[security_definition_request_message_at] = security_definition_request_message_value; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_record.reference_instrument_identifier = security_definition_request_message_value;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 25 -> security_definition_request_message_record.reference_instrument[security_definition_request_message_at] = security_definition_request_message_value; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.reference_price[security_definition_request_message_at] = security_definition_request_message_value; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.near_month_type[security_definition_request_message_at] = security_definition_request_message_value; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.far_month_type[security_definition_request_message_at] = security_definition_request_message_value; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.far_maturity_date[security_definition_request_message_at] = security_definition_request_message_value; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Definition Request Message set to where it lies, so a field read out of place says so */
inline ramp_security_definition_request_message(security_definition_request_message_record, security_definition_request_message_base) {
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 10 -> security_definition_request_message_record.security_request_id[security_definition_request_message_at] = (security_definition_request_message_base + 0 + security_definition_request_message_at + 1) % 256; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_record.security_type = (security_definition_request_message_base + 10 + 1) % 256;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.strike_price[security_definition_request_message_at] = (security_definition_request_message_base + 11 + security_definition_request_message_at + 1) % 256; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.maturity_date[security_definition_request_message_at] = (security_definition_request_message_base + 19 + security_definition_request_message_at + 1) % 256; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_record.reference_instrument_identifier = (security_definition_request_message_base + 27 + 1) % 256;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 25 -> security_definition_request_message_record.reference_instrument[security_definition_request_message_at] = (security_definition_request_message_base + 28 + security_definition_request_message_at + 1) % 256; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.reference_price[security_definition_request_message_at] = (security_definition_request_message_base + 53 + security_definition_request_message_at + 1) % 256; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.near_month_type[security_definition_request_message_at] = (security_definition_request_message_base + 61 + security_definition_request_message_at + 1) % 256; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.far_month_type[security_definition_request_message_at] = (security_definition_request_message_base + 65 + security_definition_request_message_at + 1) % 256; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.far_maturity_date[security_definition_request_message_at] = (security_definition_request_message_base + 69 + security_definition_request_message_at + 1) % 256; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Request Message to the wire, 77 bytes from where the cursor stands */
inline encode_security_definition_request_message(security_definition_request_message_record) {
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 10 -> wire[at] = security_definition_request_message_record.security_request_id[security_definition_request_message_at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_request_message_record.security_type; at = at + 1;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> wire[at] = security_definition_request_message_record.strike_price[security_definition_request_message_at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> wire[at] = security_definition_request_message_record.maturity_date[security_definition_request_message_at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_request_message_record.reference_instrument_identifier; at = at + 1;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 25 -> wire[at] = security_definition_request_message_record.reference_instrument[security_definition_request_message_at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> wire[at] = security_definition_request_message_record.reference_price[security_definition_request_message_at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> wire[at] = security_definition_request_message_record.near_month_type[security_definition_request_message_at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> wire[at] = security_definition_request_message_record.far_month_type[security_definition_request_message_at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> wire[at] = security_definition_request_message_record.far_maturity_date[security_definition_request_message_at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Definition Request Message off the wire, 77 bytes from where the cursor stands */
inline decode_security_definition_request_message(security_definition_request_message_record) {
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 10 -> security_definition_request_message_record.security_request_id[security_definition_request_message_at] = wire[at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_record.security_type = wire[at]; at = at + 1;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.strike_price[security_definition_request_message_at] = wire[at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.maturity_date[security_definition_request_message_at] = wire[at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_record.reference_instrument_identifier = wire[at]; at = at + 1;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 25 -> security_definition_request_message_record.reference_instrument[security_definition_request_message_at] = wire[at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.reference_price[security_definition_request_message_at] = wire[at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.near_month_type[security_definition_request_message_at] = wire[at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> security_definition_request_message_record.far_month_type[security_definition_request_message_at] = wire[at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> security_definition_request_message_record.far_maturity_date[security_definition_request_message_at] = wire[at]; at = at + 1; security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Definition Request Message is what was written, byte for byte */
inline equal_security_definition_request_message(security_definition_request_message_read, security_definition_request_message_written) {
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 10 -> assert(security_definition_request_message_read.security_request_id[security_definition_request_message_at] == security_definition_request_message_written.security_request_id[security_definition_request_message_at]); security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  assert(security_definition_request_message_read.security_type == security_definition_request_message_written.security_type);
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> assert(security_definition_request_message_read.strike_price[security_definition_request_message_at] == security_definition_request_message_written.strike_price[security_definition_request_message_at]); security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> assert(security_definition_request_message_read.maturity_date[security_definition_request_message_at] == security_definition_request_message_written.maturity_date[security_definition_request_message_at]); security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  assert(security_definition_request_message_read.reference_instrument_identifier == security_definition_request_message_written.reference_instrument_identifier);
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 25 -> assert(security_definition_request_message_read.reference_instrument[security_definition_request_message_at] == security_definition_request_message_written.reference_instrument[security_definition_request_message_at]); security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> assert(security_definition_request_message_read.reference_price[security_definition_request_message_at] == security_definition_request_message_written.reference_price[security_definition_request_message_at]); security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> assert(security_definition_request_message_read.near_month_type[security_definition_request_message_at] == security_definition_request_message_written.near_month_type[security_definition_request_message_at]); security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 4 -> assert(security_definition_request_message_read.far_month_type[security_definition_request_message_at] == security_definition_request_message_written.far_month_type[security_definition_request_message_at]); security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  security_definition_request_message_at = 0;
  do
  :: security_definition_request_message_at < 8 -> assert(security_definition_request_message_read.far_maturity_date[security_definition_request_message_at] == security_definition_request_message_written.far_maturity_date[security_definition_request_message_at]); security_definition_request_message_at = security_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Transact Time: 8 bytes -------------------------------------------------- */

/* Time the Execution Report was generated */
typedef TransactTime {
  byte transact_time_seconds[4];
  byte transact_time_nanoseconds[4]
};

int transact_time_at;

/* every byte of Transact Time set to one value */
inline fill_transact_time(transact_time_record, transact_time_value) {
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.transact_time_seconds[transact_time_at] = transact_time_value; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.transact_time_nanoseconds[transact_time_at] = transact_time_value; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Transact Time set to where it lies, so a field read out of place says so */
inline ramp_transact_time(transact_time_record, transact_time_base) {
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.transact_time_seconds[transact_time_at] = (transact_time_base + 0 + transact_time_at + 1) % 256; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.transact_time_nanoseconds[transact_time_at] = (transact_time_base + 4 + transact_time_at + 1) % 256; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  skip
}

/* Transact Time to the wire, 8 bytes from where the cursor stands */
inline encode_transact_time(transact_time_record) {
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> wire[at] = transact_time_record.transact_time_seconds[transact_time_at]; at = at + 1; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> wire[at] = transact_time_record.transact_time_nanoseconds[transact_time_at]; at = at + 1; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  skip
}

/* Transact Time off the wire, 8 bytes from where the cursor stands */
inline decode_transact_time(transact_time_record) {
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.transact_time_seconds[transact_time_at] = wire[at]; at = at + 1; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> transact_time_record.transact_time_nanoseconds[transact_time_at] = wire[at]; at = at + 1; transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Transact Time is what was written, byte for byte */
inline equal_transact_time(transact_time_read, transact_time_written) {
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> assert(transact_time_read.transact_time_seconds[transact_time_at] == transact_time_written.transact_time_seconds[transact_time_at]); transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  transact_time_at = 0;
  do
  :: transact_time_at < 4 -> assert(transact_time_read.transact_time_nanoseconds[transact_time_at] == transact_time_written.transact_time_nanoseconds[transact_time_at]); transact_time_at = transact_time_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Reject Message: 60 bytes ----------------------------------- */

/* Indicates that an order cancel or cancel replace request has been rejected. */
typedef OrderCancelRejectMessage {
  byte partition_id;
  byte sequence_number[4];
  byte client_order_id[20];
  byte order_id_alpha_12[12];
  TransactTime transact_time;
  byte reject_code[4];
  byte order_book;
  byte rfq_id[10]
};

int order_cancel_reject_message_at;

/* every byte of Order Cancel Reject Message set to one value */
inline fill_order_cancel_reject_message(order_cancel_reject_message_record, order_cancel_reject_message_value) {
  order_cancel_reject_message_record.partition_id = order_cancel_reject_message_value;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.sequence_number[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 20 -> order_cancel_reject_message_record.client_order_id[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 12 -> order_cancel_reject_message_record.order_id_alpha_12[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  fill_transact_time(order_cancel_reject_message_record.transact_time, order_cancel_reject_message_value);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.reject_code[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_record.order_book = order_cancel_reject_message_value;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 10 -> order_cancel_reject_message_record.rfq_id[order_cancel_reject_message_at] = order_cancel_reject_message_value; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Reject Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_reject_message(order_cancel_reject_message_record, order_cancel_reject_message_base) {
  order_cancel_reject_message_record.partition_id = (order_cancel_reject_message_base + 0 + 1) % 256;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.sequence_number[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 1 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 20 -> order_cancel_reject_message_record.client_order_id[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 5 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 12 -> order_cancel_reject_message_record.order_id_alpha_12[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 25 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  ramp_transact_time(order_cancel_reject_message_record.transact_time, order_cancel_reject_message_base + 37);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.reject_code[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 45 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_record.order_book = (order_cancel_reject_message_base + 49 + 1) % 256;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 10 -> order_cancel_reject_message_record.rfq_id[order_cancel_reject_message_at] = (order_cancel_reject_message_base + 50 + order_cancel_reject_message_at + 1) % 256; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Reject Message to the wire, 60 bytes from where the cursor stands */
inline encode_order_cancel_reject_message(order_cancel_reject_message_record) {
  wire[at] = order_cancel_reject_message_record.partition_id; at = at + 1;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> wire[at] = order_cancel_reject_message_record.sequence_number[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 20 -> wire[at] = order_cancel_reject_message_record.client_order_id[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 12 -> wire[at] = order_cancel_reject_message_record.order_id_alpha_12[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  encode_transact_time(order_cancel_reject_message_record.transact_time);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> wire[at] = order_cancel_reject_message_record.reject_code[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_reject_message_record.order_book; at = at + 1;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 10 -> wire[at] = order_cancel_reject_message_record.rfq_id[order_cancel_reject_message_at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Reject Message off the wire, 60 bytes from where the cursor stands */
inline decode_order_cancel_reject_message(order_cancel_reject_message_record) {
  order_cancel_reject_message_record.partition_id = wire[at]; at = at + 1;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.sequence_number[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 20 -> order_cancel_reject_message_record.client_order_id[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 12 -> order_cancel_reject_message_record.order_id_alpha_12[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  decode_transact_time(order_cancel_reject_message_record.transact_time);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> order_cancel_reject_message_record.reject_code[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_record.order_book = wire[at]; at = at + 1;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 10 -> order_cancel_reject_message_record.rfq_id[order_cancel_reject_message_at] = wire[at]; at = at + 1; order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Reject Message is what was written, byte for byte */
inline equal_order_cancel_reject_message(order_cancel_reject_message_read, order_cancel_reject_message_written) {
  assert(order_cancel_reject_message_read.partition_id == order_cancel_reject_message_written.partition_id);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> assert(order_cancel_reject_message_read.sequence_number[order_cancel_reject_message_at] == order_cancel_reject_message_written.sequence_number[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 20 -> assert(order_cancel_reject_message_read.client_order_id[order_cancel_reject_message_at] == order_cancel_reject_message_written.client_order_id[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 12 -> assert(order_cancel_reject_message_read.order_id_alpha_12[order_cancel_reject_message_at] == order_cancel_reject_message_written.order_id_alpha_12[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  equal_transact_time(order_cancel_reject_message_read.transact_time, order_cancel_reject_message_written.transact_time);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 4 -> assert(order_cancel_reject_message_read.reject_code[order_cancel_reject_message_at] == order_cancel_reject_message_written.reject_code[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_reject_message_read.order_book == order_cancel_reject_message_written.order_book);
  order_cancel_reject_message_at = 0;
  do
  :: order_cancel_reject_message_at < 10 -> assert(order_cancel_reject_message_read.rfq_id[order_cancel_reject_message_at] == order_cancel_reject_message_written.rfq_id[order_cancel_reject_message_at]); order_cancel_reject_message_at = order_cancel_reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Mass Cancel Report Message: 39 bytes ------------------------------ */

/* Indicates the outcome of an order mass cancel request. */
typedef OrderMassCancelReportMessage {
  byte partition_id;
  byte sequence_number[4];
  byte client_order_id[20];
  byte mass_cancel_status;
  byte reject_code[4];
  TransactTime transact_time;
  byte order_book
};

int order_mass_cancel_report_message_at;

/* every byte of Order Mass Cancel Report Message set to one value */
inline fill_order_mass_cancel_report_message(order_mass_cancel_report_message_record, order_mass_cancel_report_message_value) {
  order_mass_cancel_report_message_record.partition_id = order_mass_cancel_report_message_value;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.sequence_number[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> order_mass_cancel_report_message_record.client_order_id[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_record.mass_cancel_status = order_mass_cancel_report_message_value;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.reject_code[order_mass_cancel_report_message_at] = order_mass_cancel_report_message_value; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  fill_transact_time(order_mass_cancel_report_message_record.transact_time, order_mass_cancel_report_message_value);
  order_mass_cancel_report_message_record.order_book = order_mass_cancel_report_message_value;
  skip
}

/* each byte of Order Mass Cancel Report Message set to where it lies, so a field read out of place says so */
inline ramp_order_mass_cancel_report_message(order_mass_cancel_report_message_record, order_mass_cancel_report_message_base) {
  order_mass_cancel_report_message_record.partition_id = (order_mass_cancel_report_message_base + 0 + 1) % 256;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.sequence_number[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 1 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> order_mass_cancel_report_message_record.client_order_id[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 5 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_record.mass_cancel_status = (order_mass_cancel_report_message_base + 25 + 1) % 256;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.reject_code[order_mass_cancel_report_message_at] = (order_mass_cancel_report_message_base + 26 + order_mass_cancel_report_message_at + 1) % 256; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  ramp_transact_time(order_mass_cancel_report_message_record.transact_time, order_mass_cancel_report_message_base + 30);
  order_mass_cancel_report_message_record.order_book = (order_mass_cancel_report_message_base + 38 + 1) % 256;
  skip
}

/* Order Mass Cancel Report Message to the wire, 39 bytes from where the cursor stands */
inline encode_order_mass_cancel_report_message(order_mass_cancel_report_message_record) {
  wire[at] = order_mass_cancel_report_message_record.partition_id; at = at + 1;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> wire[at] = order_mass_cancel_report_message_record.sequence_number[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> wire[at] = order_mass_cancel_report_message_record.client_order_id[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  wire[at] = order_mass_cancel_report_message_record.mass_cancel_status; at = at + 1;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> wire[at] = order_mass_cancel_report_message_record.reject_code[order_mass_cancel_report_message_at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  encode_transact_time(order_mass_cancel_report_message_record.transact_time);
  wire[at] = order_mass_cancel_report_message_record.order_book; at = at + 1;
  skip
}

/* Order Mass Cancel Report Message off the wire, 39 bytes from where the cursor stands */
inline decode_order_mass_cancel_report_message(order_mass_cancel_report_message_record) {
  order_mass_cancel_report_message_record.partition_id = wire[at]; at = at + 1;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.sequence_number[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> order_mass_cancel_report_message_record.client_order_id[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_record.mass_cancel_status = wire[at]; at = at + 1;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> order_mass_cancel_report_message_record.reject_code[order_mass_cancel_report_message_at] = wire[at]; at = at + 1; order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  decode_transact_time(order_mass_cancel_report_message_record.transact_time);
  order_mass_cancel_report_message_record.order_book = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Mass Cancel Report Message is what was written, byte for byte */
inline equal_order_mass_cancel_report_message(order_mass_cancel_report_message_read, order_mass_cancel_report_message_written) {
  assert(order_mass_cancel_report_message_read.partition_id == order_mass_cancel_report_message_written.partition_id);
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> assert(order_mass_cancel_report_message_read.sequence_number[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.sequence_number[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 20 -> assert(order_mass_cancel_report_message_read.client_order_id[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.client_order_id[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  assert(order_mass_cancel_report_message_read.mass_cancel_status == order_mass_cancel_report_message_written.mass_cancel_status);
  order_mass_cancel_report_message_at = 0;
  do
  :: order_mass_cancel_report_message_at < 4 -> assert(order_mass_cancel_report_message_read.reject_code[order_mass_cancel_report_message_at] == order_mass_cancel_report_message_written.reject_code[order_mass_cancel_report_message_at]); order_mass_cancel_report_message_at = order_mass_cancel_report_message_at + 1
  :: else -> break
  od;
  equal_transact_time(order_mass_cancel_report_message_read.transact_time, order_mass_cancel_report_message_written.transact_time);
  assert(order_mass_cancel_report_message_read.order_book == order_mass_cancel_report_message_written.order_book);
  skip
}

/* ---- Security Definition Response Message: 20 bytes -------------------------- */

/* Indicates that a Security Definition Request has been accepted or rejected. */
typedef SecurityDefinitionResponseMessage {
  byte security_request_id[10];
  byte security_response_type;
  byte reject_code[4];
  byte security_id[4];
  byte security_type
};

int security_definition_response_message_at;

/* every byte of Security Definition Response Message set to one value */
inline fill_security_definition_response_message(security_definition_response_message_record, security_definition_response_message_value) {
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 10 -> security_definition_response_message_record.security_request_id[security_definition_response_message_at] = security_definition_response_message_value; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_record.security_response_type = security_definition_response_message_value;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 4 -> security_definition_response_message_record.reject_code[security_definition_response_message_at] = security_definition_response_message_value; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 4 -> security_definition_response_message_record.security_id[security_definition_response_message_at] = security_definition_response_message_value; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_record.security_type = security_definition_response_message_value;
  skip
}

/* each byte of Security Definition Response Message set to where it lies, so a field read out of place says so */
inline ramp_security_definition_response_message(security_definition_response_message_record, security_definition_response_message_base) {
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 10 -> security_definition_response_message_record.security_request_id[security_definition_response_message_at] = (security_definition_response_message_base + 0 + security_definition_response_message_at + 1) % 256; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_record.security_response_type = (security_definition_response_message_base + 10 + 1) % 256;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 4 -> security_definition_response_message_record.reject_code[security_definition_response_message_at] = (security_definition_response_message_base + 11 + security_definition_response_message_at + 1) % 256; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 4 -> security_definition_response_message_record.security_id[security_definition_response_message_at] = (security_definition_response_message_base + 15 + security_definition_response_message_at + 1) % 256; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_record.security_type = (security_definition_response_message_base + 19 + 1) % 256;
  skip
}

/* Security Definition Response Message to the wire, 20 bytes from where the cursor stands */
inline encode_security_definition_response_message(security_definition_response_message_record) {
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 10 -> wire[at] = security_definition_response_message_record.security_request_id[security_definition_response_message_at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_response_message_record.security_response_type; at = at + 1;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 4 -> wire[at] = security_definition_response_message_record.reject_code[security_definition_response_message_at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 4 -> wire[at] = security_definition_response_message_record.security_id[security_definition_response_message_at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  wire[at] = security_definition_response_message_record.security_type; at = at + 1;
  skip
}

/* Security Definition Response Message off the wire, 20 bytes from where the cursor stands */
inline decode_security_definition_response_message(security_definition_response_message_record) {
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 10 -> security_definition_response_message_record.security_request_id[security_definition_response_message_at] = wire[at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_record.security_response_type = wire[at]; at = at + 1;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 4 -> security_definition_response_message_record.reject_code[security_definition_response_message_at] = wire[at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 4 -> security_definition_response_message_record.security_id[security_definition_response_message_at] = wire[at]; at = at + 1; security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_record.security_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Security Definition Response Message is what was written, byte for byte */
inline equal_security_definition_response_message(security_definition_response_message_read, security_definition_response_message_written) {
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 10 -> assert(security_definition_response_message_read.security_request_id[security_definition_response_message_at] == security_definition_response_message_written.security_request_id[security_definition_response_message_at]); security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  assert(security_definition_response_message_read.security_response_type == security_definition_response_message_written.security_response_type);
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 4 -> assert(security_definition_response_message_read.reject_code[security_definition_response_message_at] == security_definition_response_message_written.reject_code[security_definition_response_message_at]); security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  security_definition_response_message_at = 0;
  do
  :: security_definition_response_message_at < 4 -> assert(security_definition_response_message_read.security_id[security_definition_response_message_at] == security_definition_response_message_written.security_id[security_definition_response_message_at]); security_definition_response_message_at = security_definition_response_message_at + 1
  :: else -> break
  od;
  assert(security_definition_response_message_read.security_type == security_definition_response_message_written.security_type);
  skip
}

/* ---- News Message: 1188 bytes ------------------------------------------------ */

/* Carries a market operations announcement. */
typedef NewsMessage {
  byte partition_id;
  byte sequence_number[4];
  byte orig_time[24];
  byte urgency;
  byte headline[100];
  byte text[750];
  byte instruments[100];
  byte underlyings[100];
  byte firm_list[54];
  byte user_list[54]
};

int news_message_at;

/* every byte of News Message set to one value */
inline fill_news_message(news_message_record, news_message_value) {
  news_message_record.partition_id = news_message_value;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.sequence_number[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 24 -> news_message_record.orig_time[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_record.urgency = news_message_value;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.headline[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 750 -> news_message_record.text[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.instruments[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.underlyings[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 54 -> news_message_record.firm_list[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 54 -> news_message_record.user_list[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of News Message set to where it lies, so a field read out of place says so */
inline ramp_news_message(news_message_record, news_message_base) {
  news_message_record.partition_id = (news_message_base + 0 + 1) % 256;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.sequence_number[news_message_at] = (news_message_base + 1 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 24 -> news_message_record.orig_time[news_message_at] = (news_message_base + 5 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_record.urgency = (news_message_base + 29 + 1) % 256;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.headline[news_message_at] = (news_message_base + 30 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 750 -> news_message_record.text[news_message_at] = (news_message_base + 130 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.instruments[news_message_at] = (news_message_base + 880 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.underlyings[news_message_at] = (news_message_base + 980 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 54 -> news_message_record.firm_list[news_message_at] = (news_message_base + 1080 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 54 -> news_message_record.user_list[news_message_at] = (news_message_base + 1134 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* News Message to the wire, 1188 bytes from where the cursor stands */
inline encode_news_message(news_message_record) {
  wire[at] = news_message_record.partition_id; at = at + 1;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> wire[at] = news_message_record.sequence_number[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 24 -> wire[at] = news_message_record.orig_time[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  wire[at] = news_message_record.urgency; at = at + 1;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> wire[at] = news_message_record.headline[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 750 -> wire[at] = news_message_record.text[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> wire[at] = news_message_record.instruments[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> wire[at] = news_message_record.underlyings[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 54 -> wire[at] = news_message_record.firm_list[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 54 -> wire[at] = news_message_record.user_list[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* News Message off the wire, 1188 bytes from where the cursor stands */
inline decode_news_message(news_message_record) {
  news_message_record.partition_id = wire[at]; at = at + 1;
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.sequence_number[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 24 -> news_message_record.orig_time[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_record.urgency = wire[at]; at = at + 1;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.headline[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 750 -> news_message_record.text[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.instruments[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> news_message_record.underlyings[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 54 -> news_message_record.firm_list[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 54 -> news_message_record.user_list[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of News Message is what was written, byte for byte */
inline equal_news_message(news_message_read, news_message_written) {
  assert(news_message_read.partition_id == news_message_written.partition_id);
  news_message_at = 0;
  do
  :: news_message_at < 4 -> assert(news_message_read.sequence_number[news_message_at] == news_message_written.sequence_number[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 24 -> assert(news_message_read.orig_time[news_message_at] == news_message_written.orig_time[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  assert(news_message_read.urgency == news_message_written.urgency);
  news_message_at = 0;
  do
  :: news_message_at < 100 -> assert(news_message_read.headline[news_message_at] == news_message_written.headline[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 750 -> assert(news_message_read.text[news_message_at] == news_message_written.text[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> assert(news_message_read.instruments[news_message_at] == news_message_written.instruments[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 100 -> assert(news_message_read.underlyings[news_message_at] == news_message_written.underlyings[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 54 -> assert(news_message_read.firm_list[news_message_at] == news_message_written.firm_list[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 54 -> assert(news_message_read.user_list[news_message_at] == news_message_written.user_list[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Business Reject Message: 49 bytes --------------------------------------- */

/* Indicates that an application message could not be processed. */
typedef BusinessRejectMessage {
  byte partition_id;
  byte sequence_number[4];
  byte reject_code[4];
  byte client_order_id[20];
  byte order_id_alpha_12[12];
  TransactTime transact_time
};

int business_reject_message_at;

/* every byte of Business Reject Message set to one value */
inline fill_business_reject_message(business_reject_message_record, business_reject_message_value) {
  business_reject_message_record.partition_id = business_reject_message_value;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.sequence_number[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
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
  :: business_reject_message_at < 12 -> business_reject_message_record.order_id_alpha_12[business_reject_message_at] = business_reject_message_value; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  fill_transact_time(business_reject_message_record.transact_time, business_reject_message_value);
  skip
}

/* each byte of Business Reject Message set to where it lies, so a field read out of place says so */
inline ramp_business_reject_message(business_reject_message_record, business_reject_message_base) {
  business_reject_message_record.partition_id = (business_reject_message_base + 0 + 1) % 256;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.sequence_number[business_reject_message_at] = (business_reject_message_base + 1 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
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
  :: business_reject_message_at < 12 -> business_reject_message_record.order_id_alpha_12[business_reject_message_at] = (business_reject_message_base + 29 + business_reject_message_at + 1) % 256; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  ramp_transact_time(business_reject_message_record.transact_time, business_reject_message_base + 41);
  skip
}

/* Business Reject Message to the wire, 49 bytes from where the cursor stands */
inline encode_business_reject_message(business_reject_message_record) {
  wire[at] = business_reject_message_record.partition_id; at = at + 1;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> wire[at] = business_reject_message_record.sequence_number[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
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
  :: business_reject_message_at < 12 -> wire[at] = business_reject_message_record.order_id_alpha_12[business_reject_message_at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  encode_transact_time(business_reject_message_record.transact_time);
  skip
}

/* Business Reject Message off the wire, 49 bytes from where the cursor stands */
inline decode_business_reject_message(business_reject_message_record) {
  business_reject_message_record.partition_id = wire[at]; at = at + 1;
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> business_reject_message_record.sequence_number[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
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
  :: business_reject_message_at < 12 -> business_reject_message_record.order_id_alpha_12[business_reject_message_at] = wire[at]; at = at + 1; business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  decode_transact_time(business_reject_message_record.transact_time);
  skip
}

/* what was read of Business Reject Message is what was written, byte for byte */
inline equal_business_reject_message(business_reject_message_read, business_reject_message_written) {
  assert(business_reject_message_read.partition_id == business_reject_message_written.partition_id);
  business_reject_message_at = 0;
  do
  :: business_reject_message_at < 4 -> assert(business_reject_message_read.sequence_number[business_reject_message_at] == business_reject_message_written.sequence_number[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
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
  :: business_reject_message_at < 12 -> assert(business_reject_message_read.order_id_alpha_12[business_reject_message_at] == business_reject_message_written.order_id_alpha_12[business_reject_message_at]); business_reject_message_at = business_reject_message_at + 1
  :: else -> break
  od;
  equal_transact_time(business_reject_message_read.transact_time, business_reject_message_written.transact_time);
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
    assert(at == 60);
    at = 0;
    decode_logon_message(logon_message_got);
    assert(at == 60);
    equal_logon_message(logon_message_got, logon_message_sent)
  }
}

/* Logon Response Message: encoded, read back, and compared */
proctype check_logon_response_message() {
  LogonResponseMessage logon_response_message_sent;
  LogonResponseMessage logon_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_response_message(logon_response_message_sent, 0)
  :: pattern == 1 -> fill_logon_response_message(logon_response_message_sent, 32)
  :: pattern == 2 -> fill_logon_response_message(logon_response_message_sent, 255)
  :: else -> ramp_logon_response_message(logon_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_response_message(logon_response_message_sent);
    assert(at == 8);
    at = 0;
    decode_logon_response_message(logon_response_message_got);
    assert(at == 8);
    equal_logon_response_message(logon_response_message_got, logon_response_message_sent)
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

/* Transmission Complete Message: encoded, read back, and compared */
proctype check_transmission_complete_message() {
  TransmissionCompleteMessage transmission_complete_message_sent;
  TransmissionCompleteMessage transmission_complete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_transmission_complete_message(transmission_complete_message_sent, 0)
  :: pattern == 1 -> fill_transmission_complete_message(transmission_complete_message_sent, 32)
  :: pattern == 2 -> fill_transmission_complete_message(transmission_complete_message_sent, 255)
  :: else -> ramp_transmission_complete_message(transmission_complete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_transmission_complete_message(transmission_complete_message_sent);
    assert(at == 1);
    at = 0;
    decode_transmission_complete_message(transmission_complete_message_got);
    assert(at == 1);
    equal_transmission_complete_message(transmission_complete_message_got, transmission_complete_message_sent)
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
    assert(at == 121);
    at = 0;
    decode_new_order_message(new_order_message_got);
    assert(at == 121);
    equal_new_order_message(new_order_message_got, new_order_message_sent)
  }
}

/* Order Cancel Request Message: encoded, read back, and compared */
proctype check_order_cancel_request_message() {
  OrderCancelRequestMessage order_cancel_request_message_sent;
  OrderCancelRequestMessage order_cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_request_message(order_cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_request_message(order_cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_request_message(order_cancel_request_message_sent, 255)
  :: else -> ramp_order_cancel_request_message(order_cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_request_message(order_cancel_request_message_sent);
    assert(at == 85);
    at = 0;
    decode_order_cancel_request_message(order_cancel_request_message_got);
    assert(at == 85);
    equal_order_cancel_request_message(order_cancel_request_message_got, order_cancel_request_message_sent)
  }
}

/* Order Mass Cancel Request Message: encoded, read back, and compared */
proctype check_order_mass_cancel_request_message() {
  OrderMassCancelRequestMessage order_mass_cancel_request_message_sent;
  OrderMassCancelRequestMessage order_mass_cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_mass_cancel_request_message(order_mass_cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_order_mass_cancel_request_message(order_mass_cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_order_mass_cancel_request_message(order_mass_cancel_request_message_sent, 255)
  :: else -> ramp_order_mass_cancel_request_message(order_mass_cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_mass_cancel_request_message(order_mass_cancel_request_message_sent);
    assert(at == 33);
    at = 0;
    decode_order_mass_cancel_request_message(order_mass_cancel_request_message_got);
    assert(at == 33);
    equal_order_mass_cancel_request_message(order_mass_cancel_request_message_got, order_mass_cancel_request_message_sent)
  }
}

/* Order Cancel Replace Request Message: encoded, read back, and compared */
proctype check_order_cancel_replace_request_message() {
  OrderCancelReplaceRequestMessage order_cancel_replace_request_message_sent;
  OrderCancelReplaceRequestMessage order_cancel_replace_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 255)
  :: else -> ramp_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_replace_request_message(order_cancel_replace_request_message_sent);
    assert(at == 142);
    at = 0;
    decode_order_cancel_replace_request_message(order_cancel_replace_request_message_got);
    assert(at == 142);
    equal_order_cancel_replace_request_message(order_cancel_replace_request_message_got, order_cancel_replace_request_message_sent)
  }
}

/* Security Definition Request Message: encoded, read back, and compared */
proctype check_security_definition_request_message() {
  SecurityDefinitionRequestMessage security_definition_request_message_sent;
  SecurityDefinitionRequestMessage security_definition_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_definition_request_message(security_definition_request_message_sent, 0)
  :: pattern == 1 -> fill_security_definition_request_message(security_definition_request_message_sent, 32)
  :: pattern == 2 -> fill_security_definition_request_message(security_definition_request_message_sent, 255)
  :: else -> ramp_security_definition_request_message(security_definition_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_definition_request_message(security_definition_request_message_sent);
    assert(at == 77);
    at = 0;
    decode_security_definition_request_message(security_definition_request_message_got);
    assert(at == 77);
    equal_security_definition_request_message(security_definition_request_message_got, security_definition_request_message_sent)
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
    assert(at == 60);
    at = 0;
    decode_order_cancel_reject_message(order_cancel_reject_message_got);
    assert(at == 60);
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
    assert(at == 39);
    at = 0;
    decode_order_mass_cancel_report_message(order_mass_cancel_report_message_got);
    assert(at == 39);
    equal_order_mass_cancel_report_message(order_mass_cancel_report_message_got, order_mass_cancel_report_message_sent)
  }
}

/* Security Definition Response Message: encoded, read back, and compared */
proctype check_security_definition_response_message() {
  SecurityDefinitionResponseMessage security_definition_response_message_sent;
  SecurityDefinitionResponseMessage security_definition_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_definition_response_message(security_definition_response_message_sent, 0)
  :: pattern == 1 -> fill_security_definition_response_message(security_definition_response_message_sent, 32)
  :: pattern == 2 -> fill_security_definition_response_message(security_definition_response_message_sent, 255)
  :: else -> ramp_security_definition_response_message(security_definition_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_definition_response_message(security_definition_response_message_sent);
    assert(at == 20);
    at = 0;
    decode_security_definition_response_message(security_definition_response_message_got);
    assert(at == 20);
    equal_security_definition_response_message(security_definition_response_message_got, security_definition_response_message_sent)
  }
}

/* News Message: encoded, read back, and compared */
proctype check_news_message() {
  NewsMessage news_message_sent;
  NewsMessage news_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_news_message(news_message_sent, 0)
  :: pattern == 1 -> fill_news_message(news_message_sent, 32)
  :: pattern == 2 -> fill_news_message(news_message_sent, 255)
  :: else -> ramp_news_message(news_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_news_message(news_message_sent);
    assert(at == 1188);
    at = 0;
    decode_news_message(news_message_got);
    assert(at == 1188);
    equal_news_message(news_message_got, news_message_sent)
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
    assert(at == 49);
    at = 0;
    decode_business_reject_message(business_reject_message_got);
    assert(at == 49);
    equal_business_reject_message(business_reject_message_got, business_reject_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_logon_message()
  :: run check_logon_response_message()
  :: run check_logout_message()
  :: run check_reject_message()
  :: run check_missed_message_request_message()
  :: run check_missed_message_request_ack_message()
  :: run check_transmission_complete_message()
  :: run check_system_status_message()
  :: run check_new_order_message()
  :: run check_order_cancel_request_message()
  :: run check_order_mass_cancel_request_message()
  :: run check_order_cancel_replace_request_message()
  :: run check_security_definition_request_message()
  :: run check_transact_time()
  :: run check_order_cancel_reject_message()
  :: run check_order_mass_cancel_report_message()
  :: run check_security_definition_response_message()
  :: run check_news_message()
  :: run check_business_reject_message()
  fi
}
