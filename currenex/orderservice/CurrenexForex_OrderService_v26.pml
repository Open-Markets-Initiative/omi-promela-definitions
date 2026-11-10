/*
 * Currenex Order Service
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
#define WIRE 85

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 9 bytes ------------------------------------------------- */

/* Currenex Market Data Message Header */
typedef MessageHeader {
  byte sequence_number[4];
  byte timestamp[4];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.sequence_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.sequence_number[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.timestamp[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 8 + 1) % 256;
  skip
}

/* Message Header to the wire, 9 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.sequence_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 9 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.sequence_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.sequence_number[message_header_at] == message_header_written.sequence_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.timestamp[message_header_at] == message_header_written.timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Logon: 44 bytes --------------------------------------------------------- */

/* Client initiates a session by submitting a Logon message */
typedef Logon {
  byte user_id[20];
  byte password[20];
  byte session_id[4]
};

int logon_at;

/* every byte of Logon set to one value */
inline fill_logon(logon_record, logon_value) {
  logon_at = 0;
  do
  :: logon_at < 20 -> logon_record.user_id[logon_at] = logon_value; logon_at = logon_at + 1
  :: else -> break
  od;
  logon_at = 0;
  do
  :: logon_at < 20 -> logon_record.password[logon_at] = logon_value; logon_at = logon_at + 1
  :: else -> break
  od;
  logon_at = 0;
  do
  :: logon_at < 4 -> logon_record.session_id[logon_at] = logon_value; logon_at = logon_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon set to where it lies, so a field read out of place says so */
inline ramp_logon(logon_record, logon_base) {
  logon_at = 0;
  do
  :: logon_at < 20 -> logon_record.user_id[logon_at] = (logon_base + 0 + logon_at + 1) % 256; logon_at = logon_at + 1
  :: else -> break
  od;
  logon_at = 0;
  do
  :: logon_at < 20 -> logon_record.password[logon_at] = (logon_base + 20 + logon_at + 1) % 256; logon_at = logon_at + 1
  :: else -> break
  od;
  logon_at = 0;
  do
  :: logon_at < 4 -> logon_record.session_id[logon_at] = (logon_base + 40 + logon_at + 1) % 256; logon_at = logon_at + 1
  :: else -> break
  od;
  skip
}

/* Logon to the wire, 44 bytes from where the cursor stands */
inline encode_logon(logon_record) {
  logon_at = 0;
  do
  :: logon_at < 20 -> wire[at] = logon_record.user_id[logon_at]; at = at + 1; logon_at = logon_at + 1
  :: else -> break
  od;
  logon_at = 0;
  do
  :: logon_at < 20 -> wire[at] = logon_record.password[logon_at]; at = at + 1; logon_at = logon_at + 1
  :: else -> break
  od;
  logon_at = 0;
  do
  :: logon_at < 4 -> wire[at] = logon_record.session_id[logon_at]; at = at + 1; logon_at = logon_at + 1
  :: else -> break
  od;
  skip
}

/* Logon off the wire, 44 bytes from where the cursor stands */
inline decode_logon(logon_record) {
  logon_at = 0;
  do
  :: logon_at < 20 -> logon_record.user_id[logon_at] = wire[at]; at = at + 1; logon_at = logon_at + 1
  :: else -> break
  od;
  logon_at = 0;
  do
  :: logon_at < 20 -> logon_record.password[logon_at] = wire[at]; at = at + 1; logon_at = logon_at + 1
  :: else -> break
  od;
  logon_at = 0;
  do
  :: logon_at < 4 -> logon_record.session_id[logon_at] = wire[at]; at = at + 1; logon_at = logon_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon is what was written, byte for byte */
inline equal_logon(logon_read, logon_written) {
  logon_at = 0;
  do
  :: logon_at < 20 -> assert(logon_read.user_id[logon_at] == logon_written.user_id[logon_at]); logon_at = logon_at + 1
  :: else -> break
  od;
  logon_at = 0;
  do
  :: logon_at < 20 -> assert(logon_read.password[logon_at] == logon_written.password[logon_at]); logon_at = logon_at + 1
  :: else -> break
  od;
  logon_at = 0;
  do
  :: logon_at < 4 -> assert(logon_read.session_id[logon_at] == logon_written.session_id[logon_at]); logon_at = logon_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout: 27 bytes -------------------------------------------------------- */

/* Terminate a session by sending a Logout message */
typedef Logout {
  byte user_id[20];
  byte session_id[4];
  byte reason[3]
};

int logout_at;

/* every byte of Logout set to one value */
inline fill_logout(logout_record, logout_value) {
  logout_at = 0;
  do
  :: logout_at < 20 -> logout_record.user_id[logout_at] = logout_value; logout_at = logout_at + 1
  :: else -> break
  od;
  logout_at = 0;
  do
  :: logout_at < 4 -> logout_record.session_id[logout_at] = logout_value; logout_at = logout_at + 1
  :: else -> break
  od;
  logout_at = 0;
  do
  :: logout_at < 3 -> logout_record.reason[logout_at] = logout_value; logout_at = logout_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout set to where it lies, so a field read out of place says so */
inline ramp_logout(logout_record, logout_base) {
  logout_at = 0;
  do
  :: logout_at < 20 -> logout_record.user_id[logout_at] = (logout_base + 0 + logout_at + 1) % 256; logout_at = logout_at + 1
  :: else -> break
  od;
  logout_at = 0;
  do
  :: logout_at < 4 -> logout_record.session_id[logout_at] = (logout_base + 20 + logout_at + 1) % 256; logout_at = logout_at + 1
  :: else -> break
  od;
  logout_at = 0;
  do
  :: logout_at < 3 -> logout_record.reason[logout_at] = (logout_base + 24 + logout_at + 1) % 256; logout_at = logout_at + 1
  :: else -> break
  od;
  skip
}

/* Logout to the wire, 27 bytes from where the cursor stands */
inline encode_logout(logout_record) {
  logout_at = 0;
  do
  :: logout_at < 20 -> wire[at] = logout_record.user_id[logout_at]; at = at + 1; logout_at = logout_at + 1
  :: else -> break
  od;
  logout_at = 0;
  do
  :: logout_at < 4 -> wire[at] = logout_record.session_id[logout_at]; at = at + 1; logout_at = logout_at + 1
  :: else -> break
  od;
  logout_at = 0;
  do
  :: logout_at < 3 -> wire[at] = logout_record.reason[logout_at]; at = at + 1; logout_at = logout_at + 1
  :: else -> break
  od;
  skip
}

/* Logout off the wire, 27 bytes from where the cursor stands */
inline decode_logout(logout_record) {
  logout_at = 0;
  do
  :: logout_at < 20 -> logout_record.user_id[logout_at] = wire[at]; at = at + 1; logout_at = logout_at + 1
  :: else -> break
  od;
  logout_at = 0;
  do
  :: logout_at < 4 -> logout_record.session_id[logout_at] = wire[at]; at = at + 1; logout_at = logout_at + 1
  :: else -> break
  od;
  logout_at = 0;
  do
  :: logout_at < 3 -> logout_record.reason[logout_at] = wire[at]; at = at + 1; logout_at = logout_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout is what was written, byte for byte */
inline equal_logout(logout_read, logout_written) {
  logout_at = 0;
  do
  :: logout_at < 20 -> assert(logout_read.user_id[logout_at] == logout_written.user_id[logout_at]); logout_at = logout_at + 1
  :: else -> break
  od;
  logout_at = 0;
  do
  :: logout_at < 4 -> assert(logout_read.session_id[logout_at] == logout_written.session_id[logout_at]); logout_at = logout_at + 1
  :: else -> break
  od;
  logout_at = 0;
  do
  :: logout_at < 3 -> assert(logout_read.reason[logout_at] == logout_written.reason[logout_at]); logout_at = logout_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heartbeat: 4 bytes ------------------------------------------------------ */

/* Keep-alive ping sent every three seconds; client must respond */
typedef Heartbeat {
  byte session_id[4]
};

int heartbeat_at;

/* every byte of Heartbeat set to one value */
inline fill_heartbeat(heartbeat_record, heartbeat_value) {
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> heartbeat_record.session_id[heartbeat_at] = heartbeat_value; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat set to where it lies, so a field read out of place says so */
inline ramp_heartbeat(heartbeat_record, heartbeat_base) {
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> heartbeat_record.session_id[heartbeat_at] = (heartbeat_base + 0 + heartbeat_at + 1) % 256; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat to the wire, 4 bytes from where the cursor stands */
inline encode_heartbeat(heartbeat_record) {
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> wire[at] = heartbeat_record.session_id[heartbeat_at]; at = at + 1; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat off the wire, 4 bytes from where the cursor stands */
inline decode_heartbeat(heartbeat_record) {
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> heartbeat_record.session_id[heartbeat_at] = wire[at]; at = at + 1; heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat is what was written, byte for byte */
inline equal_heartbeat(heartbeat_read, heartbeat_written) {
  heartbeat_at = 0;
  do
  :: heartbeat_at < 4 -> assert(heartbeat_read.session_id[heartbeat_at] == heartbeat_written.session_id[heartbeat_at]); heartbeat_at = heartbeat_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Info Request: 4 bytes ---------------------------------------- */

/* Request list of supported instruments */
typedef InstrumentInfoRequest {
  byte session_id[4]
};

int instrument_info_request_at;

/* every byte of Instrument Info Request set to one value */
inline fill_instrument_info_request(instrument_info_request_record, instrument_info_request_value) {
  instrument_info_request_at = 0;
  do
  :: instrument_info_request_at < 4 -> instrument_info_request_record.session_id[instrument_info_request_at] = instrument_info_request_value; instrument_info_request_at = instrument_info_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Info Request set to where it lies, so a field read out of place says so */
inline ramp_instrument_info_request(instrument_info_request_record, instrument_info_request_base) {
  instrument_info_request_at = 0;
  do
  :: instrument_info_request_at < 4 -> instrument_info_request_record.session_id[instrument_info_request_at] = (instrument_info_request_base + 0 + instrument_info_request_at + 1) % 256; instrument_info_request_at = instrument_info_request_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Request to the wire, 4 bytes from where the cursor stands */
inline encode_instrument_info_request(instrument_info_request_record) {
  instrument_info_request_at = 0;
  do
  :: instrument_info_request_at < 4 -> wire[at] = instrument_info_request_record.session_id[instrument_info_request_at]; at = at + 1; instrument_info_request_at = instrument_info_request_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Request off the wire, 4 bytes from where the cursor stands */
inline decode_instrument_info_request(instrument_info_request_record) {
  instrument_info_request_at = 0;
  do
  :: instrument_info_request_at < 4 -> instrument_info_request_record.session_id[instrument_info_request_at] = wire[at]; at = at + 1; instrument_info_request_at = instrument_info_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Info Request is what was written, byte for byte */
inline equal_instrument_info_request(instrument_info_request_read, instrument_info_request_written) {
  instrument_info_request_at = 0;
  do
  :: instrument_info_request_at < 4 -> assert(instrument_info_request_read.session_id[instrument_info_request_at] == instrument_info_request_written.session_id[instrument_info_request_at]); instrument_info_request_at = instrument_info_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Info: 35 bytes ----------------------------------------------- */

/* Definition of a currency or metal instrument */
typedef InstrumentInfo {
  byte session_id[4];
  byte instrument_index[2];
  byte instrument_type;
  byte instrument_id[20];
  byte settlement_date[8]
};

int instrument_info_at;

/* every byte of Instrument Info set to one value */
inline fill_instrument_info(instrument_info_record, instrument_info_value) {
  instrument_info_at = 0;
  do
  :: instrument_info_at < 4 -> instrument_info_record.session_id[instrument_info_at] = instrument_info_value; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 2 -> instrument_info_record.instrument_index[instrument_info_at] = instrument_info_value; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_record.instrument_type = instrument_info_value;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 20 -> instrument_info_record.instrument_id[instrument_info_at] = instrument_info_value; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 8 -> instrument_info_record.settlement_date[instrument_info_at] = instrument_info_value; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Info set to where it lies, so a field read out of place says so */
inline ramp_instrument_info(instrument_info_record, instrument_info_base) {
  instrument_info_at = 0;
  do
  :: instrument_info_at < 4 -> instrument_info_record.session_id[instrument_info_at] = (instrument_info_base + 0 + instrument_info_at + 1) % 256; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 2 -> instrument_info_record.instrument_index[instrument_info_at] = (instrument_info_base + 4 + instrument_info_at + 1) % 256; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_record.instrument_type = (instrument_info_base + 6 + 1) % 256;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 20 -> instrument_info_record.instrument_id[instrument_info_at] = (instrument_info_base + 7 + instrument_info_at + 1) % 256; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 8 -> instrument_info_record.settlement_date[instrument_info_at] = (instrument_info_base + 27 + instrument_info_at + 1) % 256; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info to the wire, 35 bytes from where the cursor stands */
inline encode_instrument_info(instrument_info_record) {
  instrument_info_at = 0;
  do
  :: instrument_info_at < 4 -> wire[at] = instrument_info_record.session_id[instrument_info_at]; at = at + 1; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 2 -> wire[at] = instrument_info_record.instrument_index[instrument_info_at]; at = at + 1; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  wire[at] = instrument_info_record.instrument_type; at = at + 1;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 20 -> wire[at] = instrument_info_record.instrument_id[instrument_info_at]; at = at + 1; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 8 -> wire[at] = instrument_info_record.settlement_date[instrument_info_at]; at = at + 1; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info off the wire, 35 bytes from where the cursor stands */
inline decode_instrument_info(instrument_info_record) {
  instrument_info_at = 0;
  do
  :: instrument_info_at < 4 -> instrument_info_record.session_id[instrument_info_at] = wire[at]; at = at + 1; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 2 -> instrument_info_record.instrument_index[instrument_info_at] = wire[at]; at = at + 1; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_record.instrument_type = wire[at]; at = at + 1;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 20 -> instrument_info_record.instrument_id[instrument_info_at] = wire[at]; at = at + 1; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 8 -> instrument_info_record.settlement_date[instrument_info_at] = wire[at]; at = at + 1; instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Info is what was written, byte for byte */
inline equal_instrument_info(instrument_info_read, instrument_info_written) {
  instrument_info_at = 0;
  do
  :: instrument_info_at < 4 -> assert(instrument_info_read.session_id[instrument_info_at] == instrument_info_written.session_id[instrument_info_at]); instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 2 -> assert(instrument_info_read.instrument_index[instrument_info_at] == instrument_info_written.instrument_index[instrument_info_at]); instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  assert(instrument_info_read.instrument_type == instrument_info_written.instrument_type);
  instrument_info_at = 0;
  do
  :: instrument_info_at < 20 -> assert(instrument_info_read.instrument_id[instrument_info_at] == instrument_info_written.instrument_id[instrument_info_at]); instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  instrument_info_at = 0;
  do
  :: instrument_info_at < 8 -> assert(instrument_info_read.settlement_date[instrument_info_at] == instrument_info_written.settlement_date[instrument_info_at]); instrument_info_at = instrument_info_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Order Request: 37 bytes --------------------------------------------- */

/* Submit a new order request */
typedef NewOrderRequest {
  byte cl_order_id[4];
  byte order_type;
  byte instrument_index[2];
  byte side;
  byte order_amt[8];
  byte min_amt[8];
  byte price[4];
  byte show_amt[8];
  byte expire_type
};

int new_order_request_at;

/* every byte of New Order Request set to one value */
inline fill_new_order_request(new_order_request_record, new_order_request_value) {
  new_order_request_at = 0;
  do
  :: new_order_request_at < 4 -> new_order_request_record.cl_order_id[new_order_request_at] = new_order_request_value; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_record.order_type = new_order_request_value;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 2 -> new_order_request_record.instrument_index[new_order_request_at] = new_order_request_value; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_record.side = new_order_request_value;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> new_order_request_record.order_amt[new_order_request_at] = new_order_request_value; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> new_order_request_record.min_amt[new_order_request_at] = new_order_request_value; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 4 -> new_order_request_record.price[new_order_request_at] = new_order_request_value; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> new_order_request_record.show_amt[new_order_request_at] = new_order_request_value; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_record.expire_type = new_order_request_value;
  skip
}

/* each byte of New Order Request set to where it lies, so a field read out of place says so */
inline ramp_new_order_request(new_order_request_record, new_order_request_base) {
  new_order_request_at = 0;
  do
  :: new_order_request_at < 4 -> new_order_request_record.cl_order_id[new_order_request_at] = (new_order_request_base + 0 + new_order_request_at + 1) % 256; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_record.order_type = (new_order_request_base + 4 + 1) % 256;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 2 -> new_order_request_record.instrument_index[new_order_request_at] = (new_order_request_base + 5 + new_order_request_at + 1) % 256; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_record.side = (new_order_request_base + 7 + 1) % 256;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> new_order_request_record.order_amt[new_order_request_at] = (new_order_request_base + 8 + new_order_request_at + 1) % 256; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> new_order_request_record.min_amt[new_order_request_at] = (new_order_request_base + 16 + new_order_request_at + 1) % 256; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 4 -> new_order_request_record.price[new_order_request_at] = (new_order_request_base + 24 + new_order_request_at + 1) % 256; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> new_order_request_record.show_amt[new_order_request_at] = (new_order_request_base + 28 + new_order_request_at + 1) % 256; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_record.expire_type = (new_order_request_base + 36 + 1) % 256;
  skip
}

/* New Order Request to the wire, 37 bytes from where the cursor stands */
inline encode_new_order_request(new_order_request_record) {
  new_order_request_at = 0;
  do
  :: new_order_request_at < 4 -> wire[at] = new_order_request_record.cl_order_id[new_order_request_at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  wire[at] = new_order_request_record.order_type; at = at + 1;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 2 -> wire[at] = new_order_request_record.instrument_index[new_order_request_at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  wire[at] = new_order_request_record.side; at = at + 1;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> wire[at] = new_order_request_record.order_amt[new_order_request_at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> wire[at] = new_order_request_record.min_amt[new_order_request_at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 4 -> wire[at] = new_order_request_record.price[new_order_request_at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> wire[at] = new_order_request_record.show_amt[new_order_request_at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  wire[at] = new_order_request_record.expire_type; at = at + 1;
  skip
}

/* New Order Request off the wire, 37 bytes from where the cursor stands */
inline decode_new_order_request(new_order_request_record) {
  new_order_request_at = 0;
  do
  :: new_order_request_at < 4 -> new_order_request_record.cl_order_id[new_order_request_at] = wire[at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_record.order_type = wire[at]; at = at + 1;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 2 -> new_order_request_record.instrument_index[new_order_request_at] = wire[at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_record.side = wire[at]; at = at + 1;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> new_order_request_record.order_amt[new_order_request_at] = wire[at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> new_order_request_record.min_amt[new_order_request_at] = wire[at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 4 -> new_order_request_record.price[new_order_request_at] = wire[at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> new_order_request_record.show_amt[new_order_request_at] = wire[at]; at = at + 1; new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_record.expire_type = wire[at]; at = at + 1;
  skip
}

/* what was read of New Order Request is what was written, byte for byte */
inline equal_new_order_request(new_order_request_read, new_order_request_written) {
  new_order_request_at = 0;
  do
  :: new_order_request_at < 4 -> assert(new_order_request_read.cl_order_id[new_order_request_at] == new_order_request_written.cl_order_id[new_order_request_at]); new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  assert(new_order_request_read.order_type == new_order_request_written.order_type);
  new_order_request_at = 0;
  do
  :: new_order_request_at < 2 -> assert(new_order_request_read.instrument_index[new_order_request_at] == new_order_request_written.instrument_index[new_order_request_at]); new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  assert(new_order_request_read.side == new_order_request_written.side);
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> assert(new_order_request_read.order_amt[new_order_request_at] == new_order_request_written.order_amt[new_order_request_at]); new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> assert(new_order_request_read.min_amt[new_order_request_at] == new_order_request_written.min_amt[new_order_request_at]); new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 4 -> assert(new_order_request_read.price[new_order_request_at] == new_order_request_written.price[new_order_request_at]); new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  new_order_request_at = 0;
  do
  :: new_order_request_at < 8 -> assert(new_order_request_read.show_amt[new_order_request_at] == new_order_request_written.show_amt[new_order_request_at]); new_order_request_at = new_order_request_at + 1
  :: else -> break
  od;
  assert(new_order_request_read.expire_type == new_order_request_written.expire_type);
  skip
}

/* ---- New Order Ack: 15 bytes ------------------------------------------------- */

/* Acknowledge new order */
typedef NewOrderAck {
  byte cl_order_id[4];
  byte order_id[8];
  byte ack_status;
  byte error_code[2]
};

int new_order_ack_at;

/* every byte of New Order Ack set to one value */
inline fill_new_order_ack(new_order_ack_record, new_order_ack_value) {
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 4 -> new_order_ack_record.cl_order_id[new_order_ack_at] = new_order_ack_value; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 8 -> new_order_ack_record.order_id[new_order_ack_at] = new_order_ack_value; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  new_order_ack_record.ack_status = new_order_ack_value;
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 2 -> new_order_ack_record.error_code[new_order_ack_at] = new_order_ack_value; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Ack set to where it lies, so a field read out of place says so */
inline ramp_new_order_ack(new_order_ack_record, new_order_ack_base) {
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 4 -> new_order_ack_record.cl_order_id[new_order_ack_at] = (new_order_ack_base + 0 + new_order_ack_at + 1) % 256; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 8 -> new_order_ack_record.order_id[new_order_ack_at] = (new_order_ack_base + 4 + new_order_ack_at + 1) % 256; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  new_order_ack_record.ack_status = (new_order_ack_base + 12 + 1) % 256;
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 2 -> new_order_ack_record.error_code[new_order_ack_at] = (new_order_ack_base + 13 + new_order_ack_at + 1) % 256; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Ack to the wire, 15 bytes from where the cursor stands */
inline encode_new_order_ack(new_order_ack_record) {
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 4 -> wire[at] = new_order_ack_record.cl_order_id[new_order_ack_at]; at = at + 1; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 8 -> wire[at] = new_order_ack_record.order_id[new_order_ack_at]; at = at + 1; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  wire[at] = new_order_ack_record.ack_status; at = at + 1;
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 2 -> wire[at] = new_order_ack_record.error_code[new_order_ack_at]; at = at + 1; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Ack off the wire, 15 bytes from where the cursor stands */
inline decode_new_order_ack(new_order_ack_record) {
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 4 -> new_order_ack_record.cl_order_id[new_order_ack_at] = wire[at]; at = at + 1; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 8 -> new_order_ack_record.order_id[new_order_ack_at] = wire[at]; at = at + 1; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  new_order_ack_record.ack_status = wire[at]; at = at + 1;
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 2 -> new_order_ack_record.error_code[new_order_ack_at] = wire[at]; at = at + 1; new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Ack is what was written, byte for byte */
inline equal_new_order_ack(new_order_ack_read, new_order_ack_written) {
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 4 -> assert(new_order_ack_read.cl_order_id[new_order_ack_at] == new_order_ack_written.cl_order_id[new_order_ack_at]); new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 8 -> assert(new_order_ack_read.order_id[new_order_ack_at] == new_order_ack_written.order_id[new_order_ack_at]); new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  assert(new_order_ack_read.ack_status == new_order_ack_written.ack_status);
  new_order_ack_at = 0;
  do
  :: new_order_ack_at < 2 -> assert(new_order_ack_read.error_code[new_order_ack_at] == new_order_ack_written.error_code[new_order_ack_at]); new_order_ack_at = new_order_ack_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Request: 10 bytes ------------------------------------------ */

/* Request cancellation of an order */
typedef OrderCancelRequest {
  byte new_cl_order_id[4];
  byte prev_cl_order_id[4];
  byte instrument_index[2]
};

int order_cancel_request_at;

/* every byte of Order Cancel Request set to one value */
inline fill_order_cancel_request(order_cancel_request_record, order_cancel_request_value) {
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.new_cl_order_id[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.prev_cl_order_id[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 2 -> order_cancel_request_record.instrument_index[order_cancel_request_at] = order_cancel_request_value; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Request set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_request(order_cancel_request_record, order_cancel_request_base) {
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.new_cl_order_id[order_cancel_request_at] = (order_cancel_request_base + 0 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.prev_cl_order_id[order_cancel_request_at] = (order_cancel_request_base + 4 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 2 -> order_cancel_request_record.instrument_index[order_cancel_request_at] = (order_cancel_request_base + 8 + order_cancel_request_at + 1) % 256; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Request to the wire, 10 bytes from where the cursor stands */
inline encode_order_cancel_request(order_cancel_request_record) {
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> wire[at] = order_cancel_request_record.new_cl_order_id[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> wire[at] = order_cancel_request_record.prev_cl_order_id[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 2 -> wire[at] = order_cancel_request_record.instrument_index[order_cancel_request_at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Request off the wire, 10 bytes from where the cursor stands */
inline decode_order_cancel_request(order_cancel_request_record) {
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.new_cl_order_id[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> order_cancel_request_record.prev_cl_order_id[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 2 -> order_cancel_request_record.instrument_index[order_cancel_request_at] = wire[at]; at = at + 1; order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Request is what was written, byte for byte */
inline equal_order_cancel_request(order_cancel_request_read, order_cancel_request_written) {
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> assert(order_cancel_request_read.new_cl_order_id[order_cancel_request_at] == order_cancel_request_written.new_cl_order_id[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 4 -> assert(order_cancel_request_read.prev_cl_order_id[order_cancel_request_at] == order_cancel_request_written.prev_cl_order_id[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  order_cancel_request_at = 0;
  do
  :: order_cancel_request_at < 2 -> assert(order_cancel_request_read.instrument_index[order_cancel_request_at] == order_cancel_request_written.instrument_index[order_cancel_request_at]); order_cancel_request_at = order_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Reject: 10 bytes ------------------------------------------- */

/* Rejection of Order Cancel Request */
typedef OrderCancelReject {
  byte new_cl_order_id[4];
  byte prev_cl_order_id[4];
  byte error_code[2]
};

int order_cancel_reject_at;

/* every byte of Order Cancel Reject set to one value */
inline fill_order_cancel_reject(order_cancel_reject_record, order_cancel_reject_value) {
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> order_cancel_reject_record.new_cl_order_id[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> order_cancel_reject_record.prev_cl_order_id[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> order_cancel_reject_record.error_code[order_cancel_reject_at] = order_cancel_reject_value; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Reject set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_reject(order_cancel_reject_record, order_cancel_reject_base) {
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> order_cancel_reject_record.new_cl_order_id[order_cancel_reject_at] = (order_cancel_reject_base + 0 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> order_cancel_reject_record.prev_cl_order_id[order_cancel_reject_at] = (order_cancel_reject_base + 4 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> order_cancel_reject_record.error_code[order_cancel_reject_at] = (order_cancel_reject_base + 8 + order_cancel_reject_at + 1) % 256; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Reject to the wire, 10 bytes from where the cursor stands */
inline encode_order_cancel_reject(order_cancel_reject_record) {
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> wire[at] = order_cancel_reject_record.new_cl_order_id[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> wire[at] = order_cancel_reject_record.prev_cl_order_id[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> wire[at] = order_cancel_reject_record.error_code[order_cancel_reject_at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Reject off the wire, 10 bytes from where the cursor stands */
inline decode_order_cancel_reject(order_cancel_reject_record) {
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> order_cancel_reject_record.new_cl_order_id[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> order_cancel_reject_record.prev_cl_order_id[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> order_cancel_reject_record.error_code[order_cancel_reject_at] = wire[at]; at = at + 1; order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Reject is what was written, byte for byte */
inline equal_order_cancel_reject(order_cancel_reject_read, order_cancel_reject_written) {
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> assert(order_cancel_reject_read.new_cl_order_id[order_cancel_reject_at] == order_cancel_reject_written.new_cl_order_id[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 4 -> assert(order_cancel_reject_read.prev_cl_order_id[order_cancel_reject_at] == order_cancel_reject_written.prev_cl_order_id[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  order_cancel_reject_at = 0;
  do
  :: order_cancel_reject_at < 2 -> assert(order_cancel_reject_read.error_code[order_cancel_reject_at] == order_cancel_reject_written.error_code[order_cancel_reject_at]); order_cancel_reject_at = order_cancel_reject_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replace Or Cancel Request: 22 bytes ------------------------------- */

/* Replace or cancel an order */
typedef OrderReplaceOrCancelRequest {
  byte new_cl_order_id[4];
  byte orig_cl_order_id[4];
  byte order_amt[8];
  byte price[4];
  byte instrument_index[2]
};

int order_replace_or_cancel_request_at;

/* every byte of Order Replace Or Cancel Request set to one value */
inline fill_order_replace_or_cancel_request(order_replace_or_cancel_request_record, order_replace_or_cancel_request_value) {
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> order_replace_or_cancel_request_record.new_cl_order_id[order_replace_or_cancel_request_at] = order_replace_or_cancel_request_value; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> order_replace_or_cancel_request_record.orig_cl_order_id[order_replace_or_cancel_request_at] = order_replace_or_cancel_request_value; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 8 -> order_replace_or_cancel_request_record.order_amt[order_replace_or_cancel_request_at] = order_replace_or_cancel_request_value; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> order_replace_or_cancel_request_record.price[order_replace_or_cancel_request_at] = order_replace_or_cancel_request_value; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 2 -> order_replace_or_cancel_request_record.instrument_index[order_replace_or_cancel_request_at] = order_replace_or_cancel_request_value; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replace Or Cancel Request set to where it lies, so a field read out of place says so */
inline ramp_order_replace_or_cancel_request(order_replace_or_cancel_request_record, order_replace_or_cancel_request_base) {
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> order_replace_or_cancel_request_record.new_cl_order_id[order_replace_or_cancel_request_at] = (order_replace_or_cancel_request_base + 0 + order_replace_or_cancel_request_at + 1) % 256; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> order_replace_or_cancel_request_record.orig_cl_order_id[order_replace_or_cancel_request_at] = (order_replace_or_cancel_request_base + 4 + order_replace_or_cancel_request_at + 1) % 256; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 8 -> order_replace_or_cancel_request_record.order_amt[order_replace_or_cancel_request_at] = (order_replace_or_cancel_request_base + 8 + order_replace_or_cancel_request_at + 1) % 256; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> order_replace_or_cancel_request_record.price[order_replace_or_cancel_request_at] = (order_replace_or_cancel_request_base + 16 + order_replace_or_cancel_request_at + 1) % 256; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 2 -> order_replace_or_cancel_request_record.instrument_index[order_replace_or_cancel_request_at] = (order_replace_or_cancel_request_base + 20 + order_replace_or_cancel_request_at + 1) % 256; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Or Cancel Request to the wire, 22 bytes from where the cursor stands */
inline encode_order_replace_or_cancel_request(order_replace_or_cancel_request_record) {
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> wire[at] = order_replace_or_cancel_request_record.new_cl_order_id[order_replace_or_cancel_request_at]; at = at + 1; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> wire[at] = order_replace_or_cancel_request_record.orig_cl_order_id[order_replace_or_cancel_request_at]; at = at + 1; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 8 -> wire[at] = order_replace_or_cancel_request_record.order_amt[order_replace_or_cancel_request_at]; at = at + 1; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> wire[at] = order_replace_or_cancel_request_record.price[order_replace_or_cancel_request_at]; at = at + 1; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 2 -> wire[at] = order_replace_or_cancel_request_record.instrument_index[order_replace_or_cancel_request_at]; at = at + 1; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Or Cancel Request off the wire, 22 bytes from where the cursor stands */
inline decode_order_replace_or_cancel_request(order_replace_or_cancel_request_record) {
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> order_replace_or_cancel_request_record.new_cl_order_id[order_replace_or_cancel_request_at] = wire[at]; at = at + 1; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> order_replace_or_cancel_request_record.orig_cl_order_id[order_replace_or_cancel_request_at] = wire[at]; at = at + 1; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 8 -> order_replace_or_cancel_request_record.order_amt[order_replace_or_cancel_request_at] = wire[at]; at = at + 1; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> order_replace_or_cancel_request_record.price[order_replace_or_cancel_request_at] = wire[at]; at = at + 1; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 2 -> order_replace_or_cancel_request_record.instrument_index[order_replace_or_cancel_request_at] = wire[at]; at = at + 1; order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replace Or Cancel Request is what was written, byte for byte */
inline equal_order_replace_or_cancel_request(order_replace_or_cancel_request_read, order_replace_or_cancel_request_written) {
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> assert(order_replace_or_cancel_request_read.new_cl_order_id[order_replace_or_cancel_request_at] == order_replace_or_cancel_request_written.new_cl_order_id[order_replace_or_cancel_request_at]); order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> assert(order_replace_or_cancel_request_read.orig_cl_order_id[order_replace_or_cancel_request_at] == order_replace_or_cancel_request_written.orig_cl_order_id[order_replace_or_cancel_request_at]); order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 8 -> assert(order_replace_or_cancel_request_read.order_amt[order_replace_or_cancel_request_at] == order_replace_or_cancel_request_written.order_amt[order_replace_or_cancel_request_at]); order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 4 -> assert(order_replace_or_cancel_request_read.price[order_replace_or_cancel_request_at] == order_replace_or_cancel_request_written.price[order_replace_or_cancel_request_at]); order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_request_at = 0;
  do
  :: order_replace_or_cancel_request_at < 2 -> assert(order_replace_or_cancel_request_read.instrument_index[order_replace_or_cancel_request_at] == order_replace_or_cancel_request_written.instrument_index[order_replace_or_cancel_request_at]); order_replace_or_cancel_request_at = order_replace_or_cancel_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replace Or Cancel Ack: 11 bytes ----------------------------------- */

/* Acknowledge replace/cancel */
typedef OrderReplaceOrCancelAck {
  byte new_cl_order_id[4];
  byte prev_cl_order_id[4];
  byte status;
  byte error_code[2]
};

int order_replace_or_cancel_ack_at;

/* every byte of Order Replace Or Cancel Ack set to one value */
inline fill_order_replace_or_cancel_ack(order_replace_or_cancel_ack_record, order_replace_or_cancel_ack_value) {
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 4 -> order_replace_or_cancel_ack_record.new_cl_order_id[order_replace_or_cancel_ack_at] = order_replace_or_cancel_ack_value; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 4 -> order_replace_or_cancel_ack_record.prev_cl_order_id[order_replace_or_cancel_ack_at] = order_replace_or_cancel_ack_value; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_ack_record.status = order_replace_or_cancel_ack_value;
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 2 -> order_replace_or_cancel_ack_record.error_code[order_replace_or_cancel_ack_at] = order_replace_or_cancel_ack_value; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replace Or Cancel Ack set to where it lies, so a field read out of place says so */
inline ramp_order_replace_or_cancel_ack(order_replace_or_cancel_ack_record, order_replace_or_cancel_ack_base) {
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 4 -> order_replace_or_cancel_ack_record.new_cl_order_id[order_replace_or_cancel_ack_at] = (order_replace_or_cancel_ack_base + 0 + order_replace_or_cancel_ack_at + 1) % 256; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 4 -> order_replace_or_cancel_ack_record.prev_cl_order_id[order_replace_or_cancel_ack_at] = (order_replace_or_cancel_ack_base + 4 + order_replace_or_cancel_ack_at + 1) % 256; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_ack_record.status = (order_replace_or_cancel_ack_base + 8 + 1) % 256;
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 2 -> order_replace_or_cancel_ack_record.error_code[order_replace_or_cancel_ack_at] = (order_replace_or_cancel_ack_base + 9 + order_replace_or_cancel_ack_at + 1) % 256; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Or Cancel Ack to the wire, 11 bytes from where the cursor stands */
inline encode_order_replace_or_cancel_ack(order_replace_or_cancel_ack_record) {
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 4 -> wire[at] = order_replace_or_cancel_ack_record.new_cl_order_id[order_replace_or_cancel_ack_at]; at = at + 1; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 4 -> wire[at] = order_replace_or_cancel_ack_record.prev_cl_order_id[order_replace_or_cancel_ack_at]; at = at + 1; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  wire[at] = order_replace_or_cancel_ack_record.status; at = at + 1;
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 2 -> wire[at] = order_replace_or_cancel_ack_record.error_code[order_replace_or_cancel_ack_at]; at = at + 1; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Or Cancel Ack off the wire, 11 bytes from where the cursor stands */
inline decode_order_replace_or_cancel_ack(order_replace_or_cancel_ack_record) {
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 4 -> order_replace_or_cancel_ack_record.new_cl_order_id[order_replace_or_cancel_ack_at] = wire[at]; at = at + 1; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 4 -> order_replace_or_cancel_ack_record.prev_cl_order_id[order_replace_or_cancel_ack_at] = wire[at]; at = at + 1; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_ack_record.status = wire[at]; at = at + 1;
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 2 -> order_replace_or_cancel_ack_record.error_code[order_replace_or_cancel_ack_at] = wire[at]; at = at + 1; order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replace Or Cancel Ack is what was written, byte for byte */
inline equal_order_replace_or_cancel_ack(order_replace_or_cancel_ack_read, order_replace_or_cancel_ack_written) {
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 4 -> assert(order_replace_or_cancel_ack_read.new_cl_order_id[order_replace_or_cancel_ack_at] == order_replace_or_cancel_ack_written.new_cl_order_id[order_replace_or_cancel_ack_at]); order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 4 -> assert(order_replace_or_cancel_ack_read.prev_cl_order_id[order_replace_or_cancel_ack_at] == order_replace_or_cancel_ack_written.prev_cl_order_id[order_replace_or_cancel_ack_at]); order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  assert(order_replace_or_cancel_ack_read.status == order_replace_or_cancel_ack_written.status);
  order_replace_or_cancel_ack_at = 0;
  do
  :: order_replace_or_cancel_ack_at < 2 -> assert(order_replace_or_cancel_ack_read.error_code[order_replace_or_cancel_ack_at] == order_replace_or_cancel_ack_written.error_code[order_replace_or_cancel_ack_at]); order_replace_or_cancel_ack_at = order_replace_or_cancel_ack_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Canceled Or Expired: 15 bytes ------------------------------------- */

/* Unsolicited cancellation/expiry notice */
typedef OrderCanceledOrExpired {
  byte cl_order_id[4];
  byte order_id[8];
  byte status;
  byte type[2]
};

int order_canceled_or_expired_at;

/* every byte of Order Canceled Or Expired set to one value */
inline fill_order_canceled_or_expired(order_canceled_or_expired_record, order_canceled_or_expired_value) {
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 4 -> order_canceled_or_expired_record.cl_order_id[order_canceled_or_expired_at] = order_canceled_or_expired_value; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 8 -> order_canceled_or_expired_record.order_id[order_canceled_or_expired_at] = order_canceled_or_expired_value; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  order_canceled_or_expired_record.status = order_canceled_or_expired_value;
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 2 -> order_canceled_or_expired_record.type[order_canceled_or_expired_at] = order_canceled_or_expired_value; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Canceled Or Expired set to where it lies, so a field read out of place says so */
inline ramp_order_canceled_or_expired(order_canceled_or_expired_record, order_canceled_or_expired_base) {
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 4 -> order_canceled_or_expired_record.cl_order_id[order_canceled_or_expired_at] = (order_canceled_or_expired_base + 0 + order_canceled_or_expired_at + 1) % 256; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 8 -> order_canceled_or_expired_record.order_id[order_canceled_or_expired_at] = (order_canceled_or_expired_base + 4 + order_canceled_or_expired_at + 1) % 256; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  order_canceled_or_expired_record.status = (order_canceled_or_expired_base + 12 + 1) % 256;
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 2 -> order_canceled_or_expired_record.type[order_canceled_or_expired_at] = (order_canceled_or_expired_base + 13 + order_canceled_or_expired_at + 1) % 256; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  skip
}

/* Order Canceled Or Expired to the wire, 15 bytes from where the cursor stands */
inline encode_order_canceled_or_expired(order_canceled_or_expired_record) {
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 4 -> wire[at] = order_canceled_or_expired_record.cl_order_id[order_canceled_or_expired_at]; at = at + 1; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 8 -> wire[at] = order_canceled_or_expired_record.order_id[order_canceled_or_expired_at]; at = at + 1; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  wire[at] = order_canceled_or_expired_record.status; at = at + 1;
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 2 -> wire[at] = order_canceled_or_expired_record.type[order_canceled_or_expired_at]; at = at + 1; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  skip
}

/* Order Canceled Or Expired off the wire, 15 bytes from where the cursor stands */
inline decode_order_canceled_or_expired(order_canceled_or_expired_record) {
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 4 -> order_canceled_or_expired_record.cl_order_id[order_canceled_or_expired_at] = wire[at]; at = at + 1; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 8 -> order_canceled_or_expired_record.order_id[order_canceled_or_expired_at] = wire[at]; at = at + 1; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  order_canceled_or_expired_record.status = wire[at]; at = at + 1;
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 2 -> order_canceled_or_expired_record.type[order_canceled_or_expired_at] = wire[at]; at = at + 1; order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Canceled Or Expired is what was written, byte for byte */
inline equal_order_canceled_or_expired(order_canceled_or_expired_read, order_canceled_or_expired_written) {
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 4 -> assert(order_canceled_or_expired_read.cl_order_id[order_canceled_or_expired_at] == order_canceled_or_expired_written.cl_order_id[order_canceled_or_expired_at]); order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 8 -> assert(order_canceled_or_expired_read.order_id[order_canceled_or_expired_at] == order_canceled_or_expired_written.order_id[order_canceled_or_expired_at]); order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  assert(order_canceled_or_expired_read.status == order_canceled_or_expired_written.status);
  order_canceled_or_expired_at = 0;
  do
  :: order_canceled_or_expired_at < 2 -> assert(order_canceled_or_expired_read.type[order_canceled_or_expired_at] == order_canceled_or_expired_written.type[order_canceled_or_expired_at]); order_canceled_or_expired_at = order_canceled_or_expired_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade: 85 bytes --------------------------------------------------------- */

/* Trade execution notification */
typedef Trade {
  byte cl_order_id[4];
  byte order_id[8];
  byte instrument_index[2];
  byte side;
  byte fill_amt[8];
  byte fill_rate[4];
  byte exec_broker[4];
  byte execution_id[20];
  byte exec_type;
  byte settle_date[8];
  byte trade_date[8];
  byte transact_time[8];
  byte leaves_amt[8];
  byte aggressor_flag
};

int trade_at;

/* every byte of Trade set to one value */
inline fill_trade(trade_record, trade_value) {
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.cl_order_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.order_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> trade_record.instrument_index[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.side = trade_value;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.fill_amt[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.fill_rate[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.exec_broker[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 20 -> trade_record.execution_id[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.exec_type = trade_value;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.settle_date[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trade_date[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.transact_time[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.leaves_amt[trade_at] = trade_value; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.aggressor_flag = trade_value;
  skip
}

/* each byte of Trade set to where it lies, so a field read out of place says so */
inline ramp_trade(trade_record, trade_base) {
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.cl_order_id[trade_at] = (trade_base + 0 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.order_id[trade_at] = (trade_base + 4 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> trade_record.instrument_index[trade_at] = (trade_base + 12 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.side = (trade_base + 14 + 1) % 256;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.fill_amt[trade_at] = (trade_base + 15 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.fill_rate[trade_at] = (trade_base + 23 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.exec_broker[trade_at] = (trade_base + 27 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 20 -> trade_record.execution_id[trade_at] = (trade_base + 31 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.exec_type = (trade_base + 51 + 1) % 256;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.settle_date[trade_at] = (trade_base + 52 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trade_date[trade_at] = (trade_base + 60 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.transact_time[trade_at] = (trade_base + 68 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.leaves_amt[trade_at] = (trade_base + 76 + trade_at + 1) % 256; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.aggressor_flag = (trade_base + 84 + 1) % 256;
  skip
}

/* Trade to the wire, 85 bytes from where the cursor stands */
inline encode_trade(trade_record) {
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.cl_order_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.order_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> wire[at] = trade_record.instrument_index[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.side; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.fill_amt[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.fill_rate[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> wire[at] = trade_record.exec_broker[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 20 -> wire[at] = trade_record.execution_id[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.exec_type; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.settle_date[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.trade_date[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.transact_time[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> wire[at] = trade_record.leaves_amt[trade_at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  wire[at] = trade_record.aggressor_flag; at = at + 1;
  skip
}

/* Trade off the wire, 85 bytes from where the cursor stands */
inline decode_trade(trade_record) {
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.cl_order_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.order_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> trade_record.instrument_index[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.side = wire[at]; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.fill_amt[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.fill_rate[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> trade_record.exec_broker[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 20 -> trade_record.execution_id[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.exec_type = wire[at]; at = at + 1;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.settle_date[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.trade_date[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.transact_time[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> trade_record.leaves_amt[trade_at] = wire[at]; at = at + 1; trade_at = trade_at + 1
  :: else -> break
  od;
  trade_record.aggressor_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade is what was written, byte for byte */
inline equal_trade(trade_read, trade_written) {
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.cl_order_id[trade_at] == trade_written.cl_order_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.order_id[trade_at] == trade_written.order_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 2 -> assert(trade_read.instrument_index[trade_at] == trade_written.instrument_index[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.side == trade_written.side);
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.fill_amt[trade_at] == trade_written.fill_amt[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.fill_rate[trade_at] == trade_written.fill_rate[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 4 -> assert(trade_read.exec_broker[trade_at] == trade_written.exec_broker[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 20 -> assert(trade_read.execution_id[trade_at] == trade_written.execution_id[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.exec_type == trade_written.exec_type);
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.settle_date[trade_at] == trade_written.settle_date[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.trade_date[trade_at] == trade_written.trade_date[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.transact_time[trade_at] == trade_written.transact_time[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  trade_at = 0;
  do
  :: trade_at < 8 -> assert(trade_read.leaves_amt[trade_at] == trade_written.leaves_amt[trade_at]); trade_at = trade_at + 1
  :: else -> break
  od;
  assert(trade_read.aggressor_flag == trade_written.aggressor_flag);
  skip
}

/* ---- Pending Fill: 33 bytes -------------------------------------------------- */

/* Notification of expected fill */
typedef PendingFill {
  byte cl_order_id[4];
  byte order_id[8];
  byte trade_link_id[4];
  byte fill_amt[8];
  byte fill_rate[4];
  byte aggressor_flag;
  byte exec_broker[4]
};

int pending_fill_at;

/* every byte of Pending Fill set to one value */
inline fill_pending_fill(pending_fill_record, pending_fill_value) {
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.cl_order_id[pending_fill_at] = pending_fill_value; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 8 -> pending_fill_record.order_id[pending_fill_at] = pending_fill_value; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.trade_link_id[pending_fill_at] = pending_fill_value; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 8 -> pending_fill_record.fill_amt[pending_fill_at] = pending_fill_value; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.fill_rate[pending_fill_at] = pending_fill_value; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_record.aggressor_flag = pending_fill_value;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.exec_broker[pending_fill_at] = pending_fill_value; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Pending Fill set to where it lies, so a field read out of place says so */
inline ramp_pending_fill(pending_fill_record, pending_fill_base) {
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.cl_order_id[pending_fill_at] = (pending_fill_base + 0 + pending_fill_at + 1) % 256; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 8 -> pending_fill_record.order_id[pending_fill_at] = (pending_fill_base + 4 + pending_fill_at + 1) % 256; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.trade_link_id[pending_fill_at] = (pending_fill_base + 12 + pending_fill_at + 1) % 256; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 8 -> pending_fill_record.fill_amt[pending_fill_at] = (pending_fill_base + 16 + pending_fill_at + 1) % 256; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.fill_rate[pending_fill_at] = (pending_fill_base + 24 + pending_fill_at + 1) % 256; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_record.aggressor_flag = (pending_fill_base + 28 + 1) % 256;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.exec_broker[pending_fill_at] = (pending_fill_base + 29 + pending_fill_at + 1) % 256; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  skip
}

/* Pending Fill to the wire, 33 bytes from where the cursor stands */
inline encode_pending_fill(pending_fill_record) {
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> wire[at] = pending_fill_record.cl_order_id[pending_fill_at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 8 -> wire[at] = pending_fill_record.order_id[pending_fill_at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> wire[at] = pending_fill_record.trade_link_id[pending_fill_at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 8 -> wire[at] = pending_fill_record.fill_amt[pending_fill_at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> wire[at] = pending_fill_record.fill_rate[pending_fill_at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  wire[at] = pending_fill_record.aggressor_flag; at = at + 1;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> wire[at] = pending_fill_record.exec_broker[pending_fill_at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  skip
}

/* Pending Fill off the wire, 33 bytes from where the cursor stands */
inline decode_pending_fill(pending_fill_record) {
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.cl_order_id[pending_fill_at] = wire[at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 8 -> pending_fill_record.order_id[pending_fill_at] = wire[at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.trade_link_id[pending_fill_at] = wire[at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 8 -> pending_fill_record.fill_amt[pending_fill_at] = wire[at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.fill_rate[pending_fill_at] = wire[at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_record.aggressor_flag = wire[at]; at = at + 1;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> pending_fill_record.exec_broker[pending_fill_at] = wire[at]; at = at + 1; pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Pending Fill is what was written, byte for byte */
inline equal_pending_fill(pending_fill_read, pending_fill_written) {
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> assert(pending_fill_read.cl_order_id[pending_fill_at] == pending_fill_written.cl_order_id[pending_fill_at]); pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 8 -> assert(pending_fill_read.order_id[pending_fill_at] == pending_fill_written.order_id[pending_fill_at]); pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> assert(pending_fill_read.trade_link_id[pending_fill_at] == pending_fill_written.trade_link_id[pending_fill_at]); pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 8 -> assert(pending_fill_read.fill_amt[pending_fill_at] == pending_fill_written.fill_amt[pending_fill_at]); pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> assert(pending_fill_read.fill_rate[pending_fill_at] == pending_fill_written.fill_rate[pending_fill_at]); pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  assert(pending_fill_read.aggressor_flag == pending_fill_written.aggressor_flag);
  pending_fill_at = 0;
  do
  :: pending_fill_at < 4 -> assert(pending_fill_read.exec_broker[pending_fill_at] == pending_fill_written.exec_broker[pending_fill_at]); pending_fill_at = pending_fill_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Pending Fill Cancel: 16 bytes ------------------------------------------- */

/* Notification of pending fill cancellation */
typedef PendingFillCancel {
  byte cl_order_id[4];
  byte order_id[8];
  byte trade_link_id[4]
};

int pending_fill_cancel_at;

/* every byte of Pending Fill Cancel set to one value */
inline fill_pending_fill_cancel(pending_fill_cancel_record, pending_fill_cancel_value) {
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 4 -> pending_fill_cancel_record.cl_order_id[pending_fill_cancel_at] = pending_fill_cancel_value; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 8 -> pending_fill_cancel_record.order_id[pending_fill_cancel_at] = pending_fill_cancel_value; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 4 -> pending_fill_cancel_record.trade_link_id[pending_fill_cancel_at] = pending_fill_cancel_value; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Pending Fill Cancel set to where it lies, so a field read out of place says so */
inline ramp_pending_fill_cancel(pending_fill_cancel_record, pending_fill_cancel_base) {
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 4 -> pending_fill_cancel_record.cl_order_id[pending_fill_cancel_at] = (pending_fill_cancel_base + 0 + pending_fill_cancel_at + 1) % 256; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 8 -> pending_fill_cancel_record.order_id[pending_fill_cancel_at] = (pending_fill_cancel_base + 4 + pending_fill_cancel_at + 1) % 256; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 4 -> pending_fill_cancel_record.trade_link_id[pending_fill_cancel_at] = (pending_fill_cancel_base + 12 + pending_fill_cancel_at + 1) % 256; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* Pending Fill Cancel to the wire, 16 bytes from where the cursor stands */
inline encode_pending_fill_cancel(pending_fill_cancel_record) {
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 4 -> wire[at] = pending_fill_cancel_record.cl_order_id[pending_fill_cancel_at]; at = at + 1; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 8 -> wire[at] = pending_fill_cancel_record.order_id[pending_fill_cancel_at]; at = at + 1; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 4 -> wire[at] = pending_fill_cancel_record.trade_link_id[pending_fill_cancel_at]; at = at + 1; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* Pending Fill Cancel off the wire, 16 bytes from where the cursor stands */
inline decode_pending_fill_cancel(pending_fill_cancel_record) {
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 4 -> pending_fill_cancel_record.cl_order_id[pending_fill_cancel_at] = wire[at]; at = at + 1; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 8 -> pending_fill_cancel_record.order_id[pending_fill_cancel_at] = wire[at]; at = at + 1; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 4 -> pending_fill_cancel_record.trade_link_id[pending_fill_cancel_at] = wire[at]; at = at + 1; pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Pending Fill Cancel is what was written, byte for byte */
inline equal_pending_fill_cancel(pending_fill_cancel_read, pending_fill_cancel_written) {
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 4 -> assert(pending_fill_cancel_read.cl_order_id[pending_fill_cancel_at] == pending_fill_cancel_written.cl_order_id[pending_fill_cancel_at]); pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 8 -> assert(pending_fill_cancel_read.order_id[pending_fill_cancel_at] == pending_fill_cancel_written.order_id[pending_fill_cancel_at]); pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  pending_fill_cancel_at = 0;
  do
  :: pending_fill_cancel_at < 4 -> assert(pending_fill_cancel_read.trade_link_id[pending_fill_cancel_at] == pending_fill_cancel_written.trade_link_id[pending_fill_cancel_at]); pending_fill_cancel_at = pending_fill_cancel_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Pending: 34 bytes ------------------------------------------------- */

/* Trade notification linked to pending fill */
typedef TradePending {
  byte exec_type;
  byte settle_date[8];
  byte trade_date[8];
  byte transact_time[8];
  byte leaves_amt[8];
  byte aggressor_flag
};

int trade_pending_at;

/* every byte of Trade Pending set to one value */
inline fill_trade_pending(trade_pending_record, trade_pending_value) {
  trade_pending_record.exec_type = trade_pending_value;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.settle_date[trade_pending_at] = trade_pending_value; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.trade_date[trade_pending_at] = trade_pending_value; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.transact_time[trade_pending_at] = trade_pending_value; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.leaves_amt[trade_pending_at] = trade_pending_value; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_record.aggressor_flag = trade_pending_value;
  skip
}

/* each byte of Trade Pending set to where it lies, so a field read out of place says so */
inline ramp_trade_pending(trade_pending_record, trade_pending_base) {
  trade_pending_record.exec_type = (trade_pending_base + 0 + 1) % 256;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.settle_date[trade_pending_at] = (trade_pending_base + 1 + trade_pending_at + 1) % 256; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.trade_date[trade_pending_at] = (trade_pending_base + 9 + trade_pending_at + 1) % 256; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.transact_time[trade_pending_at] = (trade_pending_base + 17 + trade_pending_at + 1) % 256; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.leaves_amt[trade_pending_at] = (trade_pending_base + 25 + trade_pending_at + 1) % 256; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_record.aggressor_flag = (trade_pending_base + 33 + 1) % 256;
  skip
}

/* Trade Pending to the wire, 34 bytes from where the cursor stands */
inline encode_trade_pending(trade_pending_record) {
  wire[at] = trade_pending_record.exec_type; at = at + 1;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> wire[at] = trade_pending_record.settle_date[trade_pending_at]; at = at + 1; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> wire[at] = trade_pending_record.trade_date[trade_pending_at]; at = at + 1; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> wire[at] = trade_pending_record.transact_time[trade_pending_at]; at = at + 1; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> wire[at] = trade_pending_record.leaves_amt[trade_pending_at]; at = at + 1; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  wire[at] = trade_pending_record.aggressor_flag; at = at + 1;
  skip
}

/* Trade Pending off the wire, 34 bytes from where the cursor stands */
inline decode_trade_pending(trade_pending_record) {
  trade_pending_record.exec_type = wire[at]; at = at + 1;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.settle_date[trade_pending_at] = wire[at]; at = at + 1; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.trade_date[trade_pending_at] = wire[at]; at = at + 1; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.transact_time[trade_pending_at] = wire[at]; at = at + 1; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> trade_pending_record.leaves_amt[trade_pending_at] = wire[at]; at = at + 1; trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_record.aggressor_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Pending is what was written, byte for byte */
inline equal_trade_pending(trade_pending_read, trade_pending_written) {
  assert(trade_pending_read.exec_type == trade_pending_written.exec_type);
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> assert(trade_pending_read.settle_date[trade_pending_at] == trade_pending_written.settle_date[trade_pending_at]); trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> assert(trade_pending_read.trade_date[trade_pending_at] == trade_pending_written.trade_date[trade_pending_at]); trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> assert(trade_pending_read.transact_time[trade_pending_at] == trade_pending_written.transact_time[trade_pending_at]); trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  trade_pending_at = 0;
  do
  :: trade_pending_at < 8 -> assert(trade_pending_read.leaves_amt[trade_pending_at] == trade_pending_written.leaves_amt[trade_pending_at]); trade_pending_at = trade_pending_at + 1
  :: else -> break
  od;
  assert(trade_pending_read.aggressor_flag == trade_pending_written.aggressor_flag);
  skip
}

/* ---- Resend Request: 4 bytes ------------------------------------------------- */

/* Request retransmission of missed messages */
typedef ResendRequest {
  byte begin_seq_no[4]
};

int resend_request_at;

/* every byte of Resend Request set to one value */
inline fill_resend_request(resend_request_record, resend_request_value) {
  resend_request_at = 0;
  do
  :: resend_request_at < 4 -> resend_request_record.begin_seq_no[resend_request_at] = resend_request_value; resend_request_at = resend_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Resend Request set to where it lies, so a field read out of place says so */
inline ramp_resend_request(resend_request_record, resend_request_base) {
  resend_request_at = 0;
  do
  :: resend_request_at < 4 -> resend_request_record.begin_seq_no[resend_request_at] = (resend_request_base + 0 + resend_request_at + 1) % 256; resend_request_at = resend_request_at + 1
  :: else -> break
  od;
  skip
}

/* Resend Request to the wire, 4 bytes from where the cursor stands */
inline encode_resend_request(resend_request_record) {
  resend_request_at = 0;
  do
  :: resend_request_at < 4 -> wire[at] = resend_request_record.begin_seq_no[resend_request_at]; at = at + 1; resend_request_at = resend_request_at + 1
  :: else -> break
  od;
  skip
}

/* Resend Request off the wire, 4 bytes from where the cursor stands */
inline decode_resend_request(resend_request_record) {
  resend_request_at = 0;
  do
  :: resend_request_at < 4 -> resend_request_record.begin_seq_no[resend_request_at] = wire[at]; at = at + 1; resend_request_at = resend_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Resend Request is what was written, byte for byte */
inline equal_resend_request(resend_request_read, resend_request_written) {
  resend_request_at = 0;
  do
  :: resend_request_at < 4 -> assert(resend_request_read.begin_seq_no[resend_request_at] == resend_request_written.begin_seq_no[resend_request_at]); resend_request_at = resend_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Gap Fill: 5 bytes ------------------------------------------------------- */

/* Skip non-resendable or unavailable messages */
typedef GapFill {
  byte new_seq_no[4];
  byte reason_code
};

int gap_fill_at;

/* every byte of Gap Fill set to one value */
inline fill_gap_fill(gap_fill_record, gap_fill_value) {
  gap_fill_at = 0;
  do
  :: gap_fill_at < 4 -> gap_fill_record.new_seq_no[gap_fill_at] = gap_fill_value; gap_fill_at = gap_fill_at + 1
  :: else -> break
  od;
  gap_fill_record.reason_code = gap_fill_value;
  skip
}

/* each byte of Gap Fill set to where it lies, so a field read out of place says so */
inline ramp_gap_fill(gap_fill_record, gap_fill_base) {
  gap_fill_at = 0;
  do
  :: gap_fill_at < 4 -> gap_fill_record.new_seq_no[gap_fill_at] = (gap_fill_base + 0 + gap_fill_at + 1) % 256; gap_fill_at = gap_fill_at + 1
  :: else -> break
  od;
  gap_fill_record.reason_code = (gap_fill_base + 4 + 1) % 256;
  skip
}

/* Gap Fill to the wire, 5 bytes from where the cursor stands */
inline encode_gap_fill(gap_fill_record) {
  gap_fill_at = 0;
  do
  :: gap_fill_at < 4 -> wire[at] = gap_fill_record.new_seq_no[gap_fill_at]; at = at + 1; gap_fill_at = gap_fill_at + 1
  :: else -> break
  od;
  wire[at] = gap_fill_record.reason_code; at = at + 1;
  skip
}

/* Gap Fill off the wire, 5 bytes from where the cursor stands */
inline decode_gap_fill(gap_fill_record) {
  gap_fill_at = 0;
  do
  :: gap_fill_at < 4 -> gap_fill_record.new_seq_no[gap_fill_at] = wire[at]; at = at + 1; gap_fill_at = gap_fill_at + 1
  :: else -> break
  od;
  gap_fill_record.reason_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Gap Fill is what was written, byte for byte */
inline equal_gap_fill(gap_fill_read, gap_fill_written) {
  gap_fill_at = 0;
  do
  :: gap_fill_at < 4 -> assert(gap_fill_read.new_seq_no[gap_fill_at] == gap_fill_written.new_seq_no[gap_fill_at]); gap_fill_at = gap_fill_at + 1
  :: else -> break
  od;
  assert(gap_fill_read.reason_code == gap_fill_written.reason_code);
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
    assert(at == 9);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 9);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Logon: encoded, read back, and compared */
proctype check_logon() {
  Logon logon_sent;
  Logon logon_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon(logon_sent, 0)
  :: pattern == 1 -> fill_logon(logon_sent, 32)
  :: pattern == 2 -> fill_logon(logon_sent, 255)
  :: else -> ramp_logon(logon_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon(logon_sent);
    assert(at == 44);
    at = 0;
    decode_logon(logon_got);
    assert(at == 44);
    equal_logon(logon_got, logon_sent)
  }
}

/* Logout: encoded, read back, and compared */
proctype check_logout() {
  Logout logout_sent;
  Logout logout_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logout(logout_sent, 0)
  :: pattern == 1 -> fill_logout(logout_sent, 32)
  :: pattern == 2 -> fill_logout(logout_sent, 255)
  :: else -> ramp_logout(logout_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logout(logout_sent);
    assert(at == 27);
    at = 0;
    decode_logout(logout_got);
    assert(at == 27);
    equal_logout(logout_got, logout_sent)
  }
}

/* Heartbeat: encoded, read back, and compared */
proctype check_heartbeat() {
  Heartbeat heartbeat_sent;
  Heartbeat heartbeat_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat(heartbeat_sent, 0)
  :: pattern == 1 -> fill_heartbeat(heartbeat_sent, 32)
  :: pattern == 2 -> fill_heartbeat(heartbeat_sent, 255)
  :: else -> ramp_heartbeat(heartbeat_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat(heartbeat_sent);
    assert(at == 4);
    at = 0;
    decode_heartbeat(heartbeat_got);
    assert(at == 4);
    equal_heartbeat(heartbeat_got, heartbeat_sent)
  }
}

/* Instrument Info Request: encoded, read back, and compared */
proctype check_instrument_info_request() {
  InstrumentInfoRequest instrument_info_request_sent;
  InstrumentInfoRequest instrument_info_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_info_request(instrument_info_request_sent, 0)
  :: pattern == 1 -> fill_instrument_info_request(instrument_info_request_sent, 32)
  :: pattern == 2 -> fill_instrument_info_request(instrument_info_request_sent, 255)
  :: else -> ramp_instrument_info_request(instrument_info_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_info_request(instrument_info_request_sent);
    assert(at == 4);
    at = 0;
    decode_instrument_info_request(instrument_info_request_got);
    assert(at == 4);
    equal_instrument_info_request(instrument_info_request_got, instrument_info_request_sent)
  }
}

/* Instrument Info: encoded, read back, and compared */
proctype check_instrument_info() {
  InstrumentInfo instrument_info_sent;
  InstrumentInfo instrument_info_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_info(instrument_info_sent, 0)
  :: pattern == 1 -> fill_instrument_info(instrument_info_sent, 32)
  :: pattern == 2 -> fill_instrument_info(instrument_info_sent, 255)
  :: else -> ramp_instrument_info(instrument_info_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_info(instrument_info_sent);
    assert(at == 35);
    at = 0;
    decode_instrument_info(instrument_info_got);
    assert(at == 35);
    equal_instrument_info(instrument_info_got, instrument_info_sent)
  }
}

/* New Order Request: encoded, read back, and compared */
proctype check_new_order_request() {
  NewOrderRequest new_order_request_sent;
  NewOrderRequest new_order_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_request(new_order_request_sent, 0)
  :: pattern == 1 -> fill_new_order_request(new_order_request_sent, 32)
  :: pattern == 2 -> fill_new_order_request(new_order_request_sent, 255)
  :: else -> ramp_new_order_request(new_order_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_request(new_order_request_sent);
    assert(at == 37);
    at = 0;
    decode_new_order_request(new_order_request_got);
    assert(at == 37);
    equal_new_order_request(new_order_request_got, new_order_request_sent)
  }
}

/* New Order Ack: encoded, read back, and compared */
proctype check_new_order_ack() {
  NewOrderAck new_order_ack_sent;
  NewOrderAck new_order_ack_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_ack(new_order_ack_sent, 0)
  :: pattern == 1 -> fill_new_order_ack(new_order_ack_sent, 32)
  :: pattern == 2 -> fill_new_order_ack(new_order_ack_sent, 255)
  :: else -> ramp_new_order_ack(new_order_ack_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_ack(new_order_ack_sent);
    assert(at == 15);
    at = 0;
    decode_new_order_ack(new_order_ack_got);
    assert(at == 15);
    equal_new_order_ack(new_order_ack_got, new_order_ack_sent)
  }
}

/* Order Cancel Request: encoded, read back, and compared */
proctype check_order_cancel_request() {
  OrderCancelRequest order_cancel_request_sent;
  OrderCancelRequest order_cancel_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_request(order_cancel_request_sent, 0)
  :: pattern == 1 -> fill_order_cancel_request(order_cancel_request_sent, 32)
  :: pattern == 2 -> fill_order_cancel_request(order_cancel_request_sent, 255)
  :: else -> ramp_order_cancel_request(order_cancel_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_request(order_cancel_request_sent);
    assert(at == 10);
    at = 0;
    decode_order_cancel_request(order_cancel_request_got);
    assert(at == 10);
    equal_order_cancel_request(order_cancel_request_got, order_cancel_request_sent)
  }
}

/* Order Cancel Reject: encoded, read back, and compared */
proctype check_order_cancel_reject() {
  OrderCancelReject order_cancel_reject_sent;
  OrderCancelReject order_cancel_reject_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_reject(order_cancel_reject_sent, 0)
  :: pattern == 1 -> fill_order_cancel_reject(order_cancel_reject_sent, 32)
  :: pattern == 2 -> fill_order_cancel_reject(order_cancel_reject_sent, 255)
  :: else -> ramp_order_cancel_reject(order_cancel_reject_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_reject(order_cancel_reject_sent);
    assert(at == 10);
    at = 0;
    decode_order_cancel_reject(order_cancel_reject_got);
    assert(at == 10);
    equal_order_cancel_reject(order_cancel_reject_got, order_cancel_reject_sent)
  }
}

/* Order Replace Or Cancel Request: encoded, read back, and compared */
proctype check_order_replace_or_cancel_request() {
  OrderReplaceOrCancelRequest order_replace_or_cancel_request_sent;
  OrderReplaceOrCancelRequest order_replace_or_cancel_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replace_or_cancel_request(order_replace_or_cancel_request_sent, 0)
  :: pattern == 1 -> fill_order_replace_or_cancel_request(order_replace_or_cancel_request_sent, 32)
  :: pattern == 2 -> fill_order_replace_or_cancel_request(order_replace_or_cancel_request_sent, 255)
  :: else -> ramp_order_replace_or_cancel_request(order_replace_or_cancel_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replace_or_cancel_request(order_replace_or_cancel_request_sent);
    assert(at == 22);
    at = 0;
    decode_order_replace_or_cancel_request(order_replace_or_cancel_request_got);
    assert(at == 22);
    equal_order_replace_or_cancel_request(order_replace_or_cancel_request_got, order_replace_or_cancel_request_sent)
  }
}

/* Order Replace Or Cancel Ack: encoded, read back, and compared */
proctype check_order_replace_or_cancel_ack() {
  OrderReplaceOrCancelAck order_replace_or_cancel_ack_sent;
  OrderReplaceOrCancelAck order_replace_or_cancel_ack_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replace_or_cancel_ack(order_replace_or_cancel_ack_sent, 0)
  :: pattern == 1 -> fill_order_replace_or_cancel_ack(order_replace_or_cancel_ack_sent, 32)
  :: pattern == 2 -> fill_order_replace_or_cancel_ack(order_replace_or_cancel_ack_sent, 255)
  :: else -> ramp_order_replace_or_cancel_ack(order_replace_or_cancel_ack_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replace_or_cancel_ack(order_replace_or_cancel_ack_sent);
    assert(at == 11);
    at = 0;
    decode_order_replace_or_cancel_ack(order_replace_or_cancel_ack_got);
    assert(at == 11);
    equal_order_replace_or_cancel_ack(order_replace_or_cancel_ack_got, order_replace_or_cancel_ack_sent)
  }
}

/* Order Canceled Or Expired: encoded, read back, and compared */
proctype check_order_canceled_or_expired() {
  OrderCanceledOrExpired order_canceled_or_expired_sent;
  OrderCanceledOrExpired order_canceled_or_expired_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_canceled_or_expired(order_canceled_or_expired_sent, 0)
  :: pattern == 1 -> fill_order_canceled_or_expired(order_canceled_or_expired_sent, 32)
  :: pattern == 2 -> fill_order_canceled_or_expired(order_canceled_or_expired_sent, 255)
  :: else -> ramp_order_canceled_or_expired(order_canceled_or_expired_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_canceled_or_expired(order_canceled_or_expired_sent);
    assert(at == 15);
    at = 0;
    decode_order_canceled_or_expired(order_canceled_or_expired_got);
    assert(at == 15);
    equal_order_canceled_or_expired(order_canceled_or_expired_got, order_canceled_or_expired_sent)
  }
}

/* Trade: encoded, read back, and compared */
proctype check_trade() {
  Trade trade_sent;
  Trade trade_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade(trade_sent, 0)
  :: pattern == 1 -> fill_trade(trade_sent, 32)
  :: pattern == 2 -> fill_trade(trade_sent, 255)
  :: else -> ramp_trade(trade_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade(trade_sent);
    assert(at == 85);
    at = 0;
    decode_trade(trade_got);
    assert(at == 85);
    equal_trade(trade_got, trade_sent)
  }
}

/* Pending Fill: encoded, read back, and compared */
proctype check_pending_fill() {
  PendingFill pending_fill_sent;
  PendingFill pending_fill_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_pending_fill(pending_fill_sent, 0)
  :: pattern == 1 -> fill_pending_fill(pending_fill_sent, 32)
  :: pattern == 2 -> fill_pending_fill(pending_fill_sent, 255)
  :: else -> ramp_pending_fill(pending_fill_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_pending_fill(pending_fill_sent);
    assert(at == 33);
    at = 0;
    decode_pending_fill(pending_fill_got);
    assert(at == 33);
    equal_pending_fill(pending_fill_got, pending_fill_sent)
  }
}

/* Pending Fill Cancel: encoded, read back, and compared */
proctype check_pending_fill_cancel() {
  PendingFillCancel pending_fill_cancel_sent;
  PendingFillCancel pending_fill_cancel_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_pending_fill_cancel(pending_fill_cancel_sent, 0)
  :: pattern == 1 -> fill_pending_fill_cancel(pending_fill_cancel_sent, 32)
  :: pattern == 2 -> fill_pending_fill_cancel(pending_fill_cancel_sent, 255)
  :: else -> ramp_pending_fill_cancel(pending_fill_cancel_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_pending_fill_cancel(pending_fill_cancel_sent);
    assert(at == 16);
    at = 0;
    decode_pending_fill_cancel(pending_fill_cancel_got);
    assert(at == 16);
    equal_pending_fill_cancel(pending_fill_cancel_got, pending_fill_cancel_sent)
  }
}

/* Trade Pending: encoded, read back, and compared */
proctype check_trade_pending() {
  TradePending trade_pending_sent;
  TradePending trade_pending_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_pending(trade_pending_sent, 0)
  :: pattern == 1 -> fill_trade_pending(trade_pending_sent, 32)
  :: pattern == 2 -> fill_trade_pending(trade_pending_sent, 255)
  :: else -> ramp_trade_pending(trade_pending_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_pending(trade_pending_sent);
    assert(at == 34);
    at = 0;
    decode_trade_pending(trade_pending_got);
    assert(at == 34);
    equal_trade_pending(trade_pending_got, trade_pending_sent)
  }
}

/* Resend Request: encoded, read back, and compared */
proctype check_resend_request() {
  ResendRequest resend_request_sent;
  ResendRequest resend_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_resend_request(resend_request_sent, 0)
  :: pattern == 1 -> fill_resend_request(resend_request_sent, 32)
  :: pattern == 2 -> fill_resend_request(resend_request_sent, 255)
  :: else -> ramp_resend_request(resend_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_resend_request(resend_request_sent);
    assert(at == 4);
    at = 0;
    decode_resend_request(resend_request_got);
    assert(at == 4);
    equal_resend_request(resend_request_got, resend_request_sent)
  }
}

/* Gap Fill: encoded, read back, and compared */
proctype check_gap_fill() {
  GapFill gap_fill_sent;
  GapFill gap_fill_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gap_fill(gap_fill_sent, 0)
  :: pattern == 1 -> fill_gap_fill(gap_fill_sent, 32)
  :: pattern == 2 -> fill_gap_fill(gap_fill_sent, 255)
  :: else -> ramp_gap_fill(gap_fill_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gap_fill(gap_fill_sent);
    assert(at == 5);
    at = 0;
    decode_gap_fill(gap_fill_got);
    assert(at == 5);
    equal_gap_fill(gap_fill_got, gap_fill_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_logon()
  :: run check_logout()
  :: run check_heartbeat()
  :: run check_instrument_info_request()
  :: run check_instrument_info()
  :: run check_new_order_request()
  :: run check_new_order_ack()
  :: run check_order_cancel_request()
  :: run check_order_cancel_reject()
  :: run check_order_replace_or_cancel_request()
  :: run check_order_replace_or_cancel_ack()
  :: run check_order_canceled_or_expired()
  :: run check_trade()
  :: run check_pending_fill()
  :: run check_pending_fill_cancel()
  :: run check_trade_pending()
  :: run check_resend_request()
  :: run check_gap_fill()
  fi
}
