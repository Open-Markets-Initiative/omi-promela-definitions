/*
 * Bolsas y Mercados Españoles MEFF Replay
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
#define WIRE 713

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

/* ---- Logon Message: 53 bytes ------------------------------------------------- */

/* The Logon message is used to start a session by the client application */
typedef LogonMessage {
  byte username[7];
  byte password[10];
  byte software_name[25];
  byte expected_sequence_number[4];
  byte subscriptions;
  byte protocol_version[6]
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 7 -> logon_message_record.username[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 10 -> logon_message_record.password[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.software_name[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.expected_sequence_number[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.subscriptions = logon_message_value;
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> logon_message_record.protocol_version[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Message set to where it lies, so a field read out of place says so */
inline ramp_logon_message(logon_message_record, logon_message_base) {
  logon_message_at = 0;
  do
  :: logon_message_at < 7 -> logon_message_record.username[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 10 -> logon_message_record.password[logon_message_at] = (logon_message_base + 7 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.software_name[logon_message_at] = (logon_message_base + 17 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.expected_sequence_number[logon_message_at] = (logon_message_base + 42 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.subscriptions = (logon_message_base + 46 + 1) % 256;
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> logon_message_record.protocol_version[logon_message_at] = (logon_message_base + 47 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message to the wire, 53 bytes from where the cursor stands */
inline encode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 7 -> wire[at] = logon_message_record.username[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 10 -> wire[at] = logon_message_record.password[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> wire[at] = logon_message_record.software_name[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> wire[at] = logon_message_record.expected_sequence_number[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_message_record.subscriptions; at = at + 1;
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> wire[at] = logon_message_record.protocol_version[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message off the wire, 53 bytes from where the cursor stands */
inline decode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 7 -> logon_message_record.username[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 10 -> logon_message_record.password[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> logon_message_record.software_name[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> logon_message_record.expected_sequence_number[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.subscriptions = wire[at]; at = at + 1;
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> logon_message_record.protocol_version[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Message is what was written, byte for byte */
inline equal_logon_message(logon_message_read, logon_message_written) {
  logon_message_at = 0;
  do
  :: logon_message_at < 7 -> assert(logon_message_read.username[logon_message_at] == logon_message_written.username[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 10 -> assert(logon_message_read.password[logon_message_at] == logon_message_written.password[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 25 -> assert(logon_message_read.software_name[logon_message_at] == logon_message_written.software_name[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 4 -> assert(logon_message_read.expected_sequence_number[logon_message_at] == logon_message_written.expected_sequence_number[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  assert(logon_message_read.subscriptions == logon_message_written.subscriptions);
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> assert(logon_message_read.protocol_version[logon_message_at] == logon_message_written.protocol_version[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reject Message: 70 bytes ------------------------------------------------ */

/* It may be sent by the server to inform about the rejection of an unsupported or syntactically incorrect message. In the Reject message, the SequenceNumber of the previously received message will be repeated */
typedef RejectMessage {
  byte sequence_number[4];
  byte session_reject_reason;
  byte text[58];
  byte msg_rejected_reference[7]
};

int reject_message_at;

/* every byte of Reject Message set to one value */
inline fill_reject_message(reject_message_record, reject_message_value) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.sequence_number[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.session_reject_reason = reject_message_value;
  reject_message_at = 0;
  do
  :: reject_message_at < 58 -> reject_message_record.text[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 7 -> reject_message_record.msg_rejected_reference[reject_message_at] = reject_message_value; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reject Message set to where it lies, so a field read out of place says so */
inline ramp_reject_message(reject_message_record, reject_message_base) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.sequence_number[reject_message_at] = (reject_message_base + 0 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.session_reject_reason = (reject_message_base + 4 + 1) % 256;
  reject_message_at = 0;
  do
  :: reject_message_at < 58 -> reject_message_record.text[reject_message_at] = (reject_message_base + 5 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 7 -> reject_message_record.msg_rejected_reference[reject_message_at] = (reject_message_base + 63 + reject_message_at + 1) % 256; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reject Message to the wire, 70 bytes from where the cursor stands */
inline encode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> wire[at] = reject_message_record.sequence_number[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  wire[at] = reject_message_record.session_reject_reason; at = at + 1;
  reject_message_at = 0;
  do
  :: reject_message_at < 58 -> wire[at] = reject_message_record.text[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 7 -> wire[at] = reject_message_record.msg_rejected_reference[reject_message_at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reject Message off the wire, 70 bytes from where the cursor stands */
inline decode_reject_message(reject_message_record) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> reject_message_record.sequence_number[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_record.session_reject_reason = wire[at]; at = at + 1;
  reject_message_at = 0;
  do
  :: reject_message_at < 58 -> reject_message_record.text[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 7 -> reject_message_record.msg_rejected_reference[reject_message_at] = wire[at]; at = at + 1; reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reject Message is what was written, byte for byte */
inline equal_reject_message(reject_message_read, reject_message_written) {
  reject_message_at = 0;
  do
  :: reject_message_at < 4 -> assert(reject_message_read.sequence_number[reject_message_at] == reject_message_written.sequence_number[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  assert(reject_message_read.session_reject_reason == reject_message_written.session_reject_reason);
  reject_message_at = 0;
  do
  :: reject_message_at < 58 -> assert(reject_message_read.text[reject_message_at] == reject_message_written.text[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  reject_message_at = 0;
  do
  :: reject_message_at < 7 -> assert(reject_message_read.msg_rejected_reference[reject_message_at] == reject_message_written.msg_rejected_reference[reject_message_at]); reject_message_at = reject_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replay Request Message: 12 bytes ---------------------------------------- */

/* Message sent by the client application to request the replay of some specific UDP messages through the TCP Replay channel */
typedef ReplayRequestMessage {
  byte sequence_number_from[4];
  byte sequence_number_to[4];
  byte request_id[4]
};

int replay_request_message_at;

/* every byte of Replay Request Message set to one value */
inline fill_replay_request_message(replay_request_message_record, replay_request_message_value) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.sequence_number_from[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.sequence_number_to[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.request_id[replay_request_message_at] = replay_request_message_value; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Replay Request Message set to where it lies, so a field read out of place says so */
inline ramp_replay_request_message(replay_request_message_record, replay_request_message_base) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.sequence_number_from[replay_request_message_at] = (replay_request_message_base + 0 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.sequence_number_to[replay_request_message_at] = (replay_request_message_base + 4 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.request_id[replay_request_message_at] = (replay_request_message_base + 8 + replay_request_message_at + 1) % 256; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Message to the wire, 12 bytes from where the cursor stands */
inline encode_replay_request_message(replay_request_message_record) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> wire[at] = replay_request_message_record.sequence_number_from[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> wire[at] = replay_request_message_record.sequence_number_to[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> wire[at] = replay_request_message_record.request_id[replay_request_message_at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Replay Request Message off the wire, 12 bytes from where the cursor stands */
inline decode_replay_request_message(replay_request_message_record) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.sequence_number_from[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.sequence_number_to[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> replay_request_message_record.request_id[replay_request_message_at] = wire[at]; at = at + 1; replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Replay Request Message is what was written, byte for byte */
inline equal_replay_request_message(replay_request_message_read, replay_request_message_written) {
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> assert(replay_request_message_read.sequence_number_from[replay_request_message_at] == replay_request_message_written.sequence_number_from[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> assert(replay_request_message_read.sequence_number_to[replay_request_message_at] == replay_request_message_written.sequence_number_to[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  replay_request_message_at = 0;
  do
  :: replay_request_message_at < 4 -> assert(replay_request_message_read.request_id[replay_request_message_at] == replay_request_message_written.request_id[replay_request_message_at]); replay_request_message_at = replay_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Replay Request Ack Nack Message: 17 bytes ------------------------------- */

/* Message sent by the Replay Server as an inmediate answer to a Replay Request (Msg Type = 0x09). In this message the sequence number will always be 0 */
typedef ReplayRequestAckNackMessage {
  byte sequence_number[4];
  byte sequence_number_from[4];
  byte sequence_number_to[4];
  byte request_id[4];
  byte status
};

int replay_request_ack_nack_message_at;

/* every byte of Replay Request Ack Nack Message set to one value */
inline fill_replay_request_ack_nack_message(replay_request_ack_nack_message_record, replay_request_ack_nack_message_value) {
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.sequence_number[replay_request_ack_nack_message_at] = replay_request_ack_nack_message_value; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.sequence_number_from[replay_request_ack_nack_message_at] = replay_request_ack_nack_message_value; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.sequence_number_to[replay_request_ack_nack_message_at] = replay_request_ack_nack_message_value; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.request_id[replay_request_ack_nack_message_at] = replay_request_ack_nack_message_value; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_record.status = replay_request_ack_nack_message_value;
  skip
}

/* each byte of Replay Request Ack Nack Message set to where it lies, so a field read out of place says so */
inline ramp_replay_request_ack_nack_message(replay_request_ack_nack_message_record, replay_request_ack_nack_message_base) {
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.sequence_number[replay_request_ack_nack_message_at] = (replay_request_ack_nack_message_base + 0 + replay_request_ack_nack_message_at + 1) % 256; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.sequence_number_from[replay_request_ack_nack_message_at] = (replay_request_ack_nack_message_base + 4 + replay_request_ack_nack_message_at + 1) % 256; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.sequence_number_to[replay_request_ack_nack_message_at] = (replay_request_ack_nack_message_base + 8 + replay_request_ack_nack_message_at + 1) % 256; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.request_id[replay_request_ack_nack_message_at] = (replay_request_ack_nack_message_base + 12 + replay_request_ack_nack_message_at + 1) % 256; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_record.status = (replay_request_ack_nack_message_base + 16 + 1) % 256;
  skip
}

/* Replay Request Ack Nack Message to the wire, 17 bytes from where the cursor stands */
inline encode_replay_request_ack_nack_message(replay_request_ack_nack_message_record) {
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> wire[at] = replay_request_ack_nack_message_record.sequence_number[replay_request_ack_nack_message_at]; at = at + 1; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> wire[at] = replay_request_ack_nack_message_record.sequence_number_from[replay_request_ack_nack_message_at]; at = at + 1; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> wire[at] = replay_request_ack_nack_message_record.sequence_number_to[replay_request_ack_nack_message_at]; at = at + 1; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> wire[at] = replay_request_ack_nack_message_record.request_id[replay_request_ack_nack_message_at]; at = at + 1; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  wire[at] = replay_request_ack_nack_message_record.status; at = at + 1;
  skip
}

/* Replay Request Ack Nack Message off the wire, 17 bytes from where the cursor stands */
inline decode_replay_request_ack_nack_message(replay_request_ack_nack_message_record) {
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.sequence_number[replay_request_ack_nack_message_at] = wire[at]; at = at + 1; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.sequence_number_from[replay_request_ack_nack_message_at] = wire[at]; at = at + 1; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.sequence_number_to[replay_request_ack_nack_message_at] = wire[at]; at = at + 1; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> replay_request_ack_nack_message_record.request_id[replay_request_ack_nack_message_at] = wire[at]; at = at + 1; replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_record.status = wire[at]; at = at + 1;
  skip
}

/* what was read of Replay Request Ack Nack Message is what was written, byte for byte */
inline equal_replay_request_ack_nack_message(replay_request_ack_nack_message_read, replay_request_ack_nack_message_written) {
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> assert(replay_request_ack_nack_message_read.sequence_number[replay_request_ack_nack_message_at] == replay_request_ack_nack_message_written.sequence_number[replay_request_ack_nack_message_at]); replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> assert(replay_request_ack_nack_message_read.sequence_number_from[replay_request_ack_nack_message_at] == replay_request_ack_nack_message_written.sequence_number_from[replay_request_ack_nack_message_at]); replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> assert(replay_request_ack_nack_message_read.sequence_number_to[replay_request_ack_nack_message_at] == replay_request_ack_nack_message_written.sequence_number_to[replay_request_ack_nack_message_at]); replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  replay_request_ack_nack_message_at = 0;
  do
  :: replay_request_ack_nack_message_at < 4 -> assert(replay_request_ack_nack_message_read.request_id[replay_request_ack_nack_message_at] == replay_request_ack_nack_message_written.request_id[replay_request_ack_nack_message_at]); replay_request_ack_nack_message_at = replay_request_ack_nack_message_at + 1
  :: else -> break
  od;
  assert(replay_request_ack_nack_message_read.status == replay_request_ack_nack_message_written.status);
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

/* ---- Security List Message: 713 bytes ---------------------------------------- */

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
  byte family_code[5];
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
  byte sec_description[20];
  byte underlying_asset[22];
  byte security_sub_type[12];
  byte maturity_month_year[8];
  byte strike_price[8];
  byte strike_value[8];
  byte opt_attribute;
  byte min_price_increment[8];
  byte unit_of_measure[20];
  byte settl_method;
  byte exercise_style;
  byte put_or_call;
  byte flexible_indicator;
  byte last_trading_day[4];
  byte number_of_decimals;
  byte order_number_of_decimals;
  byte adjustments_rule;
  byte maximum_order_size[8];
  byte self_match_prevention;
  byte commodity_derivative_indicator;
  byte stock_when_underlying_is_dividend[22];
  byte base_product[4];
  byte sub_product[4];
  byte further_sub_product[4];
  byte base_currency[3];
  byte quoted_currency[3];
  byte maturity_month_year_increment_units;
  byte start_maturity_month_year[8];
  byte end_maturity_month_year[8];
  byte maturity_month_year_increment;
  byte underlying_symbol[22];
  byte underlying_isin[12];
  byte underlying_currency[3];
  byte underlying_security_issuer_lei[20];
  byte x_rolling_closing_type;
  byte x_rolling_reference_buyer_rate;
  byte x_rolling_buyer_markup[8];
  byte x_rolling_reference_seller_rate;
  byte x_rolling_seller_markup[8];
  byte x_rolling_dividend_percentage[8];
  byte x_rolling_dividend_pay_date_diff[2];
  byte leg_symbol_1[22];
  byte leg_ratio_qty_1[4];
  byte leg_side_1;
  byte leg_price_1[8];
  byte leg_symbol_2[22];
  byte leg_ratio_qty_2[4];
  byte leg_side_2;
  byte leg_price_2[8];
  byte leg_symbol_3[22];
  byte leg_ratio_qty_3[4];
  byte leg_side_3;
  byte leg_price_3[8];
  byte leg_symbol_4[22];
  byte leg_ratio_qty_4[4];
  byte leg_side_4;
  byte leg_price_4[8];
  byte leg_symbol_5[22];
  byte leg_ratio_qty_5[4];
  byte leg_side_5;
  byte leg_price_5[8]
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
  :: security_list_message_at < 5 -> security_list_message_record.family_code[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
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
  :: security_list_message_at < 20 -> security_list_message_record.sec_description[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.underlying_asset[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.security_sub_type[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.maturity_month_year[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.strike_price[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.strike_value[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.opt_attribute = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.min_price_increment[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> security_list_message_record.unit_of_measure[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.settl_method = security_list_message_value;
  security_list_message_record.exercise_style = security_list_message_value;
  security_list_message_record.put_or_call = security_list_message_value;
  security_list_message_record.flexible_indicator = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.last_trading_day[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.number_of_decimals = security_list_message_value;
  security_list_message_record.order_number_of_decimals = security_list_message_value;
  security_list_message_record.adjustments_rule = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.maximum_order_size[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.self_match_prevention = security_list_message_value;
  security_list_message_record.commodity_derivative_indicator = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.stock_when_underlying_is_dividend[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.base_product[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.sub_product[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.further_sub_product[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.base_currency[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.quoted_currency[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.maturity_month_year_increment_units = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.start_maturity_month_year[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.end_maturity_month_year[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.maturity_month_year_increment = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.underlying_symbol[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.underlying_isin[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.underlying_currency[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> security_list_message_record.underlying_security_issuer_lei[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.x_rolling_closing_type = security_list_message_value;
  security_list_message_record.x_rolling_reference_buyer_rate = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.x_rolling_buyer_markup[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.x_rolling_reference_seller_rate = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.x_rolling_seller_markup[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.x_rolling_dividend_percentage[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.x_rolling_dividend_pay_date_diff[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_1[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_1[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_1 = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_1[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_2[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_2[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_2 = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_2[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_3[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_3[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_3 = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_3[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_4[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_4[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_4 = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_4[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_5[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_5[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_5 = security_list_message_value;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_5[security_list_message_at] = security_list_message_value; security_list_message_at = security_list_message_at + 1
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
  :: security_list_message_at < 5 -> security_list_message_record.family_code[security_list_message_at] = (security_list_message_base + 107 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 6 -> security_list_message_record.cfi_code[security_list_message_at] = (security_list_message_base + 112 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.security_type[security_list_message_at] = (security_list_message_base + 118 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.maturity_date[security_list_message_at] = (security_list_message_base + 120 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.issue_date[security_list_message_at] = (security_list_message_base + 124 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.contract_multiplier[security_list_message_at] = (security_list_message_base + 128 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.li_spre[security_list_message_at] = (security_list_message_base + 136 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.sst_ipre[security_list_message_at] = (security_list_message_base + 144 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.li_spost[security_list_message_at] = (security_list_message_base + 152 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.sst_ipost[security_list_message_at] = (security_list_message_base + 160 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.liquid_instrument = (security_list_message_base + 168 + 1) % 256;
  security_list_message_record.admission_requested_by_issuer = (security_list_message_base + 169 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.min_trade_vol[security_list_message_at] = (security_list_message_base + 170 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.round_lot[security_list_message_at] = (security_list_message_base + 174 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.currency[security_list_message_at] = (security_list_message_base + 178 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.modality_mask_b_4[security_list_message_at] = (security_list_message_base + 181 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 80 -> security_list_message_record.security_description[security_list_message_at] = (security_list_message_base + 185 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.trading_obligation = (security_list_message_base + 265 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> security_list_message_record.sec_description[security_list_message_at] = (security_list_message_base + 266 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.underlying_asset[security_list_message_at] = (security_list_message_base + 286 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.security_sub_type[security_list_message_at] = (security_list_message_base + 308 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.maturity_month_year[security_list_message_at] = (security_list_message_base + 320 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.strike_price[security_list_message_at] = (security_list_message_base + 328 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.strike_value[security_list_message_at] = (security_list_message_base + 336 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.opt_attribute = (security_list_message_base + 344 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.min_price_increment[security_list_message_at] = (security_list_message_base + 345 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> security_list_message_record.unit_of_measure[security_list_message_at] = (security_list_message_base + 353 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.settl_method = (security_list_message_base + 373 + 1) % 256;
  security_list_message_record.exercise_style = (security_list_message_base + 374 + 1) % 256;
  security_list_message_record.put_or_call = (security_list_message_base + 375 + 1) % 256;
  security_list_message_record.flexible_indicator = (security_list_message_base + 376 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.last_trading_day[security_list_message_at] = (security_list_message_base + 377 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.number_of_decimals = (security_list_message_base + 381 + 1) % 256;
  security_list_message_record.order_number_of_decimals = (security_list_message_base + 382 + 1) % 256;
  security_list_message_record.adjustments_rule = (security_list_message_base + 383 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.maximum_order_size[security_list_message_at] = (security_list_message_base + 384 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.self_match_prevention = (security_list_message_base + 392 + 1) % 256;
  security_list_message_record.commodity_derivative_indicator = (security_list_message_base + 393 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.stock_when_underlying_is_dividend[security_list_message_at] = (security_list_message_base + 394 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.base_product[security_list_message_at] = (security_list_message_base + 416 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.sub_product[security_list_message_at] = (security_list_message_base + 420 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.further_sub_product[security_list_message_at] = (security_list_message_base + 424 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.base_currency[security_list_message_at] = (security_list_message_base + 428 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.quoted_currency[security_list_message_at] = (security_list_message_base + 431 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.maturity_month_year_increment_units = (security_list_message_base + 434 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.start_maturity_month_year[security_list_message_at] = (security_list_message_base + 435 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.end_maturity_month_year[security_list_message_at] = (security_list_message_base + 443 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.maturity_month_year_increment = (security_list_message_base + 451 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.underlying_symbol[security_list_message_at] = (security_list_message_base + 452 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.underlying_isin[security_list_message_at] = (security_list_message_base + 474 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.underlying_currency[security_list_message_at] = (security_list_message_base + 486 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> security_list_message_record.underlying_security_issuer_lei[security_list_message_at] = (security_list_message_base + 489 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.x_rolling_closing_type = (security_list_message_base + 509 + 1) % 256;
  security_list_message_record.x_rolling_reference_buyer_rate = (security_list_message_base + 510 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.x_rolling_buyer_markup[security_list_message_at] = (security_list_message_base + 511 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.x_rolling_reference_seller_rate = (security_list_message_base + 519 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.x_rolling_seller_markup[security_list_message_at] = (security_list_message_base + 520 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.x_rolling_dividend_percentage[security_list_message_at] = (security_list_message_base + 528 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.x_rolling_dividend_pay_date_diff[security_list_message_at] = (security_list_message_base + 536 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_1[security_list_message_at] = (security_list_message_base + 538 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_1[security_list_message_at] = (security_list_message_base + 560 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_1 = (security_list_message_base + 564 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_1[security_list_message_at] = (security_list_message_base + 565 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_2[security_list_message_at] = (security_list_message_base + 573 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_2[security_list_message_at] = (security_list_message_base + 595 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_2 = (security_list_message_base + 599 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_2[security_list_message_at] = (security_list_message_base + 600 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_3[security_list_message_at] = (security_list_message_base + 608 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_3[security_list_message_at] = (security_list_message_base + 630 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_3 = (security_list_message_base + 634 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_3[security_list_message_at] = (security_list_message_base + 635 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_4[security_list_message_at] = (security_list_message_base + 643 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_4[security_list_message_at] = (security_list_message_base + 665 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_4 = (security_list_message_base + 669 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_4[security_list_message_at] = (security_list_message_base + 670 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_5[security_list_message_at] = (security_list_message_base + 678 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_5[security_list_message_at] = (security_list_message_base + 700 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_5 = (security_list_message_base + 704 + 1) % 256;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_5[security_list_message_at] = (security_list_message_base + 705 + security_list_message_at + 1) % 256; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security List Message to the wire, 713 bytes from where the cursor stands */
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
  :: security_list_message_at < 5 -> wire[at] = security_list_message_record.family_code[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
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
  :: security_list_message_at < 20 -> wire[at] = security_list_message_record.sec_description[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> wire[at] = security_list_message_record.underlying_asset[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> wire[at] = security_list_message_record.security_sub_type[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.maturity_month_year[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.strike_price[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.strike_value[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.opt_attribute; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.min_price_increment[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> wire[at] = security_list_message_record.unit_of_measure[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.settl_method; at = at + 1;
  wire[at] = security_list_message_record.exercise_style; at = at + 1;
  wire[at] = security_list_message_record.put_or_call; at = at + 1;
  wire[at] = security_list_message_record.flexible_indicator; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.last_trading_day[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.number_of_decimals; at = at + 1;
  wire[at] = security_list_message_record.order_number_of_decimals; at = at + 1;
  wire[at] = security_list_message_record.adjustments_rule; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.maximum_order_size[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.self_match_prevention; at = at + 1;
  wire[at] = security_list_message_record.commodity_derivative_indicator; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> wire[at] = security_list_message_record.stock_when_underlying_is_dividend[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.base_product[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.sub_product[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.further_sub_product[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> wire[at] = security_list_message_record.base_currency[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> wire[at] = security_list_message_record.quoted_currency[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.maturity_month_year_increment_units; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.start_maturity_month_year[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.end_maturity_month_year[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.maturity_month_year_increment; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> wire[at] = security_list_message_record.underlying_symbol[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> wire[at] = security_list_message_record.underlying_isin[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> wire[at] = security_list_message_record.underlying_currency[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> wire[at] = security_list_message_record.underlying_security_issuer_lei[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.x_rolling_closing_type; at = at + 1;
  wire[at] = security_list_message_record.x_rolling_reference_buyer_rate; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.x_rolling_buyer_markup[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.x_rolling_reference_seller_rate; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.x_rolling_seller_markup[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.x_rolling_dividend_percentage[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> wire[at] = security_list_message_record.x_rolling_dividend_pay_date_diff[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> wire[at] = security_list_message_record.leg_symbol_1[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.leg_ratio_qty_1[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.leg_side_1; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.leg_price_1[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> wire[at] = security_list_message_record.leg_symbol_2[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.leg_ratio_qty_2[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.leg_side_2; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.leg_price_2[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> wire[at] = security_list_message_record.leg_symbol_3[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.leg_ratio_qty_3[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.leg_side_3; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.leg_price_3[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> wire[at] = security_list_message_record.leg_symbol_4[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.leg_ratio_qty_4[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.leg_side_4; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.leg_price_4[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> wire[at] = security_list_message_record.leg_symbol_5[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> wire[at] = security_list_message_record.leg_ratio_qty_5[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_message_record.leg_side_5; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> wire[at] = security_list_message_record.leg_price_5[security_list_message_at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security List Message off the wire, 713 bytes from where the cursor stands */
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
  :: security_list_message_at < 5 -> security_list_message_record.family_code[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
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
  :: security_list_message_at < 20 -> security_list_message_record.sec_description[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.underlying_asset[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.security_sub_type[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.maturity_month_year[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.strike_price[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.strike_value[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.opt_attribute = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.min_price_increment[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> security_list_message_record.unit_of_measure[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.settl_method = wire[at]; at = at + 1;
  security_list_message_record.exercise_style = wire[at]; at = at + 1;
  security_list_message_record.put_or_call = wire[at]; at = at + 1;
  security_list_message_record.flexible_indicator = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.last_trading_day[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.number_of_decimals = wire[at]; at = at + 1;
  security_list_message_record.order_number_of_decimals = wire[at]; at = at + 1;
  security_list_message_record.adjustments_rule = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.maximum_order_size[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.self_match_prevention = wire[at]; at = at + 1;
  security_list_message_record.commodity_derivative_indicator = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.stock_when_underlying_is_dividend[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.base_product[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.sub_product[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.further_sub_product[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.base_currency[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.quoted_currency[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.maturity_month_year_increment_units = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.start_maturity_month_year[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.end_maturity_month_year[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.maturity_month_year_increment = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.underlying_symbol[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> security_list_message_record.underlying_isin[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> security_list_message_record.underlying_currency[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> security_list_message_record.underlying_security_issuer_lei[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.x_rolling_closing_type = wire[at]; at = at + 1;
  security_list_message_record.x_rolling_reference_buyer_rate = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.x_rolling_buyer_markup[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.x_rolling_reference_seller_rate = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.x_rolling_seller_markup[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.x_rolling_dividend_percentage[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> security_list_message_record.x_rolling_dividend_pay_date_diff[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_1[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_1[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_1 = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_1[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_2[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_2[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_2 = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_2[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_3[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_3[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_3 = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_3[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_4[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_4[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_4 = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_4[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> security_list_message_record.leg_symbol_5[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> security_list_message_record.leg_ratio_qty_5[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_record.leg_side_5 = wire[at]; at = at + 1;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> security_list_message_record.leg_price_5[security_list_message_at] = wire[at]; at = at + 1; security_list_message_at = security_list_message_at + 1
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
  :: security_list_message_at < 5 -> assert(security_list_message_read.family_code[security_list_message_at] == security_list_message_written.family_code[security_list_message_at]); security_list_message_at = security_list_message_at + 1
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
  :: security_list_message_at < 20 -> assert(security_list_message_read.sec_description[security_list_message_at] == security_list_message_written.sec_description[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> assert(security_list_message_read.underlying_asset[security_list_message_at] == security_list_message_written.underlying_asset[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> assert(security_list_message_read.security_sub_type[security_list_message_at] == security_list_message_written.security_sub_type[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.maturity_month_year[security_list_message_at] == security_list_message_written.maturity_month_year[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.strike_price[security_list_message_at] == security_list_message_written.strike_price[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.strike_value[security_list_message_at] == security_list_message_written.strike_value[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.opt_attribute == security_list_message_written.opt_attribute);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.min_price_increment[security_list_message_at] == security_list_message_written.min_price_increment[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> assert(security_list_message_read.unit_of_measure[security_list_message_at] == security_list_message_written.unit_of_measure[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.settl_method == security_list_message_written.settl_method);
  assert(security_list_message_read.exercise_style == security_list_message_written.exercise_style);
  assert(security_list_message_read.put_or_call == security_list_message_written.put_or_call);
  assert(security_list_message_read.flexible_indicator == security_list_message_written.flexible_indicator);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.last_trading_day[security_list_message_at] == security_list_message_written.last_trading_day[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.number_of_decimals == security_list_message_written.number_of_decimals);
  assert(security_list_message_read.order_number_of_decimals == security_list_message_written.order_number_of_decimals);
  assert(security_list_message_read.adjustments_rule == security_list_message_written.adjustments_rule);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.maximum_order_size[security_list_message_at] == security_list_message_written.maximum_order_size[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.self_match_prevention == security_list_message_written.self_match_prevention);
  assert(security_list_message_read.commodity_derivative_indicator == security_list_message_written.commodity_derivative_indicator);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> assert(security_list_message_read.stock_when_underlying_is_dividend[security_list_message_at] == security_list_message_written.stock_when_underlying_is_dividend[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.base_product[security_list_message_at] == security_list_message_written.base_product[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.sub_product[security_list_message_at] == security_list_message_written.sub_product[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.further_sub_product[security_list_message_at] == security_list_message_written.further_sub_product[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> assert(security_list_message_read.base_currency[security_list_message_at] == security_list_message_written.base_currency[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> assert(security_list_message_read.quoted_currency[security_list_message_at] == security_list_message_written.quoted_currency[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.maturity_month_year_increment_units == security_list_message_written.maturity_month_year_increment_units);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.start_maturity_month_year[security_list_message_at] == security_list_message_written.start_maturity_month_year[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.end_maturity_month_year[security_list_message_at] == security_list_message_written.end_maturity_month_year[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.maturity_month_year_increment == security_list_message_written.maturity_month_year_increment);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> assert(security_list_message_read.underlying_symbol[security_list_message_at] == security_list_message_written.underlying_symbol[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 12 -> assert(security_list_message_read.underlying_isin[security_list_message_at] == security_list_message_written.underlying_isin[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 3 -> assert(security_list_message_read.underlying_currency[security_list_message_at] == security_list_message_written.underlying_currency[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 20 -> assert(security_list_message_read.underlying_security_issuer_lei[security_list_message_at] == security_list_message_written.underlying_security_issuer_lei[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.x_rolling_closing_type == security_list_message_written.x_rolling_closing_type);
  assert(security_list_message_read.x_rolling_reference_buyer_rate == security_list_message_written.x_rolling_reference_buyer_rate);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.x_rolling_buyer_markup[security_list_message_at] == security_list_message_written.x_rolling_buyer_markup[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.x_rolling_reference_seller_rate == security_list_message_written.x_rolling_reference_seller_rate);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.x_rolling_seller_markup[security_list_message_at] == security_list_message_written.x_rolling_seller_markup[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.x_rolling_dividend_percentage[security_list_message_at] == security_list_message_written.x_rolling_dividend_percentage[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 2 -> assert(security_list_message_read.x_rolling_dividend_pay_date_diff[security_list_message_at] == security_list_message_written.x_rolling_dividend_pay_date_diff[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> assert(security_list_message_read.leg_symbol_1[security_list_message_at] == security_list_message_written.leg_symbol_1[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.leg_ratio_qty_1[security_list_message_at] == security_list_message_written.leg_ratio_qty_1[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.leg_side_1 == security_list_message_written.leg_side_1);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.leg_price_1[security_list_message_at] == security_list_message_written.leg_price_1[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> assert(security_list_message_read.leg_symbol_2[security_list_message_at] == security_list_message_written.leg_symbol_2[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.leg_ratio_qty_2[security_list_message_at] == security_list_message_written.leg_ratio_qty_2[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.leg_side_2 == security_list_message_written.leg_side_2);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.leg_price_2[security_list_message_at] == security_list_message_written.leg_price_2[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> assert(security_list_message_read.leg_symbol_3[security_list_message_at] == security_list_message_written.leg_symbol_3[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.leg_ratio_qty_3[security_list_message_at] == security_list_message_written.leg_ratio_qty_3[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.leg_side_3 == security_list_message_written.leg_side_3);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.leg_price_3[security_list_message_at] == security_list_message_written.leg_price_3[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> assert(security_list_message_read.leg_symbol_4[security_list_message_at] == security_list_message_written.leg_symbol_4[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.leg_ratio_qty_4[security_list_message_at] == security_list_message_written.leg_ratio_qty_4[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.leg_side_4 == security_list_message_written.leg_side_4);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.leg_price_4[security_list_message_at] == security_list_message_written.leg_price_4[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 22 -> assert(security_list_message_read.leg_symbol_5[security_list_message_at] == security_list_message_written.leg_symbol_5[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  security_list_message_at = 0;
  do
  :: security_list_message_at < 4 -> assert(security_list_message_read.leg_ratio_qty_5[security_list_message_at] == security_list_message_written.leg_ratio_qty_5[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  assert(security_list_message_read.leg_side_5 == security_list_message_written.leg_side_5);
  security_list_message_at = 0;
  do
  :: security_list_message_at < 8 -> assert(security_list_message_read.leg_price_5[security_list_message_at] == security_list_message_written.leg_price_5[security_list_message_at]); security_list_message_at = security_list_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security List Update Report Message: 713 bytes -------------------------- */

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
  byte family_code[5];
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
  byte sec_description[20];
  byte underlying_asset[22];
  byte security_sub_type[12];
  byte maturity_month_year[8];
  byte strike_price[8];
  byte strike_value[8];
  byte opt_attribute;
  byte min_price_increment[8];
  byte unit_of_measure[20];
  byte settl_method;
  byte exercise_style;
  byte put_or_call;
  byte flexible_indicator;
  byte last_trading_day[4];
  byte number_of_decimals;
  byte order_number_of_decimals;
  byte adjustments_rule;
  byte maximum_order_size[8];
  byte self_match_prevention;
  byte commodity_derivative_indicator;
  byte stock_when_underlying_is_dividend[22];
  byte base_product[4];
  byte sub_product[4];
  byte further_sub_product[4];
  byte base_currency[3];
  byte quoted_currency[3];
  byte maturity_month_year_increment_units;
  byte start_maturity_month_year[8];
  byte end_maturity_month_year[8];
  byte maturity_month_year_increment;
  byte underlying_symbol[22];
  byte underlying_isin[12];
  byte underlying_currency[3];
  byte underlying_security_issuer_lei[20];
  byte x_rolling_closing_type;
  byte x_rolling_reference_buyer_rate;
  byte x_rolling_buyer_markup[8];
  byte x_rolling_reference_seller_rate;
  byte x_rolling_seller_markup[8];
  byte x_rolling_dividend_percentage[8];
  byte x_rolling_dividend_pay_date_diff[2];
  byte leg_symbol_1[22];
  byte leg_ratio_qty_1[4];
  byte leg_side_1;
  byte leg_price_1[8];
  byte leg_symbol_2[22];
  byte leg_ratio_qty_2[4];
  byte leg_side_2;
  byte leg_price_2[8];
  byte leg_symbol_3[22];
  byte leg_ratio_qty_3[4];
  byte leg_side_3;
  byte leg_price_3[8];
  byte leg_symbol_4[22];
  byte leg_ratio_qty_4[4];
  byte leg_side_4;
  byte leg_price_4[8];
  byte leg_symbol_5[22];
  byte leg_ratio_qty_5[4];
  byte leg_side_5;
  byte leg_price_5[8]
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
  :: security_list_update_report_message_at < 5 -> security_list_update_report_message_record.family_code[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
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
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.sec_description[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.underlying_asset[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.security_sub_type[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.maturity_month_year[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.strike_price[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.strike_value[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.opt_attribute = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.min_price_increment[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.unit_of_measure[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.settl_method = security_list_update_report_message_value;
  security_list_update_report_message_record.exercise_style = security_list_update_report_message_value;
  security_list_update_report_message_record.put_or_call = security_list_update_report_message_value;
  security_list_update_report_message_record.flexible_indicator = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.last_trading_day[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.number_of_decimals = security_list_update_report_message_value;
  security_list_update_report_message_record.order_number_of_decimals = security_list_update_report_message_value;
  security_list_update_report_message_record.adjustments_rule = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.maximum_order_size[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.self_match_prevention = security_list_update_report_message_value;
  security_list_update_report_message_record.commodity_derivative_indicator = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.stock_when_underlying_is_dividend[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.base_product[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.sub_product[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.further_sub_product[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.base_currency[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.quoted_currency[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.maturity_month_year_increment_units = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.start_maturity_month_year[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.end_maturity_month_year[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.maturity_month_year_increment = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.underlying_symbol[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.underlying_isin[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.underlying_currency[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.underlying_security_issuer_lei[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.x_rolling_closing_type = security_list_update_report_message_value;
  security_list_update_report_message_record.x_rolling_reference_buyer_rate = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.x_rolling_buyer_markup[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.x_rolling_reference_seller_rate = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.x_rolling_seller_markup[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.x_rolling_dividend_percentage[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.x_rolling_dividend_pay_date_diff[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_1[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_1[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_1 = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_1[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_2[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_2[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_2 = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_2[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_3[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_3[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_3 = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_3[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_4[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_4[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_4 = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_4[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_5[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_5[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_5 = security_list_update_report_message_value;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_5[security_list_update_report_message_at] = security_list_update_report_message_value; security_list_update_report_message_at = security_list_update_report_message_at + 1
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
  :: security_list_update_report_message_at < 5 -> security_list_update_report_message_record.family_code[security_list_update_report_message_at] = (security_list_update_report_message_base + 107 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 6 -> security_list_update_report_message_record.cfi_code[security_list_update_report_message_at] = (security_list_update_report_message_base + 112 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.security_type[security_list_update_report_message_at] = (security_list_update_report_message_base + 118 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.maturity_date[security_list_update_report_message_at] = (security_list_update_report_message_base + 120 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.issue_date[security_list_update_report_message_at] = (security_list_update_report_message_base + 124 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.contract_multiplier[security_list_update_report_message_at] = (security_list_update_report_message_base + 128 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.li_spre[security_list_update_report_message_at] = (security_list_update_report_message_base + 136 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.sst_ipre[security_list_update_report_message_at] = (security_list_update_report_message_base + 144 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.li_spost[security_list_update_report_message_at] = (security_list_update_report_message_base + 152 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.sst_ipost[security_list_update_report_message_at] = (security_list_update_report_message_base + 160 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.liquid_instrument = (security_list_update_report_message_base + 168 + 1) % 256;
  security_list_update_report_message_record.admission_requested_by_issuer = (security_list_update_report_message_base + 169 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.min_trade_vol[security_list_update_report_message_at] = (security_list_update_report_message_base + 170 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.round_lot[security_list_update_report_message_at] = (security_list_update_report_message_base + 174 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.currency[security_list_update_report_message_at] = (security_list_update_report_message_base + 178 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.modality_mask_b_4[security_list_update_report_message_at] = (security_list_update_report_message_base + 181 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 80 -> security_list_update_report_message_record.security_description[security_list_update_report_message_at] = (security_list_update_report_message_base + 185 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.trading_obligation = (security_list_update_report_message_base + 265 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.sec_description[security_list_update_report_message_at] = (security_list_update_report_message_base + 266 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.underlying_asset[security_list_update_report_message_at] = (security_list_update_report_message_base + 286 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.security_sub_type[security_list_update_report_message_at] = (security_list_update_report_message_base + 308 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.maturity_month_year[security_list_update_report_message_at] = (security_list_update_report_message_base + 320 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.strike_price[security_list_update_report_message_at] = (security_list_update_report_message_base + 328 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.strike_value[security_list_update_report_message_at] = (security_list_update_report_message_base + 336 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.opt_attribute = (security_list_update_report_message_base + 344 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.min_price_increment[security_list_update_report_message_at] = (security_list_update_report_message_base + 345 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.unit_of_measure[security_list_update_report_message_at] = (security_list_update_report_message_base + 353 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.settl_method = (security_list_update_report_message_base + 373 + 1) % 256;
  security_list_update_report_message_record.exercise_style = (security_list_update_report_message_base + 374 + 1) % 256;
  security_list_update_report_message_record.put_or_call = (security_list_update_report_message_base + 375 + 1) % 256;
  security_list_update_report_message_record.flexible_indicator = (security_list_update_report_message_base + 376 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.last_trading_day[security_list_update_report_message_at] = (security_list_update_report_message_base + 377 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.number_of_decimals = (security_list_update_report_message_base + 381 + 1) % 256;
  security_list_update_report_message_record.order_number_of_decimals = (security_list_update_report_message_base + 382 + 1) % 256;
  security_list_update_report_message_record.adjustments_rule = (security_list_update_report_message_base + 383 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.maximum_order_size[security_list_update_report_message_at] = (security_list_update_report_message_base + 384 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.self_match_prevention = (security_list_update_report_message_base + 392 + 1) % 256;
  security_list_update_report_message_record.commodity_derivative_indicator = (security_list_update_report_message_base + 393 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.stock_when_underlying_is_dividend[security_list_update_report_message_at] = (security_list_update_report_message_base + 394 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.base_product[security_list_update_report_message_at] = (security_list_update_report_message_base + 416 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.sub_product[security_list_update_report_message_at] = (security_list_update_report_message_base + 420 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.further_sub_product[security_list_update_report_message_at] = (security_list_update_report_message_base + 424 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.base_currency[security_list_update_report_message_at] = (security_list_update_report_message_base + 428 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.quoted_currency[security_list_update_report_message_at] = (security_list_update_report_message_base + 431 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.maturity_month_year_increment_units = (security_list_update_report_message_base + 434 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.start_maturity_month_year[security_list_update_report_message_at] = (security_list_update_report_message_base + 435 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.end_maturity_month_year[security_list_update_report_message_at] = (security_list_update_report_message_base + 443 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.maturity_month_year_increment = (security_list_update_report_message_base + 451 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.underlying_symbol[security_list_update_report_message_at] = (security_list_update_report_message_base + 452 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.underlying_isin[security_list_update_report_message_at] = (security_list_update_report_message_base + 474 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.underlying_currency[security_list_update_report_message_at] = (security_list_update_report_message_base + 486 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.underlying_security_issuer_lei[security_list_update_report_message_at] = (security_list_update_report_message_base + 489 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.x_rolling_closing_type = (security_list_update_report_message_base + 509 + 1) % 256;
  security_list_update_report_message_record.x_rolling_reference_buyer_rate = (security_list_update_report_message_base + 510 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.x_rolling_buyer_markup[security_list_update_report_message_at] = (security_list_update_report_message_base + 511 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.x_rolling_reference_seller_rate = (security_list_update_report_message_base + 519 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.x_rolling_seller_markup[security_list_update_report_message_at] = (security_list_update_report_message_base + 520 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.x_rolling_dividend_percentage[security_list_update_report_message_at] = (security_list_update_report_message_base + 528 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.x_rolling_dividend_pay_date_diff[security_list_update_report_message_at] = (security_list_update_report_message_base + 536 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_1[security_list_update_report_message_at] = (security_list_update_report_message_base + 538 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_1[security_list_update_report_message_at] = (security_list_update_report_message_base + 560 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_1 = (security_list_update_report_message_base + 564 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_1[security_list_update_report_message_at] = (security_list_update_report_message_base + 565 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_2[security_list_update_report_message_at] = (security_list_update_report_message_base + 573 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_2[security_list_update_report_message_at] = (security_list_update_report_message_base + 595 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_2 = (security_list_update_report_message_base + 599 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_2[security_list_update_report_message_at] = (security_list_update_report_message_base + 600 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_3[security_list_update_report_message_at] = (security_list_update_report_message_base + 608 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_3[security_list_update_report_message_at] = (security_list_update_report_message_base + 630 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_3 = (security_list_update_report_message_base + 634 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_3[security_list_update_report_message_at] = (security_list_update_report_message_base + 635 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_4[security_list_update_report_message_at] = (security_list_update_report_message_base + 643 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_4[security_list_update_report_message_at] = (security_list_update_report_message_base + 665 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_4 = (security_list_update_report_message_base + 669 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_4[security_list_update_report_message_at] = (security_list_update_report_message_base + 670 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_5[security_list_update_report_message_at] = (security_list_update_report_message_base + 678 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_5[security_list_update_report_message_at] = (security_list_update_report_message_base + 700 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_5 = (security_list_update_report_message_base + 704 + 1) % 256;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_5[security_list_update_report_message_at] = (security_list_update_report_message_base + 705 + security_list_update_report_message_at + 1) % 256; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security List Update Report Message to the wire, 713 bytes from where the cursor stands */
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
  :: security_list_update_report_message_at < 5 -> wire[at] = security_list_update_report_message_record.family_code[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
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
  :: security_list_update_report_message_at < 20 -> wire[at] = security_list_update_report_message_record.sec_description[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> wire[at] = security_list_update_report_message_record.underlying_asset[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> wire[at] = security_list_update_report_message_record.security_sub_type[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.maturity_month_year[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.strike_price[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.strike_value[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.opt_attribute; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.min_price_increment[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> wire[at] = security_list_update_report_message_record.unit_of_measure[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.settl_method; at = at + 1;
  wire[at] = security_list_update_report_message_record.exercise_style; at = at + 1;
  wire[at] = security_list_update_report_message_record.put_or_call; at = at + 1;
  wire[at] = security_list_update_report_message_record.flexible_indicator; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.last_trading_day[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.number_of_decimals; at = at + 1;
  wire[at] = security_list_update_report_message_record.order_number_of_decimals; at = at + 1;
  wire[at] = security_list_update_report_message_record.adjustments_rule; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.maximum_order_size[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.self_match_prevention; at = at + 1;
  wire[at] = security_list_update_report_message_record.commodity_derivative_indicator; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> wire[at] = security_list_update_report_message_record.stock_when_underlying_is_dividend[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.base_product[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.sub_product[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.further_sub_product[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> wire[at] = security_list_update_report_message_record.base_currency[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> wire[at] = security_list_update_report_message_record.quoted_currency[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.maturity_month_year_increment_units; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.start_maturity_month_year[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.end_maturity_month_year[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.maturity_month_year_increment; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> wire[at] = security_list_update_report_message_record.underlying_symbol[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> wire[at] = security_list_update_report_message_record.underlying_isin[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> wire[at] = security_list_update_report_message_record.underlying_currency[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> wire[at] = security_list_update_report_message_record.underlying_security_issuer_lei[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.x_rolling_closing_type; at = at + 1;
  wire[at] = security_list_update_report_message_record.x_rolling_reference_buyer_rate; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.x_rolling_buyer_markup[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.x_rolling_reference_seller_rate; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.x_rolling_seller_markup[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.x_rolling_dividend_percentage[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> wire[at] = security_list_update_report_message_record.x_rolling_dividend_pay_date_diff[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> wire[at] = security_list_update_report_message_record.leg_symbol_1[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.leg_ratio_qty_1[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.leg_side_1; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.leg_price_1[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> wire[at] = security_list_update_report_message_record.leg_symbol_2[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.leg_ratio_qty_2[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.leg_side_2; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.leg_price_2[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> wire[at] = security_list_update_report_message_record.leg_symbol_3[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.leg_ratio_qty_3[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.leg_side_3; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.leg_price_3[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> wire[at] = security_list_update_report_message_record.leg_symbol_4[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.leg_ratio_qty_4[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.leg_side_4; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.leg_price_4[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> wire[at] = security_list_update_report_message_record.leg_symbol_5[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> wire[at] = security_list_update_report_message_record.leg_ratio_qty_5[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  wire[at] = security_list_update_report_message_record.leg_side_5; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> wire[at] = security_list_update_report_message_record.leg_price_5[security_list_update_report_message_at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security List Update Report Message off the wire, 713 bytes from where the cursor stands */
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
  :: security_list_update_report_message_at < 5 -> security_list_update_report_message_record.family_code[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
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
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.sec_description[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.underlying_asset[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.security_sub_type[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.maturity_month_year[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.strike_price[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.strike_value[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.opt_attribute = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.min_price_increment[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.unit_of_measure[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.settl_method = wire[at]; at = at + 1;
  security_list_update_report_message_record.exercise_style = wire[at]; at = at + 1;
  security_list_update_report_message_record.put_or_call = wire[at]; at = at + 1;
  security_list_update_report_message_record.flexible_indicator = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.last_trading_day[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.number_of_decimals = wire[at]; at = at + 1;
  security_list_update_report_message_record.order_number_of_decimals = wire[at]; at = at + 1;
  security_list_update_report_message_record.adjustments_rule = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.maximum_order_size[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.self_match_prevention = wire[at]; at = at + 1;
  security_list_update_report_message_record.commodity_derivative_indicator = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.stock_when_underlying_is_dividend[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.base_product[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.sub_product[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.further_sub_product[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.base_currency[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.quoted_currency[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.maturity_month_year_increment_units = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.start_maturity_month_year[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.end_maturity_month_year[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.maturity_month_year_increment = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.underlying_symbol[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> security_list_update_report_message_record.underlying_isin[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> security_list_update_report_message_record.underlying_currency[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> security_list_update_report_message_record.underlying_security_issuer_lei[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.x_rolling_closing_type = wire[at]; at = at + 1;
  security_list_update_report_message_record.x_rolling_reference_buyer_rate = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.x_rolling_buyer_markup[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.x_rolling_reference_seller_rate = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.x_rolling_seller_markup[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.x_rolling_dividend_percentage[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> security_list_update_report_message_record.x_rolling_dividend_pay_date_diff[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_1[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_1[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_1 = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_1[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_2[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_2[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_2 = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_2[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_3[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_3[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_3 = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_3[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_4[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_4[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_4 = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_4[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> security_list_update_report_message_record.leg_symbol_5[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> security_list_update_report_message_record.leg_ratio_qty_5[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_record.leg_side_5 = wire[at]; at = at + 1;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> security_list_update_report_message_record.leg_price_5[security_list_update_report_message_at] = wire[at]; at = at + 1; security_list_update_report_message_at = security_list_update_report_message_at + 1
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
  :: security_list_update_report_message_at < 5 -> assert(security_list_update_report_message_read.family_code[security_list_update_report_message_at] == security_list_update_report_message_written.family_code[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
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
  :: security_list_update_report_message_at < 20 -> assert(security_list_update_report_message_read.sec_description[security_list_update_report_message_at] == security_list_update_report_message_written.sec_description[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> assert(security_list_update_report_message_read.underlying_asset[security_list_update_report_message_at] == security_list_update_report_message_written.underlying_asset[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> assert(security_list_update_report_message_read.security_sub_type[security_list_update_report_message_at] == security_list_update_report_message_written.security_sub_type[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.maturity_month_year[security_list_update_report_message_at] == security_list_update_report_message_written.maturity_month_year[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.strike_price[security_list_update_report_message_at] == security_list_update_report_message_written.strike_price[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.strike_value[security_list_update_report_message_at] == security_list_update_report_message_written.strike_value[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.opt_attribute == security_list_update_report_message_written.opt_attribute);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.min_price_increment[security_list_update_report_message_at] == security_list_update_report_message_written.min_price_increment[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> assert(security_list_update_report_message_read.unit_of_measure[security_list_update_report_message_at] == security_list_update_report_message_written.unit_of_measure[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.settl_method == security_list_update_report_message_written.settl_method);
  assert(security_list_update_report_message_read.exercise_style == security_list_update_report_message_written.exercise_style);
  assert(security_list_update_report_message_read.put_or_call == security_list_update_report_message_written.put_or_call);
  assert(security_list_update_report_message_read.flexible_indicator == security_list_update_report_message_written.flexible_indicator);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.last_trading_day[security_list_update_report_message_at] == security_list_update_report_message_written.last_trading_day[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.number_of_decimals == security_list_update_report_message_written.number_of_decimals);
  assert(security_list_update_report_message_read.order_number_of_decimals == security_list_update_report_message_written.order_number_of_decimals);
  assert(security_list_update_report_message_read.adjustments_rule == security_list_update_report_message_written.adjustments_rule);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.maximum_order_size[security_list_update_report_message_at] == security_list_update_report_message_written.maximum_order_size[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.self_match_prevention == security_list_update_report_message_written.self_match_prevention);
  assert(security_list_update_report_message_read.commodity_derivative_indicator == security_list_update_report_message_written.commodity_derivative_indicator);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> assert(security_list_update_report_message_read.stock_when_underlying_is_dividend[security_list_update_report_message_at] == security_list_update_report_message_written.stock_when_underlying_is_dividend[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.base_product[security_list_update_report_message_at] == security_list_update_report_message_written.base_product[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.sub_product[security_list_update_report_message_at] == security_list_update_report_message_written.sub_product[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.further_sub_product[security_list_update_report_message_at] == security_list_update_report_message_written.further_sub_product[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> assert(security_list_update_report_message_read.base_currency[security_list_update_report_message_at] == security_list_update_report_message_written.base_currency[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> assert(security_list_update_report_message_read.quoted_currency[security_list_update_report_message_at] == security_list_update_report_message_written.quoted_currency[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.maturity_month_year_increment_units == security_list_update_report_message_written.maturity_month_year_increment_units);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.start_maturity_month_year[security_list_update_report_message_at] == security_list_update_report_message_written.start_maturity_month_year[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.end_maturity_month_year[security_list_update_report_message_at] == security_list_update_report_message_written.end_maturity_month_year[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.maturity_month_year_increment == security_list_update_report_message_written.maturity_month_year_increment);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> assert(security_list_update_report_message_read.underlying_symbol[security_list_update_report_message_at] == security_list_update_report_message_written.underlying_symbol[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 12 -> assert(security_list_update_report_message_read.underlying_isin[security_list_update_report_message_at] == security_list_update_report_message_written.underlying_isin[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 3 -> assert(security_list_update_report_message_read.underlying_currency[security_list_update_report_message_at] == security_list_update_report_message_written.underlying_currency[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 20 -> assert(security_list_update_report_message_read.underlying_security_issuer_lei[security_list_update_report_message_at] == security_list_update_report_message_written.underlying_security_issuer_lei[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.x_rolling_closing_type == security_list_update_report_message_written.x_rolling_closing_type);
  assert(security_list_update_report_message_read.x_rolling_reference_buyer_rate == security_list_update_report_message_written.x_rolling_reference_buyer_rate);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.x_rolling_buyer_markup[security_list_update_report_message_at] == security_list_update_report_message_written.x_rolling_buyer_markup[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.x_rolling_reference_seller_rate == security_list_update_report_message_written.x_rolling_reference_seller_rate);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.x_rolling_seller_markup[security_list_update_report_message_at] == security_list_update_report_message_written.x_rolling_seller_markup[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.x_rolling_dividend_percentage[security_list_update_report_message_at] == security_list_update_report_message_written.x_rolling_dividend_percentage[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 2 -> assert(security_list_update_report_message_read.x_rolling_dividend_pay_date_diff[security_list_update_report_message_at] == security_list_update_report_message_written.x_rolling_dividend_pay_date_diff[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> assert(security_list_update_report_message_read.leg_symbol_1[security_list_update_report_message_at] == security_list_update_report_message_written.leg_symbol_1[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.leg_ratio_qty_1[security_list_update_report_message_at] == security_list_update_report_message_written.leg_ratio_qty_1[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.leg_side_1 == security_list_update_report_message_written.leg_side_1);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.leg_price_1[security_list_update_report_message_at] == security_list_update_report_message_written.leg_price_1[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> assert(security_list_update_report_message_read.leg_symbol_2[security_list_update_report_message_at] == security_list_update_report_message_written.leg_symbol_2[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.leg_ratio_qty_2[security_list_update_report_message_at] == security_list_update_report_message_written.leg_ratio_qty_2[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.leg_side_2 == security_list_update_report_message_written.leg_side_2);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.leg_price_2[security_list_update_report_message_at] == security_list_update_report_message_written.leg_price_2[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> assert(security_list_update_report_message_read.leg_symbol_3[security_list_update_report_message_at] == security_list_update_report_message_written.leg_symbol_3[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.leg_ratio_qty_3[security_list_update_report_message_at] == security_list_update_report_message_written.leg_ratio_qty_3[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.leg_side_3 == security_list_update_report_message_written.leg_side_3);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.leg_price_3[security_list_update_report_message_at] == security_list_update_report_message_written.leg_price_3[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> assert(security_list_update_report_message_read.leg_symbol_4[security_list_update_report_message_at] == security_list_update_report_message_written.leg_symbol_4[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.leg_ratio_qty_4[security_list_update_report_message_at] == security_list_update_report_message_written.leg_ratio_qty_4[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.leg_side_4 == security_list_update_report_message_written.leg_side_4);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.leg_price_4[security_list_update_report_message_at] == security_list_update_report_message_written.leg_price_4[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 22 -> assert(security_list_update_report_message_read.leg_symbol_5[security_list_update_report_message_at] == security_list_update_report_message_written.leg_symbol_5[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 4 -> assert(security_list_update_report_message_read.leg_ratio_qty_5[security_list_update_report_message_at] == security_list_update_report_message_written.leg_ratio_qty_5[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  assert(security_list_update_report_message_read.leg_side_5 == security_list_update_report_message_written.leg_side_5);
  security_list_update_report_message_at = 0;
  do
  :: security_list_update_report_message_at < 8 -> assert(security_list_update_report_message_read.leg_price_5[security_list_update_report_message_at] == security_list_update_report_message_written.leg_price_5[security_list_update_report_message_at]); security_list_update_report_message_at = security_list_update_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Status Message: 34 bytes --------------------------------------- */

/* Message sent by the server to inform on the status of one security */
typedef SecurityStatusMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte security_trading_status;
  byte non_availability_reason;
  byte high_limit_price[8];
  byte low_limit_price[8]
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
  security_status_message_record.security_trading_status = (security_status_message_base + 16 + 1) % 256;
  security_status_message_record.non_availability_reason = (security_status_message_base + 17 + 1) % 256;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.high_limit_price[security_status_message_at] = (security_status_message_base + 18 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  security_status_message_at = 0;
  do
  :: security_status_message_at < 8 -> security_status_message_record.low_limit_price[security_status_message_at] = (security_status_message_base + 26 + security_status_message_at + 1) % 256; security_status_message_at = security_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Status Message to the wire, 34 bytes from where the cursor stands */
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
  skip
}

/* Security Status Message off the wire, 34 bytes from where the cursor stands */
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
  skip
}

/* ---- Family Status Message: 21 bytes ----------------------------------------- */

/* Message sent by the server in the Derivatives environment to inform about the status a Family of products */
typedef FamilyStatusMessage {
  byte sequence_number[4];
  byte security_group[2];
  byte family_code[5];
  byte transaction_date_and_time[8];
  byte security_trading_status;
  byte non_availability_reason
};

int family_status_message_at;

/* every byte of Family Status Message set to one value */
inline fill_family_status_message(family_status_message_record, family_status_message_value) {
  family_status_message_at = 0;
  do
  :: family_status_message_at < 4 -> family_status_message_record.sequence_number[family_status_message_at] = family_status_message_value; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 2 -> family_status_message_record.security_group[family_status_message_at] = family_status_message_value; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 5 -> family_status_message_record.family_code[family_status_message_at] = family_status_message_value; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 8 -> family_status_message_record.transaction_date_and_time[family_status_message_at] = family_status_message_value; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_record.security_trading_status = family_status_message_value;
  family_status_message_record.non_availability_reason = family_status_message_value;
  skip
}

/* each byte of Family Status Message set to where it lies, so a field read out of place says so */
inline ramp_family_status_message(family_status_message_record, family_status_message_base) {
  family_status_message_at = 0;
  do
  :: family_status_message_at < 4 -> family_status_message_record.sequence_number[family_status_message_at] = (family_status_message_base + 0 + family_status_message_at + 1) % 256; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 2 -> family_status_message_record.security_group[family_status_message_at] = (family_status_message_base + 4 + family_status_message_at + 1) % 256; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 5 -> family_status_message_record.family_code[family_status_message_at] = (family_status_message_base + 6 + family_status_message_at + 1) % 256; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 8 -> family_status_message_record.transaction_date_and_time[family_status_message_at] = (family_status_message_base + 11 + family_status_message_at + 1) % 256; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_record.security_trading_status = (family_status_message_base + 19 + 1) % 256;
  family_status_message_record.non_availability_reason = (family_status_message_base + 20 + 1) % 256;
  skip
}

/* Family Status Message to the wire, 21 bytes from where the cursor stands */
inline encode_family_status_message(family_status_message_record) {
  family_status_message_at = 0;
  do
  :: family_status_message_at < 4 -> wire[at] = family_status_message_record.sequence_number[family_status_message_at]; at = at + 1; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 2 -> wire[at] = family_status_message_record.security_group[family_status_message_at]; at = at + 1; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 5 -> wire[at] = family_status_message_record.family_code[family_status_message_at]; at = at + 1; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 8 -> wire[at] = family_status_message_record.transaction_date_and_time[family_status_message_at]; at = at + 1; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  wire[at] = family_status_message_record.security_trading_status; at = at + 1;
  wire[at] = family_status_message_record.non_availability_reason; at = at + 1;
  skip
}

/* Family Status Message off the wire, 21 bytes from where the cursor stands */
inline decode_family_status_message(family_status_message_record) {
  family_status_message_at = 0;
  do
  :: family_status_message_at < 4 -> family_status_message_record.sequence_number[family_status_message_at] = wire[at]; at = at + 1; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 2 -> family_status_message_record.security_group[family_status_message_at] = wire[at]; at = at + 1; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 5 -> family_status_message_record.family_code[family_status_message_at] = wire[at]; at = at + 1; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 8 -> family_status_message_record.transaction_date_and_time[family_status_message_at] = wire[at]; at = at + 1; family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_record.security_trading_status = wire[at]; at = at + 1;
  family_status_message_record.non_availability_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Family Status Message is what was written, byte for byte */
inline equal_family_status_message(family_status_message_read, family_status_message_written) {
  family_status_message_at = 0;
  do
  :: family_status_message_at < 4 -> assert(family_status_message_read.sequence_number[family_status_message_at] == family_status_message_written.sequence_number[family_status_message_at]); family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 2 -> assert(family_status_message_read.security_group[family_status_message_at] == family_status_message_written.security_group[family_status_message_at]); family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 5 -> assert(family_status_message_read.family_code[family_status_message_at] == family_status_message_written.family_code[family_status_message_at]); family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  family_status_message_at = 0;
  do
  :: family_status_message_at < 8 -> assert(family_status_message_read.transaction_date_and_time[family_status_message_at] == family_status_message_written.transaction_date_and_time[family_status_message_at]); family_status_message_at = family_status_message_at + 1
  :: else -> break
  od;
  assert(family_status_message_read.security_trading_status == family_status_message_written.security_trading_status);
  assert(family_status_message_read.non_availability_reason == family_status_message_written.non_availability_reason);
  skip
}

/* ---- Order Book Clear Message: 16 bytes -------------------------------------- */

/* Message sent by the UDP full-depth server whenever the information about order prices must be reset. In particular, it is sent by the server when the trading mode changes from auction to open market and vice versa */
typedef OrderBookClearMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8]
};

int order_book_clear_message_at;

/* every byte of Order Book Clear Message set to one value */
inline fill_order_book_clear_message(order_book_clear_message_record, order_book_clear_message_value) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.sequence_number[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.security_code[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.transaction_date_and_time[order_book_clear_message_at] = order_book_clear_message_value; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Book Clear Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_clear_message(order_book_clear_message_record, order_book_clear_message_base) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.sequence_number[order_book_clear_message_at] = (order_book_clear_message_base + 0 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.security_code[order_book_clear_message_at] = (order_book_clear_message_base + 4 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.transaction_date_and_time[order_book_clear_message_at] = (order_book_clear_message_base + 8 + order_book_clear_message_at + 1) % 256; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Clear Message to the wire, 16 bytes from where the cursor stands */
inline encode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> wire[at] = order_book_clear_message_record.sequence_number[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> wire[at] = order_book_clear_message_record.security_code[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> wire[at] = order_book_clear_message_record.transaction_date_and_time[order_book_clear_message_at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Book Clear Message off the wire, 16 bytes from where the cursor stands */
inline decode_order_book_clear_message(order_book_clear_message_record) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.sequence_number[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> order_book_clear_message_record.security_code[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> order_book_clear_message_record.transaction_date_and_time[order_book_clear_message_at] = wire[at]; at = at + 1; order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Book Clear Message is what was written, byte for byte */
inline equal_order_book_clear_message(order_book_clear_message_read, order_book_clear_message_written) {
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> assert(order_book_clear_message_read.sequence_number[order_book_clear_message_at] == order_book_clear_message_written.sequence_number[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 4 -> assert(order_book_clear_message_read.security_code[order_book_clear_message_at] == order_book_clear_message_written.security_code[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  order_book_clear_message_at = 0;
  do
  :: order_book_clear_message_at < 8 -> assert(order_book_clear_message_read.transaction_date_and_time[order_book_clear_message_at] == order_book_clear_message_written.transaction_date_and_time[order_book_clear_message_at]); order_book_clear_message_at = order_book_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Market Pre Transparency Information Message: 42 bytes ------------- */

/* Used by the Server to communicate information about all active visible orders. During a session, any order is uniquely identified by the SecondaryOrderID */
typedef OrderMarketPreTransparencyInformationMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte secondary_order_id[4];
  byte entry_date[4];
  byte side;
  byte priority_[4];
  byte price[8];
  byte display_qty[4];
  byte retail_cl_flag
};

int order_market_pre_transparency_information_message_at;

/* every byte of Order Market Pre Transparency Information Message set to one value */
inline fill_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_record, order_market_pre_transparency_information_message_value) {
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.sequence_number[order_market_pre_transparency_information_message_at] = order_market_pre_transparency_information_message_value; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.security_code[order_market_pre_transparency_information_message_at] = order_market_pre_transparency_information_message_value; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 8 -> order_market_pre_transparency_information_message_record.transaction_date_and_time[order_market_pre_transparency_information_message_at] = order_market_pre_transparency_information_message_value; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.secondary_order_id[order_market_pre_transparency_information_message_at] = order_market_pre_transparency_information_message_value; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.entry_date[order_market_pre_transparency_information_message_at] = order_market_pre_transparency_information_message_value; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_record.side = order_market_pre_transparency_information_message_value;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.priority_[order_market_pre_transparency_information_message_at] = order_market_pre_transparency_information_message_value; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 8 -> order_market_pre_transparency_information_message_record.price[order_market_pre_transparency_information_message_at] = order_market_pre_transparency_information_message_value; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.display_qty[order_market_pre_transparency_information_message_at] = order_market_pre_transparency_information_message_value; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_record.retail_cl_flag = order_market_pre_transparency_information_message_value;
  skip
}

/* each byte of Order Market Pre Transparency Information Message set to where it lies, so a field read out of place says so */
inline ramp_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_record, order_market_pre_transparency_information_message_base) {
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.sequence_number[order_market_pre_transparency_information_message_at] = (order_market_pre_transparency_information_message_base + 0 + order_market_pre_transparency_information_message_at + 1) % 256; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.security_code[order_market_pre_transparency_information_message_at] = (order_market_pre_transparency_information_message_base + 4 + order_market_pre_transparency_information_message_at + 1) % 256; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 8 -> order_market_pre_transparency_information_message_record.transaction_date_and_time[order_market_pre_transparency_information_message_at] = (order_market_pre_transparency_information_message_base + 8 + order_market_pre_transparency_information_message_at + 1) % 256; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.secondary_order_id[order_market_pre_transparency_information_message_at] = (order_market_pre_transparency_information_message_base + 16 + order_market_pre_transparency_information_message_at + 1) % 256; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.entry_date[order_market_pre_transparency_information_message_at] = (order_market_pre_transparency_information_message_base + 20 + order_market_pre_transparency_information_message_at + 1) % 256; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_record.side = (order_market_pre_transparency_information_message_base + 24 + 1) % 256;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.priority_[order_market_pre_transparency_information_message_at] = (order_market_pre_transparency_information_message_base + 25 + order_market_pre_transparency_information_message_at + 1) % 256; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 8 -> order_market_pre_transparency_information_message_record.price[order_market_pre_transparency_information_message_at] = (order_market_pre_transparency_information_message_base + 29 + order_market_pre_transparency_information_message_at + 1) % 256; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.display_qty[order_market_pre_transparency_information_message_at] = (order_market_pre_transparency_information_message_base + 37 + order_market_pre_transparency_information_message_at + 1) % 256; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_record.retail_cl_flag = (order_market_pre_transparency_information_message_base + 41 + 1) % 256;
  skip
}

/* Order Market Pre Transparency Information Message to the wire, 42 bytes from where the cursor stands */
inline encode_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_record) {
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> wire[at] = order_market_pre_transparency_information_message_record.sequence_number[order_market_pre_transparency_information_message_at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> wire[at] = order_market_pre_transparency_information_message_record.security_code[order_market_pre_transparency_information_message_at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 8 -> wire[at] = order_market_pre_transparency_information_message_record.transaction_date_and_time[order_market_pre_transparency_information_message_at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> wire[at] = order_market_pre_transparency_information_message_record.secondary_order_id[order_market_pre_transparency_information_message_at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> wire[at] = order_market_pre_transparency_information_message_record.entry_date[order_market_pre_transparency_information_message_at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  wire[at] = order_market_pre_transparency_information_message_record.side; at = at + 1;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> wire[at] = order_market_pre_transparency_information_message_record.priority_[order_market_pre_transparency_information_message_at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 8 -> wire[at] = order_market_pre_transparency_information_message_record.price[order_market_pre_transparency_information_message_at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> wire[at] = order_market_pre_transparency_information_message_record.display_qty[order_market_pre_transparency_information_message_at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  wire[at] = order_market_pre_transparency_information_message_record.retail_cl_flag; at = at + 1;
  skip
}

/* Order Market Pre Transparency Information Message off the wire, 42 bytes from where the cursor stands */
inline decode_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_record) {
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.sequence_number[order_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.security_code[order_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 8 -> order_market_pre_transparency_information_message_record.transaction_date_and_time[order_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.secondary_order_id[order_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.entry_date[order_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_record.side = wire[at]; at = at + 1;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.priority_[order_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 8 -> order_market_pre_transparency_information_message_record.price[order_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> order_market_pre_transparency_information_message_record.display_qty[order_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_record.retail_cl_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Market Pre Transparency Information Message is what was written, byte for byte */
inline equal_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_read, order_market_pre_transparency_information_message_written) {
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> assert(order_market_pre_transparency_information_message_read.sequence_number[order_market_pre_transparency_information_message_at] == order_market_pre_transparency_information_message_written.sequence_number[order_market_pre_transparency_information_message_at]); order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> assert(order_market_pre_transparency_information_message_read.security_code[order_market_pre_transparency_information_message_at] == order_market_pre_transparency_information_message_written.security_code[order_market_pre_transparency_information_message_at]); order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 8 -> assert(order_market_pre_transparency_information_message_read.transaction_date_and_time[order_market_pre_transparency_information_message_at] == order_market_pre_transparency_information_message_written.transaction_date_and_time[order_market_pre_transparency_information_message_at]); order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> assert(order_market_pre_transparency_information_message_read.secondary_order_id[order_market_pre_transparency_information_message_at] == order_market_pre_transparency_information_message_written.secondary_order_id[order_market_pre_transparency_information_message_at]); order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> assert(order_market_pre_transparency_information_message_read.entry_date[order_market_pre_transparency_information_message_at] == order_market_pre_transparency_information_message_written.entry_date[order_market_pre_transparency_information_message_at]); order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  assert(order_market_pre_transparency_information_message_read.side == order_market_pre_transparency_information_message_written.side);
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> assert(order_market_pre_transparency_information_message_read.priority_[order_market_pre_transparency_information_message_at] == order_market_pre_transparency_information_message_written.priority_[order_market_pre_transparency_information_message_at]); order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 8 -> assert(order_market_pre_transparency_information_message_read.price[order_market_pre_transparency_information_message_at] == order_market_pre_transparency_information_message_written.price[order_market_pre_transparency_information_message_at]); order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  order_market_pre_transparency_information_message_at = 0;
  do
  :: order_market_pre_transparency_information_message_at < 4 -> assert(order_market_pre_transparency_information_message_read.display_qty[order_market_pre_transparency_information_message_at] == order_market_pre_transparency_information_message_written.display_qty[order_market_pre_transparency_information_message_at]); order_market_pre_transparency_information_message_at = order_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  assert(order_market_pre_transparency_information_message_read.retail_cl_flag == order_market_pre_transparency_information_message_written.retail_cl_flag);
  skip
}

/* ---- Quote Market Pre Transparency Information Message: 56 bytes ------------- */

/* Used by the Server to communicate information about active quotes. In a session, a Quote is univoquely identified by its two orders: SecurityCode and SecondaryOrderID (buy order) and SecondaryOrderID2 (sell order) */
typedef QuoteMarketPreTransparencyInformationMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte secondary_order_id[4];
  byte secondary_order_id_2[4];
  byte priority_[4];
  byte price[8];
  byte display_qty[4];
  byte priority_2[4];
  byte price_2[8];
  byte display_qty_2[4]
};

int quote_market_pre_transparency_information_message_at;

/* every byte of Quote Market Pre Transparency Information Message set to one value */
inline fill_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_record, quote_market_pre_transparency_information_message_value) {
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.sequence_number[quote_market_pre_transparency_information_message_at] = quote_market_pre_transparency_information_message_value; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.security_code[quote_market_pre_transparency_information_message_at] = quote_market_pre_transparency_information_message_value; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> quote_market_pre_transparency_information_message_record.transaction_date_and_time[quote_market_pre_transparency_information_message_at] = quote_market_pre_transparency_information_message_value; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.secondary_order_id[quote_market_pre_transparency_information_message_at] = quote_market_pre_transparency_information_message_value; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.secondary_order_id_2[quote_market_pre_transparency_information_message_at] = quote_market_pre_transparency_information_message_value; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.priority_[quote_market_pre_transparency_information_message_at] = quote_market_pre_transparency_information_message_value; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> quote_market_pre_transparency_information_message_record.price[quote_market_pre_transparency_information_message_at] = quote_market_pre_transparency_information_message_value; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.display_qty[quote_market_pre_transparency_information_message_at] = quote_market_pre_transparency_information_message_value; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.priority_2[quote_market_pre_transparency_information_message_at] = quote_market_pre_transparency_information_message_value; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> quote_market_pre_transparency_information_message_record.price_2[quote_market_pre_transparency_information_message_at] = quote_market_pre_transparency_information_message_value; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.display_qty_2[quote_market_pre_transparency_information_message_at] = quote_market_pre_transparency_information_message_value; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Market Pre Transparency Information Message set to where it lies, so a field read out of place says so */
inline ramp_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_record, quote_market_pre_transparency_information_message_base) {
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.sequence_number[quote_market_pre_transparency_information_message_at] = (quote_market_pre_transparency_information_message_base + 0 + quote_market_pre_transparency_information_message_at + 1) % 256; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.security_code[quote_market_pre_transparency_information_message_at] = (quote_market_pre_transparency_information_message_base + 4 + quote_market_pre_transparency_information_message_at + 1) % 256; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> quote_market_pre_transparency_information_message_record.transaction_date_and_time[quote_market_pre_transparency_information_message_at] = (quote_market_pre_transparency_information_message_base + 8 + quote_market_pre_transparency_information_message_at + 1) % 256; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.secondary_order_id[quote_market_pre_transparency_information_message_at] = (quote_market_pre_transparency_information_message_base + 16 + quote_market_pre_transparency_information_message_at + 1) % 256; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.secondary_order_id_2[quote_market_pre_transparency_information_message_at] = (quote_market_pre_transparency_information_message_base + 20 + quote_market_pre_transparency_information_message_at + 1) % 256; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.priority_[quote_market_pre_transparency_information_message_at] = (quote_market_pre_transparency_information_message_base + 24 + quote_market_pre_transparency_information_message_at + 1) % 256; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> quote_market_pre_transparency_information_message_record.price[quote_market_pre_transparency_information_message_at] = (quote_market_pre_transparency_information_message_base + 28 + quote_market_pre_transparency_information_message_at + 1) % 256; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.display_qty[quote_market_pre_transparency_information_message_at] = (quote_market_pre_transparency_information_message_base + 36 + quote_market_pre_transparency_information_message_at + 1) % 256; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.priority_2[quote_market_pre_transparency_information_message_at] = (quote_market_pre_transparency_information_message_base + 40 + quote_market_pre_transparency_information_message_at + 1) % 256; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> quote_market_pre_transparency_information_message_record.price_2[quote_market_pre_transparency_information_message_at] = (quote_market_pre_transparency_information_message_base + 44 + quote_market_pre_transparency_information_message_at + 1) % 256; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.display_qty_2[quote_market_pre_transparency_information_message_at] = (quote_market_pre_transparency_information_message_base + 52 + quote_market_pre_transparency_information_message_at + 1) % 256; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Market Pre Transparency Information Message to the wire, 56 bytes from where the cursor stands */
inline encode_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_record) {
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> wire[at] = quote_market_pre_transparency_information_message_record.sequence_number[quote_market_pre_transparency_information_message_at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> wire[at] = quote_market_pre_transparency_information_message_record.security_code[quote_market_pre_transparency_information_message_at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> wire[at] = quote_market_pre_transparency_information_message_record.transaction_date_and_time[quote_market_pre_transparency_information_message_at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> wire[at] = quote_market_pre_transparency_information_message_record.secondary_order_id[quote_market_pre_transparency_information_message_at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> wire[at] = quote_market_pre_transparency_information_message_record.secondary_order_id_2[quote_market_pre_transparency_information_message_at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> wire[at] = quote_market_pre_transparency_information_message_record.priority_[quote_market_pre_transparency_information_message_at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> wire[at] = quote_market_pre_transparency_information_message_record.price[quote_market_pre_transparency_information_message_at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> wire[at] = quote_market_pre_transparency_information_message_record.display_qty[quote_market_pre_transparency_information_message_at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> wire[at] = quote_market_pre_transparency_information_message_record.priority_2[quote_market_pre_transparency_information_message_at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> wire[at] = quote_market_pre_transparency_information_message_record.price_2[quote_market_pre_transparency_information_message_at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> wire[at] = quote_market_pre_transparency_information_message_record.display_qty_2[quote_market_pre_transparency_information_message_at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Market Pre Transparency Information Message off the wire, 56 bytes from where the cursor stands */
inline decode_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_record) {
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.sequence_number[quote_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.security_code[quote_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> quote_market_pre_transparency_information_message_record.transaction_date_and_time[quote_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.secondary_order_id[quote_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.secondary_order_id_2[quote_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.priority_[quote_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> quote_market_pre_transparency_information_message_record.price[quote_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.display_qty[quote_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.priority_2[quote_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> quote_market_pre_transparency_information_message_record.price_2[quote_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> quote_market_pre_transparency_information_message_record.display_qty_2[quote_market_pre_transparency_information_message_at] = wire[at]; at = at + 1; quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Market Pre Transparency Information Message is what was written, byte for byte */
inline equal_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_read, quote_market_pre_transparency_information_message_written) {
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> assert(quote_market_pre_transparency_information_message_read.sequence_number[quote_market_pre_transparency_information_message_at] == quote_market_pre_transparency_information_message_written.sequence_number[quote_market_pre_transparency_information_message_at]); quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> assert(quote_market_pre_transparency_information_message_read.security_code[quote_market_pre_transparency_information_message_at] == quote_market_pre_transparency_information_message_written.security_code[quote_market_pre_transparency_information_message_at]); quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> assert(quote_market_pre_transparency_information_message_read.transaction_date_and_time[quote_market_pre_transparency_information_message_at] == quote_market_pre_transparency_information_message_written.transaction_date_and_time[quote_market_pre_transparency_information_message_at]); quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> assert(quote_market_pre_transparency_information_message_read.secondary_order_id[quote_market_pre_transparency_information_message_at] == quote_market_pre_transparency_information_message_written.secondary_order_id[quote_market_pre_transparency_information_message_at]); quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> assert(quote_market_pre_transparency_information_message_read.secondary_order_id_2[quote_market_pre_transparency_information_message_at] == quote_market_pre_transparency_information_message_written.secondary_order_id_2[quote_market_pre_transparency_information_message_at]); quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> assert(quote_market_pre_transparency_information_message_read.priority_[quote_market_pre_transparency_information_message_at] == quote_market_pre_transparency_information_message_written.priority_[quote_market_pre_transparency_information_message_at]); quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> assert(quote_market_pre_transparency_information_message_read.price[quote_market_pre_transparency_information_message_at] == quote_market_pre_transparency_information_message_written.price[quote_market_pre_transparency_information_message_at]); quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> assert(quote_market_pre_transparency_information_message_read.display_qty[quote_market_pre_transparency_information_message_at] == quote_market_pre_transparency_information_message_written.display_qty[quote_market_pre_transparency_information_message_at]); quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> assert(quote_market_pre_transparency_information_message_read.priority_2[quote_market_pre_transparency_information_message_at] == quote_market_pre_transparency_information_message_written.priority_2[quote_market_pre_transparency_information_message_at]); quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 8 -> assert(quote_market_pre_transparency_information_message_read.price_2[quote_market_pre_transparency_information_message_at] == quote_market_pre_transparency_information_message_written.price_2[quote_market_pre_transparency_information_message_at]); quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  quote_market_pre_transparency_information_message_at = 0;
  do
  :: quote_market_pre_transparency_information_message_at < 4 -> assert(quote_market_pre_transparency_information_message_read.display_qty_2[quote_market_pre_transparency_information_message_at] == quote_market_pre_transparency_information_message_written.display_qty_2[quote_market_pre_transparency_information_message_at]); quote_market_pre_transparency_information_message_at = quote_market_pre_transparency_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancellation Market Member Message: 24 bytes ---------------------- */

/* Used by the Server to communicate information order cancellation. The same message is used in Full-Depth data feeds (for order cancellations of any user), in the Order Entry Server (for cancellations of user orders) and in the Market & Order Server (for order cancellations of any user) */
typedef OrderCancellationMarketMemberMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte secondary_order_id[4];
  byte entry_date[4]
};

int order_cancellation_market_member_message_at;

/* every byte of Order Cancellation Market Member Message set to one value */
inline fill_order_cancellation_market_member_message(order_cancellation_market_member_message_record, order_cancellation_market_member_message_value) {
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.sequence_number[order_cancellation_market_member_message_at] = order_cancellation_market_member_message_value; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.security_code[order_cancellation_market_member_message_at] = order_cancellation_market_member_message_value; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 8 -> order_cancellation_market_member_message_record.transaction_date_and_time[order_cancellation_market_member_message_at] = order_cancellation_market_member_message_value; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.secondary_order_id[order_cancellation_market_member_message_at] = order_cancellation_market_member_message_value; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.entry_date[order_cancellation_market_member_message_at] = order_cancellation_market_member_message_value; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancellation Market Member Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancellation_market_member_message(order_cancellation_market_member_message_record, order_cancellation_market_member_message_base) {
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.sequence_number[order_cancellation_market_member_message_at] = (order_cancellation_market_member_message_base + 0 + order_cancellation_market_member_message_at + 1) % 256; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.security_code[order_cancellation_market_member_message_at] = (order_cancellation_market_member_message_base + 4 + order_cancellation_market_member_message_at + 1) % 256; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 8 -> order_cancellation_market_member_message_record.transaction_date_and_time[order_cancellation_market_member_message_at] = (order_cancellation_market_member_message_base + 8 + order_cancellation_market_member_message_at + 1) % 256; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.secondary_order_id[order_cancellation_market_member_message_at] = (order_cancellation_market_member_message_base + 16 + order_cancellation_market_member_message_at + 1) % 256; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.entry_date[order_cancellation_market_member_message_at] = (order_cancellation_market_member_message_base + 20 + order_cancellation_market_member_message_at + 1) % 256; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Market Member Message to the wire, 24 bytes from where the cursor stands */
inline encode_order_cancellation_market_member_message(order_cancellation_market_member_message_record) {
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> wire[at] = order_cancellation_market_member_message_record.sequence_number[order_cancellation_market_member_message_at]; at = at + 1; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> wire[at] = order_cancellation_market_member_message_record.security_code[order_cancellation_market_member_message_at]; at = at + 1; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 8 -> wire[at] = order_cancellation_market_member_message_record.transaction_date_and_time[order_cancellation_market_member_message_at]; at = at + 1; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> wire[at] = order_cancellation_market_member_message_record.secondary_order_id[order_cancellation_market_member_message_at]; at = at + 1; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> wire[at] = order_cancellation_market_member_message_record.entry_date[order_cancellation_market_member_message_at]; at = at + 1; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Market Member Message off the wire, 24 bytes from where the cursor stands */
inline decode_order_cancellation_market_member_message(order_cancellation_market_member_message_record) {
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.sequence_number[order_cancellation_market_member_message_at] = wire[at]; at = at + 1; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.security_code[order_cancellation_market_member_message_at] = wire[at]; at = at + 1; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 8 -> order_cancellation_market_member_message_record.transaction_date_and_time[order_cancellation_market_member_message_at] = wire[at]; at = at + 1; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.secondary_order_id[order_cancellation_market_member_message_at] = wire[at]; at = at + 1; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> order_cancellation_market_member_message_record.entry_date[order_cancellation_market_member_message_at] = wire[at]; at = at + 1; order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancellation Market Member Message is what was written, byte for byte */
inline equal_order_cancellation_market_member_message(order_cancellation_market_member_message_read, order_cancellation_market_member_message_written) {
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> assert(order_cancellation_market_member_message_read.sequence_number[order_cancellation_market_member_message_at] == order_cancellation_market_member_message_written.sequence_number[order_cancellation_market_member_message_at]); order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> assert(order_cancellation_market_member_message_read.security_code[order_cancellation_market_member_message_at] == order_cancellation_market_member_message_written.security_code[order_cancellation_market_member_message_at]); order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 8 -> assert(order_cancellation_market_member_message_read.transaction_date_and_time[order_cancellation_market_member_message_at] == order_cancellation_market_member_message_written.transaction_date_and_time[order_cancellation_market_member_message_at]); order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> assert(order_cancellation_market_member_message_read.secondary_order_id[order_cancellation_market_member_message_at] == order_cancellation_market_member_message_written.secondary_order_id[order_cancellation_market_member_message_at]); order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  order_cancellation_market_member_message_at = 0;
  do
  :: order_cancellation_market_member_message_at < 4 -> assert(order_cancellation_market_member_message_read.entry_date[order_cancellation_market_member_message_at] == order_cancellation_market_member_message_written.entry_date[order_cancellation_market_member_message_at]); order_cancellation_market_member_message_at = order_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Cancellation Market Member Message: 24 bytes ---------------------- */

/* Used by the Server to communicate information about quote cancellation. The same message is used in Full-Depth data feeds (for quote cancellations of any user), in the Order Entry Server (for cancellations of user quotes) and in the Market & Order Server (for quote cancellations of any user) */
typedef QuoteCancellationMarketMemberMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte secondary_order_id[4];
  byte secondary_order_id_2[4]
};

int quote_cancellation_market_member_message_at;

/* every byte of Quote Cancellation Market Member Message set to one value */
inline fill_quote_cancellation_market_member_message(quote_cancellation_market_member_message_record, quote_cancellation_market_member_message_value) {
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.sequence_number[quote_cancellation_market_member_message_at] = quote_cancellation_market_member_message_value; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.security_code[quote_cancellation_market_member_message_at] = quote_cancellation_market_member_message_value; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 8 -> quote_cancellation_market_member_message_record.transaction_date_and_time[quote_cancellation_market_member_message_at] = quote_cancellation_market_member_message_value; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.secondary_order_id[quote_cancellation_market_member_message_at] = quote_cancellation_market_member_message_value; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.secondary_order_id_2[quote_cancellation_market_member_message_at] = quote_cancellation_market_member_message_value; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Cancellation Market Member Message set to where it lies, so a field read out of place says so */
inline ramp_quote_cancellation_market_member_message(quote_cancellation_market_member_message_record, quote_cancellation_market_member_message_base) {
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.sequence_number[quote_cancellation_market_member_message_at] = (quote_cancellation_market_member_message_base + 0 + quote_cancellation_market_member_message_at + 1) % 256; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.security_code[quote_cancellation_market_member_message_at] = (quote_cancellation_market_member_message_base + 4 + quote_cancellation_market_member_message_at + 1) % 256; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 8 -> quote_cancellation_market_member_message_record.transaction_date_and_time[quote_cancellation_market_member_message_at] = (quote_cancellation_market_member_message_base + 8 + quote_cancellation_market_member_message_at + 1) % 256; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.secondary_order_id[quote_cancellation_market_member_message_at] = (quote_cancellation_market_member_message_base + 16 + quote_cancellation_market_member_message_at + 1) % 256; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.secondary_order_id_2[quote_cancellation_market_member_message_at] = (quote_cancellation_market_member_message_base + 20 + quote_cancellation_market_member_message_at + 1) % 256; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Cancellation Market Member Message to the wire, 24 bytes from where the cursor stands */
inline encode_quote_cancellation_market_member_message(quote_cancellation_market_member_message_record) {
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> wire[at] = quote_cancellation_market_member_message_record.sequence_number[quote_cancellation_market_member_message_at]; at = at + 1; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> wire[at] = quote_cancellation_market_member_message_record.security_code[quote_cancellation_market_member_message_at]; at = at + 1; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 8 -> wire[at] = quote_cancellation_market_member_message_record.transaction_date_and_time[quote_cancellation_market_member_message_at]; at = at + 1; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> wire[at] = quote_cancellation_market_member_message_record.secondary_order_id[quote_cancellation_market_member_message_at]; at = at + 1; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> wire[at] = quote_cancellation_market_member_message_record.secondary_order_id_2[quote_cancellation_market_member_message_at]; at = at + 1; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Cancellation Market Member Message off the wire, 24 bytes from where the cursor stands */
inline decode_quote_cancellation_market_member_message(quote_cancellation_market_member_message_record) {
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.sequence_number[quote_cancellation_market_member_message_at] = wire[at]; at = at + 1; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.security_code[quote_cancellation_market_member_message_at] = wire[at]; at = at + 1; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 8 -> quote_cancellation_market_member_message_record.transaction_date_and_time[quote_cancellation_market_member_message_at] = wire[at]; at = at + 1; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.secondary_order_id[quote_cancellation_market_member_message_at] = wire[at]; at = at + 1; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> quote_cancellation_market_member_message_record.secondary_order_id_2[quote_cancellation_market_member_message_at] = wire[at]; at = at + 1; quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Cancellation Market Member Message is what was written, byte for byte */
inline equal_quote_cancellation_market_member_message(quote_cancellation_market_member_message_read, quote_cancellation_market_member_message_written) {
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> assert(quote_cancellation_market_member_message_read.sequence_number[quote_cancellation_market_member_message_at] == quote_cancellation_market_member_message_written.sequence_number[quote_cancellation_market_member_message_at]); quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> assert(quote_cancellation_market_member_message_read.security_code[quote_cancellation_market_member_message_at] == quote_cancellation_market_member_message_written.security_code[quote_cancellation_market_member_message_at]); quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 8 -> assert(quote_cancellation_market_member_message_read.transaction_date_and_time[quote_cancellation_market_member_message_at] == quote_cancellation_market_member_message_written.transaction_date_and_time[quote_cancellation_market_member_message_at]); quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> assert(quote_cancellation_market_member_message_read.secondary_order_id[quote_cancellation_market_member_message_at] == quote_cancellation_market_member_message_written.secondary_order_id[quote_cancellation_market_member_message_at]); quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  quote_cancellation_market_member_message_at = 0;
  do
  :: quote_cancellation_market_member_message_at < 4 -> assert(quote_cancellation_market_member_message_read.secondary_order_id_2[quote_cancellation_market_member_message_at] == quote_cancellation_market_member_message_written.secondary_order_id_2[quote_cancellation_market_member_message_at]); quote_cancellation_market_member_message_at = quote_cancellation_market_member_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Market Post Transparency Information Top Of Book Message: 54 bytes ---- */

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
  byte transaction_category;
  byte strategy_trd_match_id[4]
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
  trade_market_post_transparency_information_top_of_book_message_record.transaction_category = trade_market_post_transparency_information_top_of_book_message_value;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.strategy_trd_match_id[trade_market_post_transparency_information_top_of_book_message_at] = trade_market_post_transparency_information_top_of_book_message_value; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
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
  trade_market_post_transparency_information_top_of_book_message_record.transaction_category = (trade_market_post_transparency_information_top_of_book_message_base + 49 + 1) % 256;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.strategy_trd_match_id[trade_market_post_transparency_information_top_of_book_message_at] = (trade_market_post_transparency_information_top_of_book_message_base + 50 + trade_market_post_transparency_information_top_of_book_message_at + 1) % 256; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Market Post Transparency Information Top Of Book Message to the wire, 54 bytes from where the cursor stands */
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
  wire[at] = trade_market_post_transparency_information_top_of_book_message_record.transaction_category; at = at + 1;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> wire[at] = trade_market_post_transparency_information_top_of_book_message_record.strategy_trd_match_id[trade_market_post_transparency_information_top_of_book_message_at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Market Post Transparency Information Top Of Book Message off the wire, 54 bytes from where the cursor stands */
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
  trade_market_post_transparency_information_top_of_book_message_record.transaction_category = wire[at]; at = at + 1;
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> trade_market_post_transparency_information_top_of_book_message_record.strategy_trd_match_id[trade_market_post_transparency_information_top_of_book_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
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
  assert(trade_market_post_transparency_information_top_of_book_message_read.transaction_category == trade_market_post_transparency_information_top_of_book_message_written.transaction_category);
  trade_market_post_transparency_information_top_of_book_message_at = 0;
  do
  :: trade_market_post_transparency_information_top_of_book_message_at < 4 -> assert(trade_market_post_transparency_information_top_of_book_message_read.strategy_trd_match_id[trade_market_post_transparency_information_top_of_book_message_at] == trade_market_post_transparency_information_top_of_book_message_written.strategy_trd_match_id[trade_market_post_transparency_information_top_of_book_message_at]); trade_market_post_transparency_information_top_of_book_message_at = trade_market_post_transparency_information_top_of_book_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Trade Amendment Or Cancellation Message: 89 bytes ----------------- */

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
  byte transaction_category;
  byte strategy_trd_match_id[4];
  byte last_change_flag;
  byte benc_rfpt_flag;
  byte trade_price_condition;
  byte pre_trade_transparency_waiver;
  byte deferral_waiver;
  byte post_deferral_publication_type;
  byte publish_date_and_time[8];
  byte trade_date[8];
  byte trade_session_date[4];
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
  trade_trade_amendment_or_cancellation_message_record.transaction_category = trade_trade_amendment_or_cancellation_message_value;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.strategy_trd_match_id[trade_trade_amendment_or_cancellation_message_at] = trade_trade_amendment_or_cancellation_message_value; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
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
  trade_trade_amendment_or_cancellation_message_record.transaction_category = (trade_trade_amendment_or_cancellation_message_base + 49 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.strategy_trd_match_id[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 50 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.last_change_flag = (trade_trade_amendment_or_cancellation_message_base + 54 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.benc_rfpt_flag = (trade_trade_amendment_or_cancellation_message_base + 55 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.trade_price_condition = (trade_trade_amendment_or_cancellation_message_base + 56 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.pre_trade_transparency_waiver = (trade_trade_amendment_or_cancellation_message_base + 57 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.deferral_waiver = (trade_trade_amendment_or_cancellation_message_base + 58 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_record.post_deferral_publication_type = (trade_trade_amendment_or_cancellation_message_base + 59 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.publish_date_and_time[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 60 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 8 -> trade_trade_amendment_or_cancellation_message_record.trade_date[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 68 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.trade_session_date[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 76 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_record.amended_trade_type = (trade_trade_amendment_or_cancellation_message_base + 80 + 1) % 256;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.exec_ref_id[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 81 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.amended_trade_date[trade_trade_amendment_or_cancellation_message_at] = (trade_trade_amendment_or_cancellation_message_base + 85 + trade_trade_amendment_or_cancellation_message_at + 1) % 256; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Trade Amendment Or Cancellation Message to the wire, 89 bytes from where the cursor stands */
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
  wire[at] = trade_trade_amendment_or_cancellation_message_record.transaction_category; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> wire[at] = trade_trade_amendment_or_cancellation_message_record.strategy_trd_match_id[trade_trade_amendment_or_cancellation_message_at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
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

/* Trade Trade Amendment Or Cancellation Message off the wire, 89 bytes from where the cursor stands */
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
  trade_trade_amendment_or_cancellation_message_record.transaction_category = wire[at]; at = at + 1;
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> trade_trade_amendment_or_cancellation_message_record.strategy_trd_match_id[trade_trade_amendment_or_cancellation_message_at] = wire[at]; at = at + 1; trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
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
  assert(trade_trade_amendment_or_cancellation_message_read.transaction_category == trade_trade_amendment_or_cancellation_message_written.transaction_category);
  trade_trade_amendment_or_cancellation_message_at = 0;
  do
  :: trade_trade_amendment_or_cancellation_message_at < 4 -> assert(trade_trade_amendment_or_cancellation_message_read.strategy_trd_match_id[trade_trade_amendment_or_cancellation_message_at] == trade_trade_amendment_or_cancellation_message_written.strategy_trd_match_id[trade_trade_amendment_or_cancellation_message_at]); trade_trade_amendment_or_cancellation_message_at = trade_trade_amendment_or_cancellation_message_at + 1
  :: else -> break
  od;
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

/* ---- Trade Market Post Transparency Information Full Depth Message: 104 bytes ---- */

/* Used by the server to communicate trade information related to trades resulting from order matching. The message also contains the situation in which the relevant orders will remain in the books */
typedef TradeMarketPostTransparencyInformationFullDepthMessage {
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
  byte transaction_category;
  byte strategy_trd_match_id[4];
  byte secondary_order_id[4];
  byte entry_date[4];
  byte priority_[4];
  byte price[8];
  byte display_qty[4];
  byte retail_cl_flag;
  byte secondary_order_id_2[4];
  byte entry_date_2[4];
  byte priority_2[4];
  byte price_2[8];
  byte display_qty_2[4];
  byte retail_cl_flag_2
};

int trade_market_post_transparency_information_full_depth_message_at;

/* every byte of Trade Market Post Transparency Information Full Depth Message set to one value */
inline fill_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_record, trade_market_post_transparency_information_full_depth_message_value) {
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.sequence_number[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.security_code[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.transaction_date_and_time[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.market_segment_id[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.trading_session_id = trade_market_post_transparency_information_full_depth_message_value;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.trd_match_id[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.trade_type = trade_market_post_transparency_information_full_depth_message_value;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.last_px[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.last_qty[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.gross_trade_amt[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.designation = trade_market_post_transparency_information_full_depth_message_value;
  trade_market_post_transparency_information_full_depth_message_record.market_mechanism = trade_market_post_transparency_information_full_depth_message_value;
  trade_market_post_transparency_information_full_depth_message_record.algo_flag = trade_market_post_transparency_information_full_depth_message_value;
  trade_market_post_transparency_information_full_depth_message_record.transaction_category = trade_market_post_transparency_information_full_depth_message_value;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.strategy_trd_match_id[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.secondary_order_id[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.entry_date[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.priority_[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.price[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.display_qty[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.retail_cl_flag = trade_market_post_transparency_information_full_depth_message_value;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.secondary_order_id_2[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.entry_date_2[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.priority_2[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.price_2[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.display_qty_2[trade_market_post_transparency_information_full_depth_message_at] = trade_market_post_transparency_information_full_depth_message_value; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.retail_cl_flag_2 = trade_market_post_transparency_information_full_depth_message_value;
  skip
}

/* each byte of Trade Market Post Transparency Information Full Depth Message set to where it lies, so a field read out of place says so */
inline ramp_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_record, trade_market_post_transparency_information_full_depth_message_base) {
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.sequence_number[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 0 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.security_code[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 4 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.transaction_date_and_time[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 8 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.market_segment_id[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 16 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.trading_session_id = (trade_market_post_transparency_information_full_depth_message_base + 20 + 1) % 256;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.trd_match_id[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 21 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.trade_type = (trade_market_post_transparency_information_full_depth_message_base + 25 + 1) % 256;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.last_px[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 26 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.last_qty[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 34 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.gross_trade_amt[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 38 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.designation = (trade_market_post_transparency_information_full_depth_message_base + 46 + 1) % 256;
  trade_market_post_transparency_information_full_depth_message_record.market_mechanism = (trade_market_post_transparency_information_full_depth_message_base + 47 + 1) % 256;
  trade_market_post_transparency_information_full_depth_message_record.algo_flag = (trade_market_post_transparency_information_full_depth_message_base + 48 + 1) % 256;
  trade_market_post_transparency_information_full_depth_message_record.transaction_category = (trade_market_post_transparency_information_full_depth_message_base + 49 + 1) % 256;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.strategy_trd_match_id[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 50 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.secondary_order_id[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 54 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.entry_date[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 58 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.priority_[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 62 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.price[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 66 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.display_qty[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 74 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.retail_cl_flag = (trade_market_post_transparency_information_full_depth_message_base + 78 + 1) % 256;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.secondary_order_id_2[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 79 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.entry_date_2[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 83 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.priority_2[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 87 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.price_2[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 91 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.display_qty_2[trade_market_post_transparency_information_full_depth_message_at] = (trade_market_post_transparency_information_full_depth_message_base + 99 + trade_market_post_transparency_information_full_depth_message_at + 1) % 256; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.retail_cl_flag_2 = (trade_market_post_transparency_information_full_depth_message_base + 103 + 1) % 256;
  skip
}

/* Trade Market Post Transparency Information Full Depth Message to the wire, 104 bytes from where the cursor stands */
inline encode_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_record) {
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.sequence_number[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.security_code[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.transaction_date_and_time[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.market_segment_id[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_market_post_transparency_information_full_depth_message_record.trading_session_id; at = at + 1;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.trd_match_id[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_market_post_transparency_information_full_depth_message_record.trade_type; at = at + 1;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.last_px[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.last_qty[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.gross_trade_amt[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_market_post_transparency_information_full_depth_message_record.designation; at = at + 1;
  wire[at] = trade_market_post_transparency_information_full_depth_message_record.market_mechanism; at = at + 1;
  wire[at] = trade_market_post_transparency_information_full_depth_message_record.algo_flag; at = at + 1;
  wire[at] = trade_market_post_transparency_information_full_depth_message_record.transaction_category; at = at + 1;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.strategy_trd_match_id[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.secondary_order_id[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.entry_date[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.priority_[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.price[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.display_qty[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_market_post_transparency_information_full_depth_message_record.retail_cl_flag; at = at + 1;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.secondary_order_id_2[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.entry_date_2[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.priority_2[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.price_2[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> wire[at] = trade_market_post_transparency_information_full_depth_message_record.display_qty_2[trade_market_post_transparency_information_full_depth_message_at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_market_post_transparency_information_full_depth_message_record.retail_cl_flag_2; at = at + 1;
  skip
}

/* Trade Market Post Transparency Information Full Depth Message off the wire, 104 bytes from where the cursor stands */
inline decode_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_record) {
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.sequence_number[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.security_code[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.transaction_date_and_time[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.market_segment_id[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.trading_session_id = wire[at]; at = at + 1;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.trd_match_id[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.trade_type = wire[at]; at = at + 1;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.last_px[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.last_qty[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.gross_trade_amt[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.designation = wire[at]; at = at + 1;
  trade_market_post_transparency_information_full_depth_message_record.market_mechanism = wire[at]; at = at + 1;
  trade_market_post_transparency_information_full_depth_message_record.algo_flag = wire[at]; at = at + 1;
  trade_market_post_transparency_information_full_depth_message_record.transaction_category = wire[at]; at = at + 1;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.strategy_trd_match_id[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.secondary_order_id[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.entry_date[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.priority_[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.price[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.display_qty[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.retail_cl_flag = wire[at]; at = at + 1;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.secondary_order_id_2[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.entry_date_2[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.priority_2[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> trade_market_post_transparency_information_full_depth_message_record.price_2[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> trade_market_post_transparency_information_full_depth_message_record.display_qty_2[trade_market_post_transparency_information_full_depth_message_at] = wire[at]; at = at + 1; trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_record.retail_cl_flag_2 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Market Post Transparency Information Full Depth Message is what was written, byte for byte */
inline equal_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_read, trade_market_post_transparency_information_full_depth_message_written) {
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.sequence_number[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.sequence_number[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.security_code[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.security_code[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> assert(trade_market_post_transparency_information_full_depth_message_read.transaction_date_and_time[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.transaction_date_and_time[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.market_segment_id[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.market_segment_id[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  assert(trade_market_post_transparency_information_full_depth_message_read.trading_session_id == trade_market_post_transparency_information_full_depth_message_written.trading_session_id);
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.trd_match_id[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.trd_match_id[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  assert(trade_market_post_transparency_information_full_depth_message_read.trade_type == trade_market_post_transparency_information_full_depth_message_written.trade_type);
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> assert(trade_market_post_transparency_information_full_depth_message_read.last_px[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.last_px[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.last_qty[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.last_qty[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> assert(trade_market_post_transparency_information_full_depth_message_read.gross_trade_amt[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.gross_trade_amt[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  assert(trade_market_post_transparency_information_full_depth_message_read.designation == trade_market_post_transparency_information_full_depth_message_written.designation);
  assert(trade_market_post_transparency_information_full_depth_message_read.market_mechanism == trade_market_post_transparency_information_full_depth_message_written.market_mechanism);
  assert(trade_market_post_transparency_information_full_depth_message_read.algo_flag == trade_market_post_transparency_information_full_depth_message_written.algo_flag);
  assert(trade_market_post_transparency_information_full_depth_message_read.transaction_category == trade_market_post_transparency_information_full_depth_message_written.transaction_category);
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.strategy_trd_match_id[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.strategy_trd_match_id[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.secondary_order_id[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.secondary_order_id[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.entry_date[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.entry_date[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.priority_[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.priority_[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> assert(trade_market_post_transparency_information_full_depth_message_read.price[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.price[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.display_qty[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.display_qty[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  assert(trade_market_post_transparency_information_full_depth_message_read.retail_cl_flag == trade_market_post_transparency_information_full_depth_message_written.retail_cl_flag);
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.secondary_order_id_2[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.secondary_order_id_2[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.entry_date_2[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.entry_date_2[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.priority_2[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.priority_2[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 8 -> assert(trade_market_post_transparency_information_full_depth_message_read.price_2[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.price_2[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  trade_market_post_transparency_information_full_depth_message_at = 0;
  do
  :: trade_market_post_transparency_information_full_depth_message_at < 4 -> assert(trade_market_post_transparency_information_full_depth_message_read.display_qty_2[trade_market_post_transparency_information_full_depth_message_at] == trade_market_post_transparency_information_full_depth_message_written.display_qty_2[trade_market_post_transparency_information_full_depth_message_at]); trade_market_post_transparency_information_full_depth_message_at = trade_market_post_transparency_information_full_depth_message_at + 1
  :: else -> break
  od;
  assert(trade_market_post_transparency_information_full_depth_message_read.retail_cl_flag_2 == trade_market_post_transparency_information_full_depth_message_written.retail_cl_flag_2);
  skip
}

/* ---- Indication Of Interest Message: 36 bytes -------------------------------- */

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
  byte ioi_qlty_ind;
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
  indication_of_interest_message_record.ioi_qlty_ind = indication_of_interest_message_value;
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
  indication_of_interest_message_record.ioi_qlty_ind = (indication_of_interest_message_base + 34 + 1) % 256;
  indication_of_interest_message_record.trading_session_id = (indication_of_interest_message_base + 35 + 1) % 256;
  skip
}

/* Indication Of Interest Message to the wire, 36 bytes from where the cursor stands */
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
  wire[at] = indication_of_interest_message_record.ioi_qlty_ind; at = at + 1;
  wire[at] = indication_of_interest_message_record.trading_session_id; at = at + 1;
  skip
}

/* Indication Of Interest Message off the wire, 36 bytes from where the cursor stands */
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
  indication_of_interest_message_record.ioi_qlty_ind = wire[at]; at = at + 1;
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
  assert(indication_of_interest_message_read.ioi_qlty_ind == indication_of_interest_message_written.ioi_qlty_ind);
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

/* ---- Top Of Book Message: 46 bytes ------------------------------------------- */

/* Used by the UDP Servers to communicate Top-of-book price information during auctions. When there is an indicative match price, the fields BidPx1 and AskPx1 will have the same value */
typedef TopOfBookMessage {
  byte sequence_number[4];
  byte security_code[4];
  byte transaction_date_and_time[8];
  byte bid_orders_1[2];
  byte bid_size_1[4];
  byte bid_px_1[8];
  byte retail_cl_bid_flag_1;
  byte ask_orders_1[2];
  byte ask_size_1[4];
  byte ask_px_1[8];
  byte retail_cl_ask_flag_1
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
  top_of_book_message_record.retail_cl_bid_flag_1 = top_of_book_message_value;
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
  top_of_book_message_record.retail_cl_ask_flag_1 = top_of_book_message_value;
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
  top_of_book_message_record.retail_cl_bid_flag_1 = (top_of_book_message_base + 30 + 1) % 256;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 2 -> top_of_book_message_record.ask_orders_1[top_of_book_message_at] = (top_of_book_message_base + 31 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.ask_size_1[top_of_book_message_at] = (top_of_book_message_base + 33 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.ask_px_1[top_of_book_message_at] = (top_of_book_message_base + 37 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_record.retail_cl_ask_flag_1 = (top_of_book_message_base + 45 + 1) % 256;
  skip
}

/* Top Of Book Message to the wire, 46 bytes from where the cursor stands */
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
  wire[at] = top_of_book_message_record.retail_cl_bid_flag_1; at = at + 1;
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
  wire[at] = top_of_book_message_record.retail_cl_ask_flag_1; at = at + 1;
  skip
}

/* Top Of Book Message off the wire, 46 bytes from where the cursor stands */
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
  top_of_book_message_record.retail_cl_bid_flag_1 = wire[at]; at = at + 1;
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
  top_of_book_message_record.retail_cl_ask_flag_1 = wire[at]; at = at + 1;
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
  assert(top_of_book_message_read.retail_cl_bid_flag_1 == top_of_book_message_written.retail_cl_bid_flag_1);
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
  assert(top_of_book_message_read.retail_cl_ask_flag_1 == top_of_book_message_written.retail_cl_ask_flag_1);
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
    assert(at == 53);
    at = 0;
    decode_logon_message(logon_message_got);
    assert(at == 53);
    equal_logon_message(logon_message_got, logon_message_sent)
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
    assert(at == 70);
    at = 0;
    decode_reject_message(reject_message_got);
    assert(at == 70);
    equal_reject_message(reject_message_got, reject_message_sent)
  }
}

/* Replay Request Message: encoded, read back, and compared */
proctype check_replay_request_message() {
  ReplayRequestMessage replay_request_message_sent;
  ReplayRequestMessage replay_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_request_message(replay_request_message_sent, 0)
  :: pattern == 1 -> fill_replay_request_message(replay_request_message_sent, 32)
  :: pattern == 2 -> fill_replay_request_message(replay_request_message_sent, 255)
  :: else -> ramp_replay_request_message(replay_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_request_message(replay_request_message_sent);
    assert(at == 12);
    at = 0;
    decode_replay_request_message(replay_request_message_got);
    assert(at == 12);
    equal_replay_request_message(replay_request_message_got, replay_request_message_sent)
  }
}

/* Replay Request Ack Nack Message: encoded, read back, and compared */
proctype check_replay_request_ack_nack_message() {
  ReplayRequestAckNackMessage replay_request_ack_nack_message_sent;
  ReplayRequestAckNackMessage replay_request_ack_nack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_replay_request_ack_nack_message(replay_request_ack_nack_message_sent, 0)
  :: pattern == 1 -> fill_replay_request_ack_nack_message(replay_request_ack_nack_message_sent, 32)
  :: pattern == 2 -> fill_replay_request_ack_nack_message(replay_request_ack_nack_message_sent, 255)
  :: else -> ramp_replay_request_ack_nack_message(replay_request_ack_nack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_replay_request_ack_nack_message(replay_request_ack_nack_message_sent);
    assert(at == 17);
    at = 0;
    decode_replay_request_ack_nack_message(replay_request_ack_nack_message_got);
    assert(at == 17);
    equal_replay_request_ack_nack_message(replay_request_ack_nack_message_got, replay_request_ack_nack_message_sent)
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
    assert(at == 713);
    at = 0;
    decode_security_list_message(security_list_message_got);
    assert(at == 713);
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
    assert(at == 713);
    at = 0;
    decode_security_list_update_report_message(security_list_update_report_message_got);
    assert(at == 713);
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
    assert(at == 34);
    at = 0;
    decode_security_status_message(security_status_message_got);
    assert(at == 34);
    equal_security_status_message(security_status_message_got, security_status_message_sent)
  }
}

/* Family Status Message: encoded, read back, and compared */
proctype check_family_status_message() {
  FamilyStatusMessage family_status_message_sent;
  FamilyStatusMessage family_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_family_status_message(family_status_message_sent, 0)
  :: pattern == 1 -> fill_family_status_message(family_status_message_sent, 32)
  :: pattern == 2 -> fill_family_status_message(family_status_message_sent, 255)
  :: else -> ramp_family_status_message(family_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_family_status_message(family_status_message_sent);
    assert(at == 21);
    at = 0;
    decode_family_status_message(family_status_message_got);
    assert(at == 21);
    equal_family_status_message(family_status_message_got, family_status_message_sent)
  }
}

/* Order Book Clear Message: encoded, read back, and compared */
proctype check_order_book_clear_message() {
  OrderBookClearMessage order_book_clear_message_sent;
  OrderBookClearMessage order_book_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_clear_message(order_book_clear_message_sent, 0)
  :: pattern == 1 -> fill_order_book_clear_message(order_book_clear_message_sent, 32)
  :: pattern == 2 -> fill_order_book_clear_message(order_book_clear_message_sent, 255)
  :: else -> ramp_order_book_clear_message(order_book_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_clear_message(order_book_clear_message_sent);
    assert(at == 16);
    at = 0;
    decode_order_book_clear_message(order_book_clear_message_got);
    assert(at == 16);
    equal_order_book_clear_message(order_book_clear_message_got, order_book_clear_message_sent)
  }
}

/* Order Market Pre Transparency Information Message: encoded, read back, and compared */
proctype check_order_market_pre_transparency_information_message() {
  OrderMarketPreTransparencyInformationMessage order_market_pre_transparency_information_message_sent;
  OrderMarketPreTransparencyInformationMessage order_market_pre_transparency_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_sent, 0)
  :: pattern == 1 -> fill_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_sent, 32)
  :: pattern == 2 -> fill_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_sent, 255)
  :: else -> ramp_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_sent);
    assert(at == 42);
    at = 0;
    decode_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_got);
    assert(at == 42);
    equal_order_market_pre_transparency_information_message(order_market_pre_transparency_information_message_got, order_market_pre_transparency_information_message_sent)
  }
}

/* Quote Market Pre Transparency Information Message: encoded, read back, and compared */
proctype check_quote_market_pre_transparency_information_message() {
  QuoteMarketPreTransparencyInformationMessage quote_market_pre_transparency_information_message_sent;
  QuoteMarketPreTransparencyInformationMessage quote_market_pre_transparency_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_sent, 0)
  :: pattern == 1 -> fill_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_sent, 32)
  :: pattern == 2 -> fill_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_sent, 255)
  :: else -> ramp_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_sent);
    assert(at == 56);
    at = 0;
    decode_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_got);
    assert(at == 56);
    equal_quote_market_pre_transparency_information_message(quote_market_pre_transparency_information_message_got, quote_market_pre_transparency_information_message_sent)
  }
}

/* Order Cancellation Market Member Message: encoded, read back, and compared */
proctype check_order_cancellation_market_member_message() {
  OrderCancellationMarketMemberMessage order_cancellation_market_member_message_sent;
  OrderCancellationMarketMemberMessage order_cancellation_market_member_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancellation_market_member_message(order_cancellation_market_member_message_sent, 0)
  :: pattern == 1 -> fill_order_cancellation_market_member_message(order_cancellation_market_member_message_sent, 32)
  :: pattern == 2 -> fill_order_cancellation_market_member_message(order_cancellation_market_member_message_sent, 255)
  :: else -> ramp_order_cancellation_market_member_message(order_cancellation_market_member_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancellation_market_member_message(order_cancellation_market_member_message_sent);
    assert(at == 24);
    at = 0;
    decode_order_cancellation_market_member_message(order_cancellation_market_member_message_got);
    assert(at == 24);
    equal_order_cancellation_market_member_message(order_cancellation_market_member_message_got, order_cancellation_market_member_message_sent)
  }
}

/* Quote Cancellation Market Member Message: encoded, read back, and compared */
proctype check_quote_cancellation_market_member_message() {
  QuoteCancellationMarketMemberMessage quote_cancellation_market_member_message_sent;
  QuoteCancellationMarketMemberMessage quote_cancellation_market_member_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_cancellation_market_member_message(quote_cancellation_market_member_message_sent, 0)
  :: pattern == 1 -> fill_quote_cancellation_market_member_message(quote_cancellation_market_member_message_sent, 32)
  :: pattern == 2 -> fill_quote_cancellation_market_member_message(quote_cancellation_market_member_message_sent, 255)
  :: else -> ramp_quote_cancellation_market_member_message(quote_cancellation_market_member_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_cancellation_market_member_message(quote_cancellation_market_member_message_sent);
    assert(at == 24);
    at = 0;
    decode_quote_cancellation_market_member_message(quote_cancellation_market_member_message_got);
    assert(at == 24);
    equal_quote_cancellation_market_member_message(quote_cancellation_market_member_message_got, quote_cancellation_market_member_message_sent)
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
    assert(at == 54);
    at = 0;
    decode_trade_market_post_transparency_information_top_of_book_message(trade_market_post_transparency_information_top_of_book_message_got);
    assert(at == 54);
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
    assert(at == 89);
    at = 0;
    decode_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_got);
    assert(at == 89);
    equal_trade_trade_amendment_or_cancellation_message(trade_trade_amendment_or_cancellation_message_got, trade_trade_amendment_or_cancellation_message_sent)
  }
}

/* Trade Market Post Transparency Information Full Depth Message: encoded, read back, and compared */
proctype check_trade_market_post_transparency_information_full_depth_message() {
  TradeMarketPostTransparencyInformationFullDepthMessage trade_market_post_transparency_information_full_depth_message_sent;
  TradeMarketPostTransparencyInformationFullDepthMessage trade_market_post_transparency_information_full_depth_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_sent, 0)
  :: pattern == 1 -> fill_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_sent, 32)
  :: pattern == 2 -> fill_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_sent, 255)
  :: else -> ramp_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_sent);
    assert(at == 104);
    at = 0;
    decode_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_got);
    assert(at == 104);
    equal_trade_market_post_transparency_information_full_depth_message(trade_market_post_transparency_information_full_depth_message_got, trade_market_post_transparency_information_full_depth_message_sent)
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
    assert(at == 36);
    at = 0;
    decode_indication_of_interest_message(indication_of_interest_message_got);
    assert(at == 36);
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
    assert(at == 46);
    at = 0;
    decode_top_of_book_message(top_of_book_message_got);
    assert(at == 46);
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
  :: run check_logon_message()
  :: run check_reject_message()
  :: run check_replay_request_message()
  :: run check_replay_request_ack_nack_message()
  :: run check_trading_session_status_message()
  :: run check_news_message()
  :: run check_security_list_cancellation_report_message()
  :: run check_security_list_message()
  :: run check_security_list_update_report_message()
  :: run check_security_status_message()
  :: run check_family_status_message()
  :: run check_order_book_clear_message()
  :: run check_order_market_pre_transparency_information_message()
  :: run check_quote_market_pre_transparency_information_message()
  :: run check_order_cancellation_market_member_message()
  :: run check_quote_cancellation_market_member_message()
  :: run check_trade_market_post_transparency_information_top_of_book_message()
  :: run check_trade_trade_amendment_or_cancellation_message()
  :: run check_trade_market_post_transparency_information_full_depth_message()
  :: run check_indication_of_interest_message()
  :: run check_rfq_market_pre_transparency_information_message()
  :: run check_top_of_book_message()
  fi
}
