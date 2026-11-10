/*
 * Currenex Now Forex Market Data
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
 *   - a field of no fixed width
 *   - a run of a stated number of entries
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

/* ---- Message Header: 13 bytes ------------------------------------------------ */

/* Currenex Itch Market Data Message Header */
typedef MessageHeader {
  byte sequence_number[4];
  byte timestamp[8];
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
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
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
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 12 + 1) % 256;
  skip
}

/* Message Header to the wire, 13 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
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
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 13 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
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
  :: message_header_at < 8 -> assert(message_header_read.timestamp[message_header_at] == message_header_written.timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Logon Message: 44 bytes ------------------------------------------------- */

/* Client initiates a session by submitting a Logon message to Currenex_NOW */
typedef LogonMessage {
  byte user_id[20];
  byte password[20];
  byte session_id[4]
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 20 -> logon_message_record.user_id[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 20 -> logon_message_record.password[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.session_id[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Message set to where it lies, so a field read out of place says so */
inline ramp_logon_message(logon_message_record, logon_message_base) {
  logon_message_at = 0;
  do
  :: logon_message_at < 20 -> logon_message_record.user_id[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 20 -> logon_message_record.password[logon_message_at] = (logon_message_base + 20 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.session_id[logon_message_at] = (logon_message_base + 40 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message to the wire, 44 bytes from where the cursor stands */
inline encode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 20 -> wire[at] = logon_message_record.user_id[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 20 -> wire[at] = logon_message_record.password[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> wire[at] = logon_message_record.session_id[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message off the wire, 44 bytes from where the cursor stands */
inline decode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 20 -> logon_message_record.user_id[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 20 -> logon_message_record.password[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.session_id[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Message is what was written, byte for byte */
inline equal_logon_message(logon_message_read, logon_message_written) {
  logon_message_at = 0;
  do
  :: logon_message_at < 20 -> assert(logon_message_read.user_id[logon_message_at] == logon_message_written.user_id[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 20 -> assert(logon_message_read.password[logon_message_at] == logon_message_written.password[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> assert(logon_message_read.session_id[logon_message_at] == logon_message_written.session_id[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Message: 27 bytes ------------------------------------------------ */

/* Terminate a session by sending or receiving a Logout message */
typedef LogoutMessage {
  byte user_id[20];
  byte session_id[4];
  byte reason_alpha_3[3]
};

int logout_message_at;

/* every byte of Logout Message set to one value */
inline fill_logout_message(logout_message_record, logout_message_value) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> logout_message_record.user_id[logout_message_at] = logout_message_value; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 4 -> logout_message_record.session_id[logout_message_at] = logout_message_value; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 3 -> logout_message_record.reason_alpha_3[logout_message_at] = logout_message_value; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout Message set to where it lies, so a field read out of place says so */
inline ramp_logout_message(logout_message_record, logout_message_base) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> logout_message_record.user_id[logout_message_at] = (logout_message_base + 0 + logout_message_at + 1) % 256; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 4 -> logout_message_record.session_id[logout_message_at] = (logout_message_base + 20 + logout_message_at + 1) % 256; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 3 -> logout_message_record.reason_alpha_3[logout_message_at] = (logout_message_base + 24 + logout_message_at + 1) % 256; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message to the wire, 27 bytes from where the cursor stands */
inline encode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> wire[at] = logout_message_record.user_id[logout_message_at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 4 -> wire[at] = logout_message_record.session_id[logout_message_at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 3 -> wire[at] = logout_message_record.reason_alpha_3[logout_message_at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message off the wire, 27 bytes from where the cursor stands */
inline decode_logout_message(logout_message_record) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> logout_message_record.user_id[logout_message_at] = wire[at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 4 -> logout_message_record.session_id[logout_message_at] = wire[at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 3 -> logout_message_record.reason_alpha_3[logout_message_at] = wire[at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout Message is what was written, byte for byte */
inline equal_logout_message(logout_message_read, logout_message_written) {
  logout_message_at = 0;
  do
  :: logout_message_at < 20 -> assert(logout_message_read.user_id[logout_message_at] == logout_message_written.user_id[logout_message_at]); logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 4 -> assert(logout_message_read.session_id[logout_message_at] == logout_message_written.session_id[logout_message_at]); logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  logout_message_at = 0;
  do
  :: logout_message_at < 3 -> assert(logout_message_read.reason_alpha_3[logout_message_at] == logout_message_written.reason_alpha_3[logout_message_at]); logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heart Beat Message: 4 bytes --------------------------------------------- */

/* Keep-alive ping sent every 15 seconds; client must respond */
typedef HeartBeatMessage {
  byte session_id[4]
};

int heart_beat_message_at;

/* every byte of Heart Beat Message set to one value */
inline fill_heart_beat_message(heart_beat_message_record, heart_beat_message_value) {
  heart_beat_message_at = 0;
  do
  :: heart_beat_message_at < 4 -> heart_beat_message_record.session_id[heart_beat_message_at] = heart_beat_message_value; heart_beat_message_at = heart_beat_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heart Beat Message set to where it lies, so a field read out of place says so */
inline ramp_heart_beat_message(heart_beat_message_record, heart_beat_message_base) {
  heart_beat_message_at = 0;
  do
  :: heart_beat_message_at < 4 -> heart_beat_message_record.session_id[heart_beat_message_at] = (heart_beat_message_base + 0 + heart_beat_message_at + 1) % 256; heart_beat_message_at = heart_beat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heart Beat Message to the wire, 4 bytes from where the cursor stands */
inline encode_heart_beat_message(heart_beat_message_record) {
  heart_beat_message_at = 0;
  do
  :: heart_beat_message_at < 4 -> wire[at] = heart_beat_message_record.session_id[heart_beat_message_at]; at = at + 1; heart_beat_message_at = heart_beat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heart Beat Message off the wire, 4 bytes from where the cursor stands */
inline decode_heart_beat_message(heart_beat_message_record) {
  heart_beat_message_at = 0;
  do
  :: heart_beat_message_at < 4 -> heart_beat_message_record.session_id[heart_beat_message_at] = wire[at]; at = at + 1; heart_beat_message_at = heart_beat_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heart Beat Message is what was written, byte for byte */
inline equal_heart_beat_message(heart_beat_message_read, heart_beat_message_written) {
  heart_beat_message_at = 0;
  do
  :: heart_beat_message_at < 4 -> assert(heart_beat_message_read.session_id[heart_beat_message_at] == heart_beat_message_written.session_id[heart_beat_message_at]); heart_beat_message_at = heart_beat_message_at + 1
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

/* ---- Instrument Info Ack Message: 6 bytes ------------------------------------ */

/* Acknowledge receipt of InstrumentInfo */
typedef InstrumentInfoAckMessage {
  byte session_id[4];
  byte instrument_index[2]
};

int instrument_info_ack_message_at;

/* every byte of Instrument Info Ack Message set to one value */
inline fill_instrument_info_ack_message(instrument_info_ack_message_record, instrument_info_ack_message_value) {
  instrument_info_ack_message_at = 0;
  do
  :: instrument_info_ack_message_at < 4 -> instrument_info_ack_message_record.session_id[instrument_info_ack_message_at] = instrument_info_ack_message_value; instrument_info_ack_message_at = instrument_info_ack_message_at + 1
  :: else -> break
  od;
  instrument_info_ack_message_at = 0;
  do
  :: instrument_info_ack_message_at < 2 -> instrument_info_ack_message_record.instrument_index[instrument_info_ack_message_at] = instrument_info_ack_message_value; instrument_info_ack_message_at = instrument_info_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Info Ack Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_info_ack_message(instrument_info_ack_message_record, instrument_info_ack_message_base) {
  instrument_info_ack_message_at = 0;
  do
  :: instrument_info_ack_message_at < 4 -> instrument_info_ack_message_record.session_id[instrument_info_ack_message_at] = (instrument_info_ack_message_base + 0 + instrument_info_ack_message_at + 1) % 256; instrument_info_ack_message_at = instrument_info_ack_message_at + 1
  :: else -> break
  od;
  instrument_info_ack_message_at = 0;
  do
  :: instrument_info_ack_message_at < 2 -> instrument_info_ack_message_record.instrument_index[instrument_info_ack_message_at] = (instrument_info_ack_message_base + 4 + instrument_info_ack_message_at + 1) % 256; instrument_info_ack_message_at = instrument_info_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Ack Message to the wire, 6 bytes from where the cursor stands */
inline encode_instrument_info_ack_message(instrument_info_ack_message_record) {
  instrument_info_ack_message_at = 0;
  do
  :: instrument_info_ack_message_at < 4 -> wire[at] = instrument_info_ack_message_record.session_id[instrument_info_ack_message_at]; at = at + 1; instrument_info_ack_message_at = instrument_info_ack_message_at + 1
  :: else -> break
  od;
  instrument_info_ack_message_at = 0;
  do
  :: instrument_info_ack_message_at < 2 -> wire[at] = instrument_info_ack_message_record.instrument_index[instrument_info_ack_message_at]; at = at + 1; instrument_info_ack_message_at = instrument_info_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Ack Message off the wire, 6 bytes from where the cursor stands */
inline decode_instrument_info_ack_message(instrument_info_ack_message_record) {
  instrument_info_ack_message_at = 0;
  do
  :: instrument_info_ack_message_at < 4 -> instrument_info_ack_message_record.session_id[instrument_info_ack_message_at] = wire[at]; at = at + 1; instrument_info_ack_message_at = instrument_info_ack_message_at + 1
  :: else -> break
  od;
  instrument_info_ack_message_at = 0;
  do
  :: instrument_info_ack_message_at < 2 -> instrument_info_ack_message_record.instrument_index[instrument_info_ack_message_at] = wire[at]; at = at + 1; instrument_info_ack_message_at = instrument_info_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Info Ack Message is what was written, byte for byte */
inline equal_instrument_info_ack_message(instrument_info_ack_message_read, instrument_info_ack_message_written) {
  instrument_info_ack_message_at = 0;
  do
  :: instrument_info_ack_message_at < 4 -> assert(instrument_info_ack_message_read.session_id[instrument_info_ack_message_at] == instrument_info_ack_message_written.session_id[instrument_info_ack_message_at]); instrument_info_ack_message_at = instrument_info_ack_message_at + 1
  :: else -> break
  od;
  instrument_info_ack_message_at = 0;
  do
  :: instrument_info_ack_message_at < 2 -> assert(instrument_info_ack_message_read.instrument_index[instrument_info_ack_message_at] == instrument_info_ack_message_written.instrument_index[instrument_info_ack_message_at]); instrument_info_ack_message_at = instrument_info_ack_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Subscription Reply Message: 57 bytes ------------------------------------ */

/* Response to SubscriptionRequest */
typedef SubscriptionReplyMessage {
  byte session_id[4];
  byte instrument_index[2];
  byte type;
  byte reason_alpha_50[50]
};

int subscription_reply_message_at;

/* every byte of Subscription Reply Message set to one value */
inline fill_subscription_reply_message(subscription_reply_message_record, subscription_reply_message_value) {
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 4 -> subscription_reply_message_record.session_id[subscription_reply_message_at] = subscription_reply_message_value; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 2 -> subscription_reply_message_record.instrument_index[subscription_reply_message_at] = subscription_reply_message_value; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  subscription_reply_message_record.type = subscription_reply_message_value;
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 50 -> subscription_reply_message_record.reason_alpha_50[subscription_reply_message_at] = subscription_reply_message_value; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Subscription Reply Message set to where it lies, so a field read out of place says so */
inline ramp_subscription_reply_message(subscription_reply_message_record, subscription_reply_message_base) {
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 4 -> subscription_reply_message_record.session_id[subscription_reply_message_at] = (subscription_reply_message_base + 0 + subscription_reply_message_at + 1) % 256; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 2 -> subscription_reply_message_record.instrument_index[subscription_reply_message_at] = (subscription_reply_message_base + 4 + subscription_reply_message_at + 1) % 256; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  subscription_reply_message_record.type = (subscription_reply_message_base + 6 + 1) % 256;
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 50 -> subscription_reply_message_record.reason_alpha_50[subscription_reply_message_at] = (subscription_reply_message_base + 7 + subscription_reply_message_at + 1) % 256; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Subscription Reply Message to the wire, 57 bytes from where the cursor stands */
inline encode_subscription_reply_message(subscription_reply_message_record) {
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 4 -> wire[at] = subscription_reply_message_record.session_id[subscription_reply_message_at]; at = at + 1; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 2 -> wire[at] = subscription_reply_message_record.instrument_index[subscription_reply_message_at]; at = at + 1; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  wire[at] = subscription_reply_message_record.type; at = at + 1;
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 50 -> wire[at] = subscription_reply_message_record.reason_alpha_50[subscription_reply_message_at]; at = at + 1; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Subscription Reply Message off the wire, 57 bytes from where the cursor stands */
inline decode_subscription_reply_message(subscription_reply_message_record) {
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 4 -> subscription_reply_message_record.session_id[subscription_reply_message_at] = wire[at]; at = at + 1; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 2 -> subscription_reply_message_record.instrument_index[subscription_reply_message_at] = wire[at]; at = at + 1; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  subscription_reply_message_record.type = wire[at]; at = at + 1;
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 50 -> subscription_reply_message_record.reason_alpha_50[subscription_reply_message_at] = wire[at]; at = at + 1; subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Subscription Reply Message is what was written, byte for byte */
inline equal_subscription_reply_message(subscription_reply_message_read, subscription_reply_message_written) {
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 4 -> assert(subscription_reply_message_read.session_id[subscription_reply_message_at] == subscription_reply_message_written.session_id[subscription_reply_message_at]); subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 2 -> assert(subscription_reply_message_read.instrument_index[subscription_reply_message_at] == subscription_reply_message_written.instrument_index[subscription_reply_message_at]); subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  assert(subscription_reply_message_read.type == subscription_reply_message_written.type);
  subscription_reply_message_at = 0;
  do
  :: subscription_reply_message_at < 50 -> assert(subscription_reply_message_read.reason_alpha_50[subscription_reply_message_at] == subscription_reply_message_written.reason_alpha_50[subscription_reply_message_at]); subscription_reply_message_at = subscription_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mass Subscription Reply Message: 55 bytes ------------------------------- */

/* Response to MassSubscriptionRequest */
typedef MassSubscriptionReplyMessage {
  byte session_id[4];
  byte type;
  byte reason_alpha_50[50]
};

int mass_subscription_reply_message_at;

/* every byte of Mass Subscription Reply Message set to one value */
inline fill_mass_subscription_reply_message(mass_subscription_reply_message_record, mass_subscription_reply_message_value) {
  mass_subscription_reply_message_at = 0;
  do
  :: mass_subscription_reply_message_at < 4 -> mass_subscription_reply_message_record.session_id[mass_subscription_reply_message_at] = mass_subscription_reply_message_value; mass_subscription_reply_message_at = mass_subscription_reply_message_at + 1
  :: else -> break
  od;
  mass_subscription_reply_message_record.type = mass_subscription_reply_message_value;
  mass_subscription_reply_message_at = 0;
  do
  :: mass_subscription_reply_message_at < 50 -> mass_subscription_reply_message_record.reason_alpha_50[mass_subscription_reply_message_at] = mass_subscription_reply_message_value; mass_subscription_reply_message_at = mass_subscription_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Subscription Reply Message set to where it lies, so a field read out of place says so */
inline ramp_mass_subscription_reply_message(mass_subscription_reply_message_record, mass_subscription_reply_message_base) {
  mass_subscription_reply_message_at = 0;
  do
  :: mass_subscription_reply_message_at < 4 -> mass_subscription_reply_message_record.session_id[mass_subscription_reply_message_at] = (mass_subscription_reply_message_base + 0 + mass_subscription_reply_message_at + 1) % 256; mass_subscription_reply_message_at = mass_subscription_reply_message_at + 1
  :: else -> break
  od;
  mass_subscription_reply_message_record.type = (mass_subscription_reply_message_base + 4 + 1) % 256;
  mass_subscription_reply_message_at = 0;
  do
  :: mass_subscription_reply_message_at < 50 -> mass_subscription_reply_message_record.reason_alpha_50[mass_subscription_reply_message_at] = (mass_subscription_reply_message_base + 5 + mass_subscription_reply_message_at + 1) % 256; mass_subscription_reply_message_at = mass_subscription_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Subscription Reply Message to the wire, 55 bytes from where the cursor stands */
inline encode_mass_subscription_reply_message(mass_subscription_reply_message_record) {
  mass_subscription_reply_message_at = 0;
  do
  :: mass_subscription_reply_message_at < 4 -> wire[at] = mass_subscription_reply_message_record.session_id[mass_subscription_reply_message_at]; at = at + 1; mass_subscription_reply_message_at = mass_subscription_reply_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_subscription_reply_message_record.type; at = at + 1;
  mass_subscription_reply_message_at = 0;
  do
  :: mass_subscription_reply_message_at < 50 -> wire[at] = mass_subscription_reply_message_record.reason_alpha_50[mass_subscription_reply_message_at]; at = at + 1; mass_subscription_reply_message_at = mass_subscription_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Subscription Reply Message off the wire, 55 bytes from where the cursor stands */
inline decode_mass_subscription_reply_message(mass_subscription_reply_message_record) {
  mass_subscription_reply_message_at = 0;
  do
  :: mass_subscription_reply_message_at < 4 -> mass_subscription_reply_message_record.session_id[mass_subscription_reply_message_at] = wire[at]; at = at + 1; mass_subscription_reply_message_at = mass_subscription_reply_message_at + 1
  :: else -> break
  od;
  mass_subscription_reply_message_record.type = wire[at]; at = at + 1;
  mass_subscription_reply_message_at = 0;
  do
  :: mass_subscription_reply_message_at < 50 -> mass_subscription_reply_message_record.reason_alpha_50[mass_subscription_reply_message_at] = wire[at]; at = at + 1; mass_subscription_reply_message_at = mass_subscription_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Subscription Reply Message is what was written, byte for byte */
inline equal_mass_subscription_reply_message(mass_subscription_reply_message_read, mass_subscription_reply_message_written) {
  mass_subscription_reply_message_at = 0;
  do
  :: mass_subscription_reply_message_at < 4 -> assert(mass_subscription_reply_message_read.session_id[mass_subscription_reply_message_at] == mass_subscription_reply_message_written.session_id[mass_subscription_reply_message_at]); mass_subscription_reply_message_at = mass_subscription_reply_message_at + 1
  :: else -> break
  od;
  assert(mass_subscription_reply_message_read.type == mass_subscription_reply_message_written.type);
  mass_subscription_reply_message_at = 0;
  do
  :: mass_subscription_reply_message_at < 50 -> assert(mass_subscription_reply_message_read.reason_alpha_50[mass_subscription_reply_message_at] == mass_subscription_reply_message_written.reason_alpha_50[mass_subscription_reply_message_at]); mass_subscription_reply_message_at = mass_subscription_reply_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bid: 12 bytes ----------------------------------------------------------- */

/* Market level bid */
typedef Bid {
  byte rate[4];
  byte amount[8]
};

int bid_at;

/* every byte of Bid set to one value */
inline fill_bid(bid_record, bid_value) {
  bid_at = 0;
  do
  :: bid_at < 4 -> bid_record.rate[bid_at] = bid_value; bid_at = bid_at + 1
  :: else -> break
  od;
  bid_at = 0;
  do
  :: bid_at < 8 -> bid_record.amount[bid_at] = bid_value; bid_at = bid_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bid set to where it lies, so a field read out of place says so */
inline ramp_bid(bid_record, bid_base) {
  bid_at = 0;
  do
  :: bid_at < 4 -> bid_record.rate[bid_at] = (bid_base + 0 + bid_at + 1) % 256; bid_at = bid_at + 1
  :: else -> break
  od;
  bid_at = 0;
  do
  :: bid_at < 8 -> bid_record.amount[bid_at] = (bid_base + 4 + bid_at + 1) % 256; bid_at = bid_at + 1
  :: else -> break
  od;
  skip
}

/* Bid to the wire, 12 bytes from where the cursor stands */
inline encode_bid(bid_record) {
  bid_at = 0;
  do
  :: bid_at < 4 -> wire[at] = bid_record.rate[bid_at]; at = at + 1; bid_at = bid_at + 1
  :: else -> break
  od;
  bid_at = 0;
  do
  :: bid_at < 8 -> wire[at] = bid_record.amount[bid_at]; at = at + 1; bid_at = bid_at + 1
  :: else -> break
  od;
  skip
}

/* Bid off the wire, 12 bytes from where the cursor stands */
inline decode_bid(bid_record) {
  bid_at = 0;
  do
  :: bid_at < 4 -> bid_record.rate[bid_at] = wire[at]; at = at + 1; bid_at = bid_at + 1
  :: else -> break
  od;
  bid_at = 0;
  do
  :: bid_at < 8 -> bid_record.amount[bid_at] = wire[at]; at = at + 1; bid_at = bid_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bid is what was written, byte for byte */
inline equal_bid(bid_read, bid_written) {
  bid_at = 0;
  do
  :: bid_at < 4 -> assert(bid_read.rate[bid_at] == bid_written.rate[bid_at]); bid_at = bid_at + 1
  :: else -> break
  od;
  bid_at = 0;
  do
  :: bid_at < 8 -> assert(bid_read.amount[bid_at] == bid_written.amount[bid_at]); bid_at = bid_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Offer: 12 bytes --------------------------------------------------------- */

/* Market level offer */
typedef Offer {
  byte rate[4];
  byte amount[8]
};

int offer_at;

/* every byte of Offer set to one value */
inline fill_offer(offer_record, offer_value) {
  offer_at = 0;
  do
  :: offer_at < 4 -> offer_record.rate[offer_at] = offer_value; offer_at = offer_at + 1
  :: else -> break
  od;
  offer_at = 0;
  do
  :: offer_at < 8 -> offer_record.amount[offer_at] = offer_value; offer_at = offer_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Offer set to where it lies, so a field read out of place says so */
inline ramp_offer(offer_record, offer_base) {
  offer_at = 0;
  do
  :: offer_at < 4 -> offer_record.rate[offer_at] = (offer_base + 0 + offer_at + 1) % 256; offer_at = offer_at + 1
  :: else -> break
  od;
  offer_at = 0;
  do
  :: offer_at < 8 -> offer_record.amount[offer_at] = (offer_base + 4 + offer_at + 1) % 256; offer_at = offer_at + 1
  :: else -> break
  od;
  skip
}

/* Offer to the wire, 12 bytes from where the cursor stands */
inline encode_offer(offer_record) {
  offer_at = 0;
  do
  :: offer_at < 4 -> wire[at] = offer_record.rate[offer_at]; at = at + 1; offer_at = offer_at + 1
  :: else -> break
  od;
  offer_at = 0;
  do
  :: offer_at < 8 -> wire[at] = offer_record.amount[offer_at]; at = at + 1; offer_at = offer_at + 1
  :: else -> break
  od;
  skip
}

/* Offer off the wire, 12 bytes from where the cursor stands */
inline decode_offer(offer_record) {
  offer_at = 0;
  do
  :: offer_at < 4 -> offer_record.rate[offer_at] = wire[at]; at = at + 1; offer_at = offer_at + 1
  :: else -> break
  od;
  offer_at = 0;
  do
  :: offer_at < 8 -> offer_record.amount[offer_at] = wire[at]; at = at + 1; offer_at = offer_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Offer is what was written, byte for byte */
inline equal_offer(offer_read, offer_written) {
  offer_at = 0;
  do
  :: offer_at < 4 -> assert(offer_read.rate[offer_at] == offer_written.rate[offer_at]); offer_at = offer_at + 1
  :: else -> break
  od;
  offer_at = 0;
  do
  :: offer_at < 8 -> assert(offer_read.amount[offer_at] == offer_written.amount[offer_at]); offer_at = offer_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Paid Given Message: 16 bytes -------------------------------------------- */

/* Latest trade versus liquidity */
typedef PaidGivenMessage {
  byte instrument_index[2];
  byte rate[4];
  byte size_indicator;
  byte paid_given_indicator;
  byte transact_time[8]
};

int paid_given_message_at;

/* every byte of Paid Given Message set to one value */
inline fill_paid_given_message(paid_given_message_record, paid_given_message_value) {
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 2 -> paid_given_message_record.instrument_index[paid_given_message_at] = paid_given_message_value; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 4 -> paid_given_message_record.rate[paid_given_message_at] = paid_given_message_value; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  paid_given_message_record.size_indicator = paid_given_message_value;
  paid_given_message_record.paid_given_indicator = paid_given_message_value;
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 8 -> paid_given_message_record.transact_time[paid_given_message_at] = paid_given_message_value; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Paid Given Message set to where it lies, so a field read out of place says so */
inline ramp_paid_given_message(paid_given_message_record, paid_given_message_base) {
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 2 -> paid_given_message_record.instrument_index[paid_given_message_at] = (paid_given_message_base + 0 + paid_given_message_at + 1) % 256; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 4 -> paid_given_message_record.rate[paid_given_message_at] = (paid_given_message_base + 2 + paid_given_message_at + 1) % 256; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  paid_given_message_record.size_indicator = (paid_given_message_base + 6 + 1) % 256;
  paid_given_message_record.paid_given_indicator = (paid_given_message_base + 7 + 1) % 256;
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 8 -> paid_given_message_record.transact_time[paid_given_message_at] = (paid_given_message_base + 8 + paid_given_message_at + 1) % 256; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  skip
}

/* Paid Given Message to the wire, 16 bytes from where the cursor stands */
inline encode_paid_given_message(paid_given_message_record) {
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 2 -> wire[at] = paid_given_message_record.instrument_index[paid_given_message_at]; at = at + 1; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 4 -> wire[at] = paid_given_message_record.rate[paid_given_message_at]; at = at + 1; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  wire[at] = paid_given_message_record.size_indicator; at = at + 1;
  wire[at] = paid_given_message_record.paid_given_indicator; at = at + 1;
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 8 -> wire[at] = paid_given_message_record.transact_time[paid_given_message_at]; at = at + 1; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  skip
}

/* Paid Given Message off the wire, 16 bytes from where the cursor stands */
inline decode_paid_given_message(paid_given_message_record) {
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 2 -> paid_given_message_record.instrument_index[paid_given_message_at] = wire[at]; at = at + 1; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 4 -> paid_given_message_record.rate[paid_given_message_at] = wire[at]; at = at + 1; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  paid_given_message_record.size_indicator = wire[at]; at = at + 1;
  paid_given_message_record.paid_given_indicator = wire[at]; at = at + 1;
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 8 -> paid_given_message_record.transact_time[paid_given_message_at] = wire[at]; at = at + 1; paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Paid Given Message is what was written, byte for byte */
inline equal_paid_given_message(paid_given_message_read, paid_given_message_written) {
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 2 -> assert(paid_given_message_read.instrument_index[paid_given_message_at] == paid_given_message_written.instrument_index[paid_given_message_at]); paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 4 -> assert(paid_given_message_read.rate[paid_given_message_at] == paid_given_message_written.rate[paid_given_message_at]); paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  assert(paid_given_message_read.size_indicator == paid_given_message_written.size_indicator);
  assert(paid_given_message_read.paid_given_indicator == paid_given_message_written.paid_given_indicator);
  paid_given_message_at = 0;
  do
  :: paid_given_message_at < 8 -> assert(paid_given_message_read.transact_time[paid_given_message_at] == paid_given_message_written.transact_time[paid_given_message_at]); paid_given_message_at = paid_given_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Conf Factor 75: 8 bytes ------------------------------------------------- */

/* 75th percentile confidence factor */
typedef ConfFactor75 {
  byte bid_price[4];
  byte offer_price[4]
};

int conf_factor75_at;

/* every byte of Conf Factor 75 set to one value */
inline fill_conf_factor75(conf_factor75_record, conf_factor75_value) {
  conf_factor75_at = 0;
  do
  :: conf_factor75_at < 4 -> conf_factor75_record.bid_price[conf_factor75_at] = conf_factor75_value; conf_factor75_at = conf_factor75_at + 1
  :: else -> break
  od;
  conf_factor75_at = 0;
  do
  :: conf_factor75_at < 4 -> conf_factor75_record.offer_price[conf_factor75_at] = conf_factor75_value; conf_factor75_at = conf_factor75_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Conf Factor 75 set to where it lies, so a field read out of place says so */
inline ramp_conf_factor75(conf_factor75_record, conf_factor75_base) {
  conf_factor75_at = 0;
  do
  :: conf_factor75_at < 4 -> conf_factor75_record.bid_price[conf_factor75_at] = (conf_factor75_base + 0 + conf_factor75_at + 1) % 256; conf_factor75_at = conf_factor75_at + 1
  :: else -> break
  od;
  conf_factor75_at = 0;
  do
  :: conf_factor75_at < 4 -> conf_factor75_record.offer_price[conf_factor75_at] = (conf_factor75_base + 4 + conf_factor75_at + 1) % 256; conf_factor75_at = conf_factor75_at + 1
  :: else -> break
  od;
  skip
}

/* Conf Factor 75 to the wire, 8 bytes from where the cursor stands */
inline encode_conf_factor75(conf_factor75_record) {
  conf_factor75_at = 0;
  do
  :: conf_factor75_at < 4 -> wire[at] = conf_factor75_record.bid_price[conf_factor75_at]; at = at + 1; conf_factor75_at = conf_factor75_at + 1
  :: else -> break
  od;
  conf_factor75_at = 0;
  do
  :: conf_factor75_at < 4 -> wire[at] = conf_factor75_record.offer_price[conf_factor75_at]; at = at + 1; conf_factor75_at = conf_factor75_at + 1
  :: else -> break
  od;
  skip
}

/* Conf Factor 75 off the wire, 8 bytes from where the cursor stands */
inline decode_conf_factor75(conf_factor75_record) {
  conf_factor75_at = 0;
  do
  :: conf_factor75_at < 4 -> conf_factor75_record.bid_price[conf_factor75_at] = wire[at]; at = at + 1; conf_factor75_at = conf_factor75_at + 1
  :: else -> break
  od;
  conf_factor75_at = 0;
  do
  :: conf_factor75_at < 4 -> conf_factor75_record.offer_price[conf_factor75_at] = wire[at]; at = at + 1; conf_factor75_at = conf_factor75_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Conf Factor 75 is what was written, byte for byte */
inline equal_conf_factor75(conf_factor75_read, conf_factor75_written) {
  conf_factor75_at = 0;
  do
  :: conf_factor75_at < 4 -> assert(conf_factor75_read.bid_price[conf_factor75_at] == conf_factor75_written.bid_price[conf_factor75_at]); conf_factor75_at = conf_factor75_at + 1
  :: else -> break
  od;
  conf_factor75_at = 0;
  do
  :: conf_factor75_at < 4 -> assert(conf_factor75_read.offer_price[conf_factor75_at] == conf_factor75_written.offer_price[conf_factor75_at]); conf_factor75_at = conf_factor75_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Conf Factor 50: 8 bytes ------------------------------------------------- */

/* 50th percentile confidence factor */
typedef ConfFactor50 {
  byte bid_price[4];
  byte offer_price[4]
};

int conf_factor50_at;

/* every byte of Conf Factor 50 set to one value */
inline fill_conf_factor50(conf_factor50_record, conf_factor50_value) {
  conf_factor50_at = 0;
  do
  :: conf_factor50_at < 4 -> conf_factor50_record.bid_price[conf_factor50_at] = conf_factor50_value; conf_factor50_at = conf_factor50_at + 1
  :: else -> break
  od;
  conf_factor50_at = 0;
  do
  :: conf_factor50_at < 4 -> conf_factor50_record.offer_price[conf_factor50_at] = conf_factor50_value; conf_factor50_at = conf_factor50_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Conf Factor 50 set to where it lies, so a field read out of place says so */
inline ramp_conf_factor50(conf_factor50_record, conf_factor50_base) {
  conf_factor50_at = 0;
  do
  :: conf_factor50_at < 4 -> conf_factor50_record.bid_price[conf_factor50_at] = (conf_factor50_base + 0 + conf_factor50_at + 1) % 256; conf_factor50_at = conf_factor50_at + 1
  :: else -> break
  od;
  conf_factor50_at = 0;
  do
  :: conf_factor50_at < 4 -> conf_factor50_record.offer_price[conf_factor50_at] = (conf_factor50_base + 4 + conf_factor50_at + 1) % 256; conf_factor50_at = conf_factor50_at + 1
  :: else -> break
  od;
  skip
}

/* Conf Factor 50 to the wire, 8 bytes from where the cursor stands */
inline encode_conf_factor50(conf_factor50_record) {
  conf_factor50_at = 0;
  do
  :: conf_factor50_at < 4 -> wire[at] = conf_factor50_record.bid_price[conf_factor50_at]; at = at + 1; conf_factor50_at = conf_factor50_at + 1
  :: else -> break
  od;
  conf_factor50_at = 0;
  do
  :: conf_factor50_at < 4 -> wire[at] = conf_factor50_record.offer_price[conf_factor50_at]; at = at + 1; conf_factor50_at = conf_factor50_at + 1
  :: else -> break
  od;
  skip
}

/* Conf Factor 50 off the wire, 8 bytes from where the cursor stands */
inline decode_conf_factor50(conf_factor50_record) {
  conf_factor50_at = 0;
  do
  :: conf_factor50_at < 4 -> conf_factor50_record.bid_price[conf_factor50_at] = wire[at]; at = at + 1; conf_factor50_at = conf_factor50_at + 1
  :: else -> break
  od;
  conf_factor50_at = 0;
  do
  :: conf_factor50_at < 4 -> conf_factor50_record.offer_price[conf_factor50_at] = wire[at]; at = at + 1; conf_factor50_at = conf_factor50_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Conf Factor 50 is what was written, byte for byte */
inline equal_conf_factor50(conf_factor50_read, conf_factor50_written) {
  conf_factor50_at = 0;
  do
  :: conf_factor50_at < 4 -> assert(conf_factor50_read.bid_price[conf_factor50_at] == conf_factor50_written.bid_price[conf_factor50_at]); conf_factor50_at = conf_factor50_at + 1
  :: else -> break
  od;
  conf_factor50_at = 0;
  do
  :: conf_factor50_at < 4 -> assert(conf_factor50_read.offer_price[conf_factor50_at] == conf_factor50_written.offer_price[conf_factor50_at]); conf_factor50_at = conf_factor50_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Conf Factor 25: 8 bytes ------------------------------------------------- */

/* 25th percentile confidence factor */
typedef ConfFactor25 {
  byte bid_price[4];
  byte offer_price[4]
};

int conf_factor25_at;

/* every byte of Conf Factor 25 set to one value */
inline fill_conf_factor25(conf_factor25_record, conf_factor25_value) {
  conf_factor25_at = 0;
  do
  :: conf_factor25_at < 4 -> conf_factor25_record.bid_price[conf_factor25_at] = conf_factor25_value; conf_factor25_at = conf_factor25_at + 1
  :: else -> break
  od;
  conf_factor25_at = 0;
  do
  :: conf_factor25_at < 4 -> conf_factor25_record.offer_price[conf_factor25_at] = conf_factor25_value; conf_factor25_at = conf_factor25_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Conf Factor 25 set to where it lies, so a field read out of place says so */
inline ramp_conf_factor25(conf_factor25_record, conf_factor25_base) {
  conf_factor25_at = 0;
  do
  :: conf_factor25_at < 4 -> conf_factor25_record.bid_price[conf_factor25_at] = (conf_factor25_base + 0 + conf_factor25_at + 1) % 256; conf_factor25_at = conf_factor25_at + 1
  :: else -> break
  od;
  conf_factor25_at = 0;
  do
  :: conf_factor25_at < 4 -> conf_factor25_record.offer_price[conf_factor25_at] = (conf_factor25_base + 4 + conf_factor25_at + 1) % 256; conf_factor25_at = conf_factor25_at + 1
  :: else -> break
  od;
  skip
}

/* Conf Factor 25 to the wire, 8 bytes from where the cursor stands */
inline encode_conf_factor25(conf_factor25_record) {
  conf_factor25_at = 0;
  do
  :: conf_factor25_at < 4 -> wire[at] = conf_factor25_record.bid_price[conf_factor25_at]; at = at + 1; conf_factor25_at = conf_factor25_at + 1
  :: else -> break
  od;
  conf_factor25_at = 0;
  do
  :: conf_factor25_at < 4 -> wire[at] = conf_factor25_record.offer_price[conf_factor25_at]; at = at + 1; conf_factor25_at = conf_factor25_at + 1
  :: else -> break
  od;
  skip
}

/* Conf Factor 25 off the wire, 8 bytes from where the cursor stands */
inline decode_conf_factor25(conf_factor25_record) {
  conf_factor25_at = 0;
  do
  :: conf_factor25_at < 4 -> conf_factor25_record.bid_price[conf_factor25_at] = wire[at]; at = at + 1; conf_factor25_at = conf_factor25_at + 1
  :: else -> break
  od;
  conf_factor25_at = 0;
  do
  :: conf_factor25_at < 4 -> conf_factor25_record.offer_price[conf_factor25_at] = wire[at]; at = at + 1; conf_factor25_at = conf_factor25_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Conf Factor 25 is what was written, byte for byte */
inline equal_conf_factor25(conf_factor25_read, conf_factor25_written) {
  conf_factor25_at = 0;
  do
  :: conf_factor25_at < 4 -> assert(conf_factor25_read.bid_price[conf_factor25_at] == conf_factor25_written.bid_price[conf_factor25_at]); conf_factor25_at = conf_factor25_at + 1
  :: else -> break
  od;
  conf_factor25_at = 0;
  do
  :: conf_factor25_at < 4 -> assert(conf_factor25_read.offer_price[conf_factor25_at] == conf_factor25_written.offer_price[conf_factor25_at]); conf_factor25_at = conf_factor25_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Wamr With Confidence Factor Message: 38 bytes --------------------------- */

/* Weighted average mid-rate with confidence factors */
typedef WamrWithConfidenceFactorMessage {
  byte instrument_index[2];
  byte price[4];
  ConfFactor75 conf_factor_75;
  ConfFactor50 conf_factor_50;
  ConfFactor25 conf_factor_25;
  byte timestamp[8]
};

int wamr_with_confidence_factor_message_at;

/* every byte of Wamr With Confidence Factor Message set to one value */
inline fill_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_record, wamr_with_confidence_factor_message_value) {
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 2 -> wamr_with_confidence_factor_message_record.instrument_index[wamr_with_confidence_factor_message_at] = wamr_with_confidence_factor_message_value; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 4 -> wamr_with_confidence_factor_message_record.price[wamr_with_confidence_factor_message_at] = wamr_with_confidence_factor_message_value; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  fill_conf_factor75(wamr_with_confidence_factor_message_record.conf_factor_75, wamr_with_confidence_factor_message_value);
  fill_conf_factor50(wamr_with_confidence_factor_message_record.conf_factor_50, wamr_with_confidence_factor_message_value);
  fill_conf_factor25(wamr_with_confidence_factor_message_record.conf_factor_25, wamr_with_confidence_factor_message_value);
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 8 -> wamr_with_confidence_factor_message_record.timestamp[wamr_with_confidence_factor_message_at] = wamr_with_confidence_factor_message_value; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Wamr With Confidence Factor Message set to where it lies, so a field read out of place says so */
inline ramp_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_record, wamr_with_confidence_factor_message_base) {
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 2 -> wamr_with_confidence_factor_message_record.instrument_index[wamr_with_confidence_factor_message_at] = (wamr_with_confidence_factor_message_base + 0 + wamr_with_confidence_factor_message_at + 1) % 256; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 4 -> wamr_with_confidence_factor_message_record.price[wamr_with_confidence_factor_message_at] = (wamr_with_confidence_factor_message_base + 2 + wamr_with_confidence_factor_message_at + 1) % 256; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  ramp_conf_factor75(wamr_with_confidence_factor_message_record.conf_factor_75, wamr_with_confidence_factor_message_base + 6);
  ramp_conf_factor50(wamr_with_confidence_factor_message_record.conf_factor_50, wamr_with_confidence_factor_message_base + 14);
  ramp_conf_factor25(wamr_with_confidence_factor_message_record.conf_factor_25, wamr_with_confidence_factor_message_base + 22);
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 8 -> wamr_with_confidence_factor_message_record.timestamp[wamr_with_confidence_factor_message_at] = (wamr_with_confidence_factor_message_base + 30 + wamr_with_confidence_factor_message_at + 1) % 256; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  skip
}

/* Wamr With Confidence Factor Message to the wire, 38 bytes from where the cursor stands */
inline encode_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_record) {
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 2 -> wire[at] = wamr_with_confidence_factor_message_record.instrument_index[wamr_with_confidence_factor_message_at]; at = at + 1; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 4 -> wire[at] = wamr_with_confidence_factor_message_record.price[wamr_with_confidence_factor_message_at]; at = at + 1; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  encode_conf_factor75(wamr_with_confidence_factor_message_record.conf_factor_75);
  encode_conf_factor50(wamr_with_confidence_factor_message_record.conf_factor_50);
  encode_conf_factor25(wamr_with_confidence_factor_message_record.conf_factor_25);
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 8 -> wire[at] = wamr_with_confidence_factor_message_record.timestamp[wamr_with_confidence_factor_message_at]; at = at + 1; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  skip
}

/* Wamr With Confidence Factor Message off the wire, 38 bytes from where the cursor stands */
inline decode_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_record) {
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 2 -> wamr_with_confidence_factor_message_record.instrument_index[wamr_with_confidence_factor_message_at] = wire[at]; at = at + 1; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 4 -> wamr_with_confidence_factor_message_record.price[wamr_with_confidence_factor_message_at] = wire[at]; at = at + 1; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  decode_conf_factor75(wamr_with_confidence_factor_message_record.conf_factor_75);
  decode_conf_factor50(wamr_with_confidence_factor_message_record.conf_factor_50);
  decode_conf_factor25(wamr_with_confidence_factor_message_record.conf_factor_25);
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 8 -> wamr_with_confidence_factor_message_record.timestamp[wamr_with_confidence_factor_message_at] = wire[at]; at = at + 1; wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Wamr With Confidence Factor Message is what was written, byte for byte */
inline equal_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_read, wamr_with_confidence_factor_message_written) {
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 2 -> assert(wamr_with_confidence_factor_message_read.instrument_index[wamr_with_confidence_factor_message_at] == wamr_with_confidence_factor_message_written.instrument_index[wamr_with_confidence_factor_message_at]); wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 4 -> assert(wamr_with_confidence_factor_message_read.price[wamr_with_confidence_factor_message_at] == wamr_with_confidence_factor_message_written.price[wamr_with_confidence_factor_message_at]); wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  equal_conf_factor75(wamr_with_confidence_factor_message_read.conf_factor_75, wamr_with_confidence_factor_message_written.conf_factor_75);
  equal_conf_factor50(wamr_with_confidence_factor_message_read.conf_factor_50, wamr_with_confidence_factor_message_written.conf_factor_50);
  equal_conf_factor25(wamr_with_confidence_factor_message_read.conf_factor_25, wamr_with_confidence_factor_message_written.conf_factor_25);
  wamr_with_confidence_factor_message_at = 0;
  do
  :: wamr_with_confidence_factor_message_at < 8 -> assert(wamr_with_confidence_factor_message_read.timestamp[wamr_with_confidence_factor_message_at] == wamr_with_confidence_factor_message_written.timestamp[wamr_with_confidence_factor_message_at]); wamr_with_confidence_factor_message_at = wamr_with_confidence_factor_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mid Activity Indicator Message: 3 bytes --------------------------------- */

/* Indicator of mid-rate activity windows */
typedef MidActivityIndicatorMessage {
  byte instrument_index[2];
  byte activity_indicator
};

int mid_activity_indicator_message_at;

/* every byte of Mid Activity Indicator Message set to one value */
inline fill_mid_activity_indicator_message(mid_activity_indicator_message_record, mid_activity_indicator_message_value) {
  mid_activity_indicator_message_at = 0;
  do
  :: mid_activity_indicator_message_at < 2 -> mid_activity_indicator_message_record.instrument_index[mid_activity_indicator_message_at] = mid_activity_indicator_message_value; mid_activity_indicator_message_at = mid_activity_indicator_message_at + 1
  :: else -> break
  od;
  mid_activity_indicator_message_record.activity_indicator = mid_activity_indicator_message_value;
  skip
}

/* each byte of Mid Activity Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_mid_activity_indicator_message(mid_activity_indicator_message_record, mid_activity_indicator_message_base) {
  mid_activity_indicator_message_at = 0;
  do
  :: mid_activity_indicator_message_at < 2 -> mid_activity_indicator_message_record.instrument_index[mid_activity_indicator_message_at] = (mid_activity_indicator_message_base + 0 + mid_activity_indicator_message_at + 1) % 256; mid_activity_indicator_message_at = mid_activity_indicator_message_at + 1
  :: else -> break
  od;
  mid_activity_indicator_message_record.activity_indicator = (mid_activity_indicator_message_base + 2 + 1) % 256;
  skip
}

/* Mid Activity Indicator Message to the wire, 3 bytes from where the cursor stands */
inline encode_mid_activity_indicator_message(mid_activity_indicator_message_record) {
  mid_activity_indicator_message_at = 0;
  do
  :: mid_activity_indicator_message_at < 2 -> wire[at] = mid_activity_indicator_message_record.instrument_index[mid_activity_indicator_message_at]; at = at + 1; mid_activity_indicator_message_at = mid_activity_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = mid_activity_indicator_message_record.activity_indicator; at = at + 1;
  skip
}

/* Mid Activity Indicator Message off the wire, 3 bytes from where the cursor stands */
inline decode_mid_activity_indicator_message(mid_activity_indicator_message_record) {
  mid_activity_indicator_message_at = 0;
  do
  :: mid_activity_indicator_message_at < 2 -> mid_activity_indicator_message_record.instrument_index[mid_activity_indicator_message_at] = wire[at]; at = at + 1; mid_activity_indicator_message_at = mid_activity_indicator_message_at + 1
  :: else -> break
  od;
  mid_activity_indicator_message_record.activity_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Mid Activity Indicator Message is what was written, byte for byte */
inline equal_mid_activity_indicator_message(mid_activity_indicator_message_read, mid_activity_indicator_message_written) {
  mid_activity_indicator_message_at = 0;
  do
  :: mid_activity_indicator_message_at < 2 -> assert(mid_activity_indicator_message_read.instrument_index[mid_activity_indicator_message_at] == mid_activity_indicator_message_written.instrument_index[mid_activity_indicator_message_at]); mid_activity_indicator_message_at = mid_activity_indicator_message_at + 1
  :: else -> break
  od;
  assert(mid_activity_indicator_message_read.activity_indicator == mid_activity_indicator_message_written.activity_indicator);
  skip
}

/* ---- Reject Message: 55 bytes ------------------------------------------------ */

/* Reject incorrectly formatted or invalid messages */
typedef RejectMessage {
  byte session_id[4];
  byte reject_msg_type;
  byte reason_alpha_50[50]
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
  :: reject_message_at < 50 -> reject_message_record.reason_alpha_50[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
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
  :: reject_message_at < 50 -> reject_message_record.reason_alpha_50[reject_message_at] = (reject_message_base + 5 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
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
  :: reject_message_at < 50 -> wire[at] = reject_message_record.reason_alpha_50[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
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
  :: reject_message_at < 50 -> reject_message_record.reason_alpha_50[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
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
  :: reject_message_at < 50 -> assert(reject_message_read.reason_alpha_50[reject_message_at] == reject_message_written.reason_alpha_50[reject_message_at]); reject_message_at = reject_message_at + 1
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
    assert(at == 13);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 13);
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
    assert(at == 44);
    at = 0;
    decode_logon_message(logon_message_got);
    assert(at == 44);
    equal_logon_message(logon_message_got, logon_message_sent)
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
    assert(at == 27);
    at = 0;
    decode_logout_message(logout_message_got);
    assert(at == 27);
    equal_logout_message(logout_message_got, logout_message_sent)
  }
}

/* Heart Beat Message: encoded, read back, and compared */
proctype check_heart_beat_message() {
  HeartBeatMessage heart_beat_message_sent;
  HeartBeatMessage heart_beat_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heart_beat_message(heart_beat_message_sent, 0)
  :: pattern == 1 -> fill_heart_beat_message(heart_beat_message_sent, 32)
  :: pattern == 2 -> fill_heart_beat_message(heart_beat_message_sent, 255)
  :: else -> ramp_heart_beat_message(heart_beat_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heart_beat_message(heart_beat_message_sent);
    assert(at == 4);
    at = 0;
    decode_heart_beat_message(heart_beat_message_got);
    assert(at == 4);
    equal_heart_beat_message(heart_beat_message_got, heart_beat_message_sent)
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

/* Instrument Info Ack Message: encoded, read back, and compared */
proctype check_instrument_info_ack_message() {
  InstrumentInfoAckMessage instrument_info_ack_message_sent;
  InstrumentInfoAckMessage instrument_info_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_info_ack_message(instrument_info_ack_message_sent, 0)
  :: pattern == 1 -> fill_instrument_info_ack_message(instrument_info_ack_message_sent, 32)
  :: pattern == 2 -> fill_instrument_info_ack_message(instrument_info_ack_message_sent, 255)
  :: else -> ramp_instrument_info_ack_message(instrument_info_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_info_ack_message(instrument_info_ack_message_sent);
    assert(at == 6);
    at = 0;
    decode_instrument_info_ack_message(instrument_info_ack_message_got);
    assert(at == 6);
    equal_instrument_info_ack_message(instrument_info_ack_message_got, instrument_info_ack_message_sent)
  }
}

/* Subscription Reply Message: encoded, read back, and compared */
proctype check_subscription_reply_message() {
  SubscriptionReplyMessage subscription_reply_message_sent;
  SubscriptionReplyMessage subscription_reply_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_subscription_reply_message(subscription_reply_message_sent, 0)
  :: pattern == 1 -> fill_subscription_reply_message(subscription_reply_message_sent, 32)
  :: pattern == 2 -> fill_subscription_reply_message(subscription_reply_message_sent, 255)
  :: else -> ramp_subscription_reply_message(subscription_reply_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_subscription_reply_message(subscription_reply_message_sent);
    assert(at == 57);
    at = 0;
    decode_subscription_reply_message(subscription_reply_message_got);
    assert(at == 57);
    equal_subscription_reply_message(subscription_reply_message_got, subscription_reply_message_sent)
  }
}

/* Mass Subscription Reply Message: encoded, read back, and compared */
proctype check_mass_subscription_reply_message() {
  MassSubscriptionReplyMessage mass_subscription_reply_message_sent;
  MassSubscriptionReplyMessage mass_subscription_reply_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_subscription_reply_message(mass_subscription_reply_message_sent, 0)
  :: pattern == 1 -> fill_mass_subscription_reply_message(mass_subscription_reply_message_sent, 32)
  :: pattern == 2 -> fill_mass_subscription_reply_message(mass_subscription_reply_message_sent, 255)
  :: else -> ramp_mass_subscription_reply_message(mass_subscription_reply_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_subscription_reply_message(mass_subscription_reply_message_sent);
    assert(at == 55);
    at = 0;
    decode_mass_subscription_reply_message(mass_subscription_reply_message_got);
    assert(at == 55);
    equal_mass_subscription_reply_message(mass_subscription_reply_message_got, mass_subscription_reply_message_sent)
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
    assert(at == 12);
    at = 0;
    decode_bid(bid_got);
    assert(at == 12);
    equal_bid(bid_got, bid_sent)
  }
}

/* Offer: encoded, read back, and compared */
proctype check_offer() {
  Offer offer_sent;
  Offer offer_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_offer(offer_sent, 0)
  :: pattern == 1 -> fill_offer(offer_sent, 32)
  :: pattern == 2 -> fill_offer(offer_sent, 255)
  :: else -> ramp_offer(offer_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_offer(offer_sent);
    assert(at == 12);
    at = 0;
    decode_offer(offer_got);
    assert(at == 12);
    equal_offer(offer_got, offer_sent)
  }
}

/* Paid Given Message: encoded, read back, and compared */
proctype check_paid_given_message() {
  PaidGivenMessage paid_given_message_sent;
  PaidGivenMessage paid_given_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_paid_given_message(paid_given_message_sent, 0)
  :: pattern == 1 -> fill_paid_given_message(paid_given_message_sent, 32)
  :: pattern == 2 -> fill_paid_given_message(paid_given_message_sent, 255)
  :: else -> ramp_paid_given_message(paid_given_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_paid_given_message(paid_given_message_sent);
    assert(at == 16);
    at = 0;
    decode_paid_given_message(paid_given_message_got);
    assert(at == 16);
    equal_paid_given_message(paid_given_message_got, paid_given_message_sent)
  }
}

/* Conf Factor 75: encoded, read back, and compared */
proctype check_conf_factor75() {
  ConfFactor75 conf_factor75_sent;
  ConfFactor75 conf_factor75_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_conf_factor75(conf_factor75_sent, 0)
  :: pattern == 1 -> fill_conf_factor75(conf_factor75_sent, 32)
  :: pattern == 2 -> fill_conf_factor75(conf_factor75_sent, 255)
  :: else -> ramp_conf_factor75(conf_factor75_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_conf_factor75(conf_factor75_sent);
    assert(at == 8);
    at = 0;
    decode_conf_factor75(conf_factor75_got);
    assert(at == 8);
    equal_conf_factor75(conf_factor75_got, conf_factor75_sent)
  }
}

/* Conf Factor 50: encoded, read back, and compared */
proctype check_conf_factor50() {
  ConfFactor50 conf_factor50_sent;
  ConfFactor50 conf_factor50_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_conf_factor50(conf_factor50_sent, 0)
  :: pattern == 1 -> fill_conf_factor50(conf_factor50_sent, 32)
  :: pattern == 2 -> fill_conf_factor50(conf_factor50_sent, 255)
  :: else -> ramp_conf_factor50(conf_factor50_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_conf_factor50(conf_factor50_sent);
    assert(at == 8);
    at = 0;
    decode_conf_factor50(conf_factor50_got);
    assert(at == 8);
    equal_conf_factor50(conf_factor50_got, conf_factor50_sent)
  }
}

/* Conf Factor 25: encoded, read back, and compared */
proctype check_conf_factor25() {
  ConfFactor25 conf_factor25_sent;
  ConfFactor25 conf_factor25_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_conf_factor25(conf_factor25_sent, 0)
  :: pattern == 1 -> fill_conf_factor25(conf_factor25_sent, 32)
  :: pattern == 2 -> fill_conf_factor25(conf_factor25_sent, 255)
  :: else -> ramp_conf_factor25(conf_factor25_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_conf_factor25(conf_factor25_sent);
    assert(at == 8);
    at = 0;
    decode_conf_factor25(conf_factor25_got);
    assert(at == 8);
    equal_conf_factor25(conf_factor25_got, conf_factor25_sent)
  }
}

/* Wamr With Confidence Factor Message: encoded, read back, and compared */
proctype check_wamr_with_confidence_factor_message() {
  WamrWithConfidenceFactorMessage wamr_with_confidence_factor_message_sent;
  WamrWithConfidenceFactorMessage wamr_with_confidence_factor_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_sent, 0)
  :: pattern == 1 -> fill_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_sent, 32)
  :: pattern == 2 -> fill_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_sent, 255)
  :: else -> ramp_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_sent);
    assert(at == 38);
    at = 0;
    decode_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_got);
    assert(at == 38);
    equal_wamr_with_confidence_factor_message(wamr_with_confidence_factor_message_got, wamr_with_confidence_factor_message_sent)
  }
}

/* Mid Activity Indicator Message: encoded, read back, and compared */
proctype check_mid_activity_indicator_message() {
  MidActivityIndicatorMessage mid_activity_indicator_message_sent;
  MidActivityIndicatorMessage mid_activity_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mid_activity_indicator_message(mid_activity_indicator_message_sent, 0)
  :: pattern == 1 -> fill_mid_activity_indicator_message(mid_activity_indicator_message_sent, 32)
  :: pattern == 2 -> fill_mid_activity_indicator_message(mid_activity_indicator_message_sent, 255)
  :: else -> ramp_mid_activity_indicator_message(mid_activity_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mid_activity_indicator_message(mid_activity_indicator_message_sent);
    assert(at == 3);
    at = 0;
    decode_mid_activity_indicator_message(mid_activity_indicator_message_got);
    assert(at == 3);
    equal_mid_activity_indicator_message(mid_activity_indicator_message_got, mid_activity_indicator_message_sent)
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
  :: run check_logon_message()
  :: run check_logout_message()
  :: run check_heart_beat_message()
  :: run check_instrument_info()
  :: run check_instrument_info_ack_message()
  :: run check_subscription_reply_message()
  :: run check_mass_subscription_reply_message()
  :: run check_bid()
  :: run check_offer()
  :: run check_paid_given_message()
  :: run check_conf_factor75()
  :: run check_conf_factor50()
  :: run check_conf_factor25()
  :: run check_wamr_with_confidence_factor_message()
  :: run check_mid_activity_indicator_message()
  :: run check_reject_message()
  fi
}
