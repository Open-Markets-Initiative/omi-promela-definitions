/*
 * Bolsas y Mercados Españoles BME Fixed Income Top Of Book
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 450

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* What every message carries, in either direction: its length and its type. Section 2.1 gives a published message a third field, the sequence number that lets a listener continue an interrupted session without gaps and without repeated messages, and the message tables state it as the message's own first field - which is where it is declared, since a client's Logon, Replay Request and Logout do not carry one */
typedef MessageHeader {
  byte message_size[2];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 2 + 1) % 256;
  skip
}

/* Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_size[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_size[message_header_at] == message_header_written.message_size[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Logon Response Message: 26 bytes ---------------------------------------- */

/* The Logon Response message is used by the Server to accept a new session. In this message the sequence number will always be 0 */
typedef LogonResponseMessage {
  byte sequence_number[4];
  byte heart_bt_int;
  byte protocol_version[6];
  byte test_production_ind;
  byte environment_code[2];
  byte session_date[4];
  byte expected_sequence_number[4];
  byte sequence_number_to[4]
};

int logon_response_message_at;

/* every byte of Logon Response Message set to one value */
inline fill_logon_response_message(logon_response_message_record, logon_response_message_value) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.sequence_number[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_record.heart_bt_int = logon_response_message_value;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 6 -> logon_response_message_record.protocol_version[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_record.test_production_ind = logon_response_message_value;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 2 -> logon_response_message_record.environment_code[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.session_date[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.expected_sequence_number[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.sequence_number_to[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Response Message set to where it lies, so a field read out of place says so */
inline ramp_logon_response_message(logon_response_message_record, logon_response_message_base) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.sequence_number[logon_response_message_at] = (logon_response_message_base + 0 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_record.heart_bt_int = (logon_response_message_base + 4 + 1) % 256;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 6 -> logon_response_message_record.protocol_version[logon_response_message_at] = (logon_response_message_base + 5 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_record.test_production_ind = (logon_response_message_base + 11 + 1) % 256;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 2 -> logon_response_message_record.environment_code[logon_response_message_at] = (logon_response_message_base + 12 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.session_date[logon_response_message_at] = (logon_response_message_base + 14 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.expected_sequence_number[logon_response_message_at] = (logon_response_message_base + 18 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.sequence_number_to[logon_response_message_at] = (logon_response_message_base + 22 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message to the wire, 26 bytes from where the cursor stands */
inline encode_logon_response_message(logon_response_message_record) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> wire[at] = logon_response_message_record.sequence_number[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_response_message_record.heart_bt_int; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 6 -> wire[at] = logon_response_message_record.protocol_version[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_response_message_record.test_production_ind; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 2 -> wire[at] = logon_response_message_record.environment_code[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> wire[at] = logon_response_message_record.session_date[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> wire[at] = logon_response_message_record.expected_sequence_number[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> wire[at] = logon_response_message_record.sequence_number_to[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message off the wire, 26 bytes from where the cursor stands */
inline decode_logon_response_message(logon_response_message_record) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.sequence_number[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_record.heart_bt_int = wire[at]; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 6 -> logon_response_message_record.protocol_version[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_record.test_production_ind = wire[at]; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 2 -> logon_response_message_record.environment_code[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.session_date[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.expected_sequence_number[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.sequence_number_to[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Response Message is what was written, byte for byte */
inline equal_logon_response_message(logon_response_message_read, logon_response_message_written) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> assert(logon_response_message_read.sequence_number[logon_response_message_at] == logon_response_message_written.sequence_number[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  assert(logon_response_message_read.heart_bt_int == logon_response_message_written.heart_bt_int);
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 6 -> assert(logon_response_message_read.protocol_version[logon_response_message_at] == logon_response_message_written.protocol_version[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  assert(logon_response_message_read.test_production_ind == logon_response_message_written.test_production_ind);
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 2 -> assert(logon_response_message_read.environment_code[logon_response_message_at] == logon_response_message_written.environment_code[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> assert(logon_response_message_read.session_date[logon_response_message_at] == logon_response_message_written.session_date[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> assert(logon_response_message_read.expected_sequence_number[logon_response_message_at] == logon_response_message_written.expected_sequence_number[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> assert(logon_response_message_read.sequence_number_to[logon_response_message_at] == logon_response_message_written.sequence_number_to[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Response Message: 5 bytes ---------------------------------------- */

/* The Logout message is used by the Server to notify the end of a session, whether it is solicited or unsolicited. It may also be the answer to a failed logon attempt (see Logon message) */
typedef LogoutResponseMessage {
  byte sequence_number[4];
  byte logout_reason
};

int logout_response_message_at;

/* every byte of Logout Response Message set to one value */
inline fill_logout_response_message(logout_response_message_record, logout_response_message_value) {
  logout_response_message_at = 0;
  do
  :: logout_response_message_at < 4 -> logout_response_message_record.sequence_number[logout_response_message_at] = logout_response_message_value; logout_response_message_at = logout_response_message_at + 1
  :: else -> break
  od;
  logout_response_message_record.logout_reason = logout_response_message_value;
  skip
}

/* each byte of Logout Response Message set to where it lies, so a field read out of place says so */
inline ramp_logout_response_message(logout_response_message_record, logout_response_message_base) {
  logout_response_message_at = 0;
  do
  :: logout_response_message_at < 4 -> logout_response_message_record.sequence_number[logout_response_message_at] = (logout_response_message_base + 0 + logout_response_message_at + 1) % 256; logout_response_message_at = logout_response_message_at + 1
  :: else -> break
  od;
  logout_response_message_record.logout_reason = (logout_response_message_base + 4 + 1) % 256;
  skip
}

/* Logout Response Message to the wire, 5 bytes from where the cursor stands */
inline encode_logout_response_message(logout_response_message_record) {
  logout_response_message_at = 0;
  do
  :: logout_response_message_at < 4 -> wire[at] = logout_response_message_record.sequence_number[logout_response_message_at]; at = at + 1; logout_response_message_at = logout_response_message_at + 1
  :: else -> break
  od;
  wire[at] = logout_response_message_record.logout_reason; at = at + 1;
  skip
}

/* Logout Response Message off the wire, 5 bytes from where the cursor stands */
inline decode_logout_response_message(logout_response_message_record) {
  logout_response_message_at = 0;
  do
  :: logout_response_message_at < 4 -> logout_response_message_record.sequence_number[logout_response_message_at] = wire[at]; at = at + 1; logout_response_message_at = logout_response_message_at + 1
  :: else -> break
  od;
  logout_response_message_record.logout_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Logout Response Message is what was written, byte for byte */
inline equal_logout_response_message(logout_response_message_read, logout_response_message_written) {
  logout_response_message_at = 0;
  do
  :: logout_response_message_at < 4 -> assert(logout_response_message_read.sequence_number[logout_response_message_at] == logout_response_message_written.sequence_number[logout_response_message_at]); logout_response_message_at = logout_response_message_at + 1
  :: else -> break
  od;
  assert(logout_response_message_read.logout_reason == logout_response_message_written.logout_reason);
  skip
}

/* ---- Heartbeat Message: 4 bytes ---------------------------------------------- */

/* The Heartbeat message is used by the Server to indicate that the communication is active. In the Heartbeat message, the SequenceNumber of the previously received message will be repeated */
typedef HeartbeatMessage {
  byte sequence_number[4]
};

int heartbeat_message_at;

/* every byte of Heartbeat Message set to one value */
inline fill_heartbeat_message(heartbeat_message_record, heartbeat_message_value) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.sequence_number[heartbeat_message_at] = heartbeat_message_value; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Message set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_message(heartbeat_message_record, heartbeat_message_base) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.sequence_number[heartbeat_message_at] = (heartbeat_message_base + 0 + heartbeat_message_at + 1) % 256; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message to the wire, 4 bytes from where the cursor stands */
inline encode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> wire[at] = heartbeat_message_record.sequence_number[heartbeat_message_at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message off the wire, 4 bytes from where the cursor stands */
inline decode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.sequence_number[heartbeat_message_at] = wire[at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Message is what was written, byte for byte */
inline equal_heartbeat_message(heartbeat_message_read, heartbeat_message_written) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> assert(heartbeat_message_read.sequence_number[heartbeat_message_at] == heartbeat_message_written.sequence_number[heartbeat_message_at]); heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Network Status Message: 5 bytes ----------------------------------------- */

/* Message sent by the server with information about the connectivity between the Server and the central systems. In the Network Status message, the SequenceNumber of the previously received message will be repeated */
typedef NetworkStatusMessage {
  byte sequence_number[4];
  byte network_status_value
};

int network_status_message_at;

/* every byte of Network Status Message set to one value */
inline fill_network_status_message(network_status_message_record, network_status_message_value) {
  network_status_message_at = 0;
  do
  :: network_status_message_at < 4 -> network_status_message_record.sequence_number[network_status_message_at] = network_status_message_value; network_status_message_at = network_status_message_at + 1
  :: else -> break
  od;
  network_status_message_record.network_status_value = network_status_message_value;
  skip
}

/* each byte of Network Status Message set to where it lies, so a field read out of place says so */
inline ramp_network_status_message(network_status_message_record, network_status_message_base) {
  network_status_message_at = 0;
  do
  :: network_status_message_at < 4 -> network_status_message_record.sequence_number[network_status_message_at] = (network_status_message_base + 0 + network_status_message_at + 1) % 256; network_status_message_at = network_status_message_at + 1
  :: else -> break
  od;
  network_status_message_record.network_status_value = (network_status_message_base + 4 + 1) % 256;
  skip
}

/* Network Status Message to the wire, 5 bytes from where the cursor stands */
inline encode_network_status_message(network_status_message_record) {
  network_status_message_at = 0;
  do
  :: network_status_message_at < 4 -> wire[at] = network_status_message_record.sequence_number[network_status_message_at]; at = at + 1; network_status_message_at = network_status_message_at + 1
  :: else -> break
  od;
  wire[at] = network_status_message_record.network_status_value; at = at + 1;
  skip
}

/* Network Status Message off the wire, 5 bytes from where the cursor stands */
inline decode_network_status_message(network_status_message_record) {
  network_status_message_at = 0;
  do
  :: network_status_message_at < 4 -> network_status_message_record.sequence_number[network_status_message_at] = wire[at]; at = at + 1; network_status_message_at = network_status_message_at + 1
  :: else -> break
  od;
  network_status_message_record.network_status_value = wire[at]; at = at + 1;
  skip
}

/* what was read of Network Status Message is what was written, byte for byte */
inline equal_network_status_message(network_status_message_read, network_status_message_written) {
  network_status_message_at = 0;
  do
  :: network_status_message_at < 4 -> assert(network_status_message_read.sequence_number[network_status_message_at] == network_status_message_written.sequence_number[network_status_message_at]); network_status_message_at = network_status_message_at + 1
  :: else -> break
  od;
  assert(network_status_message_read.network_status_value == network_status_message_written.network_status_value);
  skip
}

/* ---- Trading Session Status Message: 15 bytes -------------------------------- */

/* Sent by the server to inform about the session status in each Trading Mode */
typedef TradingSessionStatusMessage {
  byte sequence_number[4];
  byte trading_session_id;
  byte trading_session_sub_id;
  byte trad_ses_status;
  byte transaction_date_and_time[8]
};

int trading_session_status_message_at;

/* every byte of Trading Session Status Message set to one value */
inline fill_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_value) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.sequence_number[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session_id = trading_session_status_message_value;
  trading_session_status_message_record.trading_session_sub_id = trading_session_status_message_value;
  trading_session_status_message_record.trad_ses_status = trading_session_status_message_value;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.transaction_date_and_time[trading_session_status_message_at] = trading_session_status_message_value; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Session Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_session_status_message(trading_session_status_message_record, trading_session_status_message_base) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.sequence_number[trading_session_status_message_at] = (trading_session_status_message_base + 0 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session_id = (trading_session_status_message_base + 4 + 1) % 256;
  trading_session_status_message_record.trading_session_sub_id = (trading_session_status_message_base + 5 + 1) % 256;
  trading_session_status_message_record.trad_ses_status = (trading_session_status_message_base + 6 + 1) % 256;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.transaction_date_and_time[trading_session_status_message_at] = (trading_session_status_message_base + 7 + trading_session_status_message_at + 1) % 256; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Status Message to the wire, 15 bytes from where the cursor stands */
inline encode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> wire[at] = trading_session_status_message_record.sequence_number[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_session_status_message_record.trading_session_id; at = at + 1;
  wire[at] = trading_session_status_message_record.trading_session_sub_id; at = at + 1;
  wire[at] = trading_session_status_message_record.trad_ses_status; at = at + 1;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> wire[at] = trading_session_status_message_record.transaction_date_and_time[trading_session_status_message_at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Session Status Message off the wire, 15 bytes from where the cursor stands */
inline decode_trading_session_status_message(trading_session_status_message_record) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> trading_session_status_message_record.sequence_number[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  trading_session_status_message_record.trading_session_id = wire[at]; at = at + 1;
  trading_session_status_message_record.trading_session_sub_id = wire[at]; at = at + 1;
  trading_session_status_message_record.trad_ses_status = wire[at]; at = at + 1;
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> trading_session_status_message_record.transaction_date_and_time[trading_session_status_message_at] = wire[at]; at = at + 1; trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Session Status Message is what was written, byte for byte */
inline equal_trading_session_status_message(trading_session_status_message_read, trading_session_status_message_written) {
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 4 -> assert(trading_session_status_message_read.sequence_number[trading_session_status_message_at] == trading_session_status_message_written.sequence_number[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  assert(trading_session_status_message_read.trading_session_id == trading_session_status_message_written.trading_session_id);
  assert(trading_session_status_message_read.trading_session_sub_id == trading_session_status_message_written.trading_session_sub_id);
  assert(trading_session_status_message_read.trad_ses_status == trading_session_status_message_written.trad_ses_status);
  trading_session_status_message_at = 0;
  do
  :: trading_session_status_message_at < 8 -> assert(trading_session_status_message_read.transaction_date_and_time[trading_session_status_message_at] == trading_session_status_message_written.transaction_date_and_time[trading_session_status_message_at]); trading_session_status_message_at = trading_session_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- News Message: 82 bytes -------------------------------------------------- */

/* Used by the Server to communicate a Market Surveillance or system-wide text message */
typedef NewsMessage {
  byte sequence_number[4];
  byte news_text[78]
};

int news_message_at;

/* every byte of News Message set to one value */
inline fill_news_message(news_message_record, news_message_value) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.sequence_number[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 78 -> news_message_record.news_text[news_message_at] = news_message_value; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of News Message set to where it lies, so a field read out of place says so */
inline ramp_news_message(news_message_record, news_message_base) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.sequence_number[news_message_at] = (news_message_base + 0 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 78 -> news_message_record.news_text[news_message_at] = (news_message_base + 4 + news_message_at + 1) % 256; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* News Message to the wire, 82 bytes from where the cursor stands */
inline encode_news_message(news_message_record) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> wire[at] = news_message_record.sequence_number[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 78 -> wire[at] = news_message_record.news_text[news_message_at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* News Message off the wire, 82 bytes from where the cursor stands */
inline decode_news_message(news_message_record) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> news_message_record.sequence_number[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 78 -> news_message_record.news_text[news_message_at] = wire[at]; at = at + 1; news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of News Message is what was written, byte for byte */
inline equal_news_message(news_message_read, news_message_written) {
  news_message_at = 0;
  do
  :: news_message_at < 4 -> assert(news_message_read.sequence_number[news_message_at] == news_message_written.sequence_number[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  news_message_at = 0;
  do
  :: news_message_at < 78 -> assert(news_message_read.news_text[news_message_at] == news_message_written.news_text[news_message_at]); news_message_at = news_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security List Cancellation Report Message: 50 bytes --------------------- */

/* Message sent by the server for cancelling previously defined securities */
typedef SecurityListCancellationReportMessage {
  byte sequence_number[4];
  byte market_id[4];
  byte market_segment_id[4];
  byte security_code[4];
  byte symbol[22];
  byte symbol_isin[12]
};

int security_list_cancellation_report_message_at;

/* every byte of Security List Cancellation Report Message set to one value */
inline fill_security_list_cancellation_report_message(security_list_cancellation_report_message_record, security_list_cancellation_report_message_value) {
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.sequence_number[security_list_cancellation_report_message_at] = security_list_cancellation_report_message_value; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.market_id[security_list_cancellation_report_message_at] = security_list_cancellation_report_message_value; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.market_segment_id[security_list_cancellation_report_message_at] = security_list_cancellation_report_message_value; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.security_code[security_list_cancellation_report_message_at] = security_list_cancellation_report_message_value; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 22 -> security_list_cancellation_report_message_record.symbol[security_list_cancellation_report_message_at] = security_list_cancellation_report_message_value; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 12 -> security_list_cancellation_report_message_record.symbol_isin[security_list_cancellation_report_message_at] = security_list_cancellation_report_message_value; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security List Cancellation Report Message set to where it lies, so a field read out of place says so */
inline ramp_security_list_cancellation_report_message(security_list_cancellation_report_message_record, security_list_cancellation_report_message_base) {
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.sequence_number[security_list_cancellation_report_message_at] = (security_list_cancellation_report_message_base + 0 + security_list_cancellation_report_message_at + 1) % 256; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.market_id[security_list_cancellation_report_message_at] = (security_list_cancellation_report_message_base + 4 + security_list_cancellation_report_message_at + 1) % 256; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.market_segment_id[security_list_cancellation_report_message_at] = (security_list_cancellation_report_message_base + 8 + security_list_cancellation_report_message_at + 1) % 256; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.security_code[security_list_cancellation_report_message_at] = (security_list_cancellation_report_message_base + 12 + security_list_cancellation_report_message_at + 1) % 256; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 22 -> security_list_cancellation_report_message_record.symbol[security_list_cancellation_report_message_at] = (security_list_cancellation_report_message_base + 16 + security_list_cancellation_report_message_at + 1) % 256; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 12 -> security_list_cancellation_report_message_record.symbol_isin[security_list_cancellation_report_message_at] = (security_list_cancellation_report_message_base + 38 + security_list_cancellation_report_message_at + 1) % 256; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security List Cancellation Report Message to the wire, 50 bytes from where the cursor stands */
inline encode_security_list_cancellation_report_message(security_list_cancellation_report_message_record) {
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> wire[at] = security_list_cancellation_report_message_record.sequence_number[security_list_cancellation_report_message_at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> wire[at] = security_list_cancellation_report_message_record.market_id[security_list_cancellation_report_message_at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> wire[at] = security_list_cancellation_report_message_record.market_segment_id[security_list_cancellation_report_message_at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> wire[at] = security_list_cancellation_report_message_record.security_code[security_list_cancellation_report_message_at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 22 -> wire[at] = security_list_cancellation_report_message_record.symbol[security_list_cancellation_report_message_at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 12 -> wire[at] = security_list_cancellation_report_message_record.symbol_isin[security_list_cancellation_report_message_at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security List Cancellation Report Message off the wire, 50 bytes from where the cursor stands */
inline decode_security_list_cancellation_report_message(security_list_cancellation_report_message_record) {
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.sequence_number[security_list_cancellation_report_message_at] = wire[at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.market_id[security_list_cancellation_report_message_at] = wire[at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.market_segment_id[security_list_cancellation_report_message_at] = wire[at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> security_list_cancellation_report_message_record.security_code[security_list_cancellation_report_message_at] = wire[at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 22 -> security_list_cancellation_report_message_record.symbol[security_list_cancellation_report_message_at] = wire[at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 12 -> security_list_cancellation_report_message_record.symbol_isin[security_list_cancellation_report_message_at] = wire[at]; at = at + 1; security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security List Cancellation Report Message is what was written, byte for byte */
inline equal_security_list_cancellation_report_message(security_list_cancellation_report_message_read, security_list_cancellation_report_message_written) {
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> assert(security_list_cancellation_report_message_read.sequence_number[security_list_cancellation_report_message_at] == security_list_cancellation_report_message_written.sequence_number[security_list_cancellation_report_message_at]); security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> assert(security_list_cancellation_report_message_read.market_id[security_list_cancellation_report_message_at] == security_list_cancellation_report_message_written.market_id[security_list_cancellation_report_message_at]); security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> assert(security_list_cancellation_report_message_read.market_segment_id[security_list_cancellation_report_message_at] == security_list_cancellation_report_message_written.market_segment_id[security_list_cancellation_report_message_at]); security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 4 -> assert(security_list_cancellation_report_message_read.security_code[security_list_cancellation_report_message_at] == security_list_cancellation_report_message_written.security_code[security_list_cancellation_report_message_at]); security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 22 -> assert(security_list_cancellation_report_message_read.symbol[security_list_cancellation_report_message_at] == security_list_cancellation_report_message_written.symbol[security_list_cancellation_report_message_at]); security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  security_list_cancellation_report_message_at = 0;
  do
  :: security_list_cancellation_report_message_at < 12 -> assert(security_list_cancellation_report_message_read.symbol_isin[security_list_cancellation_report_message_at] == security_list_cancellation_report_message_written.symbol_isin[security_list_cancellation_report_message_at]); security_list_cancellation_report_message_at = security_list_cancellation_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security List Message: 450 bytes ---------------------------------------- */

/* Message sent by the server to provide the definition of one security. It shares the same layout as the Security List Update Report message, but with a different Message Type */
typedef SecurityListMessage {
  byte sequence_number[4];
  byte market_id[4];
  byte market_segment_id[4];
  byte security_code[4];
  byte symbol[22];
  byte symbol_isin[12];
  byte fisn[35];
  byte issuer_lei[20];
  byte security_group[2];
  byte cfi_code[6];
  byte security_type[2];
  byte maturity_date[4];
  byte issue_date[4];
  byte contract_multiplier[8];
  byte li_spre[8];
  byte sst_ipre[8];
  byte li_spost[8];
  byte sst_ipost[8];
  byte liquid_instrument;
  byte admission_requested_by_issuer;
  byte min_trade_vol[4];
  byte round_lot[4];
  byte currency[3];
  byte modality_mask_b_4[4];
  byte security_description[80];
  byte trading_obligation;
  byte security_name[40];
  byte security_status;
  byte coupon_payment_date[4];
  byte min_price_increment[8];
  byte number_of_decimals;
  byte order_number_of_decimals;
  byte coupon_rate[8];
  byte issuer[12];
  byte trading_scope_b_1;
  byte first_trading_date[4];
  byte settlement_system;
  byte maturity[8];
  byte coupon_periodicity;
  byte benchmark;
  byte strippable;
  byte volume_issued[8];
  byte alive_volume[8];
  byte coupon_type;
  byte coupon_quotation;
  byte accrued_interest_calculation_procedure;
  byte next_redemption_date[4];
  byte type_of_redemption[2];
  byte facial[8];
  byte calculation_method;
  byte date_last_coupon_was_paid[4];
  byte bond_seniority[4];
  byte interest_accrual_date[4];
  byte start_date[4];
  byte price_type;
  byte spread_to_index[8];
  byte benchmark_curve_points_units[4];
  byte benchmark_curve_points_value;
  byte benchmark_security_id[25];
  byte accrued_interest_rate_r_8[8]
};

int security_list_message_at;

/* every byte of Security List Message set to one value */
inline fill_security_list_message(security_list_message_record, security_list_message_value) {
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.sequence_number[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.market_id[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.market_segment_id[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.security_code[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.symbol[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.symbol_isin[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 35 -> security_list_message_record.fisn[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> security_list_message_record.issuer_lei[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.security_group[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 6 -> security_list_message_record.cfi_code[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.security_type[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.maturity_date[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.issue_date[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.contract_multiplier[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.li_spre[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.sst_ipre[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.li_spost[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.sst_ipost[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.liquid_instrument = security_list_message_value;
  security_list_message_record.admission_requested_by_issuer = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.min_trade_vol[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.round_lot[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.currency[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.modality_mask_b_4[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 80 -> security_list_message_record.security_description[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.trading_obligation = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 40 -> security_list_message_record.security_name[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.security_status = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.coupon_payment_date[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.min_price_increment[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.number_of_decimals = security_list_message_value;
  security_list_message_record.order_number_of_decimals = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.coupon_rate[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.issuer[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.trading_scope_b_1 = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.first_trading_date[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.settlement_system = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.maturity[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.coupon_periodicity = security_list_message_value;
  security_list_message_record.benchmark = security_list_message_value;
  security_list_message_record.strippable = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.volume_issued[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.alive_volume[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.coupon_type = security_list_message_value;
  security_list_message_record.coupon_quotation = security_list_message_value;
  security_list_message_record.accrued_interest_calculation_procedure = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.next_redemption_date[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.type_of_redemption[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.facial[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.calculation_method = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.date_last_coupon_was_paid[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.bond_seniority[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.interest_accrual_date[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.start_date[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.price_type = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.spread_to_index[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.benchmark_curve_points_units[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.benchmark_curve_points_value = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 25 -> security_list_message_record.benchmark_security_id[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.accrued_interest_rate_r_8[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security List Message set to where it lies, so a field read out of place says so */
inline ramp_security_list_message(security_list_message_record, security_list_message_base) {
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.sequence_number[security_list_message_at] = (security_list_message_base + 0 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.market_id[security_list_message_at] = (security_list_message_base + 4 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.market_segment_id[security_list_message_at] = (security_list_message_base + 8 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.security_code[security_list_message_at] = (security_list_message_base + 12 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.symbol[security_list_message_at] = (security_list_message_base + 16 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.symbol_isin[security_list_message_at] = (security_list_message_base + 38 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 35 -> security_list_message_record.fisn[security_list_message_at] = (security_list_message_base + 50 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> security_list_message_record.issuer_lei[security_list_message_at] = (security_list_message_base + 85 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.security_group[security_list_message_at] = (security_list_message_base + 105 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 6 -> security_list_message_record.cfi_code[security_list_message_at] = (security_list_message_base + 107 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.security_type[security_list_message_at] = (security_list_message_base + 113 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.maturity_date[security_list_message_at] = (security_list_message_base + 115 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.issue_date[security_list_message_at] = (security_list_message_base + 119 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.contract_multiplier[security_list_message_at] = (security_list_message_base + 123 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.li_spre[security_list_message_at] = (security_list_message_base + 131 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.sst_ipre[security_list_message_at] = (security_list_message_base + 139 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.li_spost[security_list_message_at] = (security_list_message_base + 147 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.sst_ipost[security_list_message_at] = (security_list_message_base + 155 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.liquid_instrument = (security_list_message_base + 163 + 1) % 256;
  security_list_message_record.admission_requested_by_issuer = (security_list_message_base + 164 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.min_trade_vol[security_list_message_at] = (security_list_message_base + 165 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.round_lot[security_list_message_at] = (security_list_message_base + 169 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.currency[security_list_message_at] = (security_list_message_base + 173 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.modality_mask_b_4[security_list_message_at] = (security_list_message_base + 176 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 80 -> security_list_message_record.security_description[security_list_message_at] = (security_list_message_base + 180 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.trading_obligation = (security_list_message_base + 260 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 40 -> security_list_message_record.security_name[security_list_message_at] = (security_list_message_base + 261 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.security_status = (security_list_message_base + 301 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.coupon_payment_date[security_list_message_at] = (security_list_message_base + 302 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.min_price_increment[security_list_message_at] = (security_list_message_base + 306 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.number_of_decimals = (security_list_message_base + 314 + 1) % 256;
  security_list_message_record.order_number_of_decimals = (security_list_message_base + 315 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.coupon_rate[security_list_message_at] = (security_list_message_base + 316 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.issuer[security_list_message_at] = (security_list_message_base + 324 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.trading_scope_b_1 = (security_list_message_base + 336 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.first_trading_date[security_list_message_at] = (security_list_message_base + 337 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.settlement_system = (security_list_message_base + 341 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.maturity[security_list_message_at] = (security_list_message_base + 342 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.coupon_periodicity = (security_list_message_base + 350 + 1) % 256;
  security_list_message_record.benchmark = (security_list_message_base + 351 + 1) % 256;
  security_list_message_record.strippable = (security_list_message_base + 352 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.volume_issued[security_list_message_at] = (security_list_message_base + 353 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.alive_volume[security_list_message_at] = (security_list_message_base + 361 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.coupon_type = (security_list_message_base + 369 + 1) % 256;
  security_list_message_record.coupon_quotation = (security_list_message_base + 370 + 1) % 256;
  security_list_message_record.accrued_interest_calculation_procedure = (security_list_message_base + 371 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.next_redemption_date[security_list_message_at] = (security_list_message_base + 372 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.type_of_redemption[security_list_message_at] = (security_list_message_base + 376 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.facial[security_list_message_at] = (security_list_message_base + 378 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.calculation_method = (security_list_message_base + 386 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.date_last_coupon_was_paid[security_list_message_at] = (security_list_message_base + 387 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.bond_seniority[security_list_message_at] = (security_list_message_base + 391 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.interest_accrual_date[security_list_message_at] = (security_list_message_base + 395 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.start_date[security_list_message_at] = (security_list_message_base + 399 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.price_type = (security_list_message_base + 403 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.spread_to_index[security_list_message_at] = (security_list_message_base + 404 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.benchmark_curve_points_units[security_list_message_at] = (security_list_message_base + 412 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.benchmark_curve_points_value = (security_list_message_base + 416 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 25 -> security_list_message_record.benchmark_security_id[security_list_message_at] = (security_list_message_base + 417 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.accrued_interest_rate_r_8[security_list_message_at] = (security_list_message_base + 442 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security List Message to the wire, 450 bytes from where the cursor stands */
inline encode_security_list_message(security_list_message_record) {
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.sequence_number[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.market_id[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.market_segment_id[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.security_code[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> wire[at] = security_list_message_record.symbol[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> wire[at] = security_list_message_record.symbol_isin[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 35 -> wire[at] = security_list_message_record.fisn[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> wire[at] = security_list_message_record.issuer_lei[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> wire[at] = security_list_message_record.security_group[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 6 -> wire[at] = security_list_message_record.cfi_code[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> wire[at] = security_list_message_record.security_type[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.maturity_date[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.issue_date[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.contract_multiplier[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.li_spre[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.sst_ipre[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.li_spost[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.sst_ipost[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.liquid_instrument; at = at + 1;
  wire[at] = security_list_message_record.admission_requested_by_issuer; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.min_trade_vol[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.round_lot[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> wire[at] = security_list_message_record.currency[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.modality_mask_b_4[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 80 -> wire[at] = security_list_message_record.security_description[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.trading_obligation; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 40 -> wire[at] = security_list_message_record.security_name[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.security_status; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.coupon_payment_date[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.min_price_increment[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.number_of_decimals; at = at + 1;
  wire[at] = security_list_message_record.order_number_of_decimals; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.coupon_rate[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> wire[at] = security_list_message_record.issuer[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.trading_scope_b_1; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.first_trading_date[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.settlement_system; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.maturity[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.coupon_periodicity; at = at + 1;
  wire[at] = security_list_message_record.benchmark; at = at + 1;
  wire[at] = security_list_message_record.strippable; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.volume_issued[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.alive_volume[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.coupon_type; at = at + 1;
  wire[at] = security_list_message_record.coupon_quotation; at = at + 1;
  wire[at] = security_list_message_record.accrued_interest_calculation_procedure; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.next_redemption_date[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> wire[at] = security_list_message_record.type_of_redemption[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.facial[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.calculation_method; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.date_last_coupon_was_paid[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.bond_seniority[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.interest_accrual_date[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.start_date[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.price_type; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.spread_to_index[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.benchmark_curve_points_units[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.benchmark_curve_points_value; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 25 -> wire[at] = security_list_message_record.benchmark_security_id[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.accrued_interest_rate_r_8[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security List Message off the wire, 450 bytes from where the cursor stands */
inline decode_security_list_message(security_list_message_record) {
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.sequence_number[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.market_id[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.market_segment_id[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.security_code[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.symbol[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.symbol_isin[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 35 -> security_list_message_record.fisn[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> security_list_message_record.issuer_lei[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.security_group[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 6 -> security_list_message_record.cfi_code[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.security_type[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.maturity_date[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.issue_date[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.contract_multiplier[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.li_spre[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.sst_ipre[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.li_spost[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.sst_ipost[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.liquid_instrument = wire[at]; at = at + 1;
  security_list_message_record.admission_requested_by_issuer = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.min_trade_vol[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.round_lot[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.currency[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.modality_mask_b_4[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 80 -> security_list_message_record.security_description[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.trading_obligation = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 40 -> security_list_message_record.security_name[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.security_status = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.coupon_payment_date[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.min_price_increment[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.number_of_decimals = wire[at]; at = at + 1;
  security_list_message_record.order_number_of_decimals = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.coupon_rate[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.issuer[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.trading_scope_b_1 = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.first_trading_date[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.settlement_system = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.maturity[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.coupon_periodicity = wire[at]; at = at + 1;
  security_list_message_record.benchmark = wire[at]; at = at + 1;
  security_list_message_record.strippable = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.volume_issued[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.alive_volume[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.coupon_type = wire[at]; at = at + 1;
  security_list_message_record.coupon_quotation = wire[at]; at = at + 1;
  security_list_message_record.accrued_interest_calculation_procedure = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.next_redemption_date[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.type_of_redemption[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.facial[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.calculation_method = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.date_last_coupon_was_paid[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.bond_seniority[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.interest_accrual_date[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.start_date[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.price_type = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.spread_to_index[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.benchmark_curve_points_units[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.benchmark_curve_points_value = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 25 -> security_list_message_record.benchmark_security_id[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.accrued_interest_rate_r_8[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security List Message is what was written, byte for byte */
inline equal_security_list_message(security_list_message_read, security_list_message_written) {
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.sequence_number[security_list_message_at] == security_list_message_written.sequence_number[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.market_id[security_list_message_at] == security_list_message_written.market_id[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.market_segment_id[security_list_message_at] == security_list_message_written.market_segment_id[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.security_code[security_list_message_at] == security_list_message_written.security_code[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> assert(security_list_message_read.symbol[security_list_message_at] == security_list_message_written.symbol[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> assert(security_list_message_read.symbol_isin[security_list_message_at] == security_list_message_written.symbol_isin[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 35 -> assert(security_list_message_read.fisn[security_list_message_at] == security_list_message_written.fisn[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> assert(security_list_message_read.issuer_lei[security_list_message_at] == security_list_message_written.issuer_lei[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> assert(security_list_message_read.security_group[security_list_message_at] == security_list_message_written.security_group[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 6 -> assert(security_list_message_read.cfi_code[security_list_message_at] == security_list_message_written.cfi_code[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> assert(security_list_message_read.security_type[security_list_message_at] == security_list_message_written.security_type[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.maturity_date[security_list_message_at] == security_list_message_written.maturity_date[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.issue_date[security_list_message_at] == security_list_message_written.issue_date[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.contract_multiplier[security_list_message_at] == security_list_message_written.contract_multiplier[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.li_spre[security_list_message_at] == security_list_message_written.li_spre[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.sst_ipre[security_list_message_at] == security_list_message_written.sst_ipre[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.li_spost[security_list_message_at] == security_list_message_written.li_spost[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.sst_ipost[security_list_message_at] == security_list_message_written.sst_ipost[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.liquid_instrument == security_list_message_written.liquid_instrument);
  assert(security_list_message_read.admission_requested_by_issuer == security_list_message_written.admission_requested_by_issuer);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.min_trade_vol[security_list_message_at] == security_list_message_written.min_trade_vol[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.round_lot[security_list_message_at] == security_list_message_written.round_lot[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> assert(security_list_message_read.currency[security_list_message_at] == security_list_message_written.currency[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.modality_mask_b_4[security_list_message_at] == security_list_message_written.modality_mask_b_4[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 80 -> assert(security_list_message_read.security_description[security_list_message_at] == security_list_message_written.security_description[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.trading_obligation == security_list_message_written.trading_obligation);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 40 -> assert(security_list_message_read.security_name[security_list_message_at] == security_list_message_written.security_name[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.security_status == security_list_message_written.security_status);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.coupon_payment_date[security_list_message_at] == security_list_message_written.coupon_payment_date[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.min_price_increment[security_list_message_at] == security_list_message_written.min_price_increment[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.number_of_decimals == security_list_message_written.number_of_decimals);
  assert(security_list_message_read.order_number_of_decimals == security_list_message_written.order_number_of_decimals);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.coupon_rate[security_list_message_at] == security_list_message_written.coupon_rate[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> assert(security_list_message_read.issuer[security_list_message_at] == security_list_message_written.issuer[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.trading_scope_b_1 == security_list_message_written.trading_scope_b_1);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.first_trading_date[security_list_message_at] == security_list_message_written.first_trading_date[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.settlement_system == security_list_message_written.settlement_system);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.maturity[security_list_message_at] == security_list_message_written.maturity[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.coupon_periodicity == security_list_message_written.coupon_periodicity);
  assert(security_list_message_read.benchmark == security_list_message_written.benchmark);
  assert(security_list_message_read.strippable == security_list_message_written.strippable);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.volume_issued[security_list_message_at] == security_list_message_written.volume_issued[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.alive_volume[security_list_message_at] == security_list_message_written.alive_volume[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.coupon_type == security_list_message_written.coupon_type);
  assert(security_list_message_read.coupon_quotation == security_list_message_written.coupon_quotation);
  assert(security_list_message_read.accrued_interest_calculation_procedure == security_list_message_written.accrued_interest_calculation_procedure);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.next_redemption_date[security_list_message_at] == security_list_message_written.next_redemption_date[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> assert(security_list_message_read.type_of_redemption[security_list_message_at] == security_list_message_written.type_of_redemption[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.facial[security_list_message_at] == security_list_message_written.facial[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.calculation_method == security_list_message_written.calculation_method);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.date_last_coupon_was_paid[security_list_message_at] == security_list_message_written.date_last_coupon_was_paid[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.bond_seniority[security_list_message_at] == security_list_message_written.bond_seniority[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.interest_accrual_date[security_list_message_at] == security_list_message_written.interest_accrual_date[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.start_date[security_list_message_at] == security_list_message_written.start_date[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.price_type == security_list_message_written.price_type);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.spread_to_index[security_list_message_at] == security_list_message_written.spread_to_index[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.benchmark_curve_points_units[security_list_message_at] == security_list_message_written.benchmark_curve_points_units[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.benchmark_curve_points_value == security_list_message_written.benchmark_curve_points_value);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 25 -> assert(security_list_message_read.benchmark_security_id[security_list_message_at] == security_list_message_written.benchmark_security_id[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.accrued_interest_rate_r_8[security_list_message_at] == security_list_message_written.accrued_interest_rate_r_8[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security List Update Report Message: 450 bytes -------------------------- */

/* Message sent by the server for reporting updates, during the session, to the security definition */
typedef SecurityListUpdateReportMessage {
  byte sequence_number[4];
  byte market_id[4];
  byte market_segment_id[4];
  byte security_code[4];
  byte symbol[22];
  byte symbol_isin[12];
  byte fisn[35];
  byte issuer_lei[20];
  byte security_group[2];
  byte cfi_code[6];
  byte security_type[2];
  byte maturity_date[4];
  byte issue_date[4];
  byte contract_multiplier[8];
  byte li_spre[8];
  byte sst_ipre[8];
  byte li_spost[8];
  byte sst_ipost[8];
  byte liquid_instrument;
  byte admission_requested_by_issuer;
  byte min_trade_vol[4];
  byte round_lot[4];
  byte currency[3];
  byte modality_mask_b_4[4];
  byte security_description[80];
  byte trading_obligation;
  byte security_name[40];
  byte security_status;
  byte coupon_payment_date[4];
  byte min_price_increment[8];
  byte number_of_decimals;
  byte order_number_of_decimals;
  byte coupon_rate[8];
  byte issuer[12];
  byte trading_scope_b_1;
  byte first_trading_date[4];
  byte settlement_system;
  byte maturity[8];
  byte coupon_periodicity;
  byte benchmark;
  byte strippable;
  byte volume_issued[8];
  byte alive_volume[8];
  byte coupon_type;
  byte coupon_quotation;
  byte accrued_interest_calculation_procedure;
  byte next_redemption_date[4];
  byte type_of_redemption[2];
  byte facial[8];
  byte calculation_method;
  byte date_last_coupon_was_paid[4];
  byte bond_seniority[4];
  byte interest_accrual_date[4];
  byte start_date[4];
  byte price_type;
  byte spread_to_index[8];
  byte benchmark_curve_points_units[4];
  byte benchmark_curve_points_value;
  byte benchmark_security_id[25];
  byte accrued_interest_rate_r_8[8]
};

int security_list_update_report_message_at;

/* every byte of Security List Update Report Message set to one value */
inline fill_security_list_update_report_message(security_list_update_report_message_record, security_list_update_report_message_value) {
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.sequence_number[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.market_id[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.market_segment_id[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.security_code[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.symbol[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.symbol_isin[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 35 -> security_list_update_report_message_record.fisn[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.issuer_lei[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.security_group[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 6 -> security_list_update_report_message_record.cfi_code[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.security_type[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.maturity_date[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.issue_date[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.contract_multiplier[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.li_spre[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.sst_ipre[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.li_spost[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.sst_ipost[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.liquid_instrument = security_list_update_report_message_value;
  security_list_update_report_message_record.admission_requested_by_issuer = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.min_trade_vol[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.round_lot[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.currency[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.modality_mask_b_4[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 80 -> security_list_update_report_message_record.security_description[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.trading_obligation = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 40 -> security_list_update_report_message_record.security_name[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.security_status = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.coupon_payment_date[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.min_price_increment[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.number_of_decimals = security_list_update_report_message_value;
  security_list_update_report_message_record.order_number_of_decimals = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.coupon_rate[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.issuer[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.trading_scope_b_1 = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.first_trading_date[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.settlement_system = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.maturity[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.coupon_periodicity = security_list_update_report_message_value;
  security_list_update_report_message_record.benchmark = security_list_update_report_message_value;
  security_list_update_report_message_record.strippable = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.volume_issued[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.alive_volume[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.coupon_type = security_list_update_report_message_value;
  security_list_update_report_message_record.coupon_quotation = security_list_update_report_message_value;
  security_list_update_report_message_record.accrued_interest_calculation_procedure = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.next_redemption_date[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.type_of_redemption[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.facial[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.calculation_method = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.date_last_coupon_was_paid[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.bond_seniority[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.interest_accrual_date[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.start_date[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.price_type = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.spread_to_index[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.benchmark_curve_points_units[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.benchmark_curve_points_value = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 25 -> security_list_update_report_message_record.benchmark_security_id[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.accrued_interest_rate_r_8[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security List Update Report Message set to where it lies, so a field read out of place says so */
inline ramp_security_list_update_report_message(security_list_update_report_message_record, security_list_update_report_message_base) {
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.sequence_number[security_list_update_report_message_at] = (security_list_update_report_message_base + 0 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.market_id[security_list_update_report_message_at] = (security_list_update_report_message_base + 4 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.market_segment_id[security_list_update_report_message_at] = (security_list_update_report_message_base + 8 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.security_code[security_list_update_report_message_at] = (security_list_update_report_message_base + 12 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.symbol[security_list_update_report_message_at] = (security_list_update_report_message_base + 16 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.symbol_isin[security_list_update_report_message_at] = (security_list_update_report_message_base + 38 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 35 -> security_list_update_report_message_record.fisn[security_list_update_report_message_at] = (security_list_update_report_message_base + 50 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.issuer_lei[security_list_update_report_message_at] = (security_list_update_report_message_base + 85 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.security_group[security_list_update_report_message_at] = (security_list_update_report_message_base + 105 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 6 -> security_list_update_report_message_record.cfi_code[security_list_update_report_message_at] = (security_list_update_report_message_base + 107 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.security_type[security_list_update_report_message_at] = (security_list_update_report_message_base + 113 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.maturity_date[security_list_update_report_message_at] = (security_list_update_report_message_base + 115 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.issue_date[security_list_update_report_message_at] = (security_list_update_report_message_base + 119 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.contract_multiplier[security_list_update_report_message_at] = (security_list_update_report_message_base + 123 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.li_spre[security_list_update_report_message_at] = (security_list_update_report_message_base + 131 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.sst_ipre[security_list_update_report_message_at] = (security_list_update_report_message_base + 139 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.li_spost[security_list_update_report_message_at] = (security_list_update_report_message_base + 147 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.sst_ipost[security_list_update_report_message_at] = (security_list_update_report_message_base + 155 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.liquid_instrument = (security_list_update_report_message_base + 163 + 1) % 256;
  security_list_update_report_message_record.admission_requested_by_issuer = (security_list_update_report_message_base + 164 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.min_trade_vol[security_list_update_report_message_at] = (security_list_update_report_message_base + 165 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.round_lot[security_list_update_report_message_at] = (security_list_update_report_message_base + 169 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.currency[security_list_update_report_message_at] = (security_list_update_report_message_base + 173 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.modality_mask_b_4[security_list_update_report_message_at] = (security_list_update_report_message_base + 176 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 80 -> security_list_update_report_message_record.security_description[security_list_update_report_message_at] = (security_list_update_report_message_base + 180 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.trading_obligation = (security_list_update_report_message_base + 260 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 40 -> security_list_update_report_message_record.security_name[security_list_update_report_message_at] = (security_list_update_report_message_base + 261 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.security_status = (security_list_update_report_message_base + 301 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.coupon_payment_date[security_list_update_report_message_at] = (security_list_update_report_message_base + 302 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.min_price_increment[security_list_update_report_message_at] = (security_list_update_report_message_base + 306 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.number_of_decimals = (security_list_update_report_message_base + 314 + 1) % 256;
  security_list_update_report_message_record.order_number_of_decimals = (security_list_update_report_message_base + 315 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.coupon_rate[security_list_update_report_message_at] = (security_list_update_report_message_base + 316 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.issuer[security_list_update_report_message_at] = (security_list_update_report_message_base + 324 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.trading_scope_b_1 = (security_list_update_report_message_base + 336 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.first_trading_date[security_list_update_report_message_at] = (security_list_update_report_message_base + 337 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.settlement_system = (security_list_update_report_message_base + 341 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.maturity[security_list_update_report_message_at] = (security_list_update_report_message_base + 342 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.coupon_periodicity = (security_list_update_report_message_base + 350 + 1) % 256;
  security_list_update_report_message_record.benchmark = (security_list_update_report_message_base + 351 + 1) % 256;
  security_list_update_report_message_record.strippable = (security_list_update_report_message_base + 352 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.volume_issued[security_list_update_report_message_at] = (security_list_update_report_message_base + 353 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.alive_volume[security_list_update_report_message_at] = (security_list_update_report_message_base + 361 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.coupon_type = (security_list_update_report_message_base + 369 + 1) % 256;
  security_list_update_report_message_record.coupon_quotation = (security_list_update_report_message_base + 370 + 1) % 256;
  security_list_update_report_message_record.accrued_interest_calculation_procedure = (security_list_update_report_message_base + 371 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.next_redemption_date[security_list_update_report_message_at] = (security_list_update_report_message_base + 372 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.type_of_redemption[security_list_update_report_message_at] = (security_list_update_report_message_base + 376 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.facial[security_list_update_report_message_at] = (security_list_update_report_message_base + 378 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.calculation_method = (security_list_update_report_message_base + 386 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.date_last_coupon_was_paid[security_list_update_report_message_at] = (security_list_update_report_message_base + 387 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.bond_seniority[security_list_update_report_message_at] = (security_list_update_report_message_base + 391 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.interest_accrual_date[security_list_update_report_message_at] = (security_list_update_report_message_base + 395 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.start_date[security_list_update_report_message_at] = (security_list_update_report_message_base + 399 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.price_type = (security_list_update_report_message_base + 403 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.spread_to_index[security_list_update_report_message_at] = (security_list_update_report_message_base + 404 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.benchmark_curve_points_units[security_list_update_report_message_at] = (security_list_update_report_message_base + 412 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.benchmark_curve_points_value = (security_list_update_report_message_base + 416 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 25 -> security_list_update_report_message_record.benchmark_security_id[security_list_update_report_message_at] = (security_list_update_report_message_base + 417 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.accrued_interest_rate_r_8[security_list_update_report_message_at] = (security_list_update_report_message_base + 442 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security List Update Report Message to the wire, 450 bytes from where the cursor stands */
inline encode_security_list_update_report_message(security_list_update_report_message_record) {
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.sequence_number[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.market_id[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.market_segment_id[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.security_code[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> wire[at] = security_list_update_report_message_record.symbol[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> wire[at] = security_list_update_report_message_record.symbol_isin[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 35 -> wire[at] = security_list_update_report_message_record.fisn[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> wire[at] = security_list_update_report_message_record.issuer_lei[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> wire[at] = security_list_update_report_message_record.security_group[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 6 -> wire[at] = security_list_update_report_message_record.cfi_code[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> wire[at] = security_list_update_report_message_record.security_type[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.maturity_date[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.issue_date[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.contract_multiplier[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.li_spre[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.sst_ipre[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.li_spost[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.sst_ipost[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.liquid_instrument; at = at + 1;
  wire[at] = security_list_update_report_message_record.admission_requested_by_issuer; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.min_trade_vol[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.round_lot[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> wire[at] = security_list_update_report_message_record.currency[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.modality_mask_b_4[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 80 -> wire[at] = security_list_update_report_message_record.security_description[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.trading_obligation; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 40 -> wire[at] = security_list_update_report_message_record.security_name[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.security_status; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.coupon_payment_date[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.min_price_increment[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.number_of_decimals; at = at + 1;
  wire[at] = security_list_update_report_message_record.order_number_of_decimals; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.coupon_rate[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> wire[at] = security_list_update_report_message_record.issuer[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.trading_scope_b_1; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.first_trading_date[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.settlement_system; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.maturity[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.coupon_periodicity; at = at + 1;
  wire[at] = security_list_update_report_message_record.benchmark; at = at + 1;
  wire[at] = security_list_update_report_message_record.strippable; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.volume_issued[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.alive_volume[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.coupon_type; at = at + 1;
  wire[at] = security_list_update_report_message_record.coupon_quotation; at = at + 1;
  wire[at] = security_list_update_report_message_record.accrued_interest_calculation_procedure; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.next_redemption_date[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> wire[at] = security_list_update_report_message_record.type_of_redemption[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.facial[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.calculation_method; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.date_last_coupon_was_paid[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.bond_seniority[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.interest_accrual_date[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.start_date[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.price_type; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.spread_to_index[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.benchmark_curve_points_units[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.benchmark_curve_points_value; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 25 -> wire[at] = security_list_update_report_message_record.benchmark_security_id[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.accrued_interest_rate_r_8[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security List Update Report Message off the wire, 450 bytes from where the cursor stands */
inline decode_security_list_update_report_message(security_list_update_report_message_record) {
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.sequence_number[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.market_id[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.market_segment_id[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.security_code[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.symbol[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.symbol_isin[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 35 -> security_list_update_report_message_record.fisn[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.issuer_lei[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.security_group[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 6 -> security_list_update_report_message_record.cfi_code[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.security_type[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.maturity_date[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.issue_date[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.contract_multiplier[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.li_spre[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.sst_ipre[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.li_spost[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.sst_ipost[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.liquid_instrument = wire[at]; at = at + 1;
  security_list_update_report_message_record.admission_requested_by_issuer = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.min_trade_vol[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.round_lot[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.currency[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.modality_mask_b_4[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 80 -> security_list_update_report_message_record.security_description[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.trading_obligation = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 40 -> security_list_update_report_message_record.security_name[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.security_status = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.coupon_payment_date[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.min_price_increment[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.number_of_decimals = wire[at]; at = at + 1;
  security_list_update_report_message_record.order_number_of_decimals = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.coupon_rate[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.issuer[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.trading_scope_b_1 = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.first_trading_date[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.settlement_system = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.maturity[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.coupon_periodicity = wire[at]; at = at + 1;
  security_list_update_report_message_record.benchmark = wire[at]; at = at + 1;
  security_list_update_report_message_record.strippable = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.volume_issued[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.alive_volume[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.coupon_type = wire[at]; at = at + 1;
  security_list_update_report_message_record.coupon_quotation = wire[at]; at = at + 1;
  security_list_update_report_message_record.accrued_interest_calculation_procedure = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.next_redemption_date[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.type_of_redemption[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.facial[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.calculation_method = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.date_last_coupon_was_paid[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.bond_seniority[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.interest_accrual_date[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.start_date[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.price_type = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.spread_to_index[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.benchmark_curve_points_units[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.benchmark_curve_points_value = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 25 -> security_list_update_report_message_record.benchmark_security_id[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.accrued_interest_rate_r_8[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security List Update Report Message is what was written, byte for byte */
inline equal_security_list_update_report_message(security_list_update_report_message_read, security_list_update_report_message_written) {
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.sequence_number[security_list_update_report_message_at] == security_list_update_report_message_written.sequence_number[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.market_id[security_list_update_report_message_at] == security_list_update_report_message_written.market_id[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.market_segment_id[security_list_update_report_message_at] == security_list_update_report_message_written.market_segment_id[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.security_code[security_list_update_report_message_at] == security_list_update_report_message_written.security_code[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> assert(security_list_update_report_message_read.symbol[security_list_update_report_message_at] == security_list_update_report_message_written.symbol[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> assert(security_list_update_report_message_read.symbol_isin[security_list_update_report_message_at] == security_list_update_report_message_written.symbol_isin[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 35 -> assert(security_list_update_report_message_read.fisn[security_list_update_report_message_at] == security_list_update_report_message_written.fisn[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> assert(security_list_update_report_message_read.issuer_lei[security_list_update_report_message_at] == security_list_update_report_message_written.issuer_lei[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> assert(security_list_update_report_message_read.security_group[security_list_update_report_message_at] == security_list_update_report_message_written.security_group[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 6 -> assert(security_list_update_report_message_read.cfi_code[security_list_update_report_message_at] == security_list_update_report_message_written.cfi_code[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> assert(security_list_update_report_message_read.security_type[security_list_update_report_message_at] == security_list_update_report_message_written.security_type[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.maturity_date[security_list_update_report_message_at] == security_list_update_report_message_written.maturity_date[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.issue_date[security_list_update_report_message_at] == security_list_update_report_message_written.issue_date[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.contract_multiplier[security_list_update_report_message_at] == security_list_update_report_message_written.contract_multiplier[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.li_spre[security_list_update_report_message_at] == security_list_update_report_message_written.li_spre[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.sst_ipre[security_list_update_report_message_at] == security_list_update_report_message_written.sst_ipre[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.li_spost[security_list_update_report_message_at] == security_list_update_report_message_written.li_spost[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.sst_ipost[security_list_update_report_message_at] == security_list_update_report_message_written.sst_ipost[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.liquid_instrument == security_list_update_report_message_written.liquid_instrument);
  assert(security_list_update_report_message_read.admission_requested_by_issuer == security_list_update_report_message_written.admission_requested_by_issuer);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.min_trade_vol[security_list_update_report_message_at] == security_list_update_report_message_written.min_trade_vol[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.round_lot[security_list_update_report_message_at] == security_list_update_report_message_written.round_lot[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> assert(security_list_update_report_message_read.currency[security_list_update_report_message_at] == security_list_update_report_message_written.currency[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.modality_mask_b_4[security_list_update_report_message_at] == security_list_update_report_message_written.modality_mask_b_4[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 80 -> assert(security_list_update_report_message_read.security_description[security_list_update_report_message_at] == security_list_update_report_message_written.security_description[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.trading_obligation == security_list_update_report_message_written.trading_obligation);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 40 -> assert(security_list_update_report_message_read.security_name[security_list_update_report_message_at] == security_list_update_report_message_written.security_name[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.security_status == security_list_update_report_message_written.security_status);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.coupon_payment_date[security_list_update_report_message_at] == security_list_update_report_message_written.coupon_payment_date[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.min_price_increment[security_list_update_report_message_at] == security_list_update_report_message_written.min_price_increment[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.number_of_decimals == security_list_update_report_message_written.number_of_decimals);
  assert(security_list_update_report_message_read.order_number_of_decimals == security_list_update_report_message_written.order_number_of_decimals);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.coupon_rate[security_list_update_report_message_at] == security_list_update_report_message_written.coupon_rate[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> assert(security_list_update_report_message_read.issuer[security_list_update_report_message_at] == security_list_update_report_message_written.issuer[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.trading_scope_b_1 == security_list_update_report_message_written.trading_scope_b_1);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.first_trading_date[security_list_update_report_message_at] == security_list_update_report_message_written.first_trading_date[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.settlement_system == security_list_update_report_message_written.settlement_system);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.maturity[security_list_update_report_message_at] == security_list_update_report_message_written.maturity[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.coupon_periodicity == security_list_update_report_message_written.coupon_periodicity);
  assert(security_list_update_report_message_read.benchmark == security_list_update_report_message_written.benchmark);
  assert(security_list_update_report_message_read.strippable == security_list_update_report_message_written.strippable);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.volume_issued[security_list_update_report_message_at] == security_list_update_report_message_written.volume_issued[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.alive_volume[security_list_update_report_message_at] == security_list_update_report_message_written.alive_volume[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.coupon_type == security_list_update_report_message_written.coupon_type);
  assert(security_list_update_report_message_read.coupon_quotation == security_list_update_report_message_written.coupon_quotation);
  assert(security_list_update_report_message_read.accrued_interest_calculation_procedure == security_list_update_report_message_written.accrued_interest_calculation_procedure);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.next_redemption_date[security_list_update_report_message_at] == security_list_update_report_message_written.next_redemption_date[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> assert(security_list_update_report_message_read.type_of_redemption[security_list_update_report_message_at] == security_list_update_report_message_written.type_of_redemption[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.facial[security_list_update_report_message_at] == security_list_update_report_message_written.facial[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.calculation_method == security_list_update_report_message_written.calculation_method);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.date_last_coupon_was_paid[security_list_update_report_message_at] == security_list_update_report_message_written.date_last_coupon_was_paid[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.bond_seniority[security_list_update_report_message_at] == security_list_update_report_message_written.bond_seniority[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.interest_accrual_date[security_list_update_report_message_at] == security_list_update_report_message_written.interest_accrual_date[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.start_date[security_list_update_report_message_at] == security_list_update_report_message_written.start_date[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.price_type == security_list_update_report_message_written.price_type);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.spread_to_index[security_list_update_report_message_at] == security_list_update_report_message_written.spread_to_index[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.benchmark_curve_points_units[security_list_update_report_message_at] == security_list_update_report_message_written.benchmark_curve_points_units[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.benchmark_curve_points_value == security_list_update_report_message_written.benchmark_curve_points_value);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 25 -> assert(security_list_update_report_message_read.benchmark_security_id[security_list_update_report_message_at] == security_list_update_report_message_written.benchmark_security_id[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.accrued_interest_rate_r_8[security_list_update_report_message_at] == security_list_update_report_message_written.accrued_interest_rate_r_8[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Status Message: 59 bytes --------------------------------------- */

/* Message sent by the server to inform on the status of one security */
typedef SecurityStatusMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte reference_price[8];
  byte security_trading_status;
  byte non_availability_reason;
  byte high_limit_price[8];
  byte low_limit_price[8];
  byte static_range_type;
  byte order_static_range[8];
  byte block_static_range[8]
};

int security_status_message_at;

/* every byte of Security Status Message set to one value */
inline fill_security_status_message(security_status_message_record, security_status_message_value) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.sequence_number[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.transaction_date_and_time[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.reference_price[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.security_trading_status = security_status_message_value;
  security_status_message_record.non_availability_reason = security_status_message_value;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.high_limit_price[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.low_limit_price[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.static_range_type = security_status_message_value;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.order_static_range[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.block_static_range[security_status_message_at] = security_status_message_value; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Status Message set to where it lies, so a field read out of place says so */
inline ramp_security_status_message(security_status_message_record, security_status_message_base) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.sequence_number[security_status_message_at] = (security_status_message_base + 0 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = (security_status_message_base + 4 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.transaction_date_and_time[security_status_message_at] = (security_status_message_base + 8 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.reference_price[security_status_message_at] = (security_status_message_base + 16 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.security_trading_status = (security_status_message_base + 24 + 1) % 256;
  security_status_message_record.non_availability_reason = (security_status_message_base + 25 + 1) % 256;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.high_limit_price[security_status_message_at] = (security_status_message_base + 26 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.low_limit_price[security_status_message_at] = (security_status_message_base + 34 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.static_range_type = (security_status_message_base + 42 + 1) % 256;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.order_static_range[security_status_message_at] = (security_status_message_base + 43 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.block_static_range[security_status_message_at] = (security_status_message_base + 51 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Status Message to the wire, 59 bytes from where the cursor stands */
inline encode_security_status_message(security_status_message_record) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.sequence_number[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> wire[at] = security_status_message_record.security_code[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> wire[at] = security_status_message_record.transaction_date_and_time[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> wire[at] = security_status_message_record.reference_price[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  wire[at] = security_status_message_record.security_trading_status; at = at + 1;
  wire[at] = security_status_message_record.non_availability_reason; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> wire[at] = security_status_message_record.high_limit_price[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> wire[at] = security_status_message_record.low_limit_price[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  wire[at] = security_status_message_record.static_range_type; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> wire[at] = security_status_message_record.order_static_range[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> wire[at] = security_status_message_record.block_static_range[security_status_message_at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Status Message off the wire, 59 bytes from where the cursor stands */
inline decode_security_status_message(security_status_message_record) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.sequence_number[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> security_status_message_record.security_code[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.transaction_date_and_time[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.reference_price[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.security_trading_status = wire[at]; at = at + 1;
  security_status_message_record.non_availability_reason = wire[at]; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.high_limit_price[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.low_limit_price[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_record.static_range_type = wire[at]; at = at + 1;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.order_static_range[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.block_static_range[security_status_message_at] = wire[at]; at = at + 1; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Status Message is what was written, byte for byte */
inline equal_security_status_message(security_status_message_read, security_status_message_written) {
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.sequence_number[security_status_message_at] == security_status_message_written.sequence_number[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 4 -> assert(security_status_message_read.security_code[security_status_message_at] == security_status_message_written.security_code[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> assert(security_status_message_read.transaction_date_and_time[security_status_message_at] == security_status_message_written.transaction_date_and_time[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> assert(security_status_message_read.reference_price[security_status_message_at] == security_status_message_written.reference_price[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  assert(security_status_message_read.security_trading_status == security_status_message_written.security_trading_status);
  assert(security_status_message_read.non_availability_reason == security_status_message_written.non_availability_reason);
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> assert(security_status_message_read.high_limit_price[security_status_message_at] == security_status_message_written.high_limit_price[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> assert(security_status_message_read.low_limit_price[security_status_message_at] == security_status_message_written.low_limit_price[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  assert(security_status_message_read.static_range_type == security_status_message_written.static_range_type);
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> assert(security_status_message_read.order_static_range[security_status_message_at] == security_status_message_written.order_static_range[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> assert(security_status_message_read.block_static_range[security_status_message_at] == security_status_message_written.block_static_range[security_status_message_at]); security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Market Post Transparency Information Top Of Book Message: 78 bytes ---- */

/* Used by the server to communicate trade information related to trades resulting from order matching in channels C/D and E/F. It is also used in channels A/B when the trade is the result of order matching at the end of an auction period (where only top-of-book information is shown) */
typedef TradeMarketPostTransparencyInformationTopOfBookMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte market_segment_id[4];
  byte trading_session_id;
  byte trd_match_id[4];
  byte trade_type;
  byte last_px[8];
  byte last_qty[4];
  byte gross_trade_amt[8];
  byte designation;
  byte market_mechanism;
  byte algo_flag;
  byte alt_last_px[8];
  byte accrued_interest_amt[8];
  byte accrued_interest_rate_p_8[8];
  byte settl_date[4];
  byte transaction_category
};

int trade_market_post_transparency_information_top_of_book_message_at;

/* every byte of Trade Market Post Transparency Information Top Of Book Message set to one value */
inline fill_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_record, trade_market_post_transparency_information_top_of_book_message_value) {
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.sequence_number[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.security_code[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.transaction_date_and_time[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.market_segment_id[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.trading_session_id = trade_market_post_transparency_information_top_of_book_message_value;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.trd_match_id[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.trade_type = trade_market_post_transparency_information_top_of_book_message_value;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.last_px[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.last_qty[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.gross_trade_amt[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.designation = trade_market_post_transparency_information_top_of_book_message_value;
  trade_market_post_transparency_information_top_of_book_message_record.market_mechanism = trade_market_post_transparency_information_top_of_book_message_value;
  trade_market_post_transparency_information_top_of_book_message_record.algo_flag = trade_market_post_transparency_information_top_of_book_message_value;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.alt_last_px[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.accrued_interest_amt[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.accrued_interest_rate_p_8[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.settl_date[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.transaction_category = trade_market_post_transparency_information_top_of_book_message_value;
  skip
}

/* each byte of Trade Market Post Transparency Information Top Of Book Message set to where it lies, so a field read out of place says so */
inline ramp_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_record, trade_market_post_transparency_information_top_of_book_message_base) {
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.sequence_number[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 0 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.security_code[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 4 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.transaction_date_and_time[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 8 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.market_segment_id[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 16 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.trading_session_id = (trade_market_post_transparency_information_top_of_book_message_base + 20 + 1) % 256;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.trd_match_id[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 21 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.trade_type = (trade_market_post_transparency_information_top_of_book_message_base + 25 + 1) % 256;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.last_px[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 26 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.last_qty[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 34 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.gross_trade_amt[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 38 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.designation = (trade_market_post_transparency_information_top_of_book_message_base + 46 + 1) % 256;
  trade_market_post_transparency_information_top_of_book_message_record.market_mechanism = (trade_market_post_transparency_information_top_of_book_message_base + 47 + 1) % 256;
  trade_market_post_transparency_information_top_of_book_message_record.algo_flag = (trade_market_post_transparency_information_top_of_book_message_base + 48 + 1) % 256;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.alt_last_px[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 49 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.accrued_interest_amt[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 57 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.accrued_interest_rate_p_8[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 65 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.settl_date[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 73 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.transaction_category = (trade_market_post_transparency_information_top_of_book_message_base + 77 + 1) % 256;
  skip
}

/* Trade Market Post Transparency Information Top Of Book Message to the wire, 78 bytes from where the cursor stands */
inline encode_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_record) {
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.sequence_number[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.security_code[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.transaction_date_and_time[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.market_segment_id[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_market_post_transparency_information_top_of_book_message_record.trading_session_id; at = at + 1;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.trd_match_id[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_market_post_transparency_information_top_of_book_message_record.trade_type; at = at + 1;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.last_px[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.last_qty[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.gross_trade_amt[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_market_post_transparency_information_top_of_book_message_record.designation; at = at + 1;
  wire[at] = trade_market_post_transparency_information_top_of_book_message_record.market_mechanism; at = at + 1;
  wire[at] = trade_market_post_transparency_information_top_of_book_message_record.algo_flag; at = at + 1;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.alt_last_px[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.accrued_interest_amt[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.accrued_interest_rate_p_8[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.settl_date[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_market_post_transparency_information_top_of_book_message_record.transaction_category; at = at + 1;
  skip
}

/* Trade Market Post Transparency Information Top Of Book Message off the wire, 78 bytes from where the cursor stands */
inline decode_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_record) {
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.sequence_number[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.security_code[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.transaction_date_and_time[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.market_segment_id[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.trading_session_id = wire[at]; at = at + 1;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.trd_match_id[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.trade_type = wire[at]; at = at + 1;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.last_px[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.last_qty[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.gross_trade_amt[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.designation = wire[at]; at = at + 1;
  trade_market_post_transparency_information_top_of_book_message_record.market_mechanism = wire[at]; at = at + 1;
  trade_market_post_transparency_information_top_of_book_message_record.algo_flag = wire[at]; at = at + 1;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.alt_last_px[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.accrued_interest_amt[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> trade_market_post_transparency_information_top_of_book_message_record.accrued_interest_rate_p_8[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.settl_date[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_record.transaction_category = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Market Post Transparency Information Top Of Book Message is what was written, byte for byte */
inline equal_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_read, trade_market_post_transparency_information_top_of_book_message_written) {
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> assert(trade_market_post_transparency_information_top_of_book_message_read.sequence_number[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.sequence_number[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> assert(trade_market_post_transparency_information_top_of_book_message_read.security_code[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.security_code[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> assert(trade_market_post_transparency_information_top_of_book_message_read.transaction_date_and_time[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.transaction_date_and_time[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> assert(trade_market_post_transparency_information_top_of_book_message_read.market_segment_id[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.market_segment_id[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  assert(trade_market_post_transparency_information_top_of_book_message_read.trading_session_id == trade_market_post_transparency_information_top_of_book_message_written.trading_session_id);
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> assert(trade_market_post_transparency_information_top_of_book_message_read.trd_match_id[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.trd_match_id[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  assert(trade_market_post_transparency_information_top_of_book_message_read.trade_type == trade_market_post_transparency_information_top_of_book_message_written.trade_type);
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> assert(trade_market_post_transparency_information_top_of_book_message_read.last_px[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.last_px[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> assert(trade_market_post_transparency_information_top_of_book_message_read.last_qty[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.last_qty[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> assert(trade_market_post_transparency_information_top_of_book_message_read.gross_trade_amt[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.gross_trade_amt[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  assert(trade_market_post_transparency_information_top_of_book_message_read.designation == trade_market_post_transparency_information_top_of_book_message_written.designation);
  assert(trade_market_post_transparency_information_top_of_book_message_read.market_mechanism == trade_market_post_transparency_information_top_of_book_message_written.market_mechanism);
  assert(trade_market_post_transparency_information_top_of_book_message_read.algo_flag == trade_market_post_transparency_information_top_of_book_message_written.algo_flag);
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> assert(trade_market_post_transparency_information_top_of_book_message_read.alt_last_px[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.alt_last_px[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> assert(trade_market_post_transparency_information_top_of_book_message_read.accrued_interest_amt[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.accrued_interest_amt[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 8 -> assert(trade_market_post_transparency_information_top_of_book_message_read.accrued_interest_rate_p_8[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.accrued_interest_rate_p_8[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> assert(trade_market_post_transparency_information_top_of_book_message_read.settl_date[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.settl_date[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  assert(trade_market_post_transparency_information_top_of_book_message_read.transaction_category == trade_market_post_transparency_information_top_of_book_message_written.transaction_category);
  skip
}

/* ---- Trade Trade Amendment Or Cancellation Message: 125 bytes ---------------- */

/* Sent by the server to inform about a trade produced due to any reason other than order matching, also to inform about trades produced due to order matching in a Dark pool. In this message, all fields with the suffix 2 refer to the sell order, and the ones without the suffix refer either to both legs or the buy order */
typedef TradeTradeAmendmentOrCancellationMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte market_segment_id[4];
  byte trading_session_id;
  byte trd_match_id[4];
  byte trade_type;
  byte last_px[8];
  byte last_qty[4];
  byte gross_trade_amt[8];
  byte designation;
  byte market_mechanism;
  byte algo_flag;
  byte alt_last_px[8];
  byte accrued_interest_amt[8];
  byte accrued_interest_rate_p_8[8];
  byte settl_date[4];
  byte transaction_category;
  byte last_change_flag;
  byte benc_rfpt_flag;
  byte trade_price_condition;
  byte pre_trade_transparency_waiver;
  byte deferral_waiver;
  byte post_deferral_publication_type;
  byte publish_date_and_time[8];
  byte trade_date[8];
  byte trade_session_date[4];
  byte settl_date_2[4];
  byte end_cash[8];
  byte amended_trade_type;
  byte exec_ref_id[4];
  byte amended_trade_date[4]
};

int trade_trade_amendment_or_cancellation_message_at;

/* every byte of Trade Trade Amendment Or Cancellation Message set to one value */
inline fill_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_record, trade_trade_amendment_or_cancellation_message_value) {
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.sequence_number[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.security_code[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.transaction_date_and_time[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.market_segment_id[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.trading_session_id = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.trd_match_id[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.trade_type = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.last_px[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.last_qty[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.gross_trade_amt[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.designation = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_record.market_mechanism = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_record.algo_flag = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.alt_last_px[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.accrued_interest_amt[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.accrued_interest_rate_p_8[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.settl_date[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.transaction_category = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_record.last_change_flag = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_record.benc_rfpt_flag = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_record.trade_price_condition = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_record.pre_trade_transparency_waiver = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_record.deferral_waiver = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_record.post_deferral_publication_type = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.publish_date_and_time[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.trade_date[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.trade_session_date[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.settl_date_2[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.end_cash[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.amended_trade_type = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.exec_ref_id[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.amended_trade_date[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Trade Amendment Or Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_record, trade_trade_amendment_or_cancellation_message_base) {
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.sequence_number[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 0 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.security_code[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 4 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.transaction_date_and_time[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 8 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.market_segment_id[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 16 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.trading_session_id = (trade_trade_amendment_or_cancellation_message_base + 20 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.trd_match_id[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 21 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.trade_type = (trade_trade_amendment_or_cancellation_message_base + 25 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.last_px[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 26 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.last_qty[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 34 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.gross_trade_amt[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 38 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.designation = (trade_trade_amendment_or_cancellation_message_base + 46 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.market_mechanism = (trade_trade_amendment_or_cancellation_message_base + 47 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.algo_flag = (trade_trade_amendment_or_cancellation_message_base + 48 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.alt_last_px[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 49 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.accrued_interest_amt[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 57 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.accrued_interest_rate_p_8[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 65 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.settl_date[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 73 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.transaction_category = (trade_trade_amendment_or_cancellation_message_base + 77 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.last_change_flag = (trade_trade_amendment_or_cancellation_message_base + 78 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.benc_rfpt_flag = (trade_trade_amendment_or_cancellation_message_base + 79 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.trade_price_condition = (trade_trade_amendment_or_cancellation_message_base + 80 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.pre_trade_transparency_waiver = (trade_trade_amendment_or_cancellation_message_base + 81 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.deferral_waiver = (trade_trade_amendment_or_cancellation_message_base + 82 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.post_deferral_publication_type = (trade_trade_amendment_or_cancellation_message_base + 83 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.publish_date_and_time[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 84 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.trade_date[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 92 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.trade_session_date[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 100 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.settl_date_2[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 104 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.end_cash[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 108 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.amended_trade_type = (trade_trade_amendment_or_cancellation_message_base + 116 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.exec_ref_id[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 117 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.amended_trade_date[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 121 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Trade Amendment Or Cancellation Message to the wire, 125 bytes from where the cursor stands */
inline encode_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_record) {
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.sequence_number[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.security_code[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.transaction_date_and_time[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.market_segment_id[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.trading_session_id; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.trd_match_id[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.trade_type; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.last_px[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.last_qty[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.gross_trade_amt[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.designation; at = at + 1;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.market_mechanism; at = at + 1;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.algo_flag; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.alt_last_px[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.accrued_interest_amt[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.accrued_interest_rate_p_8[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.settl_date[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.transaction_category; at = at + 1;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.last_change_flag; at = at + 1;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.benc_rfpt_flag; at = at + 1;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.trade_price_condition; at = at + 1;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.pre_trade_transparency_waiver; at = at + 1;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.deferral_waiver; at = at + 1;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.post_deferral_publication_type; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.publish_date_and_time[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.trade_date[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.trade_session_date[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.settl_date_2[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.end_cash[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_trade_amendment_or_cancellation_message_record.amended_trade_type; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.exec_ref_id[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.amended_trade_date[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Trade Amendment Or Cancellation Message off the wire, 125 bytes from where the cursor stands */
inline decode_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_record) {
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.sequence_number[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.security_code[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.transaction_date_and_time[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.market_segment_id[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.trading_session_id = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.trd_match_id[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.trade_type = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.last_px[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.last_qty[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.gross_trade_amt[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.designation = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_record.market_mechanism = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_record.algo_flag = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.alt_last_px[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.accrued_interest_amt[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.accrued_interest_rate_p_8[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.settl_date[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.transaction_category = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_record.last_change_flag = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_record.benc_rfpt_flag = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_record.trade_price_condition = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_record.pre_trade_transparency_waiver = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_record.deferral_waiver = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_record.post_deferral_publication_type = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.publish_date_and_time[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.trade_date[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.trade_session_date[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.settl_date_2[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.end_cash[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.amended_trade_type = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.exec_ref_id[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.amended_trade_date[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Trade Amendment Or Cancellation Message is what was written, byte for byte */
inline equal_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_read, trade_trade_amendment_or_cancellation_message_written) {
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> assert(trade_trade_amendment_or_cancellation_message_read.sequence_number[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.sequence_number[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> assert(trade_trade_amendment_or_cancellation_message_read.security_code[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.security_code[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> assert(trade_trade_amendment_or_cancellation_message_read.transaction_date_and_time[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.transaction_date_and_time[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> assert(trade_trade_amendment_or_cancellation_message_read.market_segment_id[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.market_segment_id[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  assert(trade_trade_amendment_or_cancellation_message_read.trading_session_id == trade_trade_amendment_or_cancellation_message_written.trading_session_id);
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> assert(trade_trade_amendment_or_cancellation_message_read.trd_match_id[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.trd_match_id[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  assert(trade_trade_amendment_or_cancellation_message_read.trade_type == trade_trade_amendment_or_cancellation_message_written.trade_type);
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> assert(trade_trade_amendment_or_cancellation_message_read.last_px[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.last_px[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> assert(trade_trade_amendment_or_cancellation_message_read.last_qty[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.last_qty[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> assert(trade_trade_amendment_or_cancellation_message_read.gross_trade_amt[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.gross_trade_amt[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  assert(trade_trade_amendment_or_cancellation_message_read.designation == trade_trade_amendment_or_cancellation_message_written.designation);
  assert(trade_trade_amendment_or_cancellation_message_read.market_mechanism == trade_trade_amendment_or_cancellation_message_written.market_mechanism);
  assert(trade_trade_amendment_or_cancellation_message_read.algo_flag == trade_trade_amendment_or_cancellation_message_written.algo_flag);
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> assert(trade_trade_amendment_or_cancellation_message_read.alt_last_px[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.alt_last_px[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> assert(trade_trade_amendment_or_cancellation_message_read.accrued_interest_amt[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.accrued_interest_amt[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> assert(trade_trade_amendment_or_cancellation_message_read.accrued_interest_rate_p_8[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.accrued_interest_rate_p_8[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> assert(trade_trade_amendment_or_cancellation_message_read.settl_date[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.settl_date[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  assert(trade_trade_amendment_or_cancellation_message_read.transaction_category == trade_trade_amendment_or_cancellation_message_written.transaction_category);
  assert(trade_trade_amendment_or_cancellation_message_read.last_change_flag == trade_trade_amendment_or_cancellation_message_written.last_change_flag);
  assert(trade_trade_amendment_or_cancellation_message_read.benc_rfpt_flag == trade_trade_amendment_or_cancellation_message_written.benc_rfpt_flag);
  assert(trade_trade_amendment_or_cancellation_message_read.trade_price_condition == trade_trade_amendment_or_cancellation_message_written.trade_price_condition);
  assert(trade_trade_amendment_or_cancellation_message_read.pre_trade_transparency_waiver == trade_trade_amendment_or_cancellation_message_written.pre_trade_transparency_waiver);
  assert(trade_trade_amendment_or_cancellation_message_read.deferral_waiver == trade_trade_amendment_or_cancellation_message_written.deferral_waiver);
  assert(trade_trade_amendment_or_cancellation_message_read.post_deferral_publication_type == trade_trade_amendment_or_cancellation_message_written.post_deferral_publication_type);
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> assert(trade_trade_amendment_or_cancellation_message_read.publish_date_and_time[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.publish_date_and_time[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> assert(trade_trade_amendment_or_cancellation_message_read.trade_date[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.trade_date[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> assert(trade_trade_amendment_or_cancellation_message_read.trade_session_date[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.trade_session_date[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> assert(trade_trade_amendment_or_cancellation_message_read.settl_date_2[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.settl_date_2[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> assert(trade_trade_amendment_or_cancellation_message_read.end_cash[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.end_cash[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  assert(trade_trade_amendment_or_cancellation_message_read.amended_trade_type == trade_trade_amendment_or_cancellation_message_written.amended_trade_type);
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> assert(trade_trade_amendment_or_cancellation_message_read.exec_ref_id[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.exec_ref_id[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> assert(trade_trade_amendment_or_cancellation_message_read.amended_trade_date[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.amended_trade_date[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Indication Of Interest Message: 35 bytes -------------------------------- */

/* Used by the Server to notify an indication of interest on a specific instrument. This functionality is available in Fixed Income and Derivatives */
typedef IndicationOfInterestMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte ioiid[4];
  byte ioi_trans_type;
  byte side;
  byte ioi_qty[4];
  byte ioi_price[8];
  byte trading_session_id
};

int indication_of_interest_message_at;

/* every byte of Indication Of Interest Message set to one value */
inline fill_indication_of_interest_message(indication_of_interest_message_record, indication_of_interest_message_value) {
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.sequence_number[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.security_code[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> indication_of_interest_message_record.transaction_date_and_time[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioiid[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.ioi_trans_type = indication_of_interest_message_value;
  indication_of_interest_message_record.side = indication_of_interest_message_value;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioi_qty[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> indication_of_interest_message_record.ioi_price[indication_of_interest_message_at] = indication_of_interest_message_value; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.trading_session_id = indication_of_interest_message_value;
  skip
}

/* each byte of Indication Of Interest Message set to where it lies, so a field read out of place says so */
inline ramp_indication_of_interest_message(indication_of_interest_message_record, indication_of_interest_message_base) {
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.sequence_number[indication_of_interest_message_at] = (indication_of_interest_message_base + 0 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.security_code[indication_of_interest_message_at] = (indication_of_interest_message_base + 4 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> indication_of_interest_message_record.transaction_date_and_time[indication_of_interest_message_at] = (indication_of_interest_message_base + 8 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioiid[indication_of_interest_message_at] = (indication_of_interest_message_base + 16 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.ioi_trans_type = (indication_of_interest_message_base + 20 + 1) % 256;
  indication_of_interest_message_record.side = (indication_of_interest_message_base + 21 + 1) % 256;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioi_qty[indication_of_interest_message_at] = (indication_of_interest_message_base + 22 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> indication_of_interest_message_record.ioi_price[indication_of_interest_message_at] = (indication_of_interest_message_base + 26 + indication_of_interest_message_at + 1) % 256; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.trading_session_id = (indication_of_interest_message_base + 34 + 1) % 256;
  skip
}

/* Indication Of Interest Message to the wire, 35 bytes from where the cursor stands */
inline encode_indication_of_interest_message(indication_of_interest_message_record) {
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.sequence_number[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.security_code[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> wire[at] = indication_of_interest_message_record.transaction_date_and_time[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.ioiid[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  wire[at] = indication_of_interest_message_record.ioi_trans_type; at = at + 1;
  wire[at] = indication_of_interest_message_record.side; at = at + 1;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> wire[at] = indication_of_interest_message_record.ioi_qty[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> wire[at] = indication_of_interest_message_record.ioi_price[indication_of_interest_message_at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  wire[at] = indication_of_interest_message_record.trading_session_id; at = at + 1;
  skip
}

/* Indication Of Interest Message off the wire, 35 bytes from where the cursor stands */
inline decode_indication_of_interest_message(indication_of_interest_message_record) {
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.sequence_number[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.security_code[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> indication_of_interest_message_record.transaction_date_and_time[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioiid[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.ioi_trans_type = wire[at]; at = at + 1;
  indication_of_interest_message_record.side = wire[at]; at = at + 1;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> indication_of_interest_message_record.ioi_qty[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> indication_of_interest_message_record.ioi_price[indication_of_interest_message_at] = wire[at]; at = at + 1; indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_record.trading_session_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Indication Of Interest Message is what was written, byte for byte */
inline equal_indication_of_interest_message(indication_of_interest_message_read, indication_of_interest_message_written) {
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.sequence_number[indication_of_interest_message_at] == indication_of_interest_message_written.sequence_number[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.security_code[indication_of_interest_message_at] == indication_of_interest_message_written.security_code[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> assert(indication_of_interest_message_read.transaction_date_and_time[indication_of_interest_message_at] == indication_of_interest_message_written.transaction_date_and_time[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.ioiid[indication_of_interest_message_at] == indication_of_interest_message_written.ioiid[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  assert(indication_of_interest_message_read.ioi_trans_type == indication_of_interest_message_written.ioi_trans_type);
  assert(indication_of_interest_message_read.side == indication_of_interest_message_written.side);
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 4 -> assert(indication_of_interest_message_read.ioi_qty[indication_of_interest_message_at] == indication_of_interest_message_written.ioi_qty[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  indication_of_interest_message_at = 0;
  do
  :: indication_of_interest_message_at < 8 -> assert(indication_of_interest_message_read.ioi_price[indication_of_interest_message_at] == indication_of_interest_message_written.ioi_price[indication_of_interest_message_at]); indication_of_interest_message_at = indication_of_interest_message_at + 1
  :: else -> break
  od;
  assert(indication_of_interest_message_read.trading_session_id == indication_of_interest_message_written.trading_session_id);
  skip
}

/* ---- Rfq Market Pre Transparency Information Message: 189 bytes -------------- */

/* Used by the server to communicate price information about RFQs. The contents of the RFQID field match those of the field IOIID in the corresponding Indication of Interest message */
typedef RfqMarketPreTransparencyInformationMessage {
  byte sequence_number[4];
  byte rfqid[4];
  byte trading_session_id;
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte mid_buy_price[8];
  byte mid_buy_volume[4];
  byte buy_rf_qs_number[2];
  byte mid_sell_price[8];
  byte mid_sell_volume[4];
  byte sell_rf_qs_number[2];
  byte bid_orders_1[2];
  byte bid_size_1[4];
  byte bid_px_1[8];
  byte ask_orders_1[2];
  byte ask_size_1[4];
  byte ask_px_1[8];
  byte bid_orders_2[2];
  byte bid_size_2[4];
  byte bid_px_2[8];
  byte ask_orders_2[2];
  byte ask_size_2[4];
  byte ask_px_2[8];
  byte bid_orders_3[2];
  byte bid_size_3[4];
  byte bid_px_3[8];
  byte ask_orders_3[2];
  byte ask_size_3[4];
  byte ask_px_3[8];
  byte bid_orders_4[2];
  byte bid_size_4[4];
  byte bid_px_4[8];
  byte ask_orders_4[2];
  byte ask_size_4[4];
  byte ask_px_4[8];
  byte bid_orders_5[2];
  byte bid_size_5[4];
  byte bid_px_5[8];
  byte ask_orders_5[2];
  byte ask_size_5[4];
  byte ask_px_5[8]
};

int rfq_market_pre_transparency_information_message_at;

/* every byte of Rfq Market Pre Transparency Information Message set to one value */
inline fill_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_record, rfq_market_pre_transparency_information_message_value) {
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.sequence_number[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.rfqid[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_record.trading_session_id = rfq_market_pre_transparency_information_message_value;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.security_code[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.transaction_date_and_time[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.mid_buy_price[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.mid_buy_volume[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.buy_rf_qs_number[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.mid_sell_price[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.mid_sell_volume[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.sell_rf_qs_number[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_1[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_1[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_1[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_1[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_1[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_1[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_2[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_2[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_2[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_2[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_2[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_2[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_3[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_3[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_3[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_3[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_3[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_3[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_4[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_4[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_4[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_4[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_4[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_4[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_5[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_5[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_5[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_5[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_5[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_5[rfq_market_pre_transparency_information_message_at] = rfq_market_pre_transparency_information_message_value; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Rfq Market Pre Transparency Information Message set to where it lies, so a field read out of place says so */
inline ramp_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_record, rfq_market_pre_transparency_information_message_base) {
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.sequence_number[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 0 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.rfqid[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 4 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_record.trading_session_id = (rfq_market_pre_transparency_information_message_base + 8 + 1) % 256;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.security_code[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 9 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.transaction_date_and_time[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 13 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.mid_buy_price[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 21 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.mid_buy_volume[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 29 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.buy_rf_qs_number[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 33 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.mid_sell_price[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 35 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.mid_sell_volume[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 43 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.sell_rf_qs_number[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 47 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_1[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 49 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_1[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 51 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_1[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 55 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_1[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 63 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_1[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 65 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_1[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 69 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_2[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 77 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_2[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 79 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_2[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 83 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_2[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 91 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_2[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 93 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_2[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 97 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_3[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 105 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_3[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 107 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_3[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 111 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_3[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 119 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_3[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 121 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_3[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 125 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_4[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 133 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_4[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 135 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_4[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 139 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_4[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 147 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_4[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 149 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_4[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 153 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_5[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 161 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_5[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 163 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_5[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 167 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_5[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 175 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_5[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 177 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_5[rfq_market_pre_transparency_information_message_at] = (rfq_market_pre_transparency_information_message_base + 181 + rfq_market_pre_transparency_information_message_at + 1) % 256; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Rfq Market Pre Transparency Information Message to the wire, 189 bytes from where the cursor stands */
inline encode_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_record) {
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.sequence_number[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.rfqid[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  wire[at] = rfq_market_pre_transparency_information_message_record.trading_session_id; at = at + 1;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.security_code[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.transaction_date_and_time[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.mid_buy_price[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.mid_buy_volume[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.buy_rf_qs_number[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.mid_sell_price[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.mid_sell_volume[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.sell_rf_qs_number[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_orders_1[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_size_1[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_px_1[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_orders_1[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_size_1[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_px_1[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_orders_2[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_size_2[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_px_2[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_orders_2[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_size_2[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_px_2[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_orders_3[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_size_3[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_px_3[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_orders_3[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_size_3[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_px_3[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_orders_4[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_size_4[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_px_4[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_orders_4[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_size_4[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_px_4[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_orders_5[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_size_5[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.bid_px_5[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_orders_5[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_size_5[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> wire[at] = rfq_market_pre_transparency_information_message_record.ask_px_5[rfq_market_pre_transparency_information_message_at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Rfq Market Pre Transparency Information Message off the wire, 189 bytes from where the cursor stands */
inline decode_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_record) {
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.sequence_number[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.rfqid[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_record.trading_session_id = wire[at]; at = at + 1;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.security_code[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.transaction_date_and_time[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.mid_buy_price[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.mid_buy_volume[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.buy_rf_qs_number[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.mid_sell_price[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.mid_sell_volume[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.sell_rf_qs_number[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_1[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_1[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_1[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_1[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_1[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_1[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_2[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_2[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_2[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_2[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_2[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_2[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_3[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_3[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_3[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_3[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_3[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_3[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_4[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_4[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_4[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_4[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_4[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_4[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.bid_orders_5[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.bid_size_5[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.bid_px_5[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> rfq_market_pre_transparency_information_message_record.ask_orders_5[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> rfq_market_pre_transparency_information_message_record.ask_size_5[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> rfq_market_pre_transparency_information_message_record.ask_px_5[rfq_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Rfq Market Pre Transparency Information Message is what was written, byte for byte */
inline equal_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_read, rfq_market_pre_transparency_information_message_written) {
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.sequence_number[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.sequence_number[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.rfqid[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.rfqid[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  assert(rfq_market_pre_transparency_information_message_read.trading_session_id == rfq_market_pre_transparency_information_message_written.trading_session_id);
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.security_code[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.security_code[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.transaction_date_and_time[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.transaction_date_and_time[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.mid_buy_price[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.mid_buy_price[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.mid_buy_volume[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.mid_buy_volume[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.buy_rf_qs_number[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.buy_rf_qs_number[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.mid_sell_price[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.mid_sell_price[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.mid_sell_volume[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.mid_sell_volume[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.sell_rf_qs_number[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.sell_rf_qs_number[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.bid_orders_1[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_orders_1[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.bid_size_1[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_size_1[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.bid_px_1[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_px_1[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.ask_orders_1[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_orders_1[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.ask_size_1[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_size_1[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.ask_px_1[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_px_1[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.bid_orders_2[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_orders_2[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.bid_size_2[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_size_2[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.bid_px_2[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_px_2[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.ask_orders_2[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_orders_2[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.ask_size_2[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_size_2[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.ask_px_2[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_px_2[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.bid_orders_3[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_orders_3[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.bid_size_3[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_size_3[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.bid_px_3[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_px_3[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.ask_orders_3[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_orders_3[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.ask_size_3[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_size_3[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.ask_px_3[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_px_3[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.bid_orders_4[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_orders_4[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.bid_size_4[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_size_4[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.bid_px_4[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_px_4[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.ask_orders_4[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_orders_4[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.ask_size_4[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_size_4[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.ask_px_4[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_px_4[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.bid_orders_5[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_orders_5[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.bid_size_5[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_size_5[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.bid_px_5[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.bid_px_5[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 2 -> assert(rfq_market_pre_transparency_information_message_read.ask_orders_5[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_orders_5[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 4 -> assert(rfq_market_pre_transparency_information_message_read.ask_size_5[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_size_5[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  rfq_market_pre_transparency_information_message_at = 0;
  do
  :: rfq_market_pre_transparency_information_message_at < 8 -> assert(rfq_market_pre_transparency_information_message_read.ask_px_5[rfq_market_pre_transparency_information_message_at] == rfq_market_pre_transparency_information_message_written.ask_px_5[rfq_market_pre_transparency_information_message_at]); rfq_market_pre_transparency_information_message_at = rfq_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Top Of Book Message: 60 bytes ------------------------------------------- */

/* Used by the UDP Servers to communicate Top-of-book price information during auctions. When there is an indicative match price, the fields BidPx1 and AskPx1 will have the same value */
typedef TopOfBookMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte bid_orders_1[2];
  byte bid_size_1[4];
  byte bid_px_1[8];
  byte alt_bid_px_1[8];
  byte ask_orders_1[2];
  byte ask_size_1[4];
  byte ask_px_1[8];
  byte alt_sell_px_1[8]
};

int top_of_book_message_at;

/* every byte of Top Of Book Message set to one value */
inline fill_top_of_book_message(top_of_book_message_record, top_of_book_message_value) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.sequence_number[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.security_code[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.transaction_date_and_time[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 2 -> top_of_book_message_record.bid_orders_1[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.bid_size_1[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.bid_px_1[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.alt_bid_px_1[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 2 -> top_of_book_message_record.ask_orders_1[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.ask_size_1[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.ask_px_1[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.alt_sell_px_1[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Top Of Book Message set to where it lies, so a field read out of place says so */
inline ramp_top_of_book_message(top_of_book_message_record, top_of_book_message_base) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.sequence_number[top_of_book_message_at] = (top_of_book_message_base + 0 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.security_code[top_of_book_message_at] = (top_of_book_message_base + 4 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.transaction_date_and_time[top_of_book_message_at] = (top_of_book_message_base + 8 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 2 -> top_of_book_message_record.bid_orders_1[top_of_book_message_at] = (top_of_book_message_base + 16 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.bid_size_1[top_of_book_message_at] = (top_of_book_message_base + 18 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.bid_px_1[top_of_book_message_at] = (top_of_book_message_base + 22 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.alt_bid_px_1[top_of_book_message_at] = (top_of_book_message_base + 30 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 2 -> top_of_book_message_record.ask_orders_1[top_of_book_message_at] = (top_of_book_message_base + 38 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.ask_size_1[top_of_book_message_at] = (top_of_book_message_base + 40 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.ask_px_1[top_of_book_message_at] = (top_of_book_message_base + 44 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.alt_sell_px_1[top_of_book_message_at] = (top_of_book_message_base + 52 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Top Of Book Message to the wire, 60 bytes from where the cursor stands */
inline encode_top_of_book_message(top_of_book_message_record) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.sequence_number[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.security_code[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.transaction_date_and_time[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 2 -> wire[at] = top_of_book_message_record.bid_orders_1[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.bid_size_1[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.bid_px_1[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.alt_bid_px_1[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 2 -> wire[at] = top_of_book_message_record.ask_orders_1[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.ask_size_1[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.ask_px_1[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.alt_sell_px_1[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Top Of Book Message off the wire, 60 bytes from where the cursor stands */
inline decode_top_of_book_message(top_of_book_message_record) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.sequence_number[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.security_code[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.transaction_date_and_time[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 2 -> top_of_book_message_record.bid_orders_1[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.bid_size_1[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.bid_px_1[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.alt_bid_px_1[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 2 -> top_of_book_message_record.ask_orders_1[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.ask_size_1[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.ask_px_1[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.alt_sell_px_1[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Top Of Book Message is what was written, byte for byte */
inline equal_top_of_book_message(top_of_book_message_read, top_of_book_message_written) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.sequence_number[top_of_book_message_at] == top_of_book_message_written.sequence_number[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.security_code[top_of_book_message_at] == top_of_book_message_written.security_code[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.transaction_date_and_time[top_of_book_message_at] == top_of_book_message_written.transaction_date_and_time[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 2 -> assert(top_of_book_message_read.bid_orders_1[top_of_book_message_at] == top_of_book_message_written.bid_orders_1[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.bid_size_1[top_of_book_message_at] == top_of_book_message_written.bid_size_1[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.bid_px_1[top_of_book_message_at] == top_of_book_message_written.bid_px_1[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.alt_bid_px_1[top_of_book_message_at] == top_of_book_message_written.alt_bid_px_1[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 2 -> assert(top_of_book_message_read.ask_orders_1[top_of_book_message_at] == top_of_book_message_written.ask_orders_1[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.ask_size_1[top_of_book_message_at] == top_of_book_message_written.ask_size_1[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.ask_px_1[top_of_book_message_at] == top_of_book_message_written.ask_px_1[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.alt_sell_px_1[top_of_book_message_at] == top_of_book_message_written.alt_sell_px_1[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
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
    assert(at == 3);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 3);
    equal_message_header(message_header_got, message_header_sent)
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
    assert(at == 26);
    at = 0;
    decode_logon_response_message(logon_response_message_got);
    assert(at == 26);
    equal_logon_response_message(logon_response_message_got, logon_response_message_sent)
  }
}

/* Logout Response Message: encoded, read back, and compared */
proctype check_logout_response_message() {
  LogoutResponseMessage logout_response_message_sent;
  LogoutResponseMessage logout_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logout_response_message(logout_response_message_sent, 0)
  :: pattern == 1 -> fill_logout_response_message(logout_response_message_sent, 32)
  :: pattern == 2 -> fill_logout_response_message(logout_response_message_sent, 255)
  :: else -> ramp_logout_response_message(logout_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logout_response_message(logout_response_message_sent);
    assert(at == 5);
    at = 0;
    decode_logout_response_message(logout_response_message_got);
    assert(at == 5);
    equal_logout_response_message(logout_response_message_got, logout_response_message_sent)
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
    assert(at == 4);
    at = 0;
    decode_heartbeat_message(heartbeat_message_got);
    assert(at == 4);
    equal_heartbeat_message(heartbeat_message_got, heartbeat_message_sent)
  }
}

/* Network Status Message: encoded, read back, and compared */
proctype check_network_status_message() {
  NetworkStatusMessage network_status_message_sent;
  NetworkStatusMessage network_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_network_status_message(network_status_message_sent, 0)
  :: pattern == 1 -> fill_network_status_message(network_status_message_sent, 32)
  :: pattern == 2 -> fill_network_status_message(network_status_message_sent, 255)
  :: else -> ramp_network_status_message(network_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_network_status_message(network_status_message_sent);
    assert(at == 5);
    at = 0;
    decode_network_status_message(network_status_message_got);
    assert(at == 5);
    equal_network_status_message(network_status_message_got, network_status_message_sent)
  }
}

/* Trading Session Status Message: encoded, read back, and compared */
proctype check_trading_session_status_message() {
  TradingSessionStatusMessage trading_session_status_message_sent;
  TradingSessionStatusMessage trading_session_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_session_status_message(trading_session_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_session_status_message(trading_session_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_session_status_message(trading_session_status_message_sent, 255)
  :: else -> ramp_trading_session_status_message(trading_session_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_session_status_message(trading_session_status_message_sent);
    assert(at == 15);
    at = 0;
    decode_trading_session_status_message(trading_session_status_message_got);
    assert(at == 15);
    equal_trading_session_status_message(trading_session_status_message_got, trading_session_status_message_sent)
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
    assert(at == 82);
    at = 0;
    decode_news_message(news_message_got);
    assert(at == 82);
    equal_news_message(news_message_got, news_message_sent)
  }
}

/* Security List Cancellation Report Message: encoded, read back, and compared */
proctype check_security_list_cancellation_report_message() {
  SecurityListCancellationReportMessage security_list_cancellation_report_message_sent;
  SecurityListCancellationReportMessage security_list_cancellation_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_list_cancellation_report_message(security_list_cancellation_report_message_sent, 0)
  :: pattern == 1 -> fill_security_list_cancellation_report_message(security_list_cancellation_report_message_sent, 32)
  :: pattern == 2 -> fill_security_list_cancellation_report_message(security_list_cancellation_report_message_sent, 255)
  :: else -> ramp_security_list_cancellation_report_message(security_list_cancellation_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_list_cancellation_report_message(security_list_cancellation_report_message_sent);
    assert(at == 50);
    at = 0;
    decode_security_list_cancellation_report_message(security_list_cancellation_report_message_got);
    assert(at == 50);
    equal_security_list_cancellation_report_message(security_list_cancellation_report_message_got, security_list_cancellation_report_message_sent)
  }
}

/* Security List Message: encoded, read back, and compared */
proctype check_security_list_message() {
  SecurityListMessage security_list_message_sent;
  SecurityListMessage security_list_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_list_message(security_list_message_sent, 0)
  :: pattern == 1 -> fill_security_list_message(security_list_message_sent, 32)
  :: pattern == 2 -> fill_security_list_message(security_list_message_sent, 255)
  :: else -> ramp_security_list_message(security_list_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_list_message(security_list_message_sent);
    assert(at == 450);
    at = 0;
    decode_security_list_message(security_list_message_got);
    assert(at == 450);
    equal_security_list_message(security_list_message_got, security_list_message_sent)
  }
}

/* Security List Update Report Message: encoded, read back, and compared */
proctype check_security_list_update_report_message() {
  SecurityListUpdateReportMessage security_list_update_report_message_sent;
  SecurityListUpdateReportMessage security_list_update_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_list_update_report_message(security_list_update_report_message_sent, 0)
  :: pattern == 1 -> fill_security_list_update_report_message(security_list_update_report_message_sent, 32)
  :: pattern == 2 -> fill_security_list_update_report_message(security_list_update_report_message_sent, 255)
  :: else -> ramp_security_list_update_report_message(security_list_update_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_list_update_report_message(security_list_update_report_message_sent);
    assert(at == 450);
    at = 0;
    decode_security_list_update_report_message(security_list_update_report_message_got);
    assert(at == 450);
    equal_security_list_update_report_message(security_list_update_report_message_got, security_list_update_report_message_sent)
  }
}

/* Security Status Message: encoded, read back, and compared */
proctype check_security_status_message() {
  SecurityStatusMessage security_status_message_sent;
  SecurityStatusMessage security_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_status_message(security_status_message_sent, 0)
  :: pattern == 1 -> fill_security_status_message(security_status_message_sent, 32)
  :: pattern == 2 -> fill_security_status_message(security_status_message_sent, 255)
  :: else -> ramp_security_status_message(security_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_status_message(security_status_message_sent);
    assert(at == 59);
    at = 0;
    decode_security_status_message(security_status_message_got);
    assert(at == 59);
    equal_security_status_message(security_status_message_got, security_status_message_sent)
  }
}

/* Trade Market Post Transparency Information Top Of Book Message: encoded, read back, and compared */
proctype check_trade_market_post_transparency_information_top_of_book_message() {
  TradeMarketPostTransparencyInformationTopOfBookMessage trade_market_post_transparency_information_top_of_book_message_sent;
  TradeMarketPostTransparencyInformationTopOfBookMessage trade_market_post_transparency_information_top_of_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_sent, 0)
  :: pattern == 1 -> fill_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_sent, 32)
  :: pattern == 2 -> fill_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_sent, 255)
  :: else -> ramp_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_sent);
    assert(at == 78);
    at = 0;
    decode_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_got);
    assert(at == 78);
    equal_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_got, trade_market_post_transparency_information_top_of_book_message_sent)
  }
}

/* Trade Trade Amendment Or Cancellation Message: encoded, read back, and compared */
proctype check_trade_trade_amendment_or_cancellation_message() {
  TradeTradeAmendmentOrCancellationMessage trade_trade_amendment_or_cancellation_message_sent;
  TradeTradeAmendmentOrCancellationMessage trade_trade_amendment_or_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_sent, 255)
  :: else -> ramp_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_sent);
    assert(at == 125);
    at = 0;
    decode_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_got);
    assert(at == 125);
    equal_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_got, trade_trade_amendment_or_cancellation_message_sent)
  }
}

/* Indication Of Interest Message: encoded, read back, and compared */
proctype check_indication_of_interest_message() {
  IndicationOfInterestMessage indication_of_interest_message_sent;
  IndicationOfInterestMessage indication_of_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_indication_of_interest_message(indication_of_interest_message_sent, 0)
  :: pattern == 1 -> fill_indication_of_interest_message(indication_of_interest_message_sent, 32)
  :: pattern == 2 -> fill_indication_of_interest_message(indication_of_interest_message_sent, 255)
  :: else -> ramp_indication_of_interest_message(indication_of_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_indication_of_interest_message(indication_of_interest_message_sent);
    assert(at == 35);
    at = 0;
    decode_indication_of_interest_message(indication_of_interest_message_got);
    assert(at == 35);
    equal_indication_of_interest_message(indication_of_interest_message_got, indication_of_interest_message_sent)
  }
}

/* Rfq Market Pre Transparency Information Message: encoded, read back, and compared */
proctype check_rfq_market_pre_transparency_information_message() {
  RfqMarketPreTransparencyInformationMessage rfq_market_pre_transparency_information_message_sent;
  RfqMarketPreTransparencyInformationMessage rfq_market_pre_transparency_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_sent, 0)
  :: pattern == 1 -> fill_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_sent, 32)
  :: pattern == 2 -> fill_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_sent, 255)
  :: else -> ramp_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_sent);
    assert(at == 189);
    at = 0;
    decode_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_got);
    assert(at == 189);
    equal_rfq_market_pre_transparency_information_message(rfq_market_pre_transparency_information_message_got, rfq_market_pre_transparency_information_message_sent)
  }
}

/* Top Of Book Message: encoded, read back, and compared */
proctype check_top_of_book_message() {
  TopOfBookMessage top_of_book_message_sent;
  TopOfBookMessage top_of_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_of_book_message(top_of_book_message_sent, 0)
  :: pattern == 1 -> fill_top_of_book_message(top_of_book_message_sent, 32)
  :: pattern == 2 -> fill_top_of_book_message(top_of_book_message_sent, 255)
  :: else -> ramp_top_of_book_message(top_of_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_of_book_message(top_of_book_message_sent);
    assert(at == 60);
    at = 0;
    decode_top_of_book_message(top_of_book_message_got);
    assert(at == 60);
    equal_top_of_book_message(top_of_book_message_got, top_of_book_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_logon_response_message()
  :: run check_logout_response_message()
  :: run check_heartbeat_message()
  :: run check_network_status_message()
  :: run check_trading_session_status_message()
  :: run check_news_message()
  :: run check_security_list_cancellation_report_message()
  :: run check_security_list_message()
  :: run check_security_list_update_report_message()
  :: run check_security_status_message()
  :: run check_trade_market_post_transparency_information_top_of_book_message()
  :: run check_trade_trade_amendment_or_cancellation_message()
  :: run check_indication_of_interest_message()
  :: run check_rfq_market_pre_transparency_information_message()
  :: run check_top_of_book_message()
  fi
}
