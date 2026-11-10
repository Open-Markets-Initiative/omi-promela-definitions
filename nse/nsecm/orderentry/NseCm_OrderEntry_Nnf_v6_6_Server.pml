/*
 * National Stock Exchange of India Ltd Order Entry
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
 *   - a run of a stated number of entries
 *   - a Composite rule
 *   - the dispatch that chooses a message by its type
 *   - a field read in bits
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 250

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 40 bytes ------------------------------------------------ */

/* MESSAGE_HEADER */
typedef MessageHeader {
  byte transaction_code[2];
  byte log_time[4];
  byte alpha_char[2];
  byte trader_id[4];
  byte error_code[2];
  byte header_timestamp[8];
  byte time_stamp_1[8];
  byte time_stamp_2[8];
  byte message_length[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = (message_header_base + 6 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = (message_header_base + 8 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = (message_header_base + 12 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = (message_header_base + 14 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = (message_header_base + 22 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = (message_header_base + 30 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 38 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 40 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.transaction_code[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.log_time[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.alpha_char[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.trader_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.error_code[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.header_timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.time_stamp_1[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.time_stamp_2[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 40 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.transaction_code[message_header_at] == message_header_written.transaction_code[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.log_time[message_header_at] == message_header_written.log_time[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.alpha_char[message_header_at] == message_header_written.alpha_char[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.trader_id[message_header_at] == message_header_written.trader_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.error_code[message_header_at] == message_header_written.error_code[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.header_timestamp[message_header_at] == message_header_written.header_timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.time_stamp_1[message_header_at] == message_header_written.time_stamp_1[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.time_stamp_2[message_header_at] == message_header_written.time_stamp_2[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel On Logout Status Response Message: 6 bytes ----------------------- */

/* Sent as COL_USER_STATUS_CHANGE _OUT */
typedef CancelOnLogoutStatusResponseMessage {
  byte user_id[4];
  byte colo_user_bit;
  byte reserved_1
};

int cancel_on_logout_status_response_message_at;

/* every byte of Cancel On Logout Status Response Message set to one value */
inline fill_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_record, cancel_on_logout_status_response_message_value) {
  cancel_on_logout_status_response_message_at = 0;
  do
  :: cancel_on_logout_status_response_message_at < 4 -> cancel_on_logout_status_response_message_record.user_id[cancel_on_logout_status_response_message_at] = cancel_on_logout_status_response_message_value; cancel_on_logout_status_response_message_at = cancel_on_logout_status_response_message_at + 1
  :: else -> break
  od;
  cancel_on_logout_status_response_message_record.colo_user_bit = cancel_on_logout_status_response_message_value;
  cancel_on_logout_status_response_message_record.reserved_1 = cancel_on_logout_status_response_message_value;
  skip
}

/* each byte of Cancel On Logout Status Response Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_record, cancel_on_logout_status_response_message_base) {
  cancel_on_logout_status_response_message_at = 0;
  do
  :: cancel_on_logout_status_response_message_at < 4 -> cancel_on_logout_status_response_message_record.user_id[cancel_on_logout_status_response_message_at] = (cancel_on_logout_status_response_message_base + 0 + cancel_on_logout_status_response_message_at + 1) % 256; cancel_on_logout_status_response_message_at = cancel_on_logout_status_response_message_at + 1
  :: else -> break
  od;
  cancel_on_logout_status_response_message_record.colo_user_bit = (cancel_on_logout_status_response_message_base + 4 + 1) % 256;
  cancel_on_logout_status_response_message_record.reserved_1 = (cancel_on_logout_status_response_message_base + 5 + 1) % 256;
  skip
}

/* Cancel On Logout Status Response Message to the wire, 6 bytes from where the cursor stands */
inline encode_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_record) {
  cancel_on_logout_status_response_message_at = 0;
  do
  :: cancel_on_logout_status_response_message_at < 4 -> wire[at] = cancel_on_logout_status_response_message_record.user_id[cancel_on_logout_status_response_message_at]; at = at + 1; cancel_on_logout_status_response_message_at = cancel_on_logout_status_response_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_on_logout_status_response_message_record.colo_user_bit; at = at + 1;
  wire[at] = cancel_on_logout_status_response_message_record.reserved_1; at = at + 1;
  skip
}

/* Cancel On Logout Status Response Message off the wire, 6 bytes from where the cursor stands */
inline decode_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_record) {
  cancel_on_logout_status_response_message_at = 0;
  do
  :: cancel_on_logout_status_response_message_at < 4 -> cancel_on_logout_status_response_message_record.user_id[cancel_on_logout_status_response_message_at] = wire[at]; at = at + 1; cancel_on_logout_status_response_message_at = cancel_on_logout_status_response_message_at + 1
  :: else -> break
  od;
  cancel_on_logout_status_response_message_record.colo_user_bit = wire[at]; at = at + 1;
  cancel_on_logout_status_response_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Cancel On Logout Status Response Message is what was written, byte for byte */
inline equal_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_read, cancel_on_logout_status_response_message_written) {
  cancel_on_logout_status_response_message_at = 0;
  do
  :: cancel_on_logout_status_response_message_at < 4 -> assert(cancel_on_logout_status_response_message_read.user_id[cancel_on_logout_status_response_message_at] == cancel_on_logout_status_response_message_written.user_id[cancel_on_logout_status_response_message_at]); cancel_on_logout_status_response_message_at = cancel_on_logout_status_response_message_at + 1
  :: else -> break
  od;
  assert(cancel_on_logout_status_response_message_read.colo_user_bit == cancel_on_logout_status_response_message_written.colo_user_bit);
  assert(cancel_on_logout_status_response_message_read.reserved_1 == cancel_on_logout_status_response_message_written.reserved_1);
  skip
}

/* ---- Sec Info: 12 bytes ------------------------------------------------------ */

/* SEC_INFO */
typedef SecInfo {
  byte symbol[10];
  byte series[2]
};

int sec_info_at;

/* every byte of Sec Info set to one value */
inline fill_sec_info(sec_info_record, sec_info_value) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sec Info set to where it lies, so a field read out of place says so */
inline ramp_sec_info(sec_info_record, sec_info_base) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = (sec_info_base + 0 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = (sec_info_base + 10 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info to the wire, 12 bytes from where the cursor stands */
inline encode_sec_info(sec_info_record) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> wire[at] = sec_info_record.symbol[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> wire[at] = sec_info_record.series[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info off the wire, 12 bytes from where the cursor stands */
inline decode_sec_info(sec_info_record) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sec Info is what was written, byte for byte */
inline equal_sec_info(sec_info_read, sec_info_written) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> assert(sec_info_read.symbol[sec_info_at] == sec_info_written.symbol[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> assert(sec_info_read.series[sec_info_at] == sec_info_written.series[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Error Response Message: 140 bytes --------------------------------------- */

/* Sent as ERROR_RESPONSE_OUT */
typedef ErrorResponseMessage {
  SecInfo sec_info;
  byte error_message[128]
};

int error_response_message_at;

/* every byte of Error Response Message set to one value */
inline fill_error_response_message(error_response_message_record, error_response_message_value) {
  fill_sec_info(error_response_message_record.sec_info, error_response_message_value);
  error_response_message_at = 0;
  do
  :: error_response_message_at < 128 -> error_response_message_record.error_message[error_response_message_at] = error_response_message_value; error_response_message_at = error_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Error Response Message set to where it lies, so a field read out of place says so */
inline ramp_error_response_message(error_response_message_record, error_response_message_base) {
  ramp_sec_info(error_response_message_record.sec_info, error_response_message_base + 0);
  error_response_message_at = 0;
  do
  :: error_response_message_at < 128 -> error_response_message_record.error_message[error_response_message_at] = (error_response_message_base + 12 + error_response_message_at + 1) % 256; error_response_message_at = error_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Error Response Message to the wire, 140 bytes from where the cursor stands */
inline encode_error_response_message(error_response_message_record) {
  encode_sec_info(error_response_message_record.sec_info);
  error_response_message_at = 0;
  do
  :: error_response_message_at < 128 -> wire[at] = error_response_message_record.error_message[error_response_message_at]; at = at + 1; error_response_message_at = error_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Error Response Message off the wire, 140 bytes from where the cursor stands */
inline decode_error_response_message(error_response_message_record) {
  decode_sec_info(error_response_message_record.sec_info);
  error_response_message_at = 0;
  do
  :: error_response_message_at < 128 -> error_response_message_record.error_message[error_response_message_at] = wire[at]; at = at + 1; error_response_message_at = error_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Error Response Message is what was written, byte for byte */
inline equal_error_response_message(error_response_message_read, error_response_message_written) {
  equal_sec_info(error_response_message_read.sec_info, error_response_message_written.sec_info);
  error_response_message_at = 0;
  do
  :: error_response_message_at < 128 -> assert(error_response_message_read.error_message[error_response_message_at] == error_response_message_written.error_message[error_response_message_at]); error_response_message_at = error_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Secure Box Registration Request Message: 2 bytes ------------------------ */

/* Sent as SECURE_BOX_REGISTRATION_REQUE */
typedef SecureBoxRegistrationRequestMessage {
  byte box_id[2]
};

int secure_box_registration_request_message_at;

/* every byte of Secure Box Registration Request Message set to one value */
inline fill_secure_box_registration_request_message(secure_box_registration_request_message_record, secure_box_registration_request_message_value) {
  secure_box_registration_request_message_at = 0;
  do
  :: secure_box_registration_request_message_at < 2 -> secure_box_registration_request_message_record.box_id[secure_box_registration_request_message_at] = secure_box_registration_request_message_value; secure_box_registration_request_message_at = secure_box_registration_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Secure Box Registration Request Message set to where it lies, so a field read out of place says so */
inline ramp_secure_box_registration_request_message(secure_box_registration_request_message_record, secure_box_registration_request_message_base) {
  secure_box_registration_request_message_at = 0;
  do
  :: secure_box_registration_request_message_at < 2 -> secure_box_registration_request_message_record.box_id[secure_box_registration_request_message_at] = (secure_box_registration_request_message_base + 0 + secure_box_registration_request_message_at + 1) % 256; secure_box_registration_request_message_at = secure_box_registration_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Secure Box Registration Request Message to the wire, 2 bytes from where the cursor stands */
inline encode_secure_box_registration_request_message(secure_box_registration_request_message_record) {
  secure_box_registration_request_message_at = 0;
  do
  :: secure_box_registration_request_message_at < 2 -> wire[at] = secure_box_registration_request_message_record.box_id[secure_box_registration_request_message_at]; at = at + 1; secure_box_registration_request_message_at = secure_box_registration_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Secure Box Registration Request Message off the wire, 2 bytes from where the cursor stands */
inline decode_secure_box_registration_request_message(secure_box_registration_request_message_record) {
  secure_box_registration_request_message_at = 0;
  do
  :: secure_box_registration_request_message_at < 2 -> secure_box_registration_request_message_record.box_id[secure_box_registration_request_message_at] = wire[at]; at = at + 1; secure_box_registration_request_message_at = secure_box_registration_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Secure Box Registration Request Message is what was written, byte for byte */
inline equal_secure_box_registration_request_message(secure_box_registration_request_message_read, secure_box_registration_request_message_written) {
  secure_box_registration_request_message_at = 0;
  do
  :: secure_box_registration_request_message_at < 2 -> assert(secure_box_registration_request_message_read.box_id[secure_box_registration_request_message_at] == secure_box_registration_request_message_written.box_id[secure_box_registration_request_message_at]); secure_box_registration_request_message_at = secure_box_registration_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Box Sign On Response Message: 12 bytes ---------------------------------- */

/* Sent as BOX_SIGN_ON_REQUEST_OUT */
typedef BoxSignOnResponseMessage {
  byte box_id[2];
  byte reserved_10[10]
};

int box_sign_on_response_message_at;

/* every byte of Box Sign On Response Message set to one value */
inline fill_box_sign_on_response_message(box_sign_on_response_message_record, box_sign_on_response_message_value) {
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 2 -> box_sign_on_response_message_record.box_id[box_sign_on_response_message_at] = box_sign_on_response_message_value; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 10 -> box_sign_on_response_message_record.reserved_10[box_sign_on_response_message_at] = box_sign_on_response_message_value; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Box Sign On Response Message set to where it lies, so a field read out of place says so */
inline ramp_box_sign_on_response_message(box_sign_on_response_message_record, box_sign_on_response_message_base) {
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 2 -> box_sign_on_response_message_record.box_id[box_sign_on_response_message_at] = (box_sign_on_response_message_base + 0 + box_sign_on_response_message_at + 1) % 256; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 10 -> box_sign_on_response_message_record.reserved_10[box_sign_on_response_message_at] = (box_sign_on_response_message_base + 2 + box_sign_on_response_message_at + 1) % 256; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Response Message to the wire, 12 bytes from where the cursor stands */
inline encode_box_sign_on_response_message(box_sign_on_response_message_record) {
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 2 -> wire[at] = box_sign_on_response_message_record.box_id[box_sign_on_response_message_at]; at = at + 1; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 10 -> wire[at] = box_sign_on_response_message_record.reserved_10[box_sign_on_response_message_at]; at = at + 1; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Response Message off the wire, 12 bytes from where the cursor stands */
inline decode_box_sign_on_response_message(box_sign_on_response_message_record) {
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 2 -> box_sign_on_response_message_record.box_id[box_sign_on_response_message_at] = wire[at]; at = at + 1; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 10 -> box_sign_on_response_message_record.reserved_10[box_sign_on_response_message_at] = wire[at]; at = at + 1; box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Box Sign On Response Message is what was written, byte for byte */
inline equal_box_sign_on_response_message(box_sign_on_response_message_read, box_sign_on_response_message_written) {
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 2 -> assert(box_sign_on_response_message_read.box_id[box_sign_on_response_message_at] == box_sign_on_response_message_written.box_id[box_sign_on_response_message_at]); box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  box_sign_on_response_message_at = 0;
  do
  :: box_sign_on_response_message_at < 10 -> assert(box_sign_on_response_message_read.reserved_10[box_sign_on_response_message_at] == box_sign_on_response_message_written.reserved_10[box_sign_on_response_message_at]); box_sign_on_response_message_at = box_sign_on_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Existing Encryption Tail: 16 bytes -------------------------------------- */

/* Initialisation vector used by the existing encryption */
typedef ExistingEncryptionTail {
  byte cryptographic_iv[16]
};

int existing_encryption_tail_at;

/* every byte of Existing Encryption Tail set to one value */
inline fill_existing_encryption_tail(existing_encryption_tail_record, existing_encryption_tail_value) {
  existing_encryption_tail_at = 0;
  do
  :: existing_encryption_tail_at < 16 -> existing_encryption_tail_record.cryptographic_iv[existing_encryption_tail_at] = existing_encryption_tail_value; existing_encryption_tail_at = existing_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Existing Encryption Tail set to where it lies, so a field read out of place says so */
inline ramp_existing_encryption_tail(existing_encryption_tail_record, existing_encryption_tail_base) {
  existing_encryption_tail_at = 0;
  do
  :: existing_encryption_tail_at < 16 -> existing_encryption_tail_record.cryptographic_iv[existing_encryption_tail_at] = (existing_encryption_tail_base + 0 + existing_encryption_tail_at + 1) % 256; existing_encryption_tail_at = existing_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* Existing Encryption Tail to the wire, 16 bytes from where the cursor stands */
inline encode_existing_encryption_tail(existing_encryption_tail_record) {
  existing_encryption_tail_at = 0;
  do
  :: existing_encryption_tail_at < 16 -> wire[at] = existing_encryption_tail_record.cryptographic_iv[existing_encryption_tail_at]; at = at + 1; existing_encryption_tail_at = existing_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* Existing Encryption Tail off the wire, 16 bytes from where the cursor stands */
inline decode_existing_encryption_tail(existing_encryption_tail_record) {
  existing_encryption_tail_at = 0;
  do
  :: existing_encryption_tail_at < 16 -> existing_encryption_tail_record.cryptographic_iv[existing_encryption_tail_at] = wire[at]; at = at + 1; existing_encryption_tail_at = existing_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Existing Encryption Tail is what was written, byte for byte */
inline equal_existing_encryption_tail(existing_encryption_tail_read, existing_encryption_tail_written) {
  existing_encryption_tail_at = 0;
  do
  :: existing_encryption_tail_at < 16 -> assert(existing_encryption_tail_read.cryptographic_iv[existing_encryption_tail_at] == existing_encryption_tail_written.cryptographic_iv[existing_encryption_tail_at]); existing_encryption_tail_at = existing_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Encryption Tail: 28 bytes ------------------------------------------- */

/* Initialisation vectors used by the new authenticated encryption */
typedef NewEncryptionTail {
  byte static_cryptographic_iv[8];
  byte dynamic_cryptographic_iv[8];
  byte cryptographic_additional_key[12]
};

int new_encryption_tail_at;

/* every byte of New Encryption Tail set to one value */
inline fill_new_encryption_tail(new_encryption_tail_record, new_encryption_tail_value) {
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.static_cryptographic_iv[new_encryption_tail_at] = new_encryption_tail_value; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.dynamic_cryptographic_iv[new_encryption_tail_at] = new_encryption_tail_value; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 12 -> new_encryption_tail_record.cryptographic_additional_key[new_encryption_tail_at] = new_encryption_tail_value; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Encryption Tail set to where it lies, so a field read out of place says so */
inline ramp_new_encryption_tail(new_encryption_tail_record, new_encryption_tail_base) {
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.static_cryptographic_iv[new_encryption_tail_at] = (new_encryption_tail_base + 0 + new_encryption_tail_at + 1) % 256; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.dynamic_cryptographic_iv[new_encryption_tail_at] = (new_encryption_tail_base + 8 + new_encryption_tail_at + 1) % 256; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 12 -> new_encryption_tail_record.cryptographic_additional_key[new_encryption_tail_at] = (new_encryption_tail_base + 16 + new_encryption_tail_at + 1) % 256; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* New Encryption Tail to the wire, 28 bytes from where the cursor stands */
inline encode_new_encryption_tail(new_encryption_tail_record) {
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> wire[at] = new_encryption_tail_record.static_cryptographic_iv[new_encryption_tail_at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> wire[at] = new_encryption_tail_record.dynamic_cryptographic_iv[new_encryption_tail_at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 12 -> wire[at] = new_encryption_tail_record.cryptographic_additional_key[new_encryption_tail_at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* New Encryption Tail off the wire, 28 bytes from where the cursor stands */
inline decode_new_encryption_tail(new_encryption_tail_record) {
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.static_cryptographic_iv[new_encryption_tail_at] = wire[at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> new_encryption_tail_record.dynamic_cryptographic_iv[new_encryption_tail_at] = wire[at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 12 -> new_encryption_tail_record.cryptographic_additional_key[new_encryption_tail_at] = wire[at]; at = at + 1; new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Encryption Tail is what was written, byte for byte */
inline equal_new_encryption_tail(new_encryption_tail_read, new_encryption_tail_written) {
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> assert(new_encryption_tail_read.static_cryptographic_iv[new_encryption_tail_at] == new_encryption_tail_written.static_cryptographic_iv[new_encryption_tail_at]); new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 8 -> assert(new_encryption_tail_read.dynamic_cryptographic_iv[new_encryption_tail_at] == new_encryption_tail_written.dynamic_cryptographic_iv[new_encryption_tail_at]); new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  new_encryption_tail_at = 0;
  do
  :: new_encryption_tail_at < 12 -> assert(new_encryption_tail_read.cryptographic_additional_key[new_encryption_tail_at] == new_encryption_tail_written.cryptographic_additional_key[new_encryption_tail_at]); new_encryption_tail_at = new_encryption_tail_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Control Message To Trader Message: 250 bytes ---------------------------- */

/* Sent as CTRL_MSG_TO_TRADER */
typedef ControlMessageToTraderMessage {
  byte trader_id[4];
  byte action_code[3];
  byte reserved_1;
  byte msg_length[2];
  byte msg[240]
};

int control_message_to_trader_message_at;

/* every byte of Control Message To Trader Message set to one value */
inline fill_control_message_to_trader_message(control_message_to_trader_message_record, control_message_to_trader_message_value) {
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 4 -> control_message_to_trader_message_record.trader_id[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 3 -> control_message_to_trader_message_record.action_code[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_record.reserved_1 = control_message_to_trader_message_value;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.msg_length[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 240 -> control_message_to_trader_message_record.msg[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Control Message To Trader Message set to where it lies, so a field read out of place says so */
inline ramp_control_message_to_trader_message(control_message_to_trader_message_record, control_message_to_trader_message_base) {
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 4 -> control_message_to_trader_message_record.trader_id[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 0 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 3 -> control_message_to_trader_message_record.action_code[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 4 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_record.reserved_1 = (control_message_to_trader_message_base + 7 + 1) % 256;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.msg_length[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 8 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 240 -> control_message_to_trader_message_record.msg[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 10 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* Control Message To Trader Message to the wire, 250 bytes from where the cursor stands */
inline encode_control_message_to_trader_message(control_message_to_trader_message_record) {
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 4 -> wire[at] = control_message_to_trader_message_record.trader_id[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 3 -> wire[at] = control_message_to_trader_message_record.action_code[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  wire[at] = control_message_to_trader_message_record.reserved_1; at = at + 1;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 2 -> wire[at] = control_message_to_trader_message_record.msg_length[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 240 -> wire[at] = control_message_to_trader_message_record.msg[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* Control Message To Trader Message off the wire, 250 bytes from where the cursor stands */
inline decode_control_message_to_trader_message(control_message_to_trader_message_record) {
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 4 -> control_message_to_trader_message_record.trader_id[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 3 -> control_message_to_trader_message_record.action_code[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_record.reserved_1 = wire[at]; at = at + 1;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.msg_length[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 240 -> control_message_to_trader_message_record.msg[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Control Message To Trader Message is what was written, byte for byte */
inline equal_control_message_to_trader_message(control_message_to_trader_message_read, control_message_to_trader_message_written) {
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 4 -> assert(control_message_to_trader_message_read.trader_id[control_message_to_trader_message_at] == control_message_to_trader_message_written.trader_id[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 3 -> assert(control_message_to_trader_message_read.action_code[control_message_to_trader_message_at] == control_message_to_trader_message_written.action_code[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  assert(control_message_to_trader_message_read.reserved_1 == control_message_to_trader_message_written.reserved_1);
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 2 -> assert(control_message_to_trader_message_read.msg_length[control_message_to_trader_message_at] == control_message_to_trader_message_written.msg_length[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 240 -> assert(control_message_to_trader_message_read.msg[control_message_to_trader_message_at] == control_message_to_trader_message_written.msg[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Password Reset Out Message: 18 bytes ------------------------------------ */

/* Sent as RESET_PASSWORD_OUT */
typedef PasswordResetOutMessage {
  byte user_id[4];
  byte reserved_14[14]
};

int password_reset_out_message_at;

/* every byte of Password Reset Out Message set to one value */
inline fill_password_reset_out_message(password_reset_out_message_record, password_reset_out_message_value) {
  password_reset_out_message_at = 0;
  do
  :: password_reset_out_message_at < 4 -> password_reset_out_message_record.user_id[password_reset_out_message_at] = password_reset_out_message_value; password_reset_out_message_at = password_reset_out_message_at + 1
  :: else -> break
  od;
  password_reset_out_message_at = 0;
  do
  :: password_reset_out_message_at < 14 -> password_reset_out_message_record.reserved_14[password_reset_out_message_at] = password_reset_out_message_value; password_reset_out_message_at = password_reset_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Password Reset Out Message set to where it lies, so a field read out of place says so */
inline ramp_password_reset_out_message(password_reset_out_message_record, password_reset_out_message_base) {
  password_reset_out_message_at = 0;
  do
  :: password_reset_out_message_at < 4 -> password_reset_out_message_record.user_id[password_reset_out_message_at] = (password_reset_out_message_base + 0 + password_reset_out_message_at + 1) % 256; password_reset_out_message_at = password_reset_out_message_at + 1
  :: else -> break
  od;
  password_reset_out_message_at = 0;
  do
  :: password_reset_out_message_at < 14 -> password_reset_out_message_record.reserved_14[password_reset_out_message_at] = (password_reset_out_message_base + 4 + password_reset_out_message_at + 1) % 256; password_reset_out_message_at = password_reset_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Password Reset Out Message to the wire, 18 bytes from where the cursor stands */
inline encode_password_reset_out_message(password_reset_out_message_record) {
  password_reset_out_message_at = 0;
  do
  :: password_reset_out_message_at < 4 -> wire[at] = password_reset_out_message_record.user_id[password_reset_out_message_at]; at = at + 1; password_reset_out_message_at = password_reset_out_message_at + 1
  :: else -> break
  od;
  password_reset_out_message_at = 0;
  do
  :: password_reset_out_message_at < 14 -> wire[at] = password_reset_out_message_record.reserved_14[password_reset_out_message_at]; at = at + 1; password_reset_out_message_at = password_reset_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Password Reset Out Message off the wire, 18 bytes from where the cursor stands */
inline decode_password_reset_out_message(password_reset_out_message_record) {
  password_reset_out_message_at = 0;
  do
  :: password_reset_out_message_at < 4 -> password_reset_out_message_record.user_id[password_reset_out_message_at] = wire[at]; at = at + 1; password_reset_out_message_at = password_reset_out_message_at + 1
  :: else -> break
  od;
  password_reset_out_message_at = 0;
  do
  :: password_reset_out_message_at < 14 -> password_reset_out_message_record.reserved_14[password_reset_out_message_at] = wire[at]; at = at + 1; password_reset_out_message_at = password_reset_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Password Reset Out Message is what was written, byte for byte */
inline equal_password_reset_out_message(password_reset_out_message_read, password_reset_out_message_written) {
  password_reset_out_message_at = 0;
  do
  :: password_reset_out_message_at < 4 -> assert(password_reset_out_message_read.user_id[password_reset_out_message_at] == password_reset_out_message_written.user_id[password_reset_out_message_at]); password_reset_out_message_at = password_reset_out_message_at + 1
  :: else -> break
  od;
  password_reset_out_message_at = 0;
  do
  :: password_reset_out_message_at < 14 -> assert(password_reset_out_message_read.reserved_14[password_reset_out_message_at] == password_reset_out_message_written.reserved_14[password_reset_out_message_at]); password_reset_out_message_at = password_reset_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Inquiry Out Message: 170 bytes ------------------------------------ */

/* Sent as TRADE_ERROR, TRADE_CANCEL_OUT */
typedef TradeInquiryOutMessage {
  SecInfo sec_info;
  byte fill_number[4];
  byte fill_qty[4];
  byte fill_price[4];
  byte market_type[2];
  byte new_volume[4];
  byte reserved_24[24];
  byte buy_broker_id[5];
  byte sell_broker_id[5];
  byte trader_id[4];
  byte requested_by[2];
  byte buy_account_number[10];
  byte sell_account_number[10];
  byte buy_pan[10];
  byte sell_pan[10];
  byte reserved_60[60]
};

int trade_inquiry_out_message_at;

/* every byte of Trade Inquiry Out Message set to one value */
inline fill_trade_inquiry_out_message(trade_inquiry_out_message_record, trade_inquiry_out_message_value) {
  fill_sec_info(trade_inquiry_out_message_record.sec_info, trade_inquiry_out_message_value);
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.fill_number[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.fill_qty[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.fill_price[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 2 -> trade_inquiry_out_message_record.market_type[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.new_volume[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 24 -> trade_inquiry_out_message_record.reserved_24[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 5 -> trade_inquiry_out_message_record.buy_broker_id[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 5 -> trade_inquiry_out_message_record.sell_broker_id[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.trader_id[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 2 -> trade_inquiry_out_message_record.requested_by[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.buy_account_number[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.sell_account_number[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.buy_pan[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.sell_pan[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 60 -> trade_inquiry_out_message_record.reserved_60[trade_inquiry_out_message_at] = trade_inquiry_out_message_value; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Inquiry Out Message set to where it lies, so a field read out of place says so */
inline ramp_trade_inquiry_out_message(trade_inquiry_out_message_record, trade_inquiry_out_message_base) {
  ramp_sec_info(trade_inquiry_out_message_record.sec_info, trade_inquiry_out_message_base + 0);
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.fill_number[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 12 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.fill_qty[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 16 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.fill_price[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 20 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 2 -> trade_inquiry_out_message_record.market_type[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 24 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.new_volume[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 26 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 24 -> trade_inquiry_out_message_record.reserved_24[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 30 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 5 -> trade_inquiry_out_message_record.buy_broker_id[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 54 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 5 -> trade_inquiry_out_message_record.sell_broker_id[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 59 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.trader_id[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 64 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 2 -> trade_inquiry_out_message_record.requested_by[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 68 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.buy_account_number[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 70 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.sell_account_number[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 80 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.buy_pan[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 90 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.sell_pan[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 100 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 60 -> trade_inquiry_out_message_record.reserved_60[trade_inquiry_out_message_at] = (trade_inquiry_out_message_base + 110 + trade_inquiry_out_message_at + 1) % 256; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Inquiry Out Message to the wire, 170 bytes from where the cursor stands */
inline encode_trade_inquiry_out_message(trade_inquiry_out_message_record) {
  encode_sec_info(trade_inquiry_out_message_record.sec_info);
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> wire[at] = trade_inquiry_out_message_record.fill_number[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> wire[at] = trade_inquiry_out_message_record.fill_qty[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> wire[at] = trade_inquiry_out_message_record.fill_price[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 2 -> wire[at] = trade_inquiry_out_message_record.market_type[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> wire[at] = trade_inquiry_out_message_record.new_volume[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 24 -> wire[at] = trade_inquiry_out_message_record.reserved_24[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 5 -> wire[at] = trade_inquiry_out_message_record.buy_broker_id[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 5 -> wire[at] = trade_inquiry_out_message_record.sell_broker_id[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> wire[at] = trade_inquiry_out_message_record.trader_id[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 2 -> wire[at] = trade_inquiry_out_message_record.requested_by[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> wire[at] = trade_inquiry_out_message_record.buy_account_number[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> wire[at] = trade_inquiry_out_message_record.sell_account_number[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> wire[at] = trade_inquiry_out_message_record.buy_pan[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> wire[at] = trade_inquiry_out_message_record.sell_pan[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 60 -> wire[at] = trade_inquiry_out_message_record.reserved_60[trade_inquiry_out_message_at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Inquiry Out Message off the wire, 170 bytes from where the cursor stands */
inline decode_trade_inquiry_out_message(trade_inquiry_out_message_record) {
  decode_sec_info(trade_inquiry_out_message_record.sec_info);
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.fill_number[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.fill_qty[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.fill_price[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 2 -> trade_inquiry_out_message_record.market_type[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.new_volume[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 24 -> trade_inquiry_out_message_record.reserved_24[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 5 -> trade_inquiry_out_message_record.buy_broker_id[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 5 -> trade_inquiry_out_message_record.sell_broker_id[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> trade_inquiry_out_message_record.trader_id[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 2 -> trade_inquiry_out_message_record.requested_by[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.buy_account_number[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.sell_account_number[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.buy_pan[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> trade_inquiry_out_message_record.sell_pan[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 60 -> trade_inquiry_out_message_record.reserved_60[trade_inquiry_out_message_at] = wire[at]; at = at + 1; trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Inquiry Out Message is what was written, byte for byte */
inline equal_trade_inquiry_out_message(trade_inquiry_out_message_read, trade_inquiry_out_message_written) {
  equal_sec_info(trade_inquiry_out_message_read.sec_info, trade_inquiry_out_message_written.sec_info);
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> assert(trade_inquiry_out_message_read.fill_number[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.fill_number[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> assert(trade_inquiry_out_message_read.fill_qty[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.fill_qty[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> assert(trade_inquiry_out_message_read.fill_price[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.fill_price[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 2 -> assert(trade_inquiry_out_message_read.market_type[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.market_type[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> assert(trade_inquiry_out_message_read.new_volume[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.new_volume[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 24 -> assert(trade_inquiry_out_message_read.reserved_24[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.reserved_24[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 5 -> assert(trade_inquiry_out_message_read.buy_broker_id[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.buy_broker_id[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 5 -> assert(trade_inquiry_out_message_read.sell_broker_id[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.sell_broker_id[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 4 -> assert(trade_inquiry_out_message_read.trader_id[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.trader_id[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 2 -> assert(trade_inquiry_out_message_read.requested_by[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.requested_by[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> assert(trade_inquiry_out_message_read.buy_account_number[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.buy_account_number[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> assert(trade_inquiry_out_message_read.sell_account_number[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.sell_account_number[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> assert(trade_inquiry_out_message_read.buy_pan[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.buy_pan[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 10 -> assert(trade_inquiry_out_message_read.sell_pan[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.sell_pan[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  trade_inquiry_out_message_at = 0;
  do
  :: trade_inquiry_out_message_at < 60 -> assert(trade_inquiry_out_message_read.reserved_60[trade_inquiry_out_message_at] == trade_inquiry_out_message_written.reserved_60[trade_inquiry_out_message_at]); trade_inquiry_out_message_at = trade_inquiry_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Update Local Database Header Message: 2 bytes --------------------------- */

/* Sent as UPDATE_LOCALDB_HEADER */
typedef UpdateLocalDatabaseHeaderMessage {
  byte reserved_2[2]
};

int update_local_database_header_message_at;

/* every byte of Update Local Database Header Message set to one value */
inline fill_update_local_database_header_message(update_local_database_header_message_record, update_local_database_header_message_value) {
  update_local_database_header_message_at = 0;
  do
  :: update_local_database_header_message_at < 2 -> update_local_database_header_message_record.reserved_2[update_local_database_header_message_at] = update_local_database_header_message_value; update_local_database_header_message_at = update_local_database_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Update Local Database Header Message set to where it lies, so a field read out of place says so */
inline ramp_update_local_database_header_message(update_local_database_header_message_record, update_local_database_header_message_base) {
  update_local_database_header_message_at = 0;
  do
  :: update_local_database_header_message_at < 2 -> update_local_database_header_message_record.reserved_2[update_local_database_header_message_at] = (update_local_database_header_message_base + 0 + update_local_database_header_message_at + 1) % 256; update_local_database_header_message_at = update_local_database_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Header Message to the wire, 2 bytes from where the cursor stands */
inline encode_update_local_database_header_message(update_local_database_header_message_record) {
  update_local_database_header_message_at = 0;
  do
  :: update_local_database_header_message_at < 2 -> wire[at] = update_local_database_header_message_record.reserved_2[update_local_database_header_message_at]; at = at + 1; update_local_database_header_message_at = update_local_database_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Header Message off the wire, 2 bytes from where the cursor stands */
inline decode_update_local_database_header_message(update_local_database_header_message_record) {
  update_local_database_header_message_at = 0;
  do
  :: update_local_database_header_message_at < 2 -> update_local_database_header_message_record.reserved_2[update_local_database_header_message_at] = wire[at]; at = at + 1; update_local_database_header_message_at = update_local_database_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Update Local Database Header Message is what was written, byte for byte */
inline equal_update_local_database_header_message(update_local_database_header_message_read, update_local_database_header_message_written) {
  update_local_database_header_message_at = 0;
  do
  :: update_local_database_header_message_at < 2 -> assert(update_local_database_header_message_read.reserved_2[update_local_database_header_message_at] == update_local_database_header_message_written.reserved_2[update_local_database_header_message_at]); update_local_database_header_message_at = update_local_database_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Update Local Database Trailer Message: 2 bytes -------------------------- */

/* Sent as UPDATE_LOCALDB_TRAILER */
typedef UpdateLocalDatabaseTrailerMessage {
  byte reserved_2[2]
};

int update_local_database_trailer_message_at;

/* every byte of Update Local Database Trailer Message set to one value */
inline fill_update_local_database_trailer_message(update_local_database_trailer_message_record, update_local_database_trailer_message_value) {
  update_local_database_trailer_message_at = 0;
  do
  :: update_local_database_trailer_message_at < 2 -> update_local_database_trailer_message_record.reserved_2[update_local_database_trailer_message_at] = update_local_database_trailer_message_value; update_local_database_trailer_message_at = update_local_database_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Update Local Database Trailer Message set to where it lies, so a field read out of place says so */
inline ramp_update_local_database_trailer_message(update_local_database_trailer_message_record, update_local_database_trailer_message_base) {
  update_local_database_trailer_message_at = 0;
  do
  :: update_local_database_trailer_message_at < 2 -> update_local_database_trailer_message_record.reserved_2[update_local_database_trailer_message_at] = (update_local_database_trailer_message_base + 0 + update_local_database_trailer_message_at + 1) % 256; update_local_database_trailer_message_at = update_local_database_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Trailer Message to the wire, 2 bytes from where the cursor stands */
inline encode_update_local_database_trailer_message(update_local_database_trailer_message_record) {
  update_local_database_trailer_message_at = 0;
  do
  :: update_local_database_trailer_message_at < 2 -> wire[at] = update_local_database_trailer_message_record.reserved_2[update_local_database_trailer_message_at]; at = at + 1; update_local_database_trailer_message_at = update_local_database_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Trailer Message off the wire, 2 bytes from where the cursor stands */
inline decode_update_local_database_trailer_message(update_local_database_trailer_message_record) {
  update_local_database_trailer_message_at = 0;
  do
  :: update_local_database_trailer_message_at < 2 -> update_local_database_trailer_message_record.reserved_2[update_local_database_trailer_message_at] = wire[at]; at = at + 1; update_local_database_trailer_message_at = update_local_database_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Update Local Database Trailer Message is what was written, byte for byte */
inline equal_update_local_database_trailer_message(update_local_database_trailer_message_read, update_local_database_trailer_message_written) {
  update_local_database_trailer_message_at = 0;
  do
  :: update_local_database_trailer_message_at < 2 -> assert(update_local_database_trailer_message_read.reserved_2[update_local_database_trailer_message_at] == update_local_database_trailer_message_written.reserved_2[update_local_database_trailer_message_at]); update_local_database_trailer_message_at = update_local_database_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- User Unlock Approval Rejection Message: 4 bytes ------------------------- */

/* Sent as USER_ADDR_UNLOCK_APPROVE_OUT, USER_ADDR_UNLOCK_REJECT_OUT */
typedef UserUnlockApprovalRejectionMessage {
  byte user_id[4]
};

int user_unlock_approval_rejection_message_at;

/* every byte of User Unlock Approval Rejection Message set to one value */
inline fill_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_record, user_unlock_approval_rejection_message_value) {
  user_unlock_approval_rejection_message_at = 0;
  do
  :: user_unlock_approval_rejection_message_at < 4 -> user_unlock_approval_rejection_message_record.user_id[user_unlock_approval_rejection_message_at] = user_unlock_approval_rejection_message_value; user_unlock_approval_rejection_message_at = user_unlock_approval_rejection_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Unlock Approval Rejection Message set to where it lies, so a field read out of place says so */
inline ramp_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_record, user_unlock_approval_rejection_message_base) {
  user_unlock_approval_rejection_message_at = 0;
  do
  :: user_unlock_approval_rejection_message_at < 4 -> user_unlock_approval_rejection_message_record.user_id[user_unlock_approval_rejection_message_at] = (user_unlock_approval_rejection_message_base + 0 + user_unlock_approval_rejection_message_at + 1) % 256; user_unlock_approval_rejection_message_at = user_unlock_approval_rejection_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Unlock Approval Rejection Message to the wire, 4 bytes from where the cursor stands */
inline encode_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_record) {
  user_unlock_approval_rejection_message_at = 0;
  do
  :: user_unlock_approval_rejection_message_at < 4 -> wire[at] = user_unlock_approval_rejection_message_record.user_id[user_unlock_approval_rejection_message_at]; at = at + 1; user_unlock_approval_rejection_message_at = user_unlock_approval_rejection_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Unlock Approval Rejection Message off the wire, 4 bytes from where the cursor stands */
inline decode_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_record) {
  user_unlock_approval_rejection_message_at = 0;
  do
  :: user_unlock_approval_rejection_message_at < 4 -> user_unlock_approval_rejection_message_record.user_id[user_unlock_approval_rejection_message_at] = wire[at]; at = at + 1; user_unlock_approval_rejection_message_at = user_unlock_approval_rejection_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Unlock Approval Rejection Message is what was written, byte for byte */
inline equal_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_read, user_unlock_approval_rejection_message_written) {
  user_unlock_approval_rejection_message_at = 0;
  do
  :: user_unlock_approval_rejection_message_at < 4 -> assert(user_unlock_approval_rejection_message_read.user_id[user_unlock_approval_rejection_message_at] == user_unlock_approval_rejection_message_written.user_id[user_unlock_approval_rejection_message_at]); user_unlock_approval_rejection_message_at = user_unlock_approval_rejection_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- User Unlock Requested Response Message: 4 bytes ------------------------- */

/* Sent as USER_ADDR_UNLOCK_OUT */
typedef UserUnlockRequestedResponseMessage {
  byte user_id[4]
};

int user_unlock_requested_response_message_at;

/* every byte of User Unlock Requested Response Message set to one value */
inline fill_user_unlock_requested_response_message(user_unlock_requested_response_message_record, user_unlock_requested_response_message_value) {
  user_unlock_requested_response_message_at = 0;
  do
  :: user_unlock_requested_response_message_at < 4 -> user_unlock_requested_response_message_record.user_id[user_unlock_requested_response_message_at] = user_unlock_requested_response_message_value; user_unlock_requested_response_message_at = user_unlock_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Unlock Requested Response Message set to where it lies, so a field read out of place says so */
inline ramp_user_unlock_requested_response_message(user_unlock_requested_response_message_record, user_unlock_requested_response_message_base) {
  user_unlock_requested_response_message_at = 0;
  do
  :: user_unlock_requested_response_message_at < 4 -> user_unlock_requested_response_message_record.user_id[user_unlock_requested_response_message_at] = (user_unlock_requested_response_message_base + 0 + user_unlock_requested_response_message_at + 1) % 256; user_unlock_requested_response_message_at = user_unlock_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Unlock Requested Response Message to the wire, 4 bytes from where the cursor stands */
inline encode_user_unlock_requested_response_message(user_unlock_requested_response_message_record) {
  user_unlock_requested_response_message_at = 0;
  do
  :: user_unlock_requested_response_message_at < 4 -> wire[at] = user_unlock_requested_response_message_record.user_id[user_unlock_requested_response_message_at]; at = at + 1; user_unlock_requested_response_message_at = user_unlock_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Unlock Requested Response Message off the wire, 4 bytes from where the cursor stands */
inline decode_user_unlock_requested_response_message(user_unlock_requested_response_message_record) {
  user_unlock_requested_response_message_at = 0;
  do
  :: user_unlock_requested_response_message_at < 4 -> user_unlock_requested_response_message_record.user_id[user_unlock_requested_response_message_at] = wire[at]; at = at + 1; user_unlock_requested_response_message_at = user_unlock_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Unlock Requested Response Message is what was written, byte for byte */
inline equal_user_unlock_requested_response_message(user_unlock_requested_response_message_read, user_unlock_requested_response_message_written) {
  user_unlock_requested_response_message_at = 0;
  do
  :: user_unlock_requested_response_message_at < 4 -> assert(user_unlock_requested_response_message_read.user_id[user_unlock_requested_response_message_at] == user_unlock_requested_response_message_written.user_id[user_unlock_requested_response_message_at]); user_unlock_requested_response_message_at = user_unlock_requested_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Modification Cancellation Status Response Message: 6 bytes -------- */

/* Sent as TRD_MOD_CXL_STATUS_CHANGE _OUT */
typedef TradeModificationCancellationStatusResponseMessage {
  byte user_id[4];
  byte trd_mod_cxl_bit;
  byte reserved_1
};

int trade_modification_cancellation_status_response_message_at;

/* every byte of Trade Modification Cancellation Status Response Message set to one value */
inline fill_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_record, trade_modification_cancellation_status_response_message_value) {
  trade_modification_cancellation_status_response_message_at = 0;
  do
  :: trade_modification_cancellation_status_response_message_at < 4 -> trade_modification_cancellation_status_response_message_record.user_id[trade_modification_cancellation_status_response_message_at] = trade_modification_cancellation_status_response_message_value; trade_modification_cancellation_status_response_message_at = trade_modification_cancellation_status_response_message_at + 1
  :: else -> break
  od;
  trade_modification_cancellation_status_response_message_record.trd_mod_cxl_bit = trade_modification_cancellation_status_response_message_value;
  trade_modification_cancellation_status_response_message_record.reserved_1 = trade_modification_cancellation_status_response_message_value;
  skip
}

/* each byte of Trade Modification Cancellation Status Response Message set to where it lies, so a field read out of place says so */
inline ramp_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_record, trade_modification_cancellation_status_response_message_base) {
  trade_modification_cancellation_status_response_message_at = 0;
  do
  :: trade_modification_cancellation_status_response_message_at < 4 -> trade_modification_cancellation_status_response_message_record.user_id[trade_modification_cancellation_status_response_message_at] = (trade_modification_cancellation_status_response_message_base + 0 + trade_modification_cancellation_status_response_message_at + 1) % 256; trade_modification_cancellation_status_response_message_at = trade_modification_cancellation_status_response_message_at + 1
  :: else -> break
  od;
  trade_modification_cancellation_status_response_message_record.trd_mod_cxl_bit = (trade_modification_cancellation_status_response_message_base + 4 + 1) % 256;
  trade_modification_cancellation_status_response_message_record.reserved_1 = (trade_modification_cancellation_status_response_message_base + 5 + 1) % 256;
  skip
}

/* Trade Modification Cancellation Status Response Message to the wire, 6 bytes from where the cursor stands */
inline encode_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_record) {
  trade_modification_cancellation_status_response_message_at = 0;
  do
  :: trade_modification_cancellation_status_response_message_at < 4 -> wire[at] = trade_modification_cancellation_status_response_message_record.user_id[trade_modification_cancellation_status_response_message_at]; at = at + 1; trade_modification_cancellation_status_response_message_at = trade_modification_cancellation_status_response_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_modification_cancellation_status_response_message_record.trd_mod_cxl_bit; at = at + 1;
  wire[at] = trade_modification_cancellation_status_response_message_record.reserved_1; at = at + 1;
  skip
}

/* Trade Modification Cancellation Status Response Message off the wire, 6 bytes from where the cursor stands */
inline decode_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_record) {
  trade_modification_cancellation_status_response_message_at = 0;
  do
  :: trade_modification_cancellation_status_response_message_at < 4 -> trade_modification_cancellation_status_response_message_record.user_id[trade_modification_cancellation_status_response_message_at] = wire[at]; at = at + 1; trade_modification_cancellation_status_response_message_at = trade_modification_cancellation_status_response_message_at + 1
  :: else -> break
  od;
  trade_modification_cancellation_status_response_message_record.trd_mod_cxl_bit = wire[at]; at = at + 1;
  trade_modification_cancellation_status_response_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Modification Cancellation Status Response Message is what was written, byte for byte */
inline equal_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_read, trade_modification_cancellation_status_response_message_written) {
  trade_modification_cancellation_status_response_message_at = 0;
  do
  :: trade_modification_cancellation_status_response_message_at < 4 -> assert(trade_modification_cancellation_status_response_message_read.user_id[trade_modification_cancellation_status_response_message_at] == trade_modification_cancellation_status_response_message_written.user_id[trade_modification_cancellation_status_response_message_at]); trade_modification_cancellation_status_response_message_at = trade_modification_cancellation_status_response_message_at + 1
  :: else -> break
  od;
  assert(trade_modification_cancellation_status_response_message_read.trd_mod_cxl_bit == trade_modification_cancellation_status_response_message_written.trd_mod_cxl_bit);
  assert(trade_modification_cancellation_status_response_message_read.reserved_1 == trade_modification_cancellation_status_response_message_written.reserved_1);
  skip
}

/* ---- Inner Header: 40 bytes -------------------------------------------------- */

/* Forty byte header prefacing each downloaded record */
typedef InnerHeader {
  byte inner_trader_id[4];
  byte inner_log_time[4];
  byte inner_alpha_char[2];
  byte inner_transaction_code[2];
  byte inner_error_code[2];
  byte inner_timestamp[8];
  byte inner_time_stamp_1[8];
  byte inner_time_stamp_2[8];
  byte inner_message_length[2]
};

int inner_header_at;

/* every byte of Inner Header set to one value */
inline fill_inner_header(inner_header_record, inner_header_value) {
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_trader_id[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_log_time[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_alpha_char[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_transaction_code[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_error_code[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_timestamp[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_1[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_2[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_message_length[inner_header_at] = inner_header_value; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Inner Header set to where it lies, so a field read out of place says so */
inline ramp_inner_header(inner_header_record, inner_header_base) {
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_trader_id[inner_header_at] = (inner_header_base + 0 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_log_time[inner_header_at] = (inner_header_base + 4 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_alpha_char[inner_header_at] = (inner_header_base + 8 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_transaction_code[inner_header_at] = (inner_header_base + 10 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_error_code[inner_header_at] = (inner_header_base + 12 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_timestamp[inner_header_at] = (inner_header_base + 14 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_1[inner_header_at] = (inner_header_base + 22 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_2[inner_header_at] = (inner_header_base + 30 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_message_length[inner_header_at] = (inner_header_base + 38 + inner_header_at + 1) % 256; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  skip
}

/* Inner Header to the wire, 40 bytes from where the cursor stands */
inline encode_inner_header(inner_header_record) {
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> wire[at] = inner_header_record.inner_trader_id[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> wire[at] = inner_header_record.inner_log_time[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> wire[at] = inner_header_record.inner_alpha_char[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> wire[at] = inner_header_record.inner_transaction_code[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> wire[at] = inner_header_record.inner_error_code[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> wire[at] = inner_header_record.inner_timestamp[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> wire[at] = inner_header_record.inner_time_stamp_1[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> wire[at] = inner_header_record.inner_time_stamp_2[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> wire[at] = inner_header_record.inner_message_length[inner_header_at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  skip
}

/* Inner Header off the wire, 40 bytes from where the cursor stands */
inline decode_inner_header(inner_header_record) {
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_trader_id[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> inner_header_record.inner_log_time[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_alpha_char[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_transaction_code[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_error_code[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_timestamp[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_1[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> inner_header_record.inner_time_stamp_2[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> inner_header_record.inner_message_length[inner_header_at] = wire[at]; at = at + 1; inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Inner Header is what was written, byte for byte */
inline equal_inner_header(inner_header_read, inner_header_written) {
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> assert(inner_header_read.inner_trader_id[inner_header_at] == inner_header_written.inner_trader_id[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 4 -> assert(inner_header_read.inner_log_time[inner_header_at] == inner_header_written.inner_log_time[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> assert(inner_header_read.inner_alpha_char[inner_header_at] == inner_header_written.inner_alpha_char[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> assert(inner_header_read.inner_transaction_code[inner_header_at] == inner_header_written.inner_transaction_code[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> assert(inner_header_read.inner_error_code[inner_header_at] == inner_header_written.inner_error_code[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> assert(inner_header_read.inner_timestamp[inner_header_at] == inner_header_written.inner_timestamp[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> assert(inner_header_read.inner_time_stamp_1[inner_header_at] == inner_header_written.inner_time_stamp_1[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 8 -> assert(inner_header_read.inner_time_stamp_2[inner_header_at] == inner_header_written.inner_time_stamp_2[inner_header_at]); inner_header_at = inner_header_at + 1
  :: else -> break
  od;
  inner_header_at = 0;
  do
  :: inner_header_at < 2 -> assert(inner_header_read.inner_message_length[inner_header_at] == inner_header_written.inner_message_length[inner_header_at]); inner_header_at = inner_header_at + 1
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
    assert(at == 40);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 40);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Cancel On Logout Status Response Message: encoded, read back, and compared */
proctype check_cancel_on_logout_status_response_message() {
  CancelOnLogoutStatusResponseMessage cancel_on_logout_status_response_message_sent;
  CancelOnLogoutStatusResponseMessage cancel_on_logout_status_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_sent, 0)
  :: pattern == 1 -> fill_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_sent, 32)
  :: pattern == 2 -> fill_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_sent, 255)
  :: else -> ramp_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_sent);
    assert(at == 6);
    at = 0;
    decode_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_got);
    assert(at == 6);
    equal_cancel_on_logout_status_response_message(cancel_on_logout_status_response_message_got, cancel_on_logout_status_response_message_sent)
  }
}

/* Sec Info: encoded, read back, and compared */
proctype check_sec_info() {
  SecInfo sec_info_sent;
  SecInfo sec_info_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sec_info(sec_info_sent, 0)
  :: pattern == 1 -> fill_sec_info(sec_info_sent, 32)
  :: pattern == 2 -> fill_sec_info(sec_info_sent, 255)
  :: else -> ramp_sec_info(sec_info_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sec_info(sec_info_sent);
    assert(at == 12);
    at = 0;
    decode_sec_info(sec_info_got);
    assert(at == 12);
    equal_sec_info(sec_info_got, sec_info_sent)
  }
}

/* Error Response Message: encoded, read back, and compared */
proctype check_error_response_message() {
  ErrorResponseMessage error_response_message_sent;
  ErrorResponseMessage error_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_error_response_message(error_response_message_sent, 0)
  :: pattern == 1 -> fill_error_response_message(error_response_message_sent, 32)
  :: pattern == 2 -> fill_error_response_message(error_response_message_sent, 255)
  :: else -> ramp_error_response_message(error_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_error_response_message(error_response_message_sent);
    assert(at == 140);
    at = 0;
    decode_error_response_message(error_response_message_got);
    assert(at == 140);
    equal_error_response_message(error_response_message_got, error_response_message_sent)
  }
}

/* Secure Box Registration Request Message: encoded, read back, and compared */
proctype check_secure_box_registration_request_message() {
  SecureBoxRegistrationRequestMessage secure_box_registration_request_message_sent;
  SecureBoxRegistrationRequestMessage secure_box_registration_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_secure_box_registration_request_message(secure_box_registration_request_message_sent, 0)
  :: pattern == 1 -> fill_secure_box_registration_request_message(secure_box_registration_request_message_sent, 32)
  :: pattern == 2 -> fill_secure_box_registration_request_message(secure_box_registration_request_message_sent, 255)
  :: else -> ramp_secure_box_registration_request_message(secure_box_registration_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_secure_box_registration_request_message(secure_box_registration_request_message_sent);
    assert(at == 2);
    at = 0;
    decode_secure_box_registration_request_message(secure_box_registration_request_message_got);
    assert(at == 2);
    equal_secure_box_registration_request_message(secure_box_registration_request_message_got, secure_box_registration_request_message_sent)
  }
}

/* Box Sign On Response Message: encoded, read back, and compared */
proctype check_box_sign_on_response_message() {
  BoxSignOnResponseMessage box_sign_on_response_message_sent;
  BoxSignOnResponseMessage box_sign_on_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_box_sign_on_response_message(box_sign_on_response_message_sent, 0)
  :: pattern == 1 -> fill_box_sign_on_response_message(box_sign_on_response_message_sent, 32)
  :: pattern == 2 -> fill_box_sign_on_response_message(box_sign_on_response_message_sent, 255)
  :: else -> ramp_box_sign_on_response_message(box_sign_on_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_box_sign_on_response_message(box_sign_on_response_message_sent);
    assert(at == 12);
    at = 0;
    decode_box_sign_on_response_message(box_sign_on_response_message_got);
    assert(at == 12);
    equal_box_sign_on_response_message(box_sign_on_response_message_got, box_sign_on_response_message_sent)
  }
}

/* Existing Encryption Tail: encoded, read back, and compared */
proctype check_existing_encryption_tail() {
  ExistingEncryptionTail existing_encryption_tail_sent;
  ExistingEncryptionTail existing_encryption_tail_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_existing_encryption_tail(existing_encryption_tail_sent, 0)
  :: pattern == 1 -> fill_existing_encryption_tail(existing_encryption_tail_sent, 32)
  :: pattern == 2 -> fill_existing_encryption_tail(existing_encryption_tail_sent, 255)
  :: else -> ramp_existing_encryption_tail(existing_encryption_tail_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_existing_encryption_tail(existing_encryption_tail_sent);
    assert(at == 16);
    at = 0;
    decode_existing_encryption_tail(existing_encryption_tail_got);
    assert(at == 16);
    equal_existing_encryption_tail(existing_encryption_tail_got, existing_encryption_tail_sent)
  }
}

/* New Encryption Tail: encoded, read back, and compared */
proctype check_new_encryption_tail() {
  NewEncryptionTail new_encryption_tail_sent;
  NewEncryptionTail new_encryption_tail_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_encryption_tail(new_encryption_tail_sent, 0)
  :: pattern == 1 -> fill_new_encryption_tail(new_encryption_tail_sent, 32)
  :: pattern == 2 -> fill_new_encryption_tail(new_encryption_tail_sent, 255)
  :: else -> ramp_new_encryption_tail(new_encryption_tail_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_encryption_tail(new_encryption_tail_sent);
    assert(at == 28);
    at = 0;
    decode_new_encryption_tail(new_encryption_tail_got);
    assert(at == 28);
    equal_new_encryption_tail(new_encryption_tail_got, new_encryption_tail_sent)
  }
}

/* Control Message To Trader Message: encoded, read back, and compared */
proctype check_control_message_to_trader_message() {
  ControlMessageToTraderMessage control_message_to_trader_message_sent;
  ControlMessageToTraderMessage control_message_to_trader_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_control_message_to_trader_message(control_message_to_trader_message_sent, 0)
  :: pattern == 1 -> fill_control_message_to_trader_message(control_message_to_trader_message_sent, 32)
  :: pattern == 2 -> fill_control_message_to_trader_message(control_message_to_trader_message_sent, 255)
  :: else -> ramp_control_message_to_trader_message(control_message_to_trader_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_control_message_to_trader_message(control_message_to_trader_message_sent);
    assert(at == 250);
    at = 0;
    decode_control_message_to_trader_message(control_message_to_trader_message_got);
    assert(at == 250);
    equal_control_message_to_trader_message(control_message_to_trader_message_got, control_message_to_trader_message_sent)
  }
}

/* Password Reset Out Message: encoded, read back, and compared */
proctype check_password_reset_out_message() {
  PasswordResetOutMessage password_reset_out_message_sent;
  PasswordResetOutMessage password_reset_out_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_password_reset_out_message(password_reset_out_message_sent, 0)
  :: pattern == 1 -> fill_password_reset_out_message(password_reset_out_message_sent, 32)
  :: pattern == 2 -> fill_password_reset_out_message(password_reset_out_message_sent, 255)
  :: else -> ramp_password_reset_out_message(password_reset_out_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_password_reset_out_message(password_reset_out_message_sent);
    assert(at == 18);
    at = 0;
    decode_password_reset_out_message(password_reset_out_message_got);
    assert(at == 18);
    equal_password_reset_out_message(password_reset_out_message_got, password_reset_out_message_sent)
  }
}

/* Trade Inquiry Out Message: encoded, read back, and compared */
proctype check_trade_inquiry_out_message() {
  TradeInquiryOutMessage trade_inquiry_out_message_sent;
  TradeInquiryOutMessage trade_inquiry_out_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_inquiry_out_message(trade_inquiry_out_message_sent, 0)
  :: pattern == 1 -> fill_trade_inquiry_out_message(trade_inquiry_out_message_sent, 32)
  :: pattern == 2 -> fill_trade_inquiry_out_message(trade_inquiry_out_message_sent, 255)
  :: else -> ramp_trade_inquiry_out_message(trade_inquiry_out_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_inquiry_out_message(trade_inquiry_out_message_sent);
    assert(at == 170);
    at = 0;
    decode_trade_inquiry_out_message(trade_inquiry_out_message_got);
    assert(at == 170);
    equal_trade_inquiry_out_message(trade_inquiry_out_message_got, trade_inquiry_out_message_sent)
  }
}

/* Update Local Database Header Message: encoded, read back, and compared */
proctype check_update_local_database_header_message() {
  UpdateLocalDatabaseHeaderMessage update_local_database_header_message_sent;
  UpdateLocalDatabaseHeaderMessage update_local_database_header_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_update_local_database_header_message(update_local_database_header_message_sent, 0)
  :: pattern == 1 -> fill_update_local_database_header_message(update_local_database_header_message_sent, 32)
  :: pattern == 2 -> fill_update_local_database_header_message(update_local_database_header_message_sent, 255)
  :: else -> ramp_update_local_database_header_message(update_local_database_header_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_update_local_database_header_message(update_local_database_header_message_sent);
    assert(at == 2);
    at = 0;
    decode_update_local_database_header_message(update_local_database_header_message_got);
    assert(at == 2);
    equal_update_local_database_header_message(update_local_database_header_message_got, update_local_database_header_message_sent)
  }
}

/* Update Local Database Trailer Message: encoded, read back, and compared */
proctype check_update_local_database_trailer_message() {
  UpdateLocalDatabaseTrailerMessage update_local_database_trailer_message_sent;
  UpdateLocalDatabaseTrailerMessage update_local_database_trailer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_update_local_database_trailer_message(update_local_database_trailer_message_sent, 0)
  :: pattern == 1 -> fill_update_local_database_trailer_message(update_local_database_trailer_message_sent, 32)
  :: pattern == 2 -> fill_update_local_database_trailer_message(update_local_database_trailer_message_sent, 255)
  :: else -> ramp_update_local_database_trailer_message(update_local_database_trailer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_update_local_database_trailer_message(update_local_database_trailer_message_sent);
    assert(at == 2);
    at = 0;
    decode_update_local_database_trailer_message(update_local_database_trailer_message_got);
    assert(at == 2);
    equal_update_local_database_trailer_message(update_local_database_trailer_message_got, update_local_database_trailer_message_sent)
  }
}

/* User Unlock Approval Rejection Message: encoded, read back, and compared */
proctype check_user_unlock_approval_rejection_message() {
  UserUnlockApprovalRejectionMessage user_unlock_approval_rejection_message_sent;
  UserUnlockApprovalRejectionMessage user_unlock_approval_rejection_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_sent, 0)
  :: pattern == 1 -> fill_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_sent, 32)
  :: pattern == 2 -> fill_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_sent, 255)
  :: else -> ramp_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_sent);
    assert(at == 4);
    at = 0;
    decode_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_got);
    assert(at == 4);
    equal_user_unlock_approval_rejection_message(user_unlock_approval_rejection_message_got, user_unlock_approval_rejection_message_sent)
  }
}

/* User Unlock Requested Response Message: encoded, read back, and compared */
proctype check_user_unlock_requested_response_message() {
  UserUnlockRequestedResponseMessage user_unlock_requested_response_message_sent;
  UserUnlockRequestedResponseMessage user_unlock_requested_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_unlock_requested_response_message(user_unlock_requested_response_message_sent, 0)
  :: pattern == 1 -> fill_user_unlock_requested_response_message(user_unlock_requested_response_message_sent, 32)
  :: pattern == 2 -> fill_user_unlock_requested_response_message(user_unlock_requested_response_message_sent, 255)
  :: else -> ramp_user_unlock_requested_response_message(user_unlock_requested_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_unlock_requested_response_message(user_unlock_requested_response_message_sent);
    assert(at == 4);
    at = 0;
    decode_user_unlock_requested_response_message(user_unlock_requested_response_message_got);
    assert(at == 4);
    equal_user_unlock_requested_response_message(user_unlock_requested_response_message_got, user_unlock_requested_response_message_sent)
  }
}

/* Trade Modification Cancellation Status Response Message: encoded, read back, and compared */
proctype check_trade_modification_cancellation_status_response_message() {
  TradeModificationCancellationStatusResponseMessage trade_modification_cancellation_status_response_message_sent;
  TradeModificationCancellationStatusResponseMessage trade_modification_cancellation_status_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_sent, 0)
  :: pattern == 1 -> fill_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_sent, 32)
  :: pattern == 2 -> fill_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_sent, 255)
  :: else -> ramp_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_sent);
    assert(at == 6);
    at = 0;
    decode_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_got);
    assert(at == 6);
    equal_trade_modification_cancellation_status_response_message(trade_modification_cancellation_status_response_message_got, trade_modification_cancellation_status_response_message_sent)
  }
}

/* Inner Header: encoded, read back, and compared */
proctype check_inner_header() {
  InnerHeader inner_header_sent;
  InnerHeader inner_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_inner_header(inner_header_sent, 0)
  :: pattern == 1 -> fill_inner_header(inner_header_sent, 32)
  :: pattern == 2 -> fill_inner_header(inner_header_sent, 255)
  :: else -> ramp_inner_header(inner_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_inner_header(inner_header_sent);
    assert(at == 40);
    at = 0;
    decode_inner_header(inner_header_got);
    assert(at == 40);
    equal_inner_header(inner_header_got, inner_header_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_cancel_on_logout_status_response_message()
  :: run check_sec_info()
  :: run check_error_response_message()
  :: run check_secure_box_registration_request_message()
  :: run check_box_sign_on_response_message()
  :: run check_existing_encryption_tail()
  :: run check_new_encryption_tail()
  :: run check_control_message_to_trader_message()
  :: run check_password_reset_out_message()
  :: run check_trade_inquiry_out_message()
  :: run check_update_local_database_header_message()
  :: run check_update_local_database_trailer_message()
  :: run check_user_unlock_approval_rejection_message()
  :: run check_user_unlock_requested_response_message()
  :: run check_trade_modification_cancellation_status_response_message()
  :: run check_inner_header()
  fi
}
