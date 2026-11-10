/*
 * Currenex Executable Streaming Prices
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
#define WIRE 57

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 9 bytes ------------------------------------------------- */

/* Currenex Itch Market Data Message Header */
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

/* A MP initiates a session by submitting a Logon message to Currenex */
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

/* Currenex or a MP can terminate a session by sending a Logout message */
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

/* To ensure session integrity, Currenex sends a heartbeat message every fifteen seconds */
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

/* ---- Instrument Info: 35 bytes ----------------------------------------------- */

/* Included in the InstrumentInfo message is the InstrumentType, a free form instrument definition, and the InstrumentIndex used to request quotes and manage price updates */
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

/* ---- Instrument Info Ack: 6 bytes -------------------------------------------- */

/* A MP should respond to each received InstrumentInfo message with an InstrumentInfoAck message */
typedef InstrumentInfoAck {
  byte session_id[4];
  byte instrument_index[2]
};

int instrument_info_ack_at;

/* every byte of Instrument Info Ack set to one value */
inline fill_instrument_info_ack(instrument_info_ack_record, instrument_info_ack_value) {
  instrument_info_ack_at = 0;
  do
  :: instrument_info_ack_at < 4 -> instrument_info_ack_record.session_id[instrument_info_ack_at] = instrument_info_ack_value; instrument_info_ack_at = instrument_info_ack_at + 1
  :: else -> break
  od;
  instrument_info_ack_at = 0;
  do
  :: instrument_info_ack_at < 2 -> instrument_info_ack_record.instrument_index[instrument_info_ack_at] = instrument_info_ack_value; instrument_info_ack_at = instrument_info_ack_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Info Ack set to where it lies, so a field read out of place says so */
inline ramp_instrument_info_ack(instrument_info_ack_record, instrument_info_ack_base) {
  instrument_info_ack_at = 0;
  do
  :: instrument_info_ack_at < 4 -> instrument_info_ack_record.session_id[instrument_info_ack_at] = (instrument_info_ack_base + 0 + instrument_info_ack_at + 1) % 256; instrument_info_ack_at = instrument_info_ack_at + 1
  :: else -> break
  od;
  instrument_info_ack_at = 0;
  do
  :: instrument_info_ack_at < 2 -> instrument_info_ack_record.instrument_index[instrument_info_ack_at] = (instrument_info_ack_base + 4 + instrument_info_ack_at + 1) % 256; instrument_info_ack_at = instrument_info_ack_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Ack to the wire, 6 bytes from where the cursor stands */
inline encode_instrument_info_ack(instrument_info_ack_record) {
  instrument_info_ack_at = 0;
  do
  :: instrument_info_ack_at < 4 -> wire[at] = instrument_info_ack_record.session_id[instrument_info_ack_at]; at = at + 1; instrument_info_ack_at = instrument_info_ack_at + 1
  :: else -> break
  od;
  instrument_info_ack_at = 0;
  do
  :: instrument_info_ack_at < 2 -> wire[at] = instrument_info_ack_record.instrument_index[instrument_info_ack_at]; at = at + 1; instrument_info_ack_at = instrument_info_ack_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Ack off the wire, 6 bytes from where the cursor stands */
inline decode_instrument_info_ack(instrument_info_ack_record) {
  instrument_info_ack_at = 0;
  do
  :: instrument_info_ack_at < 4 -> instrument_info_ack_record.session_id[instrument_info_ack_at] = wire[at]; at = at + 1; instrument_info_ack_at = instrument_info_ack_at + 1
  :: else -> break
  od;
  instrument_info_ack_at = 0;
  do
  :: instrument_info_ack_at < 2 -> instrument_info_ack_record.instrument_index[instrument_info_ack_at] = wire[at]; at = at + 1; instrument_info_ack_at = instrument_info_ack_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Info Ack is what was written, byte for byte */
inline equal_instrument_info_ack(instrument_info_ack_read, instrument_info_ack_written) {
  instrument_info_ack_at = 0;
  do
  :: instrument_info_ack_at < 4 -> assert(instrument_info_ack_read.session_id[instrument_info_ack_at] == instrument_info_ack_written.session_id[instrument_info_ack_at]); instrument_info_ack_at = instrument_info_ack_at + 1
  :: else -> break
  od;
  instrument_info_ack_at = 0;
  do
  :: instrument_info_ack_at < 2 -> assert(instrument_info_ack_read.instrument_index[instrument_info_ack_at] == instrument_info_ack_written.instrument_index[instrument_info_ack_at]); instrument_info_ack_at = instrument_info_ack_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Subscription Request: 8 bytes ------------------------------------------- */

/* Currenex will stream ESP messages to a MP once it receives a SubscriptionRequest message for the pair */
typedef SubscriptionRequest {
  byte session_id[4];
  byte subscription_type;
  byte instrument_index[2];
  byte subscribe_to_ticker
};

int subscription_request_at;

/* every byte of Subscription Request set to one value */
inline fill_subscription_request(subscription_request_record, subscription_request_value) {
  subscription_request_at = 0;
  do
  :: subscription_request_at < 4 -> subscription_request_record.session_id[subscription_request_at] = subscription_request_value; subscription_request_at = subscription_request_at + 1
  :: else -> break
  od;
  subscription_request_record.subscription_type = subscription_request_value;
  subscription_request_at = 0;
  do
  :: subscription_request_at < 2 -> subscription_request_record.instrument_index[subscription_request_at] = subscription_request_value; subscription_request_at = subscription_request_at + 1
  :: else -> break
  od;
  subscription_request_record.subscribe_to_ticker = subscription_request_value;
  skip
}

/* each byte of Subscription Request set to where it lies, so a field read out of place says so */
inline ramp_subscription_request(subscription_request_record, subscription_request_base) {
  subscription_request_at = 0;
  do
  :: subscription_request_at < 4 -> subscription_request_record.session_id[subscription_request_at] = (subscription_request_base + 0 + subscription_request_at + 1) % 256; subscription_request_at = subscription_request_at + 1
  :: else -> break
  od;
  subscription_request_record.subscription_type = (subscription_request_base + 4 + 1) % 256;
  subscription_request_at = 0;
  do
  :: subscription_request_at < 2 -> subscription_request_record.instrument_index[subscription_request_at] = (subscription_request_base + 5 + subscription_request_at + 1) % 256; subscription_request_at = subscription_request_at + 1
  :: else -> break
  od;
  subscription_request_record.subscribe_to_ticker = (subscription_request_base + 7 + 1) % 256;
  skip
}

/* Subscription Request to the wire, 8 bytes from where the cursor stands */
inline encode_subscription_request(subscription_request_record) {
  subscription_request_at = 0;
  do
  :: subscription_request_at < 4 -> wire[at] = subscription_request_record.session_id[subscription_request_at]; at = at + 1; subscription_request_at = subscription_request_at + 1
  :: else -> break
  od;
  wire[at] = subscription_request_record.subscription_type; at = at + 1;
  subscription_request_at = 0;
  do
  :: subscription_request_at < 2 -> wire[at] = subscription_request_record.instrument_index[subscription_request_at]; at = at + 1; subscription_request_at = subscription_request_at + 1
  :: else -> break
  od;
  wire[at] = subscription_request_record.subscribe_to_ticker; at = at + 1;
  skip
}

/* Subscription Request off the wire, 8 bytes from where the cursor stands */
inline decode_subscription_request(subscription_request_record) {
  subscription_request_at = 0;
  do
  :: subscription_request_at < 4 -> subscription_request_record.session_id[subscription_request_at] = wire[at]; at = at + 1; subscription_request_at = subscription_request_at + 1
  :: else -> break
  od;
  subscription_request_record.subscription_type = wire[at]; at = at + 1;
  subscription_request_at = 0;
  do
  :: subscription_request_at < 2 -> subscription_request_record.instrument_index[subscription_request_at] = wire[at]; at = at + 1; subscription_request_at = subscription_request_at + 1
  :: else -> break
  od;
  subscription_request_record.subscribe_to_ticker = wire[at]; at = at + 1;
  skip
}

/* what was read of Subscription Request is what was written, byte for byte */
inline equal_subscription_request(subscription_request_read, subscription_request_written) {
  subscription_request_at = 0;
  do
  :: subscription_request_at < 4 -> assert(subscription_request_read.session_id[subscription_request_at] == subscription_request_written.session_id[subscription_request_at]); subscription_request_at = subscription_request_at + 1
  :: else -> break
  od;
  assert(subscription_request_read.subscription_type == subscription_request_written.subscription_type);
  subscription_request_at = 0;
  do
  :: subscription_request_at < 2 -> assert(subscription_request_read.instrument_index[subscription_request_at] == subscription_request_written.instrument_index[subscription_request_at]); subscription_request_at = subscription_request_at + 1
  :: else -> break
  od;
  assert(subscription_request_read.subscribe_to_ticker == subscription_request_written.subscribe_to_ticker);
  skip
}

/* ---- Subscription Reply: 57 bytes -------------------------------------------- */

/* Currenex responds to a SubscriptionRequest with a SubscriptionReply message */
typedef SubscriptionReply {
  byte session_id[4];
  byte instrument_index[2];
  byte reply_type;
  byte reject_reason[50]
};

int subscription_reply_at;

/* every byte of Subscription Reply set to one value */
inline fill_subscription_reply(subscription_reply_record, subscription_reply_value) {
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 4 -> subscription_reply_record.session_id[subscription_reply_at] = subscription_reply_value; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 2 -> subscription_reply_record.instrument_index[subscription_reply_at] = subscription_reply_value; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  subscription_reply_record.reply_type = subscription_reply_value;
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 50 -> subscription_reply_record.reject_reason[subscription_reply_at] = subscription_reply_value; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Subscription Reply set to where it lies, so a field read out of place says so */
inline ramp_subscription_reply(subscription_reply_record, subscription_reply_base) {
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 4 -> subscription_reply_record.session_id[subscription_reply_at] = (subscription_reply_base + 0 + subscription_reply_at + 1) % 256; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 2 -> subscription_reply_record.instrument_index[subscription_reply_at] = (subscription_reply_base + 4 + subscription_reply_at + 1) % 256; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  subscription_reply_record.reply_type = (subscription_reply_base + 6 + 1) % 256;
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 50 -> subscription_reply_record.reject_reason[subscription_reply_at] = (subscription_reply_base + 7 + subscription_reply_at + 1) % 256; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  skip
}

/* Subscription Reply to the wire, 57 bytes from where the cursor stands */
inline encode_subscription_reply(subscription_reply_record) {
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 4 -> wire[at] = subscription_reply_record.session_id[subscription_reply_at]; at = at + 1; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 2 -> wire[at] = subscription_reply_record.instrument_index[subscription_reply_at]; at = at + 1; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  wire[at] = subscription_reply_record.reply_type; at = at + 1;
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 50 -> wire[at] = subscription_reply_record.reject_reason[subscription_reply_at]; at = at + 1; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  skip
}

/* Subscription Reply off the wire, 57 bytes from where the cursor stands */
inline decode_subscription_reply(subscription_reply_record) {
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 4 -> subscription_reply_record.session_id[subscription_reply_at] = wire[at]; at = at + 1; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 2 -> subscription_reply_record.instrument_index[subscription_reply_at] = wire[at]; at = at + 1; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  subscription_reply_record.reply_type = wire[at]; at = at + 1;
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 50 -> subscription_reply_record.reject_reason[subscription_reply_at] = wire[at]; at = at + 1; subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Subscription Reply is what was written, byte for byte */
inline equal_subscription_reply(subscription_reply_read, subscription_reply_written) {
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 4 -> assert(subscription_reply_read.session_id[subscription_reply_at] == subscription_reply_written.session_id[subscription_reply_at]); subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 2 -> assert(subscription_reply_read.instrument_index[subscription_reply_at] == subscription_reply_written.instrument_index[subscription_reply_at]); subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  assert(subscription_reply_read.reply_type == subscription_reply_written.reply_type);
  subscription_reply_at = 0;
  do
  :: subscription_reply_at < 50 -> assert(subscription_reply_read.reject_reason[subscription_reply_at] == subscription_reply_written.reject_reason[subscription_reply_at]); subscription_reply_at = subscription_reply_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Message: 29 bytes ------------------------------------------------- */

/* Price Message */
typedef PriceMessage {
  byte instrument_index[2];
  byte price_id;
  byte side;
  byte max_amount[8];
  byte min_amount[8];
  byte price[4];
  byte attributed;
  byte price_provider[4]
};

int price_message_at;

/* every byte of Price Message set to one value */
inline fill_price_message(price_message_record, price_message_value) {
  price_message_at = 0;
  do
  :: price_message_at < 2 -> price_message_record.instrument_index[price_message_at] = price_message_value; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_record.price_id = price_message_value;
  price_message_record.side = price_message_value;
  price_message_at = 0;
  do
  :: price_message_at < 8 -> price_message_record.max_amount[price_message_at] = price_message_value; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 8 -> price_message_record.min_amount[price_message_at] = price_message_value; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.price[price_message_at] = price_message_value; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_record.attributed = price_message_value;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.price_provider[price_message_at] = price_message_value; price_message_at = price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Message set to where it lies, so a field read out of place says so */
inline ramp_price_message(price_message_record, price_message_base) {
  price_message_at = 0;
  do
  :: price_message_at < 2 -> price_message_record.instrument_index[price_message_at] = (price_message_base + 0 + price_message_at + 1) % 256; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_record.price_id = (price_message_base + 2 + 1) % 256;
  price_message_record.side = (price_message_base + 3 + 1) % 256;
  price_message_at = 0;
  do
  :: price_message_at < 8 -> price_message_record.max_amount[price_message_at] = (price_message_base + 4 + price_message_at + 1) % 256; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 8 -> price_message_record.min_amount[price_message_at] = (price_message_base + 12 + price_message_at + 1) % 256; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.price[price_message_at] = (price_message_base + 20 + price_message_at + 1) % 256; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_record.attributed = (price_message_base + 24 + 1) % 256;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.price_provider[price_message_at] = (price_message_base + 25 + price_message_at + 1) % 256; price_message_at = price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Message to the wire, 29 bytes from where the cursor stands */
inline encode_price_message(price_message_record) {
  price_message_at = 0;
  do
  :: price_message_at < 2 -> wire[at] = price_message_record.instrument_index[price_message_at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  wire[at] = price_message_record.price_id; at = at + 1;
  wire[at] = price_message_record.side; at = at + 1;
  price_message_at = 0;
  do
  :: price_message_at < 8 -> wire[at] = price_message_record.max_amount[price_message_at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 8 -> wire[at] = price_message_record.min_amount[price_message_at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> wire[at] = price_message_record.price[price_message_at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  wire[at] = price_message_record.attributed; at = at + 1;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> wire[at] = price_message_record.price_provider[price_message_at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Message off the wire, 29 bytes from where the cursor stands */
inline decode_price_message(price_message_record) {
  price_message_at = 0;
  do
  :: price_message_at < 2 -> price_message_record.instrument_index[price_message_at] = wire[at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_record.price_id = wire[at]; at = at + 1;
  price_message_record.side = wire[at]; at = at + 1;
  price_message_at = 0;
  do
  :: price_message_at < 8 -> price_message_record.max_amount[price_message_at] = wire[at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 8 -> price_message_record.min_amount[price_message_at] = wire[at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.price[price_message_at] = wire[at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_record.attributed = wire[at]; at = at + 1;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> price_message_record.price_provider[price_message_at] = wire[at]; at = at + 1; price_message_at = price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Message is what was written, byte for byte */
inline equal_price_message(price_message_read, price_message_written) {
  price_message_at = 0;
  do
  :: price_message_at < 2 -> assert(price_message_read.instrument_index[price_message_at] == price_message_written.instrument_index[price_message_at]); price_message_at = price_message_at + 1
  :: else -> break
  od;
  assert(price_message_read.price_id == price_message_written.price_id);
  assert(price_message_read.side == price_message_written.side);
  price_message_at = 0;
  do
  :: price_message_at < 8 -> assert(price_message_read.max_amount[price_message_at] == price_message_written.max_amount[price_message_at]); price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 8 -> assert(price_message_read.min_amount[price_message_at] == price_message_written.min_amount[price_message_at]); price_message_at = price_message_at + 1
  :: else -> break
  od;
  price_message_at = 0;
  do
  :: price_message_at < 4 -> assert(price_message_read.price[price_message_at] == price_message_written.price[price_message_at]); price_message_at = price_message_at + 1
  :: else -> break
  od;
  assert(price_message_read.attributed == price_message_written.attributed);
  price_message_at = 0;
  do
  :: price_message_at < 4 -> assert(price_message_read.price_provider[price_message_at] == price_message_written.price_provider[price_message_at]); price_message_at = price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Cancel Message: 3 bytes ------------------------------------------- */

/* Price Cancel */
typedef PriceCancelMessage {
  byte instrument_index[2];
  byte price_id
};

int price_cancel_message_at;

/* every byte of Price Cancel Message set to one value */
inline fill_price_cancel_message(price_cancel_message_record, price_cancel_message_value) {
  price_cancel_message_at = 0;
  do
  :: price_cancel_message_at < 2 -> price_cancel_message_record.instrument_index[price_cancel_message_at] = price_cancel_message_value; price_cancel_message_at = price_cancel_message_at + 1
  :: else -> break
  od;
  price_cancel_message_record.price_id = price_cancel_message_value;
  skip
}

/* each byte of Price Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_price_cancel_message(price_cancel_message_record, price_cancel_message_base) {
  price_cancel_message_at = 0;
  do
  :: price_cancel_message_at < 2 -> price_cancel_message_record.instrument_index[price_cancel_message_at] = (price_cancel_message_base + 0 + price_cancel_message_at + 1) % 256; price_cancel_message_at = price_cancel_message_at + 1
  :: else -> break
  od;
  price_cancel_message_record.price_id = (price_cancel_message_base + 2 + 1) % 256;
  skip
}

/* Price Cancel Message to the wire, 3 bytes from where the cursor stands */
inline encode_price_cancel_message(price_cancel_message_record) {
  price_cancel_message_at = 0;
  do
  :: price_cancel_message_at < 2 -> wire[at] = price_cancel_message_record.instrument_index[price_cancel_message_at]; at = at + 1; price_cancel_message_at = price_cancel_message_at + 1
  :: else -> break
  od;
  wire[at] = price_cancel_message_record.price_id; at = at + 1;
  skip
}

/* Price Cancel Message off the wire, 3 bytes from where the cursor stands */
inline decode_price_cancel_message(price_cancel_message_record) {
  price_cancel_message_at = 0;
  do
  :: price_cancel_message_at < 2 -> price_cancel_message_record.instrument_index[price_cancel_message_at] = wire[at]; at = at + 1; price_cancel_message_at = price_cancel_message_at + 1
  :: else -> break
  od;
  price_cancel_message_record.price_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Price Cancel Message is what was written, byte for byte */
inline equal_price_cancel_message(price_cancel_message_read, price_cancel_message_written) {
  price_cancel_message_at = 0;
  do
  :: price_cancel_message_at < 2 -> assert(price_cancel_message_read.instrument_index[price_cancel_message_at] == price_cancel_message_written.instrument_index[price_cancel_message_at]); price_cancel_message_at = price_cancel_message_at + 1
  :: else -> break
  od;
  assert(price_cancel_message_read.price_id == price_cancel_message_written.price_id);
  skip
}

/* ---- Trade Ticker Message: 15 bytes ------------------------------------------ */

/* A MP can subscribe to TradeTicker messages by setting SubscribeToTicker=0 in the SubscriptionRequest message */
typedef TradeTickerMessage {
  byte instrument_index[2];
  byte rate[4];
  byte ticker_type;
  byte transact_time[8]
};

int trade_ticker_message_at;

/* every byte of Trade Ticker Message set to one value */
inline fill_trade_ticker_message(trade_ticker_message_record, trade_ticker_message_value) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> trade_ticker_message_record.instrument_index[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.rate[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.ticker_type = trade_ticker_message_value;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.transact_time[trade_ticker_message_at] = trade_ticker_message_value; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Ticker Message set to where it lies, so a field read out of place says so */
inline ramp_trade_ticker_message(trade_ticker_message_record, trade_ticker_message_base) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> trade_ticker_message_record.instrument_index[trade_ticker_message_at] = (trade_ticker_message_base + 0 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.rate[trade_ticker_message_at] = (trade_ticker_message_base + 2 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.ticker_type = (trade_ticker_message_base + 6 + 1) % 256;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.transact_time[trade_ticker_message_at] = (trade_ticker_message_base + 7 + trade_ticker_message_at + 1) % 256; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Ticker Message to the wire, 15 bytes from where the cursor stands */
inline encode_trade_ticker_message(trade_ticker_message_record) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> wire[at] = trade_ticker_message_record.instrument_index[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> wire[at] = trade_ticker_message_record.rate[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_ticker_message_record.ticker_type; at = at + 1;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> wire[at] = trade_ticker_message_record.transact_time[trade_ticker_message_at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Ticker Message off the wire, 15 bytes from where the cursor stands */
inline decode_trade_ticker_message(trade_ticker_message_record) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> trade_ticker_message_record.instrument_index[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> trade_ticker_message_record.rate[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_record.ticker_type = wire[at]; at = at + 1;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> trade_ticker_message_record.transact_time[trade_ticker_message_at] = wire[at]; at = at + 1; trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Ticker Message is what was written, byte for byte */
inline equal_trade_ticker_message(trade_ticker_message_read, trade_ticker_message_written) {
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 2 -> assert(trade_ticker_message_read.instrument_index[trade_ticker_message_at] == trade_ticker_message_written.instrument_index[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 4 -> assert(trade_ticker_message_read.rate[trade_ticker_message_at] == trade_ticker_message_written.rate[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  assert(trade_ticker_message_read.ticker_type == trade_ticker_message_written.ticker_type);
  trade_ticker_message_at = 0;
  do
  :: trade_ticker_message_at < 8 -> assert(trade_ticker_message_read.transact_time[trade_ticker_message_at] == trade_ticker_message_written.transact_time[trade_ticker_message_at]); trade_ticker_message_at = trade_ticker_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reject Message: 55 bytes ------------------------------------------------ */

/* Included in the InstrumentInfo message is the InstrumentType, a free form instrument definition, and the InstrumentIndex used to request quotes and manage price updates */
typedef RejectMessage {
  byte session_id[4];
  byte reject_msg_type;
  byte reject_reason[50]
};

int reject_message_at;

/* every byte of Reject Message set to one value */
inline fill_reject_message(reject_message_record, reject_message_value) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.session_id[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.reject_msg_type = reject_message_value;
  reject_message_at = 0;
  do
  :: reject_message_at < 50 -> reject_message_record.reject_reason[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reject Message set to where it lies, so a field read out of place says so */
inline ramp_reject_message(reject_message_record, reject_message_base) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.session_id[reject_message_at] = (reject_message_base + 0 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.reject_msg_type = (reject_message_base + 4 + 1) % 256;
  reject_message_at = 0;
  do
  :: reject_message_at < 50 -> reject_message_record.reject_reason[reject_message_at] = (reject_message_base + 5 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reject Message to the wire, 55 bytes from where the cursor stands */
inline encode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> wire[at] = reject_message_record.session_id[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  wire[at] = reject_message_record.reject_msg_type; at = at + 1;
  reject_message_at = 0;
  do
  :: reject_message_at < 50 -> wire[at] = reject_message_record.reject_reason[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reject Message off the wire, 55 bytes from where the cursor stands */
inline decode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.session_id[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.reject_msg_type = wire[at]; at = at + 1;
  reject_message_at = 0;
  do
  :: reject_message_at < 50 -> reject_message_record.reject_reason[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reject Message is what was written, byte for byte */
inline equal_reject_message(reject_message_read, reject_message_written) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> assert(reject_message_read.session_id[reject_message_at] == reject_message_written.session_id[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  assert(reject_message_read.reject_msg_type == reject_message_written.reject_msg_type);
  reject_message_at = 0;
  do
  :: reject_message_at < 50 -> assert(reject_message_read.reject_reason[reject_message_at] == reject_message_written.reject_reason[reject_message_at]); reject_message_at = reject_message_at + 1
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

/* Instrument Info Ack: encoded, read back, and compared */
proctype check_instrument_info_ack() {
  InstrumentInfoAck instrument_info_ack_sent;
  InstrumentInfoAck instrument_info_ack_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_info_ack(instrument_info_ack_sent, 0)
  :: pattern == 1 -> fill_instrument_info_ack(instrument_info_ack_sent, 32)
  :: pattern == 2 -> fill_instrument_info_ack(instrument_info_ack_sent, 255)
  :: else -> ramp_instrument_info_ack(instrument_info_ack_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_info_ack(instrument_info_ack_sent);
    assert(at == 6);
    at = 0;
    decode_instrument_info_ack(instrument_info_ack_got);
    assert(at == 6);
    equal_instrument_info_ack(instrument_info_ack_got, instrument_info_ack_sent)
  }
}

/* Subscription Request: encoded, read back, and compared */
proctype check_subscription_request() {
  SubscriptionRequest subscription_request_sent;
  SubscriptionRequest subscription_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_subscription_request(subscription_request_sent, 0)
  :: pattern == 1 -> fill_subscription_request(subscription_request_sent, 32)
  :: pattern == 2 -> fill_subscription_request(subscription_request_sent, 255)
  :: else -> ramp_subscription_request(subscription_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_subscription_request(subscription_request_sent);
    assert(at == 8);
    at = 0;
    decode_subscription_request(subscription_request_got);
    assert(at == 8);
    equal_subscription_request(subscription_request_got, subscription_request_sent)
  }
}

/* Subscription Reply: encoded, read back, and compared */
proctype check_subscription_reply() {
  SubscriptionReply subscription_reply_sent;
  SubscriptionReply subscription_reply_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_subscription_reply(subscription_reply_sent, 0)
  :: pattern == 1 -> fill_subscription_reply(subscription_reply_sent, 32)
  :: pattern == 2 -> fill_subscription_reply(subscription_reply_sent, 255)
  :: else -> ramp_subscription_reply(subscription_reply_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_subscription_reply(subscription_reply_sent);
    assert(at == 57);
    at = 0;
    decode_subscription_reply(subscription_reply_got);
    assert(at == 57);
    equal_subscription_reply(subscription_reply_got, subscription_reply_sent)
  }
}

/* Price Message: encoded, read back, and compared */
proctype check_price_message() {
  PriceMessage price_message_sent;
  PriceMessage price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_message(price_message_sent, 0)
  :: pattern == 1 -> fill_price_message(price_message_sent, 32)
  :: pattern == 2 -> fill_price_message(price_message_sent, 255)
  :: else -> ramp_price_message(price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_message(price_message_sent);
    assert(at == 29);
    at = 0;
    decode_price_message(price_message_got);
    assert(at == 29);
    equal_price_message(price_message_got, price_message_sent)
  }
}

/* Price Cancel Message: encoded, read back, and compared */
proctype check_price_cancel_message() {
  PriceCancelMessage price_cancel_message_sent;
  PriceCancelMessage price_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_cancel_message(price_cancel_message_sent, 0)
  :: pattern == 1 -> fill_price_cancel_message(price_cancel_message_sent, 32)
  :: pattern == 2 -> fill_price_cancel_message(price_cancel_message_sent, 255)
  :: else -> ramp_price_cancel_message(price_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_cancel_message(price_cancel_message_sent);
    assert(at == 3);
    at = 0;
    decode_price_cancel_message(price_cancel_message_got);
    assert(at == 3);
    equal_price_cancel_message(price_cancel_message_got, price_cancel_message_sent)
  }
}

/* Trade Ticker Message: encoded, read back, and compared */
proctype check_trade_ticker_message() {
  TradeTickerMessage trade_ticker_message_sent;
  TradeTickerMessage trade_ticker_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_ticker_message(trade_ticker_message_sent, 0)
  :: pattern == 1 -> fill_trade_ticker_message(trade_ticker_message_sent, 32)
  :: pattern == 2 -> fill_trade_ticker_message(trade_ticker_message_sent, 255)
  :: else -> ramp_trade_ticker_message(trade_ticker_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_ticker_message(trade_ticker_message_sent);
    assert(at == 15);
    at = 0;
    decode_trade_ticker_message(trade_ticker_message_got);
    assert(at == 15);
    equal_trade_ticker_message(trade_ticker_message_got, trade_ticker_message_sent)
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_logon()
  :: run check_logout()
  :: run check_heartbeat()
  :: run check_instrument_info()
  :: run check_instrument_info_ack()
  :: run check_subscription_request()
  :: run check_subscription_reply()
  :: run check_price_message()
  :: run check_price_cancel_message()
  :: run check_trade_ticker_message()
  :: run check_reject_message()
  fi
}
