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
 *   - the dispatch that chooses a message by its type
 *   - a Composite rule
 *   - a field read in bits
 *   - a length prefix framing what follows
 *   - a run of a stated number of entries
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 276

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

/* ---- Error Response Body: 142 bytes ------------------------------------------ */

/* Error Response Body */
typedef ErrorResponseBody {
  byte key[14];
  byte error_message[128]
};

int error_response_body_at;

/* every byte of Error Response Body set to one value */
inline fill_error_response_body(error_response_body_record, error_response_body_value) {
  error_response_body_at = 0;
  do
  :: error_response_body_at < 14 -> error_response_body_record.key[error_response_body_at] = error_response_body_value; error_response_body_at = error_response_body_at + 1
  :: else -> break
  od;
  error_response_body_at = 0;
  do
  :: error_response_body_at < 128 -> error_response_body_record.error_message[error_response_body_at] = error_response_body_value; error_response_body_at = error_response_body_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Error Response Body set to where it lies, so a field read out of place says so */
inline ramp_error_response_body(error_response_body_record, error_response_body_base) {
  error_response_body_at = 0;
  do
  :: error_response_body_at < 14 -> error_response_body_record.key[error_response_body_at] = (error_response_body_base + 0 + error_response_body_at + 1) % 256; error_response_body_at = error_response_body_at + 1
  :: else -> break
  od;
  error_response_body_at = 0;
  do
  :: error_response_body_at < 128 -> error_response_body_record.error_message[error_response_body_at] = (error_response_body_base + 14 + error_response_body_at + 1) % 256; error_response_body_at = error_response_body_at + 1
  :: else -> break
  od;
  skip
}

/* Error Response Body to the wire, 142 bytes from where the cursor stands */
inline encode_error_response_body(error_response_body_record) {
  error_response_body_at = 0;
  do
  :: error_response_body_at < 14 -> wire[at] = error_response_body_record.key[error_response_body_at]; at = at + 1; error_response_body_at = error_response_body_at + 1
  :: else -> break
  od;
  error_response_body_at = 0;
  do
  :: error_response_body_at < 128 -> wire[at] = error_response_body_record.error_message[error_response_body_at]; at = at + 1; error_response_body_at = error_response_body_at + 1
  :: else -> break
  od;
  skip
}

/* Error Response Body off the wire, 142 bytes from where the cursor stands */
inline decode_error_response_body(error_response_body_record) {
  error_response_body_at = 0;
  do
  :: error_response_body_at < 14 -> error_response_body_record.key[error_response_body_at] = wire[at]; at = at + 1; error_response_body_at = error_response_body_at + 1
  :: else -> break
  od;
  error_response_body_at = 0;
  do
  :: error_response_body_at < 128 -> error_response_body_record.error_message[error_response_body_at] = wire[at]; at = at + 1; error_response_body_at = error_response_body_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Error Response Body is what was written, byte for byte */
inline equal_error_response_body(error_response_body_read, error_response_body_written) {
  error_response_body_at = 0;
  do
  :: error_response_body_at < 14 -> assert(error_response_body_read.key[error_response_body_at] == error_response_body_written.key[error_response_body_at]); error_response_body_at = error_response_body_at + 1
  :: else -> break
  od;
  error_response_body_at = 0;
  do
  :: error_response_body_at < 128 -> assert(error_response_body_read.error_message[error_response_body_at] == error_response_body_written.error_message[error_response_body_at]); error_response_body_at = error_response_body_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sign Off Request Out Message: 150 bytes --------------------------------- */

/* Details of the user's last log off, sent when the user logs on again */
typedef SignOffRequestOutMessage {
  byte user_id[4];
  byte reserved_145[145];
  byte reserved_1
};

int sign_off_request_out_message_at;

/* every byte of Sign Off Request Out Message set to one value */
inline fill_sign_off_request_out_message(sign_off_request_out_message_record, sign_off_request_out_message_value) {
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 4 -> sign_off_request_out_message_record.user_id[sign_off_request_out_message_at] = sign_off_request_out_message_value; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 145 -> sign_off_request_out_message_record.reserved_145[sign_off_request_out_message_at] = sign_off_request_out_message_value; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_record.reserved_1 = sign_off_request_out_message_value;
  skip
}

/* each byte of Sign Off Request Out Message set to where it lies, so a field read out of place says so */
inline ramp_sign_off_request_out_message(sign_off_request_out_message_record, sign_off_request_out_message_base) {
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 4 -> sign_off_request_out_message_record.user_id[sign_off_request_out_message_at] = (sign_off_request_out_message_base + 0 + sign_off_request_out_message_at + 1) % 256; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 145 -> sign_off_request_out_message_record.reserved_145[sign_off_request_out_message_at] = (sign_off_request_out_message_base + 4 + sign_off_request_out_message_at + 1) % 256; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_record.reserved_1 = (sign_off_request_out_message_base + 149 + 1) % 256;
  skip
}

/* Sign Off Request Out Message to the wire, 150 bytes from where the cursor stands */
inline encode_sign_off_request_out_message(sign_off_request_out_message_record) {
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 4 -> wire[at] = sign_off_request_out_message_record.user_id[sign_off_request_out_message_at]; at = at + 1; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 145 -> wire[at] = sign_off_request_out_message_record.reserved_145[sign_off_request_out_message_at]; at = at + 1; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  wire[at] = sign_off_request_out_message_record.reserved_1; at = at + 1;
  skip
}

/* Sign Off Request Out Message off the wire, 150 bytes from where the cursor stands */
inline decode_sign_off_request_out_message(sign_off_request_out_message_record) {
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 4 -> sign_off_request_out_message_record.user_id[sign_off_request_out_message_at] = wire[at]; at = at + 1; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 145 -> sign_off_request_out_message_record.reserved_145[sign_off_request_out_message_at] = wire[at]; at = at + 1; sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Sign Off Request Out Message is what was written, byte for byte */
inline equal_sign_off_request_out_message(sign_off_request_out_message_read, sign_off_request_out_message_written) {
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 4 -> assert(sign_off_request_out_message_read.user_id[sign_off_request_out_message_at] == sign_off_request_out_message_written.user_id[sign_off_request_out_message_at]); sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  sign_off_request_out_message_at = 0;
  do
  :: sign_off_request_out_message_at < 145 -> assert(sign_off_request_out_message_read.reserved_145[sign_off_request_out_message_at] == sign_off_request_out_message_written.reserved_145[sign_off_request_out_message_at]); sign_off_request_out_message_at = sign_off_request_out_message_at + 1
  :: else -> break
  od;
  assert(sign_off_request_out_message_read.reserved_1 == sign_off_request_out_message_written.reserved_1);
  skip
}

/* ---- St Market Status: 8 bytes ----------------------------------------------- */

/* ST_MARKET_STATUS */
typedef StMarketStatus {
  byte normal[2];
  byte oddlot[2];
  byte spot[2];
  byte auction[2]
};

int st_market_status_at;

/* every byte of St Market Status set to one value */
inline fill_st_market_status(st_market_status_record, st_market_status_value) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.normal[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.oddlot[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.spot[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.auction[st_market_status_at] = st_market_status_value; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_market_status(st_market_status_record, st_market_status_base) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.normal[st_market_status_at] = (st_market_status_base + 0 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.oddlot[st_market_status_at] = (st_market_status_base + 2 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.spot[st_market_status_at] = (st_market_status_base + 4 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.auction[st_market_status_at] = (st_market_status_base + 6 + st_market_status_at + 1) % 256; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_market_status(st_market_status_record) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.normal[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.oddlot[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.spot[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> wire[at] = st_market_status_record.auction[st_market_status_at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_market_status(st_market_status_record) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.normal[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.oddlot[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.spot[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> st_market_status_record.auction[st_market_status_at] = wire[at]; at = at + 1; st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Market Status is what was written, byte for byte */
inline equal_st_market_status(st_market_status_read, st_market_status_written) {
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.normal[st_market_status_at] == st_market_status_written.normal[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.oddlot[st_market_status_at] == st_market_status_written.oddlot[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.spot[st_market_status_at] == st_market_status_written.spot[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  st_market_status_at = 0;
  do
  :: st_market_status_at < 2 -> assert(st_market_status_read.auction[st_market_status_at] == st_market_status_written.auction[st_market_status_at]); st_market_status_at = st_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- St Ex Market Status: 8 bytes -------------------------------------------- */

/* ST_EX_MARKET_STATUS */
typedef StExMarketStatus {
  byte normal[2];
  byte oddlot[2];
  byte spot[2];
  byte auction[2]
};

int st_ex_market_status_at;

/* every byte of St Ex Market Status set to one value */
inline fill_st_ex_market_status(st_ex_market_status_record, st_ex_market_status_value) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.normal[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.oddlot[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.spot[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.auction[st_ex_market_status_at] = st_ex_market_status_value; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Ex Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_ex_market_status(st_ex_market_status_record, st_ex_market_status_base) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.normal[st_ex_market_status_at] = (st_ex_market_status_base + 0 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.oddlot[st_ex_market_status_at] = (st_ex_market_status_base + 2 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.spot[st_ex_market_status_at] = (st_ex_market_status_base + 4 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.auction[st_ex_market_status_at] = (st_ex_market_status_base + 6 + st_ex_market_status_at + 1) % 256; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Ex Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_ex_market_status(st_ex_market_status_record) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.normal[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.oddlot[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.spot[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> wire[at] = st_ex_market_status_record.auction[st_ex_market_status_at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Ex Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_ex_market_status(st_ex_market_status_record) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.normal[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.oddlot[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.spot[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> st_ex_market_status_record.auction[st_ex_market_status_at] = wire[at]; at = at + 1; st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Ex Market Status is what was written, byte for byte */
inline equal_st_ex_market_status(st_ex_market_status_read, st_ex_market_status_written) {
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.normal[st_ex_market_status_at] == st_ex_market_status_written.normal[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.oddlot[st_ex_market_status_at] == st_ex_market_status_written.oddlot[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.spot[st_ex_market_status_at] == st_ex_market_status_written.spot[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  st_ex_market_status_at = 0;
  do
  :: st_ex_market_status_at < 2 -> assert(st_ex_market_status_read.auction[st_ex_market_status_at] == st_ex_market_status_written.auction[st_ex_market_status_at]); st_ex_market_status_at = st_ex_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- St Pl Market Status: 8 bytes -------------------------------------------- */

/* ST_PL_MARKET_STATUS */
typedef StPlMarketStatus {
  byte normal[2];
  byte oddlot[2];
  byte spot[2];
  byte auction[2]
};

int st_pl_market_status_at;

/* every byte of St Pl Market Status set to one value */
inline fill_st_pl_market_status(st_pl_market_status_record, st_pl_market_status_value) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.normal[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.oddlot[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.spot[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.auction[st_pl_market_status_at] = st_pl_market_status_value; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Pl Market Status set to where it lies, so a field read out of place says so */
inline ramp_st_pl_market_status(st_pl_market_status_record, st_pl_market_status_base) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.normal[st_pl_market_status_at] = (st_pl_market_status_base + 0 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.oddlot[st_pl_market_status_at] = (st_pl_market_status_base + 2 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.spot[st_pl_market_status_at] = (st_pl_market_status_base + 4 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.auction[st_pl_market_status_at] = (st_pl_market_status_base + 6 + st_pl_market_status_at + 1) % 256; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Pl Market Status to the wire, 8 bytes from where the cursor stands */
inline encode_st_pl_market_status(st_pl_market_status_record) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.normal[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.oddlot[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.spot[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> wire[at] = st_pl_market_status_record.auction[st_pl_market_status_at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* St Pl Market Status off the wire, 8 bytes from where the cursor stands */
inline decode_st_pl_market_status(st_pl_market_status_record) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.normal[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.oddlot[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.spot[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> st_pl_market_status_record.auction[st_pl_market_status_at] = wire[at]; at = at + 1; st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Pl Market Status is what was written, byte for byte */
inline equal_st_pl_market_status(st_pl_market_status_read, st_pl_market_status_written) {
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.normal[st_pl_market_status_at] == st_pl_market_status_written.normal[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.oddlot[st_pl_market_status_at] == st_pl_market_status_written.oddlot[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.spot[st_pl_market_status_at] == st_pl_market_status_written.spot[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  st_pl_market_status_at = 0;
  do
  :: st_pl_market_status_at < 2 -> assert(st_pl_market_status_read.auction[st_pl_market_status_at] == st_pl_market_status_written.auction[st_pl_market_status_at]); st_pl_market_status_at = st_pl_market_status_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Update Local Database Header Message: 2 bytes --------------------------- */

/* Opens the local database download */
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

/* Closes the local database download */
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

/* ---- Inner Header: 40 bytes -------------------------------------------------- */

/* INNER_MESSAGE_HEADER */
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

/* ---- Contract Desc: 28 bytes ------------------------------------------------- */

/* CONTRACT_DESC */
typedef ContractDesc {
  byte instrument_name[6];
  byte symbol[10];
  byte expiry_date[4];
  byte strike_price[4];
  byte option_type[2];
  byte ca_level[2]
};

int contract_desc_at;

/* every byte of Contract Desc set to one value */
inline fill_contract_desc(contract_desc_record, contract_desc_value) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> contract_desc_record.instrument_name[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> contract_desc_record.symbol[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.expiry_date[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.strike_price[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.option_type[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.ca_level[contract_desc_at] = contract_desc_value; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Contract Desc set to where it lies, so a field read out of place says so */
inline ramp_contract_desc(contract_desc_record, contract_desc_base) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> contract_desc_record.instrument_name[contract_desc_at] = (contract_desc_base + 0 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> contract_desc_record.symbol[contract_desc_at] = (contract_desc_base + 6 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.expiry_date[contract_desc_at] = (contract_desc_base + 16 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.strike_price[contract_desc_at] = (contract_desc_base + 20 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.option_type[contract_desc_at] = (contract_desc_base + 24 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.ca_level[contract_desc_at] = (contract_desc_base + 26 + contract_desc_at + 1) % 256; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* Contract Desc to the wire, 28 bytes from where the cursor stands */
inline encode_contract_desc(contract_desc_record) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> wire[at] = contract_desc_record.instrument_name[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> wire[at] = contract_desc_record.symbol[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> wire[at] = contract_desc_record.expiry_date[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> wire[at] = contract_desc_record.strike_price[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> wire[at] = contract_desc_record.option_type[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> wire[at] = contract_desc_record.ca_level[contract_desc_at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* Contract Desc off the wire, 28 bytes from where the cursor stands */
inline decode_contract_desc(contract_desc_record) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> contract_desc_record.instrument_name[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> contract_desc_record.symbol[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.expiry_date[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> contract_desc_record.strike_price[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.option_type[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> contract_desc_record.ca_level[contract_desc_at] = wire[at]; at = at + 1; contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Contract Desc is what was written, byte for byte */
inline equal_contract_desc(contract_desc_read, contract_desc_written) {
  contract_desc_at = 0;
  do
  :: contract_desc_at < 6 -> assert(contract_desc_read.instrument_name[contract_desc_at] == contract_desc_written.instrument_name[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 10 -> assert(contract_desc_read.symbol[contract_desc_at] == contract_desc_written.symbol[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> assert(contract_desc_read.expiry_date[contract_desc_at] == contract_desc_written.expiry_date[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 4 -> assert(contract_desc_read.strike_price[contract_desc_at] == contract_desc_written.strike_price[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> assert(contract_desc_read.option_type[contract_desc_at] == contract_desc_written.option_type[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  contract_desc_at = 0;
  do
  :: contract_desc_at < 2 -> assert(contract_desc_read.ca_level[contract_desc_at] == contract_desc_written.ca_level[contract_desc_at]); contract_desc_at = contract_desc_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Inquiry Body: 194 bytes ------------------------------------------- */

/* Trade Inquiry Body */
typedef TradeInquiryBody {
  byte token_no[4];
  ContractDesc contract_desc;
  byte fill_number[4];
  byte fill_quantity[4];
  byte fill_price[4];
  byte mkt_type;
  byte buy_open_close;
  byte new_volume[4];
  byte buy_broker_id[5];
  byte sell_broker_id[5];
  byte trader_id[4];
  byte requested_by;
  byte sell_open_close;
  byte buy_account_number[10];
  byte sell_account_number[10];
  byte buy_participant[12];
  byte sell_participant[12];
  byte reserved_2[2];
  byte buy_giveup_flag;
  byte sell_giveup_flag;
  byte reserved_80[80]
};

int trade_inquiry_body_at;

/* every byte of Trade Inquiry Body set to one value */
inline fill_trade_inquiry_body(trade_inquiry_body_record, trade_inquiry_body_value) {
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.token_no[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  fill_contract_desc(trade_inquiry_body_record.contract_desc, trade_inquiry_body_value);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_number[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_quantity[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_price[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.mkt_type = trade_inquiry_body_value;
  trade_inquiry_body_record.buy_open_close = trade_inquiry_body_value;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.new_volume[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.buy_broker_id[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.sell_broker_id[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.trader_id[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.requested_by = trade_inquiry_body_value;
  trade_inquiry_body_record.sell_open_close = trade_inquiry_body_value;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.buy_account_number[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.sell_account_number[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.buy_participant[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.sell_participant[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 2 -> trade_inquiry_body_record.reserved_2[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.buy_giveup_flag = trade_inquiry_body_value;
  trade_inquiry_body_record.sell_giveup_flag = trade_inquiry_body_value;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 80 -> trade_inquiry_body_record.reserved_80[trade_inquiry_body_at] = trade_inquiry_body_value; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Inquiry Body set to where it lies, so a field read out of place says so */
inline ramp_trade_inquiry_body(trade_inquiry_body_record, trade_inquiry_body_base) {
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.token_no[trade_inquiry_body_at] = (trade_inquiry_body_base + 0 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  ramp_contract_desc(trade_inquiry_body_record.contract_desc, trade_inquiry_body_base + 4);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_number[trade_inquiry_body_at] = (trade_inquiry_body_base + 32 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_quantity[trade_inquiry_body_at] = (trade_inquiry_body_base + 36 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_price[trade_inquiry_body_at] = (trade_inquiry_body_base + 40 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.mkt_type = (trade_inquiry_body_base + 44 + 1) % 256;
  trade_inquiry_body_record.buy_open_close = (trade_inquiry_body_base + 45 + 1) % 256;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.new_volume[trade_inquiry_body_at] = (trade_inquiry_body_base + 46 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.buy_broker_id[trade_inquiry_body_at] = (trade_inquiry_body_base + 50 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.sell_broker_id[trade_inquiry_body_at] = (trade_inquiry_body_base + 55 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.trader_id[trade_inquiry_body_at] = (trade_inquiry_body_base + 60 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.requested_by = (trade_inquiry_body_base + 64 + 1) % 256;
  trade_inquiry_body_record.sell_open_close = (trade_inquiry_body_base + 65 + 1) % 256;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.buy_account_number[trade_inquiry_body_at] = (trade_inquiry_body_base + 66 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.sell_account_number[trade_inquiry_body_at] = (trade_inquiry_body_base + 76 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.buy_participant[trade_inquiry_body_at] = (trade_inquiry_body_base + 86 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.sell_participant[trade_inquiry_body_at] = (trade_inquiry_body_base + 98 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 2 -> trade_inquiry_body_record.reserved_2[trade_inquiry_body_at] = (trade_inquiry_body_base + 110 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.buy_giveup_flag = (trade_inquiry_body_base + 112 + 1) % 256;
  trade_inquiry_body_record.sell_giveup_flag = (trade_inquiry_body_base + 113 + 1) % 256;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 80 -> trade_inquiry_body_record.reserved_80[trade_inquiry_body_at] = (trade_inquiry_body_base + 114 + trade_inquiry_body_at + 1) % 256; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Inquiry Body to the wire, 194 bytes from where the cursor stands */
inline encode_trade_inquiry_body(trade_inquiry_body_record) {
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.token_no[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  encode_contract_desc(trade_inquiry_body_record.contract_desc);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.fill_number[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.fill_quantity[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.fill_price[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  wire[at] = trade_inquiry_body_record.mkt_type; at = at + 1;
  wire[at] = trade_inquiry_body_record.buy_open_close; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.new_volume[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> wire[at] = trade_inquiry_body_record.buy_broker_id[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> wire[at] = trade_inquiry_body_record.sell_broker_id[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> wire[at] = trade_inquiry_body_record.trader_id[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  wire[at] = trade_inquiry_body_record.requested_by; at = at + 1;
  wire[at] = trade_inquiry_body_record.sell_open_close; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> wire[at] = trade_inquiry_body_record.buy_account_number[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> wire[at] = trade_inquiry_body_record.sell_account_number[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> wire[at] = trade_inquiry_body_record.buy_participant[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> wire[at] = trade_inquiry_body_record.sell_participant[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 2 -> wire[at] = trade_inquiry_body_record.reserved_2[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  wire[at] = trade_inquiry_body_record.buy_giveup_flag; at = at + 1;
  wire[at] = trade_inquiry_body_record.sell_giveup_flag; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 80 -> wire[at] = trade_inquiry_body_record.reserved_80[trade_inquiry_body_at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Inquiry Body off the wire, 194 bytes from where the cursor stands */
inline decode_trade_inquiry_body(trade_inquiry_body_record) {
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.token_no[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  decode_contract_desc(trade_inquiry_body_record.contract_desc);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_number[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_quantity[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.fill_price[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.mkt_type = wire[at]; at = at + 1;
  trade_inquiry_body_record.buy_open_close = wire[at]; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.new_volume[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.buy_broker_id[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> trade_inquiry_body_record.sell_broker_id[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> trade_inquiry_body_record.trader_id[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.requested_by = wire[at]; at = at + 1;
  trade_inquiry_body_record.sell_open_close = wire[at]; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.buy_account_number[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> trade_inquiry_body_record.sell_account_number[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.buy_participant[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> trade_inquiry_body_record.sell_participant[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 2 -> trade_inquiry_body_record.reserved_2[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_record.buy_giveup_flag = wire[at]; at = at + 1;
  trade_inquiry_body_record.sell_giveup_flag = wire[at]; at = at + 1;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 80 -> trade_inquiry_body_record.reserved_80[trade_inquiry_body_at] = wire[at]; at = at + 1; trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Inquiry Body is what was written, byte for byte */
inline equal_trade_inquiry_body(trade_inquiry_body_read, trade_inquiry_body_written) {
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.token_no[trade_inquiry_body_at] == trade_inquiry_body_written.token_no[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  equal_contract_desc(trade_inquiry_body_read.contract_desc, trade_inquiry_body_written.contract_desc);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.fill_number[trade_inquiry_body_at] == trade_inquiry_body_written.fill_number[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.fill_quantity[trade_inquiry_body_at] == trade_inquiry_body_written.fill_quantity[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.fill_price[trade_inquiry_body_at] == trade_inquiry_body_written.fill_price[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  assert(trade_inquiry_body_read.mkt_type == trade_inquiry_body_written.mkt_type);
  assert(trade_inquiry_body_read.buy_open_close == trade_inquiry_body_written.buy_open_close);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.new_volume[trade_inquiry_body_at] == trade_inquiry_body_written.new_volume[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> assert(trade_inquiry_body_read.buy_broker_id[trade_inquiry_body_at] == trade_inquiry_body_written.buy_broker_id[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 5 -> assert(trade_inquiry_body_read.sell_broker_id[trade_inquiry_body_at] == trade_inquiry_body_written.sell_broker_id[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 4 -> assert(trade_inquiry_body_read.trader_id[trade_inquiry_body_at] == trade_inquiry_body_written.trader_id[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  assert(trade_inquiry_body_read.requested_by == trade_inquiry_body_written.requested_by);
  assert(trade_inquiry_body_read.sell_open_close == trade_inquiry_body_written.sell_open_close);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> assert(trade_inquiry_body_read.buy_account_number[trade_inquiry_body_at] == trade_inquiry_body_written.buy_account_number[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 10 -> assert(trade_inquiry_body_read.sell_account_number[trade_inquiry_body_at] == trade_inquiry_body_written.sell_account_number[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> assert(trade_inquiry_body_read.buy_participant[trade_inquiry_body_at] == trade_inquiry_body_written.buy_participant[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 12 -> assert(trade_inquiry_body_read.sell_participant[trade_inquiry_body_at] == trade_inquiry_body_written.sell_participant[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 2 -> assert(trade_inquiry_body_read.reserved_2[trade_inquiry_body_at] == trade_inquiry_body_written.reserved_2[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  assert(trade_inquiry_body_read.buy_giveup_flag == trade_inquiry_body_written.buy_giveup_flag);
  assert(trade_inquiry_body_read.sell_giveup_flag == trade_inquiry_body_written.sell_giveup_flag);
  trade_inquiry_body_at = 0;
  do
  :: trade_inquiry_body_at < 80 -> assert(trade_inquiry_body_read.reserved_80[trade_inquiry_body_at] == trade_inquiry_body_written.reserved_80[trade_inquiry_body_at]); trade_inquiry_body_at = trade_inquiry_body_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Inquiry Response Message: 194 bytes ------------------------------- */

/* Trade cancellation response, trade error, trade modification rejection and the negotiated large trade rejections and cancellation confirmation, carried in the shared trade structure. Transaction Code in the header names the response */
typedef TradeInquiryResponseMessage {
  TradeInquiryBody trade_inquiry_body
};

/* every byte of Trade Inquiry Response Message set to one value */
inline fill_trade_inquiry_response_message(trade_inquiry_response_message_record, trade_inquiry_response_message_value) {
  fill_trade_inquiry_body(trade_inquiry_response_message_record.trade_inquiry_body, trade_inquiry_response_message_value);
  skip
}

/* each byte of Trade Inquiry Response Message set to where it lies, so a field read out of place says so */
inline ramp_trade_inquiry_response_message(trade_inquiry_response_message_record, trade_inquiry_response_message_base) {
  ramp_trade_inquiry_body(trade_inquiry_response_message_record.trade_inquiry_body, trade_inquiry_response_message_base + 0);
  skip
}

/* Trade Inquiry Response Message to the wire, 194 bytes from where the cursor stands */
inline encode_trade_inquiry_response_message(trade_inquiry_response_message_record) {
  encode_trade_inquiry_body(trade_inquiry_response_message_record.trade_inquiry_body);
  skip
}

/* Trade Inquiry Response Message off the wire, 194 bytes from where the cursor stands */
inline decode_trade_inquiry_response_message(trade_inquiry_response_message_record) {
  decode_trade_inquiry_body(trade_inquiry_response_message_record.trade_inquiry_body);
  skip
}

/* what was read of Trade Inquiry Response Message is what was written, byte for byte */
inline equal_trade_inquiry_response_message(trade_inquiry_response_message_read, trade_inquiry_response_message_written) {
  equal_trade_inquiry_body(trade_inquiry_response_message_read.trade_inquiry_body, trade_inquiry_response_message_written.trade_inquiry_body);
  skip
}

/* ---- Control Message To Trader Message: 250 bytes ---------------------------- */

/* Interactive message sent to the trader from Nse Ix Control */
typedef ControlMessageToTraderMessage {
  byte trader_id[4];
  byte action_code[3];
  byte reserved_1;
  byte broad_cast_message_length[2];
  byte broad_cast_message[239];
  byte second_reserved_1
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
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.broad_cast_message_length[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> control_message_to_trader_message_record.broad_cast_message[control_message_to_trader_message_at] = control_message_to_trader_message_value; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_record.second_reserved_1 = control_message_to_trader_message_value;
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
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.broad_cast_message_length[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 8 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> control_message_to_trader_message_record.broad_cast_message[control_message_to_trader_message_at] = (control_message_to_trader_message_base + 10 + control_message_to_trader_message_at + 1) % 256; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_record.second_reserved_1 = (control_message_to_trader_message_base + 249 + 1) % 256;
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
  :: control_message_to_trader_message_at < 2 -> wire[at] = control_message_to_trader_message_record.broad_cast_message_length[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> wire[at] = control_message_to_trader_message_record.broad_cast_message[control_message_to_trader_message_at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  wire[at] = control_message_to_trader_message_record.second_reserved_1; at = at + 1;
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
  :: control_message_to_trader_message_at < 2 -> control_message_to_trader_message_record.broad_cast_message_length[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> control_message_to_trader_message_record.broad_cast_message[control_message_to_trader_message_at] = wire[at]; at = at + 1; control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_record.second_reserved_1 = wire[at]; at = at + 1;
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
  :: control_message_to_trader_message_at < 2 -> assert(control_message_to_trader_message_read.broad_cast_message_length[control_message_to_trader_message_at] == control_message_to_trader_message_written.broad_cast_message_length[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  control_message_to_trader_message_at = 0;
  do
  :: control_message_to_trader_message_at < 239 -> assert(control_message_to_trader_message_read.broad_cast_message[control_message_to_trader_message_at] == control_message_to_trader_message_written.broad_cast_message[control_message_to_trader_message_at]); control_message_to_trader_message_at = control_message_to_trader_message_at + 1
  :: else -> break
  od;
  assert(control_message_to_trader_message_read.second_reserved_1 == control_message_to_trader_message_written.second_reserved_1);
  skip
}

/* ---- Report Header Body: 67 bytes -------------------------------------------- */

/* Report Header Body */
typedef ReportHeaderBody {
  byte org_scope;
  byte report_date[4];
  byte user_type[2];
  byte broker_id[5];
  byte firm_name[25];
  byte trader_number[4];
  byte trader_name[26]
};

int report_header_body_at;

/* every byte of Report Header Body set to one value */
inline fill_report_header_body(report_header_body_record, report_header_body_value) {
  report_header_body_record.org_scope = report_header_body_value;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.report_date[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> report_header_body_record.user_type[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> report_header_body_record.broker_id[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> report_header_body_record.firm_name[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.trader_number[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> report_header_body_record.trader_name[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Report Header Body set to where it lies, so a field read out of place says so */
inline ramp_report_header_body(report_header_body_record, report_header_body_base) {
  report_header_body_record.org_scope = (report_header_body_base + 0 + 1) % 256;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.report_date[report_header_body_at] = (report_header_body_base + 1 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> report_header_body_record.user_type[report_header_body_at] = (report_header_body_base + 5 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> report_header_body_record.broker_id[report_header_body_at] = (report_header_body_base + 7 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> report_header_body_record.firm_name[report_header_body_at] = (report_header_body_base + 12 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.trader_number[report_header_body_at] = (report_header_body_base + 37 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> report_header_body_record.trader_name[report_header_body_at] = (report_header_body_base + 41 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* Report Header Body to the wire, 67 bytes from where the cursor stands */
inline encode_report_header_body(report_header_body_record) {
  wire[at] = report_header_body_record.org_scope; at = at + 1;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> wire[at] = report_header_body_record.report_date[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> wire[at] = report_header_body_record.user_type[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> wire[at] = report_header_body_record.broker_id[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> wire[at] = report_header_body_record.firm_name[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> wire[at] = report_header_body_record.trader_number[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> wire[at] = report_header_body_record.trader_name[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* Report Header Body off the wire, 67 bytes from where the cursor stands */
inline decode_report_header_body(report_header_body_record) {
  report_header_body_record.org_scope = wire[at]; at = at + 1;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.report_date[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> report_header_body_record.user_type[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> report_header_body_record.broker_id[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> report_header_body_record.firm_name[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.trader_number[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> report_header_body_record.trader_name[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Report Header Body is what was written, byte for byte */
inline equal_report_header_body(report_header_body_read, report_header_body_written) {
  assert(report_header_body_read.org_scope == report_header_body_written.org_scope);
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> assert(report_header_body_read.report_date[report_header_body_at] == report_header_body_written.report_date[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> assert(report_header_body_read.user_type[report_header_body_at] == report_header_body_written.user_type[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> assert(report_header_body_read.broker_id[report_header_body_at] == report_header_body_written.broker_id[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> assert(report_header_body_read.firm_name[report_header_body_at] == report_header_body_written.firm_name[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> assert(report_header_body_read.trader_number[report_header_body_at] == report_header_body_written.trader_number[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> assert(report_header_body_read.trader_name[report_header_body_at] == report_header_body_written.trader_name[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Report Trailer Body: 5 bytes -------------------------------------------- */

/* Report Trailer Body */
typedef ReportTrailerBody {
  byte number_of_packets[4];
  byte reserved_1
};

int report_trailer_body_at;

/* every byte of Report Trailer Body set to one value */
inline fill_report_trailer_body(report_trailer_body_record, report_trailer_body_value) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> report_trailer_body_record.number_of_packets[report_trailer_body_at] = report_trailer_body_value; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  report_trailer_body_record.reserved_1 = report_trailer_body_value;
  skip
}

/* each byte of Report Trailer Body set to where it lies, so a field read out of place says so */
inline ramp_report_trailer_body(report_trailer_body_record, report_trailer_body_base) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> report_trailer_body_record.number_of_packets[report_trailer_body_at] = (report_trailer_body_base + 0 + report_trailer_body_at + 1) % 256; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  report_trailer_body_record.reserved_1 = (report_trailer_body_base + 4 + 1) % 256;
  skip
}

/* Report Trailer Body to the wire, 5 bytes from where the cursor stands */
inline encode_report_trailer_body(report_trailer_body_record) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> wire[at] = report_trailer_body_record.number_of_packets[report_trailer_body_at]; at = at + 1; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  wire[at] = report_trailer_body_record.reserved_1; at = at + 1;
  skip
}

/* Report Trailer Body off the wire, 5 bytes from where the cursor stands */
inline decode_report_trailer_body(report_trailer_body_record) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> report_trailer_body_record.number_of_packets[report_trailer_body_at] = wire[at]; at = at + 1; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  report_trailer_body_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Report Trailer Body is what was written, byte for byte */
inline equal_report_trailer_body(report_trailer_body_read, report_trailer_body_written) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> assert(report_trailer_body_read.number_of_packets[report_trailer_body_at] == report_trailer_body_written.number_of_packets[report_trailer_body_at]); report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  assert(report_trailer_body_read.reserved_1 == report_trailer_body_written.reserved_1);
  skip
}

/* ---- Spread Report Header Body: 67 bytes ------------------------------------- */

/* Spread Report Header Body */
typedef SpreadReportHeaderBody {
  byte org_scope;
  byte report_date[4];
  byte user_type[2];
  byte broker_number[5];
  byte broker_name[25];
  byte trader_number[4];
  byte trader_name[26]
};

int spread_report_header_body_at;

/* every byte of Spread Report Header Body set to one value */
inline fill_spread_report_header_body(spread_report_header_body_record, spread_report_header_body_value) {
  spread_report_header_body_record.org_scope = spread_report_header_body_value;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.report_date[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 2 -> spread_report_header_body_record.user_type[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 5 -> spread_report_header_body_record.broker_number[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 25 -> spread_report_header_body_record.broker_name[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.trader_number[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 26 -> spread_report_header_body_record.trader_name[spread_report_header_body_at] = spread_report_header_body_value; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spread Report Header Body set to where it lies, so a field read out of place says so */
inline ramp_spread_report_header_body(spread_report_header_body_record, spread_report_header_body_base) {
  spread_report_header_body_record.org_scope = (spread_report_header_body_base + 0 + 1) % 256;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.report_date[spread_report_header_body_at] = (spread_report_header_body_base + 1 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 2 -> spread_report_header_body_record.user_type[spread_report_header_body_at] = (spread_report_header_body_base + 5 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 5 -> spread_report_header_body_record.broker_number[spread_report_header_body_at] = (spread_report_header_body_base + 7 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 25 -> spread_report_header_body_record.broker_name[spread_report_header_body_at] = (spread_report_header_body_base + 12 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.trader_number[spread_report_header_body_at] = (spread_report_header_body_base + 37 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 26 -> spread_report_header_body_record.trader_name[spread_report_header_body_at] = (spread_report_header_body_base + 41 + spread_report_header_body_at + 1) % 256; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Report Header Body to the wire, 67 bytes from where the cursor stands */
inline encode_spread_report_header_body(spread_report_header_body_record) {
  wire[at] = spread_report_header_body_record.org_scope; at = at + 1;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> wire[at] = spread_report_header_body_record.report_date[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 2 -> wire[at] = spread_report_header_body_record.user_type[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 5 -> wire[at] = spread_report_header_body_record.broker_number[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 25 -> wire[at] = spread_report_header_body_record.broker_name[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> wire[at] = spread_report_header_body_record.trader_number[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 26 -> wire[at] = spread_report_header_body_record.trader_name[spread_report_header_body_at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Report Header Body off the wire, 67 bytes from where the cursor stands */
inline decode_spread_report_header_body(spread_report_header_body_record) {
  spread_report_header_body_record.org_scope = wire[at]; at = at + 1;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.report_date[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 2 -> spread_report_header_body_record.user_type[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 5 -> spread_report_header_body_record.broker_number[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 25 -> spread_report_header_body_record.broker_name[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> spread_report_header_body_record.trader_number[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 26 -> spread_report_header_body_record.trader_name[spread_report_header_body_at] = wire[at]; at = at + 1; spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spread Report Header Body is what was written, byte for byte */
inline equal_spread_report_header_body(spread_report_header_body_read, spread_report_header_body_written) {
  assert(spread_report_header_body_read.org_scope == spread_report_header_body_written.org_scope);
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> assert(spread_report_header_body_read.report_date[spread_report_header_body_at] == spread_report_header_body_written.report_date[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 2 -> assert(spread_report_header_body_read.user_type[spread_report_header_body_at] == spread_report_header_body_written.user_type[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 5 -> assert(spread_report_header_body_read.broker_number[spread_report_header_body_at] == spread_report_header_body_written.broker_number[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 25 -> assert(spread_report_header_body_read.broker_name[spread_report_header_body_at] == spread_report_header_body_written.broker_name[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 4 -> assert(spread_report_header_body_read.trader_number[spread_report_header_body_at] == spread_report_header_body_written.trader_number[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  spread_report_header_body_at = 0;
  do
  :: spread_report_header_body_at < 26 -> assert(spread_report_header_body_read.trader_name[spread_report_header_body_at] == spread_report_header_body_written.trader_name[spread_report_header_body_at]); spread_report_header_body_at = spread_report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Gateway Router Response Message: 84 bytes ------------------------------- */

/* Returns the allocated gateway server and the keys used to encrypt the session */
typedef GatewayRouterResponseMessage {
  byte box_id[2];
  byte broker_id[5];
  byte filler;
  byte ip_address[16];
  byte port[4];
  byte session_key[8];
  byte cryptographic_key[32];
  byte cryptographic_iv[16]
};

int gateway_router_response_message_at;

/* every byte of Gateway Router Response Message set to one value */
inline fill_gateway_router_response_message(gateway_router_response_message_record, gateway_router_response_message_value) {
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 2 -> gateway_router_response_message_record.box_id[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 5 -> gateway_router_response_message_record.broker_id[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_record.filler = gateway_router_response_message_value;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.ip_address[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 4 -> gateway_router_response_message_record.port[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 8 -> gateway_router_response_message_record.session_key[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 32 -> gateway_router_response_message_record.cryptographic_key[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.cryptographic_iv[gateway_router_response_message_at] = gateway_router_response_message_value; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Gateway Router Response Message set to where it lies, so a field read out of place says so */
inline ramp_gateway_router_response_message(gateway_router_response_message_record, gateway_router_response_message_base) {
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 2 -> gateway_router_response_message_record.box_id[gateway_router_response_message_at] = (gateway_router_response_message_base + 0 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 5 -> gateway_router_response_message_record.broker_id[gateway_router_response_message_at] = (gateway_router_response_message_base + 2 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_record.filler = (gateway_router_response_message_base + 7 + 1) % 256;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.ip_address[gateway_router_response_message_at] = (gateway_router_response_message_base + 8 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 4 -> gateway_router_response_message_record.port[gateway_router_response_message_at] = (gateway_router_response_message_base + 24 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 8 -> gateway_router_response_message_record.session_key[gateway_router_response_message_at] = (gateway_router_response_message_base + 28 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 32 -> gateway_router_response_message_record.cryptographic_key[gateway_router_response_message_at] = (gateway_router_response_message_base + 36 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.cryptographic_iv[gateway_router_response_message_at] = (gateway_router_response_message_base + 68 + gateway_router_response_message_at + 1) % 256; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gateway Router Response Message to the wire, 84 bytes from where the cursor stands */
inline encode_gateway_router_response_message(gateway_router_response_message_record) {
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 2 -> wire[at] = gateway_router_response_message_record.box_id[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 5 -> wire[at] = gateway_router_response_message_record.broker_id[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  wire[at] = gateway_router_response_message_record.filler; at = at + 1;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> wire[at] = gateway_router_response_message_record.ip_address[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 4 -> wire[at] = gateway_router_response_message_record.port[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 8 -> wire[at] = gateway_router_response_message_record.session_key[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 32 -> wire[at] = gateway_router_response_message_record.cryptographic_key[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> wire[at] = gateway_router_response_message_record.cryptographic_iv[gateway_router_response_message_at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gateway Router Response Message off the wire, 84 bytes from where the cursor stands */
inline decode_gateway_router_response_message(gateway_router_response_message_record) {
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 2 -> gateway_router_response_message_record.box_id[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 5 -> gateway_router_response_message_record.broker_id[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_record.filler = wire[at]; at = at + 1;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.ip_address[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 4 -> gateway_router_response_message_record.port[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 8 -> gateway_router_response_message_record.session_key[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 32 -> gateway_router_response_message_record.cryptographic_key[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> gateway_router_response_message_record.cryptographic_iv[gateway_router_response_message_at] = wire[at]; at = at + 1; gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Gateway Router Response Message is what was written, byte for byte */
inline equal_gateway_router_response_message(gateway_router_response_message_read, gateway_router_response_message_written) {
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 2 -> assert(gateway_router_response_message_read.box_id[gateway_router_response_message_at] == gateway_router_response_message_written.box_id[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 5 -> assert(gateway_router_response_message_read.broker_id[gateway_router_response_message_at] == gateway_router_response_message_written.broker_id[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  assert(gateway_router_response_message_read.filler == gateway_router_response_message_written.filler);
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> assert(gateway_router_response_message_read.ip_address[gateway_router_response_message_at] == gateway_router_response_message_written.ip_address[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 4 -> assert(gateway_router_response_message_read.port[gateway_router_response_message_at] == gateway_router_response_message_written.port[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 8 -> assert(gateway_router_response_message_read.session_key[gateway_router_response_message_at] == gateway_router_response_message_written.session_key[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 32 -> assert(gateway_router_response_message_read.cryptographic_key[gateway_router_response_message_at] == gateway_router_response_message_written.cryptographic_key[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  gateway_router_response_message_at = 0;
  do
  :: gateway_router_response_message_at < 16 -> assert(gateway_router_response_message_read.cryptographic_iv[gateway_router_response_message_at] == gateway_router_response_message_written.cryptographic_iv[gateway_router_response_message_at]); gateway_router_response_message_at = gateway_router_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Box Sign On Request Out Message: 12 bytes ------------------------------- */

/* Confirms the box sign on */
typedef BoxSignOnRequestOutMessage {
  byte box_id[2];
  byte reserved_10[10]
};

int box_sign_on_request_out_message_at;

/* every byte of Box Sign On Request Out Message set to one value */
inline fill_box_sign_on_request_out_message(box_sign_on_request_out_message_record, box_sign_on_request_out_message_value) {
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 2 -> box_sign_on_request_out_message_record.box_id[box_sign_on_request_out_message_at] = box_sign_on_request_out_message_value; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 10 -> box_sign_on_request_out_message_record.reserved_10[box_sign_on_request_out_message_at] = box_sign_on_request_out_message_value; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Box Sign On Request Out Message set to where it lies, so a field read out of place says so */
inline ramp_box_sign_on_request_out_message(box_sign_on_request_out_message_record, box_sign_on_request_out_message_base) {
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 2 -> box_sign_on_request_out_message_record.box_id[box_sign_on_request_out_message_at] = (box_sign_on_request_out_message_base + 0 + box_sign_on_request_out_message_at + 1) % 256; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 10 -> box_sign_on_request_out_message_record.reserved_10[box_sign_on_request_out_message_at] = (box_sign_on_request_out_message_base + 2 + box_sign_on_request_out_message_at + 1) % 256; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request Out Message to the wire, 12 bytes from where the cursor stands */
inline encode_box_sign_on_request_out_message(box_sign_on_request_out_message_record) {
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 2 -> wire[at] = box_sign_on_request_out_message_record.box_id[box_sign_on_request_out_message_at]; at = at + 1; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 10 -> wire[at] = box_sign_on_request_out_message_record.reserved_10[box_sign_on_request_out_message_at]; at = at + 1; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request Out Message off the wire, 12 bytes from where the cursor stands */
inline decode_box_sign_on_request_out_message(box_sign_on_request_out_message_record) {
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 2 -> box_sign_on_request_out_message_record.box_id[box_sign_on_request_out_message_at] = wire[at]; at = at + 1; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 10 -> box_sign_on_request_out_message_record.reserved_10[box_sign_on_request_out_message_at] = wire[at]; at = at + 1; box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Box Sign On Request Out Message is what was written, byte for byte */
inline equal_box_sign_on_request_out_message(box_sign_on_request_out_message_read, box_sign_on_request_out_message_written) {
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 2 -> assert(box_sign_on_request_out_message_read.box_id[box_sign_on_request_out_message_at] == box_sign_on_request_out_message_written.box_id[box_sign_on_request_out_message_at]); box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_out_message_at = 0;
  do
  :: box_sign_on_request_out_message_at < 10 -> assert(box_sign_on_request_out_message_read.reserved_10[box_sign_on_request_out_message_at] == box_sign_on_request_out_message_written.reserved_10[box_sign_on_request_out_message_at]); box_sign_on_request_out_message_at = box_sign_on_request_out_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Box Sign Off Message: 2 bytes ------------------------------------------- */

/* Signs the box off the gateway server when the exchange terminates the connection */
typedef BoxSignOffMessage {
  byte box_id[2]
};

int box_sign_off_message_at;

/* every byte of Box Sign Off Message set to one value */
inline fill_box_sign_off_message(box_sign_off_message_record, box_sign_off_message_value) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> box_sign_off_message_record.box_id[box_sign_off_message_at] = box_sign_off_message_value; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Box Sign Off Message set to where it lies, so a field read out of place says so */
inline ramp_box_sign_off_message(box_sign_off_message_record, box_sign_off_message_base) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> box_sign_off_message_record.box_id[box_sign_off_message_at] = (box_sign_off_message_base + 0 + box_sign_off_message_at + 1) % 256; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign Off Message to the wire, 2 bytes from where the cursor stands */
inline encode_box_sign_off_message(box_sign_off_message_record) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> wire[at] = box_sign_off_message_record.box_id[box_sign_off_message_at]; at = at + 1; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign Off Message off the wire, 2 bytes from where the cursor stands */
inline decode_box_sign_off_message(box_sign_off_message_record) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> box_sign_off_message_record.box_id[box_sign_off_message_at] = wire[at]; at = at + 1; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Box Sign Off Message is what was written, byte for byte */
inline equal_box_sign_off_message(box_sign_off_message_read, box_sign_off_message_written) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> assert(box_sign_off_message_read.box_id[box_sign_off_message_at] == box_sign_off_message_written.box_id[box_sign_off_message_at]); box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Contingency Broadcast Message: 204 bytes -------------------------------- */

/* Signals the start or end of an outage on one or all matching engine streams */
typedef ContingencyBroadcastMessage {
  byte stream_number[2];
  byte status[2];
  byte reserved_200[200]
};

int contingency_broadcast_message_at;

/* every byte of Contingency Broadcast Message set to one value */
inline fill_contingency_broadcast_message(contingency_broadcast_message_record, contingency_broadcast_message_value) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at] = contingency_broadcast_message_value; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.status[contingency_broadcast_message_at] = contingency_broadcast_message_value; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at] = contingency_broadcast_message_value; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Contingency Broadcast Message set to where it lies, so a field read out of place says so */
inline ramp_contingency_broadcast_message(contingency_broadcast_message_record, contingency_broadcast_message_base) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at] = (contingency_broadcast_message_base + 0 + contingency_broadcast_message_at + 1) % 256; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.status[contingency_broadcast_message_at] = (contingency_broadcast_message_base + 2 + contingency_broadcast_message_at + 1) % 256; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at] = (contingency_broadcast_message_base + 4 + contingency_broadcast_message_at + 1) % 256; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* Contingency Broadcast Message to the wire, 204 bytes from where the cursor stands */
inline encode_contingency_broadcast_message(contingency_broadcast_message_record) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> wire[at] = contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> wire[at] = contingency_broadcast_message_record.status[contingency_broadcast_message_at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> wire[at] = contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* Contingency Broadcast Message off the wire, 204 bytes from where the cursor stands */
inline decode_contingency_broadcast_message(contingency_broadcast_message_record) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at] = wire[at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.status[contingency_broadcast_message_at] = wire[at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at] = wire[at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Contingency Broadcast Message is what was written, byte for byte */
inline equal_contingency_broadcast_message(contingency_broadcast_message_read, contingency_broadcast_message_written) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> assert(contingency_broadcast_message_read.stream_number[contingency_broadcast_message_at] == contingency_broadcast_message_written.stream_number[contingency_broadcast_message_at]); contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> assert(contingency_broadcast_message_read.status[contingency_broadcast_message_at] == contingency_broadcast_message_written.status[contingency_broadcast_message_at]); contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> assert(contingency_broadcast_message_read.reserved_200[contingency_broadcast_message_at] == contingency_broadcast_message_written.reserved_200[contingency_broadcast_message_at]); contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset User Password Response Message: 18 bytes -------------------------- */

/* Answers the password reset request, Error Code in the header saying whether it succeeded */
typedef ResetUserPasswordResponseMessage {
  byte user_id[4];
  byte reserved_14[14]
};

int reset_user_password_response_message_at;

/* every byte of Reset User Password Response Message set to one value */
inline fill_reset_user_password_response_message(reset_user_password_response_message_record, reset_user_password_response_message_value) {
  reset_user_password_response_message_at = 0;
  do
  :: reset_user_password_response_message_at < 4 -> reset_user_password_response_message_record.user_id[reset_user_password_response_message_at] = reset_user_password_response_message_value; reset_user_password_response_message_at = reset_user_password_response_message_at + 1
  :: else -> break
  od;
  reset_user_password_response_message_at = 0;
  do
  :: reset_user_password_response_message_at < 14 -> reset_user_password_response_message_record.reserved_14[reset_user_password_response_message_at] = reset_user_password_response_message_value; reset_user_password_response_message_at = reset_user_password_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reset User Password Response Message set to where it lies, so a field read out of place says so */
inline ramp_reset_user_password_response_message(reset_user_password_response_message_record, reset_user_password_response_message_base) {
  reset_user_password_response_message_at = 0;
  do
  :: reset_user_password_response_message_at < 4 -> reset_user_password_response_message_record.user_id[reset_user_password_response_message_at] = (reset_user_password_response_message_base + 0 + reset_user_password_response_message_at + 1) % 256; reset_user_password_response_message_at = reset_user_password_response_message_at + 1
  :: else -> break
  od;
  reset_user_password_response_message_at = 0;
  do
  :: reset_user_password_response_message_at < 14 -> reset_user_password_response_message_record.reserved_14[reset_user_password_response_message_at] = (reset_user_password_response_message_base + 4 + reset_user_password_response_message_at + 1) % 256; reset_user_password_response_message_at = reset_user_password_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset User Password Response Message to the wire, 18 bytes from where the cursor stands */
inline encode_reset_user_password_response_message(reset_user_password_response_message_record) {
  reset_user_password_response_message_at = 0;
  do
  :: reset_user_password_response_message_at < 4 -> wire[at] = reset_user_password_response_message_record.user_id[reset_user_password_response_message_at]; at = at + 1; reset_user_password_response_message_at = reset_user_password_response_message_at + 1
  :: else -> break
  od;
  reset_user_password_response_message_at = 0;
  do
  :: reset_user_password_response_message_at < 14 -> wire[at] = reset_user_password_response_message_record.reserved_14[reset_user_password_response_message_at]; at = at + 1; reset_user_password_response_message_at = reset_user_password_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset User Password Response Message off the wire, 18 bytes from where the cursor stands */
inline decode_reset_user_password_response_message(reset_user_password_response_message_record) {
  reset_user_password_response_message_at = 0;
  do
  :: reset_user_password_response_message_at < 4 -> reset_user_password_response_message_record.user_id[reset_user_password_response_message_at] = wire[at]; at = at + 1; reset_user_password_response_message_at = reset_user_password_response_message_at + 1
  :: else -> break
  od;
  reset_user_password_response_message_at = 0;
  do
  :: reset_user_password_response_message_at < 14 -> reset_user_password_response_message_record.reserved_14[reset_user_password_response_message_at] = wire[at]; at = at + 1; reset_user_password_response_message_at = reset_user_password_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reset User Password Response Message is what was written, byte for byte */
inline equal_reset_user_password_response_message(reset_user_password_response_message_read, reset_user_password_response_message_written) {
  reset_user_password_response_message_at = 0;
  do
  :: reset_user_password_response_message_at < 4 -> assert(reset_user_password_response_message_read.user_id[reset_user_password_response_message_at] == reset_user_password_response_message_written.user_id[reset_user_password_response_message_at]); reset_user_password_response_message_at = reset_user_password_response_message_at + 1
  :: else -> break
  od;
  reset_user_password_response_message_at = 0;
  do
  :: reset_user_password_response_message_at < 14 -> assert(reset_user_password_response_message_read.reserved_14[reset_user_password_response_message_at] == reset_user_password_response_message_written.reserved_14[reset_user_password_response_message_at]); reset_user_password_response_message_at = reset_user_password_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Collateral User Status Change Response Message: 6 bytes ----------------- */

/* Answers the cancel on logout status change */
typedef CollateralUserStatusChangeResponseMessage {
  byte user_id[4];
  byte col_user_bit;
  byte reserved_1
};

int collateral_user_status_change_response_message_at;

/* every byte of Collateral User Status Change Response Message set to one value */
inline fill_collateral_user_status_change_response_message(collateral_user_status_change_response_message_record, collateral_user_status_change_response_message_value) {
  collateral_user_status_change_response_message_at = 0;
  do
  :: collateral_user_status_change_response_message_at < 4 -> collateral_user_status_change_response_message_record.user_id[collateral_user_status_change_response_message_at] = collateral_user_status_change_response_message_value; collateral_user_status_change_response_message_at = collateral_user_status_change_response_message_at + 1
  :: else -> break
  od;
  collateral_user_status_change_response_message_record.col_user_bit = collateral_user_status_change_response_message_value;
  collateral_user_status_change_response_message_record.reserved_1 = collateral_user_status_change_response_message_value;
  skip
}

/* each byte of Collateral User Status Change Response Message set to where it lies, so a field read out of place says so */
inline ramp_collateral_user_status_change_response_message(collateral_user_status_change_response_message_record, collateral_user_status_change_response_message_base) {
  collateral_user_status_change_response_message_at = 0;
  do
  :: collateral_user_status_change_response_message_at < 4 -> collateral_user_status_change_response_message_record.user_id[collateral_user_status_change_response_message_at] = (collateral_user_status_change_response_message_base + 0 + collateral_user_status_change_response_message_at + 1) % 256; collateral_user_status_change_response_message_at = collateral_user_status_change_response_message_at + 1
  :: else -> break
  od;
  collateral_user_status_change_response_message_record.col_user_bit = (collateral_user_status_change_response_message_base + 4 + 1) % 256;
  collateral_user_status_change_response_message_record.reserved_1 = (collateral_user_status_change_response_message_base + 5 + 1) % 256;
  skip
}

/* Collateral User Status Change Response Message to the wire, 6 bytes from where the cursor stands */
inline encode_collateral_user_status_change_response_message(collateral_user_status_change_response_message_record) {
  collateral_user_status_change_response_message_at = 0;
  do
  :: collateral_user_status_change_response_message_at < 4 -> wire[at] = collateral_user_status_change_response_message_record.user_id[collateral_user_status_change_response_message_at]; at = at + 1; collateral_user_status_change_response_message_at = collateral_user_status_change_response_message_at + 1
  :: else -> break
  od;
  wire[at] = collateral_user_status_change_response_message_record.col_user_bit; at = at + 1;
  wire[at] = collateral_user_status_change_response_message_record.reserved_1; at = at + 1;
  skip
}

/* Collateral User Status Change Response Message off the wire, 6 bytes from where the cursor stands */
inline decode_collateral_user_status_change_response_message(collateral_user_status_change_response_message_record) {
  collateral_user_status_change_response_message_at = 0;
  do
  :: collateral_user_status_change_response_message_at < 4 -> collateral_user_status_change_response_message_record.user_id[collateral_user_status_change_response_message_at] = wire[at]; at = at + 1; collateral_user_status_change_response_message_at = collateral_user_status_change_response_message_at + 1
  :: else -> break
  od;
  collateral_user_status_change_response_message_record.col_user_bit = wire[at]; at = at + 1;
  collateral_user_status_change_response_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Collateral User Status Change Response Message is what was written, byte for byte */
inline equal_collateral_user_status_change_response_message(collateral_user_status_change_response_message_read, collateral_user_status_change_response_message_written) {
  collateral_user_status_change_response_message_at = 0;
  do
  :: collateral_user_status_change_response_message_at < 4 -> assert(collateral_user_status_change_response_message_read.user_id[collateral_user_status_change_response_message_at] == collateral_user_status_change_response_message_written.user_id[collateral_user_status_change_response_message_at]); collateral_user_status_change_response_message_at = collateral_user_status_change_response_message_at + 1
  :: else -> break
  od;
  assert(collateral_user_status_change_response_message_read.col_user_bit == collateral_user_status_change_response_message_written.col_user_bit);
  assert(collateral_user_status_change_response_message_read.reserved_1 == collateral_user_status_change_response_message_written.reserved_1);
  skip
}

/* ---- User Trade Modify Cancel Status Change Response Message: 6 bytes -------- */

/* Answers the trade modification or cancellation status change */
typedef UserTradeModifyCancelStatusChangeResponseMessage {
  byte user_id[4];
  byte trd_mod_cxl_bit;
  byte reserved_1
};

int user_trade_modify_cancel_status_change_response_message_at;

/* every byte of User Trade Modify Cancel Status Change Response Message set to one value */
inline fill_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_record, user_trade_modify_cancel_status_change_response_message_value) {
  user_trade_modify_cancel_status_change_response_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_response_message_at < 4 -> user_trade_modify_cancel_status_change_response_message_record.user_id[user_trade_modify_cancel_status_change_response_message_at] = user_trade_modify_cancel_status_change_response_message_value; user_trade_modify_cancel_status_change_response_message_at = user_trade_modify_cancel_status_change_response_message_at + 1
  :: else -> break
  od;
  user_trade_modify_cancel_status_change_response_message_record.trd_mod_cxl_bit = user_trade_modify_cancel_status_change_response_message_value;
  user_trade_modify_cancel_status_change_response_message_record.reserved_1 = user_trade_modify_cancel_status_change_response_message_value;
  skip
}

/* each byte of User Trade Modify Cancel Status Change Response Message set to where it lies, so a field read out of place says so */
inline ramp_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_record, user_trade_modify_cancel_status_change_response_message_base) {
  user_trade_modify_cancel_status_change_response_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_response_message_at < 4 -> user_trade_modify_cancel_status_change_response_message_record.user_id[user_trade_modify_cancel_status_change_response_message_at] = (user_trade_modify_cancel_status_change_response_message_base + 0 + user_trade_modify_cancel_status_change_response_message_at + 1) % 256; user_trade_modify_cancel_status_change_response_message_at = user_trade_modify_cancel_status_change_response_message_at + 1
  :: else -> break
  od;
  user_trade_modify_cancel_status_change_response_message_record.trd_mod_cxl_bit = (user_trade_modify_cancel_status_change_response_message_base + 4 + 1) % 256;
  user_trade_modify_cancel_status_change_response_message_record.reserved_1 = (user_trade_modify_cancel_status_change_response_message_base + 5 + 1) % 256;
  skip
}

/* User Trade Modify Cancel Status Change Response Message to the wire, 6 bytes from where the cursor stands */
inline encode_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_record) {
  user_trade_modify_cancel_status_change_response_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_response_message_at < 4 -> wire[at] = user_trade_modify_cancel_status_change_response_message_record.user_id[user_trade_modify_cancel_status_change_response_message_at]; at = at + 1; user_trade_modify_cancel_status_change_response_message_at = user_trade_modify_cancel_status_change_response_message_at + 1
  :: else -> break
  od;
  wire[at] = user_trade_modify_cancel_status_change_response_message_record.trd_mod_cxl_bit; at = at + 1;
  wire[at] = user_trade_modify_cancel_status_change_response_message_record.reserved_1; at = at + 1;
  skip
}

/* User Trade Modify Cancel Status Change Response Message off the wire, 6 bytes from where the cursor stands */
inline decode_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_record) {
  user_trade_modify_cancel_status_change_response_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_response_message_at < 4 -> user_trade_modify_cancel_status_change_response_message_record.user_id[user_trade_modify_cancel_status_change_response_message_at] = wire[at]; at = at + 1; user_trade_modify_cancel_status_change_response_message_at = user_trade_modify_cancel_status_change_response_message_at + 1
  :: else -> break
  od;
  user_trade_modify_cancel_status_change_response_message_record.trd_mod_cxl_bit = wire[at]; at = at + 1;
  user_trade_modify_cancel_status_change_response_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of User Trade Modify Cancel Status Change Response Message is what was written, byte for byte */
inline equal_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_read, user_trade_modify_cancel_status_change_response_message_written) {
  user_trade_modify_cancel_status_change_response_message_at = 0;
  do
  :: user_trade_modify_cancel_status_change_response_message_at < 4 -> assert(user_trade_modify_cancel_status_change_response_message_read.user_id[user_trade_modify_cancel_status_change_response_message_at] == user_trade_modify_cancel_status_change_response_message_written.user_id[user_trade_modify_cancel_status_change_response_message_at]); user_trade_modify_cancel_status_change_response_message_at = user_trade_modify_cancel_status_change_response_message_at + 1
  :: else -> break
  od;
  assert(user_trade_modify_cancel_status_change_response_message_read.trd_mod_cxl_bit == user_trade_modify_cancel_status_change_response_message_written.trd_mod_cxl_bit);
  assert(user_trade_modify_cancel_status_change_response_message_read.reserved_1 == user_trade_modify_cancel_status_change_response_message_written.reserved_1);
  skip
}

/* ---- User Address Unlock Confirm Message: 40 bytes --------------------------- */

/* Acknowledges that the unlock request reached the trading system */
typedef UserAddressUnlockConfirmMessage {
  byte user_id[4];
  byte reserved_36[36]
};

int user_address_unlock_confirm_message_at;

/* every byte of User Address Unlock Confirm Message set to one value */
inline fill_user_address_unlock_confirm_message(user_address_unlock_confirm_message_record, user_address_unlock_confirm_message_value) {
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 4 -> user_address_unlock_confirm_message_record.user_id[user_address_unlock_confirm_message_at] = user_address_unlock_confirm_message_value; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 36 -> user_address_unlock_confirm_message_record.reserved_36[user_address_unlock_confirm_message_at] = user_address_unlock_confirm_message_value; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Address Unlock Confirm Message set to where it lies, so a field read out of place says so */
inline ramp_user_address_unlock_confirm_message(user_address_unlock_confirm_message_record, user_address_unlock_confirm_message_base) {
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 4 -> user_address_unlock_confirm_message_record.user_id[user_address_unlock_confirm_message_at] = (user_address_unlock_confirm_message_base + 0 + user_address_unlock_confirm_message_at + 1) % 256; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 36 -> user_address_unlock_confirm_message_record.reserved_36[user_address_unlock_confirm_message_at] = (user_address_unlock_confirm_message_base + 4 + user_address_unlock_confirm_message_at + 1) % 256; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Address Unlock Confirm Message to the wire, 40 bytes from where the cursor stands */
inline encode_user_address_unlock_confirm_message(user_address_unlock_confirm_message_record) {
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 4 -> wire[at] = user_address_unlock_confirm_message_record.user_id[user_address_unlock_confirm_message_at]; at = at + 1; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 36 -> wire[at] = user_address_unlock_confirm_message_record.reserved_36[user_address_unlock_confirm_message_at]; at = at + 1; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Address Unlock Confirm Message off the wire, 40 bytes from where the cursor stands */
inline decode_user_address_unlock_confirm_message(user_address_unlock_confirm_message_record) {
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 4 -> user_address_unlock_confirm_message_record.user_id[user_address_unlock_confirm_message_at] = wire[at]; at = at + 1; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 36 -> user_address_unlock_confirm_message_record.reserved_36[user_address_unlock_confirm_message_at] = wire[at]; at = at + 1; user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Address Unlock Confirm Message is what was written, byte for byte */
inline equal_user_address_unlock_confirm_message(user_address_unlock_confirm_message_read, user_address_unlock_confirm_message_written) {
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 4 -> assert(user_address_unlock_confirm_message_read.user_id[user_address_unlock_confirm_message_at] == user_address_unlock_confirm_message_written.user_id[user_address_unlock_confirm_message_at]); user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  user_address_unlock_confirm_message_at = 0;
  do
  :: user_address_unlock_confirm_message_at < 36 -> assert(user_address_unlock_confirm_message_read.reserved_36[user_address_unlock_confirm_message_at] == user_address_unlock_confirm_message_written.reserved_36[user_address_unlock_confirm_message_at]); user_address_unlock_confirm_message_at = user_address_unlock_confirm_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- User Address Unlock Approve Message: 40 bytes --------------------------- */

/* Approves or rejects the unlock of a user. Transaction Code in the header names which */
typedef UserAddressUnlockApproveMessage {
  byte user_id[4];
  byte reserved_36[36]
};

int user_address_unlock_approve_message_at;

/* every byte of User Address Unlock Approve Message set to one value */
inline fill_user_address_unlock_approve_message(user_address_unlock_approve_message_record, user_address_unlock_approve_message_value) {
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 4 -> user_address_unlock_approve_message_record.user_id[user_address_unlock_approve_message_at] = user_address_unlock_approve_message_value; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 36 -> user_address_unlock_approve_message_record.reserved_36[user_address_unlock_approve_message_at] = user_address_unlock_approve_message_value; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Address Unlock Approve Message set to where it lies, so a field read out of place says so */
inline ramp_user_address_unlock_approve_message(user_address_unlock_approve_message_record, user_address_unlock_approve_message_base) {
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 4 -> user_address_unlock_approve_message_record.user_id[user_address_unlock_approve_message_at] = (user_address_unlock_approve_message_base + 0 + user_address_unlock_approve_message_at + 1) % 256; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 36 -> user_address_unlock_approve_message_record.reserved_36[user_address_unlock_approve_message_at] = (user_address_unlock_approve_message_base + 4 + user_address_unlock_approve_message_at + 1) % 256; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Address Unlock Approve Message to the wire, 40 bytes from where the cursor stands */
inline encode_user_address_unlock_approve_message(user_address_unlock_approve_message_record) {
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 4 -> wire[at] = user_address_unlock_approve_message_record.user_id[user_address_unlock_approve_message_at]; at = at + 1; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 36 -> wire[at] = user_address_unlock_approve_message_record.reserved_36[user_address_unlock_approve_message_at]; at = at + 1; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Address Unlock Approve Message off the wire, 40 bytes from where the cursor stands */
inline decode_user_address_unlock_approve_message(user_address_unlock_approve_message_record) {
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 4 -> user_address_unlock_approve_message_record.user_id[user_address_unlock_approve_message_at] = wire[at]; at = at + 1; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 36 -> user_address_unlock_approve_message_record.reserved_36[user_address_unlock_approve_message_at] = wire[at]; at = at + 1; user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Address Unlock Approve Message is what was written, byte for byte */
inline equal_user_address_unlock_approve_message(user_address_unlock_approve_message_read, user_address_unlock_approve_message_written) {
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 4 -> assert(user_address_unlock_approve_message_read.user_id[user_address_unlock_approve_message_at] == user_address_unlock_approve_message_written.user_id[user_address_unlock_approve_message_at]); user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  user_address_unlock_approve_message_at = 0;
  do
  :: user_address_unlock_approve_message_at < 36 -> assert(user_address_unlock_approve_message_read.reserved_36[user_address_unlock_approve_message_at] == user_address_unlock_approve_message_written.reserved_36[user_address_unlock_approve_message_at]); user_address_unlock_approve_message_at = user_address_unlock_approve_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Nlt Order Message To Trader Message: 276 bytes -------------------------- */

/* Tells the counter member's corporate manager of a negotiated large trade order placed against it */
typedef NltOrderMessageToTraderMessage {
  byte message_buffer[276]
};

int nlt_order_message_to_trader_message_at;

/* every byte of Nlt Order Message To Trader Message set to one value */
inline fill_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_record, nlt_order_message_to_trader_message_value) {
  nlt_order_message_to_trader_message_at = 0;
  do
  :: nlt_order_message_to_trader_message_at < 276 -> nlt_order_message_to_trader_message_record.message_buffer[nlt_order_message_to_trader_message_at] = nlt_order_message_to_trader_message_value; nlt_order_message_to_trader_message_at = nlt_order_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Nlt Order Message To Trader Message set to where it lies, so a field read out of place says so */
inline ramp_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_record, nlt_order_message_to_trader_message_base) {
  nlt_order_message_to_trader_message_at = 0;
  do
  :: nlt_order_message_to_trader_message_at < 276 -> nlt_order_message_to_trader_message_record.message_buffer[nlt_order_message_to_trader_message_at] = (nlt_order_message_to_trader_message_base + 0 + nlt_order_message_to_trader_message_at + 1) % 256; nlt_order_message_to_trader_message_at = nlt_order_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* Nlt Order Message To Trader Message to the wire, 276 bytes from where the cursor stands */
inline encode_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_record) {
  nlt_order_message_to_trader_message_at = 0;
  do
  :: nlt_order_message_to_trader_message_at < 276 -> wire[at] = nlt_order_message_to_trader_message_record.message_buffer[nlt_order_message_to_trader_message_at]; at = at + 1; nlt_order_message_to_trader_message_at = nlt_order_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* Nlt Order Message To Trader Message off the wire, 276 bytes from where the cursor stands */
inline decode_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_record) {
  nlt_order_message_to_trader_message_at = 0;
  do
  :: nlt_order_message_to_trader_message_at < 276 -> nlt_order_message_to_trader_message_record.message_buffer[nlt_order_message_to_trader_message_at] = wire[at]; at = at + 1; nlt_order_message_to_trader_message_at = nlt_order_message_to_trader_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Nlt Order Message To Trader Message is what was written, byte for byte */
inline equal_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_read, nlt_order_message_to_trader_message_written) {
  nlt_order_message_to_trader_message_at = 0;
  do
  :: nlt_order_message_to_trader_message_at < 276 -> assert(nlt_order_message_to_trader_message_read.message_buffer[nlt_order_message_to_trader_message_at] == nlt_order_message_to_trader_message_written.message_buffer[nlt_order_message_to_trader_message_at]); nlt_order_message_to_trader_message_at = nlt_order_message_to_trader_message_at + 1
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

/* Error Response Body: encoded, read back, and compared */
proctype check_error_response_body() {
  ErrorResponseBody error_response_body_sent;
  ErrorResponseBody error_response_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_error_response_body(error_response_body_sent, 0)
  :: pattern == 1 -> fill_error_response_body(error_response_body_sent, 32)
  :: pattern == 2 -> fill_error_response_body(error_response_body_sent, 255)
  :: else -> ramp_error_response_body(error_response_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_error_response_body(error_response_body_sent);
    assert(at == 142);
    at = 0;
    decode_error_response_body(error_response_body_got);
    assert(at == 142);
    equal_error_response_body(error_response_body_got, error_response_body_sent)
  }
}

/* Sign Off Request Out Message: encoded, read back, and compared */
proctype check_sign_off_request_out_message() {
  SignOffRequestOutMessage sign_off_request_out_message_sent;
  SignOffRequestOutMessage sign_off_request_out_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sign_off_request_out_message(sign_off_request_out_message_sent, 0)
  :: pattern == 1 -> fill_sign_off_request_out_message(sign_off_request_out_message_sent, 32)
  :: pattern == 2 -> fill_sign_off_request_out_message(sign_off_request_out_message_sent, 255)
  :: else -> ramp_sign_off_request_out_message(sign_off_request_out_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sign_off_request_out_message(sign_off_request_out_message_sent);
    assert(at == 150);
    at = 0;
    decode_sign_off_request_out_message(sign_off_request_out_message_got);
    assert(at == 150);
    equal_sign_off_request_out_message(sign_off_request_out_message_got, sign_off_request_out_message_sent)
  }
}

/* St Market Status: encoded, read back, and compared */
proctype check_st_market_status() {
  StMarketStatus st_market_status_sent;
  StMarketStatus st_market_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_st_market_status(st_market_status_sent, 0)
  :: pattern == 1 -> fill_st_market_status(st_market_status_sent, 32)
  :: pattern == 2 -> fill_st_market_status(st_market_status_sent, 255)
  :: else -> ramp_st_market_status(st_market_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_st_market_status(st_market_status_sent);
    assert(at == 8);
    at = 0;
    decode_st_market_status(st_market_status_got);
    assert(at == 8);
    equal_st_market_status(st_market_status_got, st_market_status_sent)
  }
}

/* St Ex Market Status: encoded, read back, and compared */
proctype check_st_ex_market_status() {
  StExMarketStatus st_ex_market_status_sent;
  StExMarketStatus st_ex_market_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_st_ex_market_status(st_ex_market_status_sent, 0)
  :: pattern == 1 -> fill_st_ex_market_status(st_ex_market_status_sent, 32)
  :: pattern == 2 -> fill_st_ex_market_status(st_ex_market_status_sent, 255)
  :: else -> ramp_st_ex_market_status(st_ex_market_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_st_ex_market_status(st_ex_market_status_sent);
    assert(at == 8);
    at = 0;
    decode_st_ex_market_status(st_ex_market_status_got);
    assert(at == 8);
    equal_st_ex_market_status(st_ex_market_status_got, st_ex_market_status_sent)
  }
}

/* St Pl Market Status: encoded, read back, and compared */
proctype check_st_pl_market_status() {
  StPlMarketStatus st_pl_market_status_sent;
  StPlMarketStatus st_pl_market_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_st_pl_market_status(st_pl_market_status_sent, 0)
  :: pattern == 1 -> fill_st_pl_market_status(st_pl_market_status_sent, 32)
  :: pattern == 2 -> fill_st_pl_market_status(st_pl_market_status_sent, 255)
  :: else -> ramp_st_pl_market_status(st_pl_market_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_st_pl_market_status(st_pl_market_status_sent);
    assert(at == 8);
    at = 0;
    decode_st_pl_market_status(st_pl_market_status_got);
    assert(at == 8);
    equal_st_pl_market_status(st_pl_market_status_got, st_pl_market_status_sent)
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

/* Contract Desc: encoded, read back, and compared */
proctype check_contract_desc() {
  ContractDesc contract_desc_sent;
  ContractDesc contract_desc_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contract_desc(contract_desc_sent, 0)
  :: pattern == 1 -> fill_contract_desc(contract_desc_sent, 32)
  :: pattern == 2 -> fill_contract_desc(contract_desc_sent, 255)
  :: else -> ramp_contract_desc(contract_desc_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contract_desc(contract_desc_sent);
    assert(at == 28);
    at = 0;
    decode_contract_desc(contract_desc_got);
    assert(at == 28);
    equal_contract_desc(contract_desc_got, contract_desc_sent)
  }
}

/* Trade Inquiry Body: encoded, read back, and compared */
proctype check_trade_inquiry_body() {
  TradeInquiryBody trade_inquiry_body_sent;
  TradeInquiryBody trade_inquiry_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_inquiry_body(trade_inquiry_body_sent, 0)
  :: pattern == 1 -> fill_trade_inquiry_body(trade_inquiry_body_sent, 32)
  :: pattern == 2 -> fill_trade_inquiry_body(trade_inquiry_body_sent, 255)
  :: else -> ramp_trade_inquiry_body(trade_inquiry_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_inquiry_body(trade_inquiry_body_sent);
    assert(at == 194);
    at = 0;
    decode_trade_inquiry_body(trade_inquiry_body_got);
    assert(at == 194);
    equal_trade_inquiry_body(trade_inquiry_body_got, trade_inquiry_body_sent)
  }
}

/* Trade Inquiry Response Message: encoded, read back, and compared */
proctype check_trade_inquiry_response_message() {
  TradeInquiryResponseMessage trade_inquiry_response_message_sent;
  TradeInquiryResponseMessage trade_inquiry_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_inquiry_response_message(trade_inquiry_response_message_sent, 0)
  :: pattern == 1 -> fill_trade_inquiry_response_message(trade_inquiry_response_message_sent, 32)
  :: pattern == 2 -> fill_trade_inquiry_response_message(trade_inquiry_response_message_sent, 255)
  :: else -> ramp_trade_inquiry_response_message(trade_inquiry_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_inquiry_response_message(trade_inquiry_response_message_sent);
    assert(at == 194);
    at = 0;
    decode_trade_inquiry_response_message(trade_inquiry_response_message_got);
    assert(at == 194);
    equal_trade_inquiry_response_message(trade_inquiry_response_message_got, trade_inquiry_response_message_sent)
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

/* Report Header Body: encoded, read back, and compared */
proctype check_report_header_body() {
  ReportHeaderBody report_header_body_sent;
  ReportHeaderBody report_header_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_report_header_body(report_header_body_sent, 0)
  :: pattern == 1 -> fill_report_header_body(report_header_body_sent, 32)
  :: pattern == 2 -> fill_report_header_body(report_header_body_sent, 255)
  :: else -> ramp_report_header_body(report_header_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_report_header_body(report_header_body_sent);
    assert(at == 67);
    at = 0;
    decode_report_header_body(report_header_body_got);
    assert(at == 67);
    equal_report_header_body(report_header_body_got, report_header_body_sent)
  }
}

/* Report Trailer Body: encoded, read back, and compared */
proctype check_report_trailer_body() {
  ReportTrailerBody report_trailer_body_sent;
  ReportTrailerBody report_trailer_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_report_trailer_body(report_trailer_body_sent, 0)
  :: pattern == 1 -> fill_report_trailer_body(report_trailer_body_sent, 32)
  :: pattern == 2 -> fill_report_trailer_body(report_trailer_body_sent, 255)
  :: else -> ramp_report_trailer_body(report_trailer_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_report_trailer_body(report_trailer_body_sent);
    assert(at == 5);
    at = 0;
    decode_report_trailer_body(report_trailer_body_got);
    assert(at == 5);
    equal_report_trailer_body(report_trailer_body_got, report_trailer_body_sent)
  }
}

/* Spread Report Header Body: encoded, read back, and compared */
proctype check_spread_report_header_body() {
  SpreadReportHeaderBody spread_report_header_body_sent;
  SpreadReportHeaderBody spread_report_header_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spread_report_header_body(spread_report_header_body_sent, 0)
  :: pattern == 1 -> fill_spread_report_header_body(spread_report_header_body_sent, 32)
  :: pattern == 2 -> fill_spread_report_header_body(spread_report_header_body_sent, 255)
  :: else -> ramp_spread_report_header_body(spread_report_header_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spread_report_header_body(spread_report_header_body_sent);
    assert(at == 67);
    at = 0;
    decode_spread_report_header_body(spread_report_header_body_got);
    assert(at == 67);
    equal_spread_report_header_body(spread_report_header_body_got, spread_report_header_body_sent)
  }
}

/* Gateway Router Response Message: encoded, read back, and compared */
proctype check_gateway_router_response_message() {
  GatewayRouterResponseMessage gateway_router_response_message_sent;
  GatewayRouterResponseMessage gateway_router_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gateway_router_response_message(gateway_router_response_message_sent, 0)
  :: pattern == 1 -> fill_gateway_router_response_message(gateway_router_response_message_sent, 32)
  :: pattern == 2 -> fill_gateway_router_response_message(gateway_router_response_message_sent, 255)
  :: else -> ramp_gateway_router_response_message(gateway_router_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gateway_router_response_message(gateway_router_response_message_sent);
    assert(at == 84);
    at = 0;
    decode_gateway_router_response_message(gateway_router_response_message_got);
    assert(at == 84);
    equal_gateway_router_response_message(gateway_router_response_message_got, gateway_router_response_message_sent)
  }
}

/* Box Sign On Request Out Message: encoded, read back, and compared */
proctype check_box_sign_on_request_out_message() {
  BoxSignOnRequestOutMessage box_sign_on_request_out_message_sent;
  BoxSignOnRequestOutMessage box_sign_on_request_out_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_box_sign_on_request_out_message(box_sign_on_request_out_message_sent, 0)
  :: pattern == 1 -> fill_box_sign_on_request_out_message(box_sign_on_request_out_message_sent, 32)
  :: pattern == 2 -> fill_box_sign_on_request_out_message(box_sign_on_request_out_message_sent, 255)
  :: else -> ramp_box_sign_on_request_out_message(box_sign_on_request_out_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_box_sign_on_request_out_message(box_sign_on_request_out_message_sent);
    assert(at == 12);
    at = 0;
    decode_box_sign_on_request_out_message(box_sign_on_request_out_message_got);
    assert(at == 12);
    equal_box_sign_on_request_out_message(box_sign_on_request_out_message_got, box_sign_on_request_out_message_sent)
  }
}

/* Box Sign Off Message: encoded, read back, and compared */
proctype check_box_sign_off_message() {
  BoxSignOffMessage box_sign_off_message_sent;
  BoxSignOffMessage box_sign_off_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_box_sign_off_message(box_sign_off_message_sent, 0)
  :: pattern == 1 -> fill_box_sign_off_message(box_sign_off_message_sent, 32)
  :: pattern == 2 -> fill_box_sign_off_message(box_sign_off_message_sent, 255)
  :: else -> ramp_box_sign_off_message(box_sign_off_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_box_sign_off_message(box_sign_off_message_sent);
    assert(at == 2);
    at = 0;
    decode_box_sign_off_message(box_sign_off_message_got);
    assert(at == 2);
    equal_box_sign_off_message(box_sign_off_message_got, box_sign_off_message_sent)
  }
}

/* Contingency Broadcast Message: encoded, read back, and compared */
proctype check_contingency_broadcast_message() {
  ContingencyBroadcastMessage contingency_broadcast_message_sent;
  ContingencyBroadcastMessage contingency_broadcast_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contingency_broadcast_message(contingency_broadcast_message_sent, 0)
  :: pattern == 1 -> fill_contingency_broadcast_message(contingency_broadcast_message_sent, 32)
  :: pattern == 2 -> fill_contingency_broadcast_message(contingency_broadcast_message_sent, 255)
  :: else -> ramp_contingency_broadcast_message(contingency_broadcast_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contingency_broadcast_message(contingency_broadcast_message_sent);
    assert(at == 204);
    at = 0;
    decode_contingency_broadcast_message(contingency_broadcast_message_got);
    assert(at == 204);
    equal_contingency_broadcast_message(contingency_broadcast_message_got, contingency_broadcast_message_sent)
  }
}

/* Reset User Password Response Message: encoded, read back, and compared */
proctype check_reset_user_password_response_message() {
  ResetUserPasswordResponseMessage reset_user_password_response_message_sent;
  ResetUserPasswordResponseMessage reset_user_password_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_user_password_response_message(reset_user_password_response_message_sent, 0)
  :: pattern == 1 -> fill_reset_user_password_response_message(reset_user_password_response_message_sent, 32)
  :: pattern == 2 -> fill_reset_user_password_response_message(reset_user_password_response_message_sent, 255)
  :: else -> ramp_reset_user_password_response_message(reset_user_password_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_user_password_response_message(reset_user_password_response_message_sent);
    assert(at == 18);
    at = 0;
    decode_reset_user_password_response_message(reset_user_password_response_message_got);
    assert(at == 18);
    equal_reset_user_password_response_message(reset_user_password_response_message_got, reset_user_password_response_message_sent)
  }
}

/* Collateral User Status Change Response Message: encoded, read back, and compared */
proctype check_collateral_user_status_change_response_message() {
  CollateralUserStatusChangeResponseMessage collateral_user_status_change_response_message_sent;
  CollateralUserStatusChangeResponseMessage collateral_user_status_change_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_collateral_user_status_change_response_message(collateral_user_status_change_response_message_sent, 0)
  :: pattern == 1 -> fill_collateral_user_status_change_response_message(collateral_user_status_change_response_message_sent, 32)
  :: pattern == 2 -> fill_collateral_user_status_change_response_message(collateral_user_status_change_response_message_sent, 255)
  :: else -> ramp_collateral_user_status_change_response_message(collateral_user_status_change_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_collateral_user_status_change_response_message(collateral_user_status_change_response_message_sent);
    assert(at == 6);
    at = 0;
    decode_collateral_user_status_change_response_message(collateral_user_status_change_response_message_got);
    assert(at == 6);
    equal_collateral_user_status_change_response_message(collateral_user_status_change_response_message_got, collateral_user_status_change_response_message_sent)
  }
}

/* User Trade Modify Cancel Status Change Response Message: encoded, read back, and compared */
proctype check_user_trade_modify_cancel_status_change_response_message() {
  UserTradeModifyCancelStatusChangeResponseMessage user_trade_modify_cancel_status_change_response_message_sent;
  UserTradeModifyCancelStatusChangeResponseMessage user_trade_modify_cancel_status_change_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_sent, 0)
  :: pattern == 1 -> fill_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_sent, 32)
  :: pattern == 2 -> fill_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_sent, 255)
  :: else -> ramp_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_sent);
    assert(at == 6);
    at = 0;
    decode_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_got);
    assert(at == 6);
    equal_user_trade_modify_cancel_status_change_response_message(user_trade_modify_cancel_status_change_response_message_got, user_trade_modify_cancel_status_change_response_message_sent)
  }
}

/* User Address Unlock Confirm Message: encoded, read back, and compared */
proctype check_user_address_unlock_confirm_message() {
  UserAddressUnlockConfirmMessage user_address_unlock_confirm_message_sent;
  UserAddressUnlockConfirmMessage user_address_unlock_confirm_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_address_unlock_confirm_message(user_address_unlock_confirm_message_sent, 0)
  :: pattern == 1 -> fill_user_address_unlock_confirm_message(user_address_unlock_confirm_message_sent, 32)
  :: pattern == 2 -> fill_user_address_unlock_confirm_message(user_address_unlock_confirm_message_sent, 255)
  :: else -> ramp_user_address_unlock_confirm_message(user_address_unlock_confirm_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_address_unlock_confirm_message(user_address_unlock_confirm_message_sent);
    assert(at == 40);
    at = 0;
    decode_user_address_unlock_confirm_message(user_address_unlock_confirm_message_got);
    assert(at == 40);
    equal_user_address_unlock_confirm_message(user_address_unlock_confirm_message_got, user_address_unlock_confirm_message_sent)
  }
}

/* User Address Unlock Approve Message: encoded, read back, and compared */
proctype check_user_address_unlock_approve_message() {
  UserAddressUnlockApproveMessage user_address_unlock_approve_message_sent;
  UserAddressUnlockApproveMessage user_address_unlock_approve_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_address_unlock_approve_message(user_address_unlock_approve_message_sent, 0)
  :: pattern == 1 -> fill_user_address_unlock_approve_message(user_address_unlock_approve_message_sent, 32)
  :: pattern == 2 -> fill_user_address_unlock_approve_message(user_address_unlock_approve_message_sent, 255)
  :: else -> ramp_user_address_unlock_approve_message(user_address_unlock_approve_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_address_unlock_approve_message(user_address_unlock_approve_message_sent);
    assert(at == 40);
    at = 0;
    decode_user_address_unlock_approve_message(user_address_unlock_approve_message_got);
    assert(at == 40);
    equal_user_address_unlock_approve_message(user_address_unlock_approve_message_got, user_address_unlock_approve_message_sent)
  }
}

/* Nlt Order Message To Trader Message: encoded, read back, and compared */
proctype check_nlt_order_message_to_trader_message() {
  NltOrderMessageToTraderMessage nlt_order_message_to_trader_message_sent;
  NltOrderMessageToTraderMessage nlt_order_message_to_trader_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_sent, 0)
  :: pattern == 1 -> fill_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_sent, 32)
  :: pattern == 2 -> fill_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_sent, 255)
  :: else -> ramp_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_sent);
    assert(at == 276);
    at = 0;
    decode_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_got);
    assert(at == 276);
    equal_nlt_order_message_to_trader_message(nlt_order_message_to_trader_message_got, nlt_order_message_to_trader_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_error_response_body()
  :: run check_sign_off_request_out_message()
  :: run check_st_market_status()
  :: run check_st_ex_market_status()
  :: run check_st_pl_market_status()
  :: run check_update_local_database_header_message()
  :: run check_update_local_database_trailer_message()
  :: run check_inner_header()
  :: run check_contract_desc()
  :: run check_trade_inquiry_body()
  :: run check_trade_inquiry_response_message()
  :: run check_control_message_to_trader_message()
  :: run check_report_header_body()
  :: run check_report_trailer_body()
  :: run check_spread_report_header_body()
  :: run check_gateway_router_response_message()
  :: run check_box_sign_on_request_out_message()
  :: run check_box_sign_off_message()
  :: run check_contingency_broadcast_message()
  :: run check_reset_user_password_response_message()
  :: run check_collateral_user_status_change_response_message()
  :: run check_user_trade_modify_cancel_status_change_response_message()
  :: run check_user_address_unlock_confirm_message()
  :: run check_user_address_unlock_approve_message()
  :: run check_nlt_order_message_to_trader_message()
  fi
}
