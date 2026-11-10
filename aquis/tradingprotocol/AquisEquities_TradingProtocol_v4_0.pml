/*
 * Aquis Exchange Aquis Trading Protocol
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
 *   - a field read in bits
 *   - the dispatch that chooses a message by its type
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 40

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 7 bytes ------------------------------------------------- */

/* Aquis Atp message header */
typedef MessageHeader {
  byte msg_length[2];
  byte msg_type;
  byte msg_seq_no[4]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.msg_type = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_no[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.msg_type = (message_header_base + 2 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_no[message_header_at] = (message_header_base + 3 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 7 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.msg_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.msg_type; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.msg_seq_no[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 7 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.msg_type = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_no[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.msg_length[message_header_at] == message_header_written.msg_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.msg_type == message_header_written.msg_type);
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.msg_seq_no[message_header_at] == message_header_written.msg_seq_no[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Message: 40 bytes ------------------------------------------------- */

/* The Login message is sent by the trading Member as the initial message used to establish a trading session. It is also used to re-establish a session after a break. */
typedef LoginMessage {
  byte protocol_version[2];
  byte sender_id[16];
  byte password[16];
  byte inactivity_timeout[2];
  byte atp_seq_no[4]
};

int login_message_at;

/* every byte of Login Message set to one value */
inline fill_login_message(login_message_record, login_message_value) {
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.protocol_version[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.sender_id[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.password[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.inactivity_timeout[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.atp_seq_no[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Message set to where it lies, so a field read out of place says so */
inline ramp_login_message(login_message_record, login_message_base) {
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.protocol_version[login_message_at] = (login_message_base + 0 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.sender_id[login_message_at] = (login_message_base + 2 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.password[login_message_at] = (login_message_base + 18 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.inactivity_timeout[login_message_at] = (login_message_base + 34 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.atp_seq_no[login_message_at] = (login_message_base + 36 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message to the wire, 40 bytes from where the cursor stands */
inline encode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 2 -> wire[at] = login_message_record.protocol_version[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> wire[at] = login_message_record.sender_id[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> wire[at] = login_message_record.password[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> wire[at] = login_message_record.inactivity_timeout[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> wire[at] = login_message_record.atp_seq_no[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message off the wire, 40 bytes from where the cursor stands */
inline decode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.protocol_version[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.sender_id[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> login_message_record.password[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.inactivity_timeout[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.atp_seq_no[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Message is what was written, byte for byte */
inline equal_login_message(login_message_read, login_message_written) {
  login_message_at = 0;
  do
  :: login_message_at < 2 -> assert(login_message_read.protocol_version[login_message_at] == login_message_written.protocol_version[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> assert(login_message_read.sender_id[login_message_at] == login_message_written.sender_id[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 16 -> assert(login_message_read.password[login_message_at] == login_message_written.password[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> assert(login_message_read.inactivity_timeout[login_message_at] == login_message_written.inactivity_timeout[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> assert(login_message_read.atp_seq_no[login_message_at] == login_message_written.atp_seq_no[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 5 bytes ----------------------------------------- */

/* The Login Response message is sent by Aquis to acknowledge a Login request, and either accept or reject it. */
typedef LoginResponseMessage {
  byte result_code;
  byte client_seq_no[4]
};

int login_response_message_at;

/* every byte of Login Response Message set to one value */
inline fill_login_response_message(login_response_message_record, login_response_message_value) {
  login_response_message_record.result_code = login_response_message_value;
  login_response_message_at = 0;
  do
  :: login_response_message_at < 4 -> login_response_message_record.client_seq_no[login_response_message_at] = login_response_message_value; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Response Message set to where it lies, so a field read out of place says so */
inline ramp_login_response_message(login_response_message_record, login_response_message_base) {
  login_response_message_record.result_code = (login_response_message_base + 0 + 1) % 256;
  login_response_message_at = 0;
  do
  :: login_response_message_at < 4 -> login_response_message_record.client_seq_no[login_response_message_at] = (login_response_message_base + 1 + login_response_message_at + 1) % 256; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response Message to the wire, 5 bytes from where the cursor stands */
inline encode_login_response_message(login_response_message_record) {
  wire[at] = login_response_message_record.result_code; at = at + 1;
  login_response_message_at = 0;
  do
  :: login_response_message_at < 4 -> wire[at] = login_response_message_record.client_seq_no[login_response_message_at]; at = at + 1; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response Message off the wire, 5 bytes from where the cursor stands */
inline decode_login_response_message(login_response_message_record) {
  login_response_message_record.result_code = wire[at]; at = at + 1;
  login_response_message_at = 0;
  do
  :: login_response_message_at < 4 -> login_response_message_record.client_seq_no[login_response_message_at] = wire[at]; at = at + 1; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Response Message is what was written, byte for byte */
inline equal_login_response_message(login_response_message_read, login_response_message_written) {
  assert(login_response_message_read.result_code == login_response_message_written.result_code);
  login_response_message_at = 0;
  do
  :: login_response_message_at < 4 -> assert(login_response_message_read.client_seq_no[login_response_message_at] == login_response_message_written.client_seq_no[login_response_message_at]); login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Message: 33 bytes ------------------------------------------------ */

/* The Logout message is usually sent as a response to the Logout Request. However it may also be sent by Aquis in case of a low sequence number or other protocol violation, or for other reasons. The TCP/IP connection is closed immediately after this message has been sent. */
typedef LogoutMessage {
  byte logout_reason_code;
  byte reason_text[32]
};

int logout_message_at;

/* every byte of Logout Message set to one value */
inline fill_logout_message(logout_message_record, logout_message_value) {
  logout_message_record.logout_reason_code = logout_message_value;
  logout_message_at = 0;
  do
  :: logout_message_at < 32 -> logout_message_record.reason_text[logout_message_at] = logout_message_value; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logout Message set to where it lies, so a field read out of place says so */
inline ramp_logout_message(logout_message_record, logout_message_base) {
  logout_message_record.logout_reason_code = (logout_message_base + 0 + 1) % 256;
  logout_message_at = 0;
  do
  :: logout_message_at < 32 -> logout_message_record.reason_text[logout_message_at] = (logout_message_base + 1 + logout_message_at + 1) % 256; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message to the wire, 33 bytes from where the cursor stands */
inline encode_logout_message(logout_message_record) {
  wire[at] = logout_message_record.logout_reason_code; at = at + 1;
  logout_message_at = 0;
  do
  :: logout_message_at < 32 -> wire[at] = logout_message_record.reason_text[logout_message_at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logout Message off the wire, 33 bytes from where the cursor stands */
inline decode_logout_message(logout_message_record) {
  logout_message_record.logout_reason_code = wire[at]; at = at + 1;
  logout_message_at = 0;
  do
  :: logout_message_at < 32 -> logout_message_record.reason_text[logout_message_at] = wire[at]; at = at + 1; logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logout Message is what was written, byte for byte */
inline equal_logout_message(logout_message_read, logout_message_written) {
  assert(logout_message_read.logout_reason_code == logout_message_written.logout_reason_code);
  logout_message_at = 0;
  do
  :: logout_message_at < 32 -> assert(logout_message_read.reason_text[logout_message_at] == logout_message_written.reason_text[logout_message_at]); logout_message_at = logout_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Iceberg Order Refresh Message: 16 bytes --------------------------------- */

/* Aquis sends an Iceberg Order Refresh message to notify the Member when an iceberg order is refreshed from the non-displayed reserve quantity. */
typedef IcebergOrderRefreshMessage {
  byte order_ref[4];
  byte orig_aqx_ord_id[4];
  byte new_aqx_ord_id[4];
  byte quantity[4]
};

int iceberg_order_refresh_message_at;

/* every byte of Iceberg Order Refresh Message set to one value */
inline fill_iceberg_order_refresh_message(iceberg_order_refresh_message_record, iceberg_order_refresh_message_value) {
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.order_ref[iceberg_order_refresh_message_at] = iceberg_order_refresh_message_value; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.orig_aqx_ord_id[iceberg_order_refresh_message_at] = iceberg_order_refresh_message_value; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.new_aqx_ord_id[iceberg_order_refresh_message_at] = iceberg_order_refresh_message_value; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.quantity[iceberg_order_refresh_message_at] = iceberg_order_refresh_message_value; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Iceberg Order Refresh Message set to where it lies, so a field read out of place says so */
inline ramp_iceberg_order_refresh_message(iceberg_order_refresh_message_record, iceberg_order_refresh_message_base) {
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.order_ref[iceberg_order_refresh_message_at] = (iceberg_order_refresh_message_base + 0 + iceberg_order_refresh_message_at + 1) % 256; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.orig_aqx_ord_id[iceberg_order_refresh_message_at] = (iceberg_order_refresh_message_base + 4 + iceberg_order_refresh_message_at + 1) % 256; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.new_aqx_ord_id[iceberg_order_refresh_message_at] = (iceberg_order_refresh_message_base + 8 + iceberg_order_refresh_message_at + 1) % 256; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.quantity[iceberg_order_refresh_message_at] = (iceberg_order_refresh_message_base + 12 + iceberg_order_refresh_message_at + 1) % 256; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* Iceberg Order Refresh Message to the wire, 16 bytes from where the cursor stands */
inline encode_iceberg_order_refresh_message(iceberg_order_refresh_message_record) {
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> wire[at] = iceberg_order_refresh_message_record.order_ref[iceberg_order_refresh_message_at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> wire[at] = iceberg_order_refresh_message_record.orig_aqx_ord_id[iceberg_order_refresh_message_at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> wire[at] = iceberg_order_refresh_message_record.new_aqx_ord_id[iceberg_order_refresh_message_at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> wire[at] = iceberg_order_refresh_message_record.quantity[iceberg_order_refresh_message_at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* Iceberg Order Refresh Message off the wire, 16 bytes from where the cursor stands */
inline decode_iceberg_order_refresh_message(iceberg_order_refresh_message_record) {
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.order_ref[iceberg_order_refresh_message_at] = wire[at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.orig_aqx_ord_id[iceberg_order_refresh_message_at] = wire[at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.new_aqx_ord_id[iceberg_order_refresh_message_at] = wire[at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.quantity[iceberg_order_refresh_message_at] = wire[at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Iceberg Order Refresh Message is what was written, byte for byte */
inline equal_iceberg_order_refresh_message(iceberg_order_refresh_message_read, iceberg_order_refresh_message_written) {
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> assert(iceberg_order_refresh_message_read.order_ref[iceberg_order_refresh_message_at] == iceberg_order_refresh_message_written.order_ref[iceberg_order_refresh_message_at]); iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> assert(iceberg_order_refresh_message_read.orig_aqx_ord_id[iceberg_order_refresh_message_at] == iceberg_order_refresh_message_written.orig_aqx_ord_id[iceberg_order_refresh_message_at]); iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> assert(iceberg_order_refresh_message_read.new_aqx_ord_id[iceberg_order_refresh_message_at] == iceberg_order_refresh_message_written.new_aqx_ord_id[iceberg_order_refresh_message_at]); iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> assert(iceberg_order_refresh_message_read.quantity[iceberg_order_refresh_message_at] == iceberg_order_refresh_message_written.quantity[iceberg_order_refresh_message_at]); iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Bust Message: 29 bytes -------------------------------------------- */

/* If a trade is invalidated, a Trade Bust message is sent to notify the trading Member. */
typedef TradeBustMessage {
  byte order_ref[4];
  byte quantity[4];
  byte price[8];
  byte side;
  byte trade_ref[4];
  byte bust_timestamp[8]
};

int trade_bust_message_at;

/* every byte of Trade Bust Message set to one value */
inline fill_trade_bust_message(trade_bust_message_record, trade_bust_message_value) {
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.order_ref[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.quantity[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.price[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_record.side = trade_bust_message_value;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.trade_ref[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.bust_timestamp[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Bust Message set to where it lies, so a field read out of place says so */
inline ramp_trade_bust_message(trade_bust_message_record, trade_bust_message_base) {
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.order_ref[trade_bust_message_at] = (trade_bust_message_base + 0 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.quantity[trade_bust_message_at] = (trade_bust_message_base + 4 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.price[trade_bust_message_at] = (trade_bust_message_base + 8 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_record.side = (trade_bust_message_base + 16 + 1) % 256;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.trade_ref[trade_bust_message_at] = (trade_bust_message_base + 17 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.bust_timestamp[trade_bust_message_at] = (trade_bust_message_base + 21 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Message to the wire, 29 bytes from where the cursor stands */
inline encode_trade_bust_message(trade_bust_message_record) {
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> wire[at] = trade_bust_message_record.order_ref[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> wire[at] = trade_bust_message_record.quantity[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> wire[at] = trade_bust_message_record.price[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_bust_message_record.side; at = at + 1;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> wire[at] = trade_bust_message_record.trade_ref[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> wire[at] = trade_bust_message_record.bust_timestamp[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Message off the wire, 29 bytes from where the cursor stands */
inline decode_trade_bust_message(trade_bust_message_record) {
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.order_ref[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.quantity[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.price[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_record.side = wire[at]; at = at + 1;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.trade_ref[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.bust_timestamp[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Bust Message is what was written, byte for byte */
inline equal_trade_bust_message(trade_bust_message_read, trade_bust_message_written) {
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> assert(trade_bust_message_read.order_ref[trade_bust_message_at] == trade_bust_message_written.order_ref[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> assert(trade_bust_message_read.quantity[trade_bust_message_at] == trade_bust_message_written.quantity[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> assert(trade_bust_message_read.price[trade_bust_message_at] == trade_bust_message_written.price[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  assert(trade_bust_message_read.side == trade_bust_message_written.side);
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> assert(trade_bust_message_read.trade_ref[trade_bust_message_at] == trade_bust_message_written.trade_ref[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> assert(trade_bust_message_read.bust_timestamp[trade_bust_message_at] == trade_bust_message_written.bust_timestamp[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ioi Invite Message: 36 bytes -------------------------------------------- */

/* Message from Aquis to the member indicating a firm up invite. The invite will expire 300ms after the value in the timestamp field. */
typedef IoiInviteMessage {
  byte order_ref[4];
  byte price[8];
  byte quantity[4];
  byte min_qty[4];
  byte invite_timestamp[8];
  byte user_tag[8]
};

int ioi_invite_message_at;

/* every byte of Ioi Invite Message set to one value */
inline fill_ioi_invite_message(ioi_invite_message_record, ioi_invite_message_value) {
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> ioi_invite_message_record.order_ref[ioi_invite_message_at] = ioi_invite_message_value; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> ioi_invite_message_record.price[ioi_invite_message_at] = ioi_invite_message_value; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> ioi_invite_message_record.quantity[ioi_invite_message_at] = ioi_invite_message_value; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> ioi_invite_message_record.min_qty[ioi_invite_message_at] = ioi_invite_message_value; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> ioi_invite_message_record.invite_timestamp[ioi_invite_message_at] = ioi_invite_message_value; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> ioi_invite_message_record.user_tag[ioi_invite_message_at] = ioi_invite_message_value; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ioi Invite Message set to where it lies, so a field read out of place says so */
inline ramp_ioi_invite_message(ioi_invite_message_record, ioi_invite_message_base) {
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> ioi_invite_message_record.order_ref[ioi_invite_message_at] = (ioi_invite_message_base + 0 + ioi_invite_message_at + 1) % 256; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> ioi_invite_message_record.price[ioi_invite_message_at] = (ioi_invite_message_base + 4 + ioi_invite_message_at + 1) % 256; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> ioi_invite_message_record.quantity[ioi_invite_message_at] = (ioi_invite_message_base + 12 + ioi_invite_message_at + 1) % 256; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> ioi_invite_message_record.min_qty[ioi_invite_message_at] = (ioi_invite_message_base + 16 + ioi_invite_message_at + 1) % 256; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> ioi_invite_message_record.invite_timestamp[ioi_invite_message_at] = (ioi_invite_message_base + 20 + ioi_invite_message_at + 1) % 256; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> ioi_invite_message_record.user_tag[ioi_invite_message_at] = (ioi_invite_message_base + 28 + ioi_invite_message_at + 1) % 256; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ioi Invite Message to the wire, 36 bytes from where the cursor stands */
inline encode_ioi_invite_message(ioi_invite_message_record) {
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> wire[at] = ioi_invite_message_record.order_ref[ioi_invite_message_at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> wire[at] = ioi_invite_message_record.price[ioi_invite_message_at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> wire[at] = ioi_invite_message_record.quantity[ioi_invite_message_at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> wire[at] = ioi_invite_message_record.min_qty[ioi_invite_message_at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> wire[at] = ioi_invite_message_record.invite_timestamp[ioi_invite_message_at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> wire[at] = ioi_invite_message_record.user_tag[ioi_invite_message_at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ioi Invite Message off the wire, 36 bytes from where the cursor stands */
inline decode_ioi_invite_message(ioi_invite_message_record) {
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> ioi_invite_message_record.order_ref[ioi_invite_message_at] = wire[at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> ioi_invite_message_record.price[ioi_invite_message_at] = wire[at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> ioi_invite_message_record.quantity[ioi_invite_message_at] = wire[at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> ioi_invite_message_record.min_qty[ioi_invite_message_at] = wire[at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> ioi_invite_message_record.invite_timestamp[ioi_invite_message_at] = wire[at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> ioi_invite_message_record.user_tag[ioi_invite_message_at] = wire[at]; at = at + 1; ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ioi Invite Message is what was written, byte for byte */
inline equal_ioi_invite_message(ioi_invite_message_read, ioi_invite_message_written) {
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> assert(ioi_invite_message_read.order_ref[ioi_invite_message_at] == ioi_invite_message_written.order_ref[ioi_invite_message_at]); ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> assert(ioi_invite_message_read.price[ioi_invite_message_at] == ioi_invite_message_written.price[ioi_invite_message_at]); ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> assert(ioi_invite_message_read.quantity[ioi_invite_message_at] == ioi_invite_message_written.quantity[ioi_invite_message_at]); ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 4 -> assert(ioi_invite_message_read.min_qty[ioi_invite_message_at] == ioi_invite_message_written.min_qty[ioi_invite_message_at]); ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> assert(ioi_invite_message_read.invite_timestamp[ioi_invite_message_at] == ioi_invite_message_written.invite_timestamp[ioi_invite_message_at]); ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  ioi_invite_message_at = 0;
  do
  :: ioi_invite_message_at < 8 -> assert(ioi_invite_message_read.user_tag[ioi_invite_message_at] == ioi_invite_message_written.user_tag[ioi_invite_message_at]); ioi_invite_message_at = ioi_invite_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ioi Firmup Message: 28 bytes -------------------------------------------- */

/* Firm up message to be used as a response to an invite. */
typedef IoiFirmupMessage {
  byte order_ref[4];
  byte price[8];
  byte quantity[4];
  byte min_qty[4];
  byte user_tag[8]
};

int ioi_firmup_message_at;

/* every byte of Ioi Firmup Message set to one value */
inline fill_ioi_firmup_message(ioi_firmup_message_record, ioi_firmup_message_value) {
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> ioi_firmup_message_record.order_ref[ioi_firmup_message_at] = ioi_firmup_message_value; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 8 -> ioi_firmup_message_record.price[ioi_firmup_message_at] = ioi_firmup_message_value; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> ioi_firmup_message_record.quantity[ioi_firmup_message_at] = ioi_firmup_message_value; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> ioi_firmup_message_record.min_qty[ioi_firmup_message_at] = ioi_firmup_message_value; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 8 -> ioi_firmup_message_record.user_tag[ioi_firmup_message_at] = ioi_firmup_message_value; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ioi Firmup Message set to where it lies, so a field read out of place says so */
inline ramp_ioi_firmup_message(ioi_firmup_message_record, ioi_firmup_message_base) {
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> ioi_firmup_message_record.order_ref[ioi_firmup_message_at] = (ioi_firmup_message_base + 0 + ioi_firmup_message_at + 1) % 256; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 8 -> ioi_firmup_message_record.price[ioi_firmup_message_at] = (ioi_firmup_message_base + 4 + ioi_firmup_message_at + 1) % 256; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> ioi_firmup_message_record.quantity[ioi_firmup_message_at] = (ioi_firmup_message_base + 12 + ioi_firmup_message_at + 1) % 256; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> ioi_firmup_message_record.min_qty[ioi_firmup_message_at] = (ioi_firmup_message_base + 16 + ioi_firmup_message_at + 1) % 256; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 8 -> ioi_firmup_message_record.user_tag[ioi_firmup_message_at] = (ioi_firmup_message_base + 20 + ioi_firmup_message_at + 1) % 256; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ioi Firmup Message to the wire, 28 bytes from where the cursor stands */
inline encode_ioi_firmup_message(ioi_firmup_message_record) {
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> wire[at] = ioi_firmup_message_record.order_ref[ioi_firmup_message_at]; at = at + 1; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 8 -> wire[at] = ioi_firmup_message_record.price[ioi_firmup_message_at]; at = at + 1; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> wire[at] = ioi_firmup_message_record.quantity[ioi_firmup_message_at]; at = at + 1; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> wire[at] = ioi_firmup_message_record.min_qty[ioi_firmup_message_at]; at = at + 1; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 8 -> wire[at] = ioi_firmup_message_record.user_tag[ioi_firmup_message_at]; at = at + 1; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ioi Firmup Message off the wire, 28 bytes from where the cursor stands */
inline decode_ioi_firmup_message(ioi_firmup_message_record) {
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> ioi_firmup_message_record.order_ref[ioi_firmup_message_at] = wire[at]; at = at + 1; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 8 -> ioi_firmup_message_record.price[ioi_firmup_message_at] = wire[at]; at = at + 1; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> ioi_firmup_message_record.quantity[ioi_firmup_message_at] = wire[at]; at = at + 1; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> ioi_firmup_message_record.min_qty[ioi_firmup_message_at] = wire[at]; at = at + 1; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 8 -> ioi_firmup_message_record.user_tag[ioi_firmup_message_at] = wire[at]; at = at + 1; ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ioi Firmup Message is what was written, byte for byte */
inline equal_ioi_firmup_message(ioi_firmup_message_read, ioi_firmup_message_written) {
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> assert(ioi_firmup_message_read.order_ref[ioi_firmup_message_at] == ioi_firmup_message_written.order_ref[ioi_firmup_message_at]); ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 8 -> assert(ioi_firmup_message_read.price[ioi_firmup_message_at] == ioi_firmup_message_written.price[ioi_firmup_message_at]); ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> assert(ioi_firmup_message_read.quantity[ioi_firmup_message_at] == ioi_firmup_message_written.quantity[ioi_firmup_message_at]); ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 4 -> assert(ioi_firmup_message_read.min_qty[ioi_firmup_message_at] == ioi_firmup_message_written.min_qty[ioi_firmup_message_at]); ioi_firmup_message_at = ioi_firmup_message_at + 1
  :: else -> break
  od;
  ioi_firmup_message_at = 0;
  do
  :: ioi_firmup_message_at < 8 -> assert(ioi_firmup_message_read.user_tag[ioi_firmup_message_at] == ioi_firmup_message_written.user_tag[ioi_firmup_message_at]); ioi_firmup_message_at = ioi_firmup_message_at + 1
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
    assert(at == 7);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 7);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Login Message: encoded, read back, and compared */
proctype check_login_message() {
  LoginMessage login_message_sent;
  LoginMessage login_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_message(login_message_sent, 0)
  :: pattern == 1 -> fill_login_message(login_message_sent, 32)
  :: pattern == 2 -> fill_login_message(login_message_sent, 255)
  :: else -> ramp_login_message(login_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_message(login_message_sent);
    assert(at == 40);
    at = 0;
    decode_login_message(login_message_got);
    assert(at == 40);
    equal_login_message(login_message_got, login_message_sent)
  }
}

/* Login Response Message: encoded, read back, and compared */
proctype check_login_response_message() {
  LoginResponseMessage login_response_message_sent;
  LoginResponseMessage login_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response_message(login_response_message_sent, 0)
  :: pattern == 1 -> fill_login_response_message(login_response_message_sent, 32)
  :: pattern == 2 -> fill_login_response_message(login_response_message_sent, 255)
  :: else -> ramp_login_response_message(login_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response_message(login_response_message_sent);
    assert(at == 5);
    at = 0;
    decode_login_response_message(login_response_message_got);
    assert(at == 5);
    equal_login_response_message(login_response_message_got, login_response_message_sent)
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
    assert(at == 33);
    at = 0;
    decode_logout_message(logout_message_got);
    assert(at == 33);
    equal_logout_message(logout_message_got, logout_message_sent)
  }
}

/* Iceberg Order Refresh Message: encoded, read back, and compared */
proctype check_iceberg_order_refresh_message() {
  IcebergOrderRefreshMessage iceberg_order_refresh_message_sent;
  IcebergOrderRefreshMessage iceberg_order_refresh_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_iceberg_order_refresh_message(iceberg_order_refresh_message_sent, 0)
  :: pattern == 1 -> fill_iceberg_order_refresh_message(iceberg_order_refresh_message_sent, 32)
  :: pattern == 2 -> fill_iceberg_order_refresh_message(iceberg_order_refresh_message_sent, 255)
  :: else -> ramp_iceberg_order_refresh_message(iceberg_order_refresh_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_iceberg_order_refresh_message(iceberg_order_refresh_message_sent);
    assert(at == 16);
    at = 0;
    decode_iceberg_order_refresh_message(iceberg_order_refresh_message_got);
    assert(at == 16);
    equal_iceberg_order_refresh_message(iceberg_order_refresh_message_got, iceberg_order_refresh_message_sent)
  }
}

/* Trade Bust Message: encoded, read back, and compared */
proctype check_trade_bust_message() {
  TradeBustMessage trade_bust_message_sent;
  TradeBustMessage trade_bust_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_bust_message(trade_bust_message_sent, 0)
  :: pattern == 1 -> fill_trade_bust_message(trade_bust_message_sent, 32)
  :: pattern == 2 -> fill_trade_bust_message(trade_bust_message_sent, 255)
  :: else -> ramp_trade_bust_message(trade_bust_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_bust_message(trade_bust_message_sent);
    assert(at == 29);
    at = 0;
    decode_trade_bust_message(trade_bust_message_got);
    assert(at == 29);
    equal_trade_bust_message(trade_bust_message_got, trade_bust_message_sent)
  }
}

/* Ioi Invite Message: encoded, read back, and compared */
proctype check_ioi_invite_message() {
  IoiInviteMessage ioi_invite_message_sent;
  IoiInviteMessage ioi_invite_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ioi_invite_message(ioi_invite_message_sent, 0)
  :: pattern == 1 -> fill_ioi_invite_message(ioi_invite_message_sent, 32)
  :: pattern == 2 -> fill_ioi_invite_message(ioi_invite_message_sent, 255)
  :: else -> ramp_ioi_invite_message(ioi_invite_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ioi_invite_message(ioi_invite_message_sent);
    assert(at == 36);
    at = 0;
    decode_ioi_invite_message(ioi_invite_message_got);
    assert(at == 36);
    equal_ioi_invite_message(ioi_invite_message_got, ioi_invite_message_sent)
  }
}

/* Ioi Firmup Message: encoded, read back, and compared */
proctype check_ioi_firmup_message() {
  IoiFirmupMessage ioi_firmup_message_sent;
  IoiFirmupMessage ioi_firmup_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ioi_firmup_message(ioi_firmup_message_sent, 0)
  :: pattern == 1 -> fill_ioi_firmup_message(ioi_firmup_message_sent, 32)
  :: pattern == 2 -> fill_ioi_firmup_message(ioi_firmup_message_sent, 255)
  :: else -> ramp_ioi_firmup_message(ioi_firmup_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ioi_firmup_message(ioi_firmup_message_sent);
    assert(at == 28);
    at = 0;
    decode_ioi_firmup_message(ioi_firmup_message_got);
    assert(at == 28);
    equal_ioi_firmup_message(ioi_firmup_message_got, ioi_firmup_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_login_message()
  :: run check_login_response_message()
  :: run check_logout_message()
  :: run check_iceberg_order_refresh_message()
  :: run check_trade_bust_message()
  :: run check_ioi_invite_message()
  :: run check_ioi_firmup_message()
  fi
}
