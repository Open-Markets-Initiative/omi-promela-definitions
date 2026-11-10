/*
 * A2X Markets A2X Binary Protocol
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
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 55

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 7 bytes ------------------------------------------------- */

/* A2X Atp message header */
typedef MessageHeader {
  byte length[2];
  byte msg_type;
  byte msg_seq_no[4]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
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
  :: message_header_at < 2 -> message_header_record.length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
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
  :: message_header_at < 2 -> wire[at] = message_header_record.length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
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
  :: message_header_at < 2 -> message_header_record.length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
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
  :: message_header_at < 2 -> assert(message_header_read.length[message_header_at] == message_header_written.length[message_header_at]); message_header_at = message_header_at + 1
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

/* The Login message is the initial message used to establish a trading session. It is also used to re-establish a session after a break. */
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

/* The Login Response message is sent by A2X to acknowledge a Login request, and either accept or reject it. */
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

/* The Logout message is usually sent as a response to the Logout Request however it may also be sent by A2X in case of a low sequence number or other protocol violation, or for other reasons. The TCP/IP connection is closed immediately after this message has been sent. */
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

/* ---- Order Add Message: 46 bytes --------------------------------------------- */

/* The Add Order message is sent by the trading Member to enter an order for a particular security. */
typedef OrderAddMessage {
  byte security_id_long[4];
  byte order_type;
  byte time_in_force;
  byte side;
  byte quantity[4];
  byte price[8];
  byte order_capacity;
  byte account[2];
  byte user_tag[8];
  byte reserved_1;
  byte reserved_byte_2;
  byte reserved_4[4];
  byte reserved_byte_3;
  byte reserved_int_2[4];
  byte reserved_byte_4;
  byte reserved_int_3[4]
};

int order_add_message_at;

/* every byte of Order Add Message set to one value */
inline fill_order_add_message(order_add_message_record, order_add_message_value) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.security_id_long[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.order_type = order_add_message_value;
  order_add_message_record.time_in_force = order_add_message_value;
  order_add_message_record.side = order_add_message_value;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.quantity[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.order_capacity = order_add_message_value;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.account[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.user_tag[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.reserved_1 = order_add_message_value;
  order_add_message_record.reserved_byte_2 = order_add_message_value;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.reserved_4[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.reserved_byte_3 = order_add_message_value;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.reserved_int_2[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.reserved_byte_4 = order_add_message_value;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.reserved_int_3[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Add Message set to where it lies, so a field read out of place says so */
inline ramp_order_add_message(order_add_message_record, order_add_message_base) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.security_id_long[order_add_message_at] = (order_add_message_base + 0 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.order_type = (order_add_message_base + 4 + 1) % 256;
  order_add_message_record.time_in_force = (order_add_message_base + 5 + 1) % 256;
  order_add_message_record.side = (order_add_message_base + 6 + 1) % 256;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.quantity[order_add_message_at] = (order_add_message_base + 7 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = (order_add_message_base + 11 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.order_capacity = (order_add_message_base + 19 + 1) % 256;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.account[order_add_message_at] = (order_add_message_base + 20 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.user_tag[order_add_message_at] = (order_add_message_base + 22 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.reserved_1 = (order_add_message_base + 30 + 1) % 256;
  order_add_message_record.reserved_byte_2 = (order_add_message_base + 31 + 1) % 256;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.reserved_4[order_add_message_at] = (order_add_message_base + 32 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.reserved_byte_3 = (order_add_message_base + 36 + 1) % 256;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.reserved_int_2[order_add_message_at] = (order_add_message_base + 37 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.reserved_byte_4 = (order_add_message_base + 41 + 1) % 256;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.reserved_int_3[order_add_message_at] = (order_add_message_base + 42 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Add Message to the wire, 46 bytes from where the cursor stands */
inline encode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.security_id_long[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_message_record.order_type; at = at + 1;
  wire[at] = order_add_message_record.time_in_force; at = at + 1;
  wire[at] = order_add_message_record.side; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.quantity[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.price[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_message_record.order_capacity; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> wire[at] = order_add_message_record.account[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.user_tag[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_message_record.reserved_1; at = at + 1;
  wire[at] = order_add_message_record.reserved_byte_2; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.reserved_4[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_message_record.reserved_byte_3; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.reserved_int_2[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_message_record.reserved_byte_4; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.reserved_int_3[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Add Message off the wire, 46 bytes from where the cursor stands */
inline decode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.security_id_long[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.order_type = wire[at]; at = at + 1;
  order_add_message_record.time_in_force = wire[at]; at = at + 1;
  order_add_message_record.side = wire[at]; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.quantity[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.order_capacity = wire[at]; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.account[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.user_tag[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.reserved_1 = wire[at]; at = at + 1;
  order_add_message_record.reserved_byte_2 = wire[at]; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.reserved_4[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.reserved_byte_3 = wire[at]; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.reserved_int_2[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.reserved_byte_4 = wire[at]; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.reserved_int_3[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Add Message is what was written, byte for byte */
inline equal_order_add_message(order_add_message_read, order_add_message_written) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.security_id_long[order_add_message_at] == order_add_message_written.security_id_long[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  assert(order_add_message_read.order_type == order_add_message_written.order_type);
  assert(order_add_message_read.time_in_force == order_add_message_written.time_in_force);
  assert(order_add_message_read.side == order_add_message_written.side);
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.quantity[order_add_message_at] == order_add_message_written.quantity[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.price[order_add_message_at] == order_add_message_written.price[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  assert(order_add_message_read.order_capacity == order_add_message_written.order_capacity);
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> assert(order_add_message_read.account[order_add_message_at] == order_add_message_written.account[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.user_tag[order_add_message_at] == order_add_message_written.user_tag[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  assert(order_add_message_read.reserved_1 == order_add_message_written.reserved_1);
  assert(order_add_message_read.reserved_byte_2 == order_add_message_written.reserved_byte_2);
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.reserved_4[order_add_message_at] == order_add_message_written.reserved_4[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  assert(order_add_message_read.reserved_byte_3 == order_add_message_written.reserved_byte_3);
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.reserved_int_2[order_add_message_at] == order_add_message_written.reserved_int_2[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  assert(order_add_message_read.reserved_byte_4 == order_add_message_written.reserved_byte_4);
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.reserved_int_3[order_add_message_at] == order_add_message_written.reserved_int_3[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Add Extended Message: 55 bytes ------------------------------------ */

/* The Order Add Extended message is sent by the trading Member to enter an order for a particular security with additional attributes. */
typedef OrderAddExtendedMessage {
  byte security_id_long[4];
  byte order_type;
  byte time_in_force;
  byte side;
  byte quantity[4];
  byte price[8];
  byte order_capacity;
  byte account[2];
  byte user_tag[8];
  byte reserved_1;
  byte reserved_byte_2;
  byte reserved_4[4];
  byte reserved_byte_3;
  byte reserved_int_2[4];
  byte reserved_byte_4;
  byte reserved_int_3[4];
  byte display_quantity[4];
  byte min_qty[4];
  byte reserved_byte_5
};

int order_add_extended_message_at;

/* every byte of Order Add Extended Message set to one value */
inline fill_order_add_extended_message(order_add_extended_message_record, order_add_extended_message_value) {
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.security_id_long[order_add_extended_message_at] = order_add_extended_message_value; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.order_type = order_add_extended_message_value;
  order_add_extended_message_record.time_in_force = order_add_extended_message_value;
  order_add_extended_message_record.side = order_add_extended_message_value;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.quantity[order_add_extended_message_at] = order_add_extended_message_value; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 8 -> order_add_extended_message_record.price[order_add_extended_message_at] = order_add_extended_message_value; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.order_capacity = order_add_extended_message_value;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 2 -> order_add_extended_message_record.account[order_add_extended_message_at] = order_add_extended_message_value; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 8 -> order_add_extended_message_record.user_tag[order_add_extended_message_at] = order_add_extended_message_value; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_1 = order_add_extended_message_value;
  order_add_extended_message_record.reserved_byte_2 = order_add_extended_message_value;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.reserved_4[order_add_extended_message_at] = order_add_extended_message_value; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_byte_3 = order_add_extended_message_value;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.reserved_int_2[order_add_extended_message_at] = order_add_extended_message_value; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_byte_4 = order_add_extended_message_value;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.reserved_int_3[order_add_extended_message_at] = order_add_extended_message_value; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.display_quantity[order_add_extended_message_at] = order_add_extended_message_value; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.min_qty[order_add_extended_message_at] = order_add_extended_message_value; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_byte_5 = order_add_extended_message_value;
  skip
}

/* each byte of Order Add Extended Message set to where it lies, so a field read out of place says so */
inline ramp_order_add_extended_message(order_add_extended_message_record, order_add_extended_message_base) {
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.security_id_long[order_add_extended_message_at] = (order_add_extended_message_base + 0 + order_add_extended_message_at + 1) % 256; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.order_type = (order_add_extended_message_base + 4 + 1) % 256;
  order_add_extended_message_record.time_in_force = (order_add_extended_message_base + 5 + 1) % 256;
  order_add_extended_message_record.side = (order_add_extended_message_base + 6 + 1) % 256;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.quantity[order_add_extended_message_at] = (order_add_extended_message_base + 7 + order_add_extended_message_at + 1) % 256; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 8 -> order_add_extended_message_record.price[order_add_extended_message_at] = (order_add_extended_message_base + 11 + order_add_extended_message_at + 1) % 256; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.order_capacity = (order_add_extended_message_base + 19 + 1) % 256;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 2 -> order_add_extended_message_record.account[order_add_extended_message_at] = (order_add_extended_message_base + 20 + order_add_extended_message_at + 1) % 256; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 8 -> order_add_extended_message_record.user_tag[order_add_extended_message_at] = (order_add_extended_message_base + 22 + order_add_extended_message_at + 1) % 256; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_1 = (order_add_extended_message_base + 30 + 1) % 256;
  order_add_extended_message_record.reserved_byte_2 = (order_add_extended_message_base + 31 + 1) % 256;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.reserved_4[order_add_extended_message_at] = (order_add_extended_message_base + 32 + order_add_extended_message_at + 1) % 256; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_byte_3 = (order_add_extended_message_base + 36 + 1) % 256;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.reserved_int_2[order_add_extended_message_at] = (order_add_extended_message_base + 37 + order_add_extended_message_at + 1) % 256; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_byte_4 = (order_add_extended_message_base + 41 + 1) % 256;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.reserved_int_3[order_add_extended_message_at] = (order_add_extended_message_base + 42 + order_add_extended_message_at + 1) % 256; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.display_quantity[order_add_extended_message_at] = (order_add_extended_message_base + 46 + order_add_extended_message_at + 1) % 256; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.min_qty[order_add_extended_message_at] = (order_add_extended_message_base + 50 + order_add_extended_message_at + 1) % 256; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_byte_5 = (order_add_extended_message_base + 54 + 1) % 256;
  skip
}

/* Order Add Extended Message to the wire, 55 bytes from where the cursor stands */
inline encode_order_add_extended_message(order_add_extended_message_record) {
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> wire[at] = order_add_extended_message_record.security_id_long[order_add_extended_message_at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_extended_message_record.order_type; at = at + 1;
  wire[at] = order_add_extended_message_record.time_in_force; at = at + 1;
  wire[at] = order_add_extended_message_record.side; at = at + 1;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> wire[at] = order_add_extended_message_record.quantity[order_add_extended_message_at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 8 -> wire[at] = order_add_extended_message_record.price[order_add_extended_message_at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_extended_message_record.order_capacity; at = at + 1;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 2 -> wire[at] = order_add_extended_message_record.account[order_add_extended_message_at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 8 -> wire[at] = order_add_extended_message_record.user_tag[order_add_extended_message_at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_extended_message_record.reserved_1; at = at + 1;
  wire[at] = order_add_extended_message_record.reserved_byte_2; at = at + 1;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> wire[at] = order_add_extended_message_record.reserved_4[order_add_extended_message_at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_extended_message_record.reserved_byte_3; at = at + 1;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> wire[at] = order_add_extended_message_record.reserved_int_2[order_add_extended_message_at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_extended_message_record.reserved_byte_4; at = at + 1;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> wire[at] = order_add_extended_message_record.reserved_int_3[order_add_extended_message_at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> wire[at] = order_add_extended_message_record.display_quantity[order_add_extended_message_at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> wire[at] = order_add_extended_message_record.min_qty[order_add_extended_message_at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_extended_message_record.reserved_byte_5; at = at + 1;
  skip
}

/* Order Add Extended Message off the wire, 55 bytes from where the cursor stands */
inline decode_order_add_extended_message(order_add_extended_message_record) {
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.security_id_long[order_add_extended_message_at] = wire[at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.order_type = wire[at]; at = at + 1;
  order_add_extended_message_record.time_in_force = wire[at]; at = at + 1;
  order_add_extended_message_record.side = wire[at]; at = at + 1;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.quantity[order_add_extended_message_at] = wire[at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 8 -> order_add_extended_message_record.price[order_add_extended_message_at] = wire[at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.order_capacity = wire[at]; at = at + 1;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 2 -> order_add_extended_message_record.account[order_add_extended_message_at] = wire[at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 8 -> order_add_extended_message_record.user_tag[order_add_extended_message_at] = wire[at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_1 = wire[at]; at = at + 1;
  order_add_extended_message_record.reserved_byte_2 = wire[at]; at = at + 1;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.reserved_4[order_add_extended_message_at] = wire[at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_byte_3 = wire[at]; at = at + 1;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.reserved_int_2[order_add_extended_message_at] = wire[at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_byte_4 = wire[at]; at = at + 1;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.reserved_int_3[order_add_extended_message_at] = wire[at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.display_quantity[order_add_extended_message_at] = wire[at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> order_add_extended_message_record.min_qty[order_add_extended_message_at] = wire[at]; at = at + 1; order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_record.reserved_byte_5 = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Add Extended Message is what was written, byte for byte */
inline equal_order_add_extended_message(order_add_extended_message_read, order_add_extended_message_written) {
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> assert(order_add_extended_message_read.security_id_long[order_add_extended_message_at] == order_add_extended_message_written.security_id_long[order_add_extended_message_at]); order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  assert(order_add_extended_message_read.order_type == order_add_extended_message_written.order_type);
  assert(order_add_extended_message_read.time_in_force == order_add_extended_message_written.time_in_force);
  assert(order_add_extended_message_read.side == order_add_extended_message_written.side);
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> assert(order_add_extended_message_read.quantity[order_add_extended_message_at] == order_add_extended_message_written.quantity[order_add_extended_message_at]); order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 8 -> assert(order_add_extended_message_read.price[order_add_extended_message_at] == order_add_extended_message_written.price[order_add_extended_message_at]); order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  assert(order_add_extended_message_read.order_capacity == order_add_extended_message_written.order_capacity);
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 2 -> assert(order_add_extended_message_read.account[order_add_extended_message_at] == order_add_extended_message_written.account[order_add_extended_message_at]); order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 8 -> assert(order_add_extended_message_read.user_tag[order_add_extended_message_at] == order_add_extended_message_written.user_tag[order_add_extended_message_at]); order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  assert(order_add_extended_message_read.reserved_1 == order_add_extended_message_written.reserved_1);
  assert(order_add_extended_message_read.reserved_byte_2 == order_add_extended_message_written.reserved_byte_2);
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> assert(order_add_extended_message_read.reserved_4[order_add_extended_message_at] == order_add_extended_message_written.reserved_4[order_add_extended_message_at]); order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  assert(order_add_extended_message_read.reserved_byte_3 == order_add_extended_message_written.reserved_byte_3);
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> assert(order_add_extended_message_read.reserved_int_2[order_add_extended_message_at] == order_add_extended_message_written.reserved_int_2[order_add_extended_message_at]); order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  assert(order_add_extended_message_read.reserved_byte_4 == order_add_extended_message_written.reserved_byte_4);
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> assert(order_add_extended_message_read.reserved_int_3[order_add_extended_message_at] == order_add_extended_message_written.reserved_int_3[order_add_extended_message_at]); order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> assert(order_add_extended_message_read.display_quantity[order_add_extended_message_at] == order_add_extended_message_written.display_quantity[order_add_extended_message_at]); order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  order_add_extended_message_at = 0;
  do
  :: order_add_extended_message_at < 4 -> assert(order_add_extended_message_read.min_qty[order_add_extended_message_at] == order_add_extended_message_written.min_qty[order_add_extended_message_at]); order_add_extended_message_at = order_add_extended_message_at + 1
  :: else -> break
  od;
  assert(order_add_extended_message_read.reserved_byte_5 == order_add_extended_message_written.reserved_byte_5);
  skip
}

/* ---- Order Cancel Message: 12 bytes ------------------------------------------ */

/* The Order Cancel message is sent when a user wishes to cancel an open order. */
typedef OrderCancelMessage {
  byte order_ref[4];
  byte user_tag[8]
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_ref[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.user_tag[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_message(order_cancel_message_record, order_cancel_message_base) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_ref[order_cancel_message_at] = (order_cancel_message_base + 0 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.user_tag[order_cancel_message_at] = (order_cancel_message_base + 4 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 12 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.order_ref[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.user_tag[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message off the wire, 12 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_ref[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.user_tag[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Message is what was written, byte for byte */
inline equal_order_cancel_message(order_cancel_message_read, order_cancel_message_written) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.order_ref[order_cancel_message_at] == order_cancel_message_written.order_ref[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.user_tag[order_cancel_message_at] == order_cancel_message_written.user_tag[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modify Message: 24 bytes ------------------------------------------ */

/* The Order Modify message is sent when a user wishes to modify an open order. Order quantity and/or limit price may be modified. Both values must be included, even if one of them is unchanged. */
typedef OrderModifyMessage {
  byte order_ref[4];
  byte price[8];
  byte quantity[4];
  byte user_tag[8]
};

int order_modify_message_at;

/* every byte of Order Modify Message set to one value */
inline fill_order_modify_message(order_modify_message_record, order_modify_message_value) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.order_ref[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.price[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.quantity[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.user_tag[order_modify_message_at] = order_modify_message_value; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modify Message set to where it lies, so a field read out of place says so */
inline ramp_order_modify_message(order_modify_message_record, order_modify_message_base) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.order_ref[order_modify_message_at] = (order_modify_message_base + 0 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.price[order_modify_message_at] = (order_modify_message_base + 4 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.quantity[order_modify_message_at] = (order_modify_message_base + 12 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.user_tag[order_modify_message_at] = (order_modify_message_base + 16 + order_modify_message_at + 1) % 256; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modify Message to the wire, 24 bytes from where the cursor stands */
inline encode_order_modify_message(order_modify_message_record) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> wire[at] = order_modify_message_record.order_ref[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.price[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> wire[at] = order_modify_message_record.quantity[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> wire[at] = order_modify_message_record.user_tag[order_modify_message_at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modify Message off the wire, 24 bytes from where the cursor stands */
inline decode_order_modify_message(order_modify_message_record) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.order_ref[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.price[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> order_modify_message_record.quantity[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> order_modify_message_record.user_tag[order_modify_message_at] = wire[at]; at = at + 1; order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modify Message is what was written, byte for byte */
inline equal_order_modify_message(order_modify_message_read, order_modify_message_written) {
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> assert(order_modify_message_read.order_ref[order_modify_message_at] == order_modify_message_written.order_ref[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.price[order_modify_message_at] == order_modify_message_written.price[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 4 -> assert(order_modify_message_read.quantity[order_modify_message_at] == order_modify_message_written.quantity[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  order_modify_message_at = 0;
  do
  :: order_modify_message_at < 8 -> assert(order_modify_message_read.user_tag[order_modify_message_at] == order_modify_message_written.user_tag[order_modify_message_at]); order_modify_message_at = order_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modify Extended Message: 49 bytes --------------------------------- */

/* The Order Modify Extended message is sent when a user wants to modify an open Order Add Extended. Order quantity and/or limit price and/or display quantity and/or minimum quantity may be modified. All values must be included, even if some are unchanged. */
typedef OrderModifyExtendedMessage {
  byte order_ref[4];
  byte price[8];
  byte quantity[4];
  byte user_tag[8];
  byte reserved_1;
  byte reserved_byte_2;
  byte reserved_4[4];
  byte reserved_byte_3;
  byte reserved_int_2[4];
  byte reserved_byte_4;
  byte reserved_int_3[4];
  byte order_capacity;
  byte display_quantity[4];
  byte reserved_int_4[4]
};

int order_modify_extended_message_at;

/* every byte of Order Modify Extended Message set to one value */
inline fill_order_modify_extended_message(order_modify_extended_message_record, order_modify_extended_message_value) {
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.order_ref[order_modify_extended_message_at] = order_modify_extended_message_value; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 8 -> order_modify_extended_message_record.price[order_modify_extended_message_at] = order_modify_extended_message_value; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.quantity[order_modify_extended_message_at] = order_modify_extended_message_value; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 8 -> order_modify_extended_message_record.user_tag[order_modify_extended_message_at] = order_modify_extended_message_value; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.reserved_1 = order_modify_extended_message_value;
  order_modify_extended_message_record.reserved_byte_2 = order_modify_extended_message_value;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_4[order_modify_extended_message_at] = order_modify_extended_message_value; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.reserved_byte_3 = order_modify_extended_message_value;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_int_2[order_modify_extended_message_at] = order_modify_extended_message_value; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.reserved_byte_4 = order_modify_extended_message_value;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_int_3[order_modify_extended_message_at] = order_modify_extended_message_value; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.order_capacity = order_modify_extended_message_value;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.display_quantity[order_modify_extended_message_at] = order_modify_extended_message_value; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_int_4[order_modify_extended_message_at] = order_modify_extended_message_value; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modify Extended Message set to where it lies, so a field read out of place says so */
inline ramp_order_modify_extended_message(order_modify_extended_message_record, order_modify_extended_message_base) {
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.order_ref[order_modify_extended_message_at] = (order_modify_extended_message_base + 0 + order_modify_extended_message_at + 1) % 256; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 8 -> order_modify_extended_message_record.price[order_modify_extended_message_at] = (order_modify_extended_message_base + 4 + order_modify_extended_message_at + 1) % 256; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.quantity[order_modify_extended_message_at] = (order_modify_extended_message_base + 12 + order_modify_extended_message_at + 1) % 256; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 8 -> order_modify_extended_message_record.user_tag[order_modify_extended_message_at] = (order_modify_extended_message_base + 16 + order_modify_extended_message_at + 1) % 256; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.reserved_1 = (order_modify_extended_message_base + 24 + 1) % 256;
  order_modify_extended_message_record.reserved_byte_2 = (order_modify_extended_message_base + 25 + 1) % 256;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_4[order_modify_extended_message_at] = (order_modify_extended_message_base + 26 + order_modify_extended_message_at + 1) % 256; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.reserved_byte_3 = (order_modify_extended_message_base + 30 + 1) % 256;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_int_2[order_modify_extended_message_at] = (order_modify_extended_message_base + 31 + order_modify_extended_message_at + 1) % 256; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.reserved_byte_4 = (order_modify_extended_message_base + 35 + 1) % 256;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_int_3[order_modify_extended_message_at] = (order_modify_extended_message_base + 36 + order_modify_extended_message_at + 1) % 256; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.order_capacity = (order_modify_extended_message_base + 40 + 1) % 256;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.display_quantity[order_modify_extended_message_at] = (order_modify_extended_message_base + 41 + order_modify_extended_message_at + 1) % 256; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_int_4[order_modify_extended_message_at] = (order_modify_extended_message_base + 45 + order_modify_extended_message_at + 1) % 256; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modify Extended Message to the wire, 49 bytes from where the cursor stands */
inline encode_order_modify_extended_message(order_modify_extended_message_record) {
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> wire[at] = order_modify_extended_message_record.order_ref[order_modify_extended_message_at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 8 -> wire[at] = order_modify_extended_message_record.price[order_modify_extended_message_at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> wire[at] = order_modify_extended_message_record.quantity[order_modify_extended_message_at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 8 -> wire[at] = order_modify_extended_message_record.user_tag[order_modify_extended_message_at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_modify_extended_message_record.reserved_1; at = at + 1;
  wire[at] = order_modify_extended_message_record.reserved_byte_2; at = at + 1;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> wire[at] = order_modify_extended_message_record.reserved_4[order_modify_extended_message_at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_modify_extended_message_record.reserved_byte_3; at = at + 1;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> wire[at] = order_modify_extended_message_record.reserved_int_2[order_modify_extended_message_at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_modify_extended_message_record.reserved_byte_4; at = at + 1;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> wire[at] = order_modify_extended_message_record.reserved_int_3[order_modify_extended_message_at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = order_modify_extended_message_record.order_capacity; at = at + 1;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> wire[at] = order_modify_extended_message_record.display_quantity[order_modify_extended_message_at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> wire[at] = order_modify_extended_message_record.reserved_int_4[order_modify_extended_message_at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modify Extended Message off the wire, 49 bytes from where the cursor stands */
inline decode_order_modify_extended_message(order_modify_extended_message_record) {
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.order_ref[order_modify_extended_message_at] = wire[at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 8 -> order_modify_extended_message_record.price[order_modify_extended_message_at] = wire[at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.quantity[order_modify_extended_message_at] = wire[at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 8 -> order_modify_extended_message_record.user_tag[order_modify_extended_message_at] = wire[at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.reserved_1 = wire[at]; at = at + 1;
  order_modify_extended_message_record.reserved_byte_2 = wire[at]; at = at + 1;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_4[order_modify_extended_message_at] = wire[at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.reserved_byte_3 = wire[at]; at = at + 1;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_int_2[order_modify_extended_message_at] = wire[at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.reserved_byte_4 = wire[at]; at = at + 1;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_int_3[order_modify_extended_message_at] = wire[at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_record.order_capacity = wire[at]; at = at + 1;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.display_quantity[order_modify_extended_message_at] = wire[at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> order_modify_extended_message_record.reserved_int_4[order_modify_extended_message_at] = wire[at]; at = at + 1; order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modify Extended Message is what was written, byte for byte */
inline equal_order_modify_extended_message(order_modify_extended_message_read, order_modify_extended_message_written) {
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> assert(order_modify_extended_message_read.order_ref[order_modify_extended_message_at] == order_modify_extended_message_written.order_ref[order_modify_extended_message_at]); order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 8 -> assert(order_modify_extended_message_read.price[order_modify_extended_message_at] == order_modify_extended_message_written.price[order_modify_extended_message_at]); order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> assert(order_modify_extended_message_read.quantity[order_modify_extended_message_at] == order_modify_extended_message_written.quantity[order_modify_extended_message_at]); order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 8 -> assert(order_modify_extended_message_read.user_tag[order_modify_extended_message_at] == order_modify_extended_message_written.user_tag[order_modify_extended_message_at]); order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  assert(order_modify_extended_message_read.reserved_1 == order_modify_extended_message_written.reserved_1);
  assert(order_modify_extended_message_read.reserved_byte_2 == order_modify_extended_message_written.reserved_byte_2);
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> assert(order_modify_extended_message_read.reserved_4[order_modify_extended_message_at] == order_modify_extended_message_written.reserved_4[order_modify_extended_message_at]); order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  assert(order_modify_extended_message_read.reserved_byte_3 == order_modify_extended_message_written.reserved_byte_3);
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> assert(order_modify_extended_message_read.reserved_int_2[order_modify_extended_message_at] == order_modify_extended_message_written.reserved_int_2[order_modify_extended_message_at]); order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  assert(order_modify_extended_message_read.reserved_byte_4 == order_modify_extended_message_written.reserved_byte_4);
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> assert(order_modify_extended_message_read.reserved_int_3[order_modify_extended_message_at] == order_modify_extended_message_written.reserved_int_3[order_modify_extended_message_at]); order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  assert(order_modify_extended_message_read.order_capacity == order_modify_extended_message_written.order_capacity);
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> assert(order_modify_extended_message_read.display_quantity[order_modify_extended_message_at] == order_modify_extended_message_written.display_quantity[order_modify_extended_message_at]); order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  order_modify_extended_message_at = 0;
  do
  :: order_modify_extended_message_at < 4 -> assert(order_modify_extended_message_read.reserved_int_4[order_modify_extended_message_at] == order_modify_extended_message_written.reserved_int_4[order_modify_extended_message_at]); order_modify_extended_message_at = order_modify_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Iceberg Order Refresh Message: 16 bytes --------------------------------- */

/* A2X sends an Iceberg Order Refresh message to notify the Member when an iceberg order is refreshed from the non-displayed reserve quantity. */
typedef IcebergOrderRefreshMessage {
  byte order_ref[4];
  byte orig_a2_x_ord_id[4];
  byte new_a2_x_ord_id[4];
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
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.orig_a2_x_ord_id[iceberg_order_refresh_message_at] = iceberg_order_refresh_message_value; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.new_a2_x_ord_id[iceberg_order_refresh_message_at] = iceberg_order_refresh_message_value; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
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
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.orig_a2_x_ord_id[iceberg_order_refresh_message_at] = (iceberg_order_refresh_message_base + 4 + iceberg_order_refresh_message_at + 1) % 256; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.new_a2_x_ord_id[iceberg_order_refresh_message_at] = (iceberg_order_refresh_message_base + 8 + iceberg_order_refresh_message_at + 1) % 256; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
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
  :: iceberg_order_refresh_message_at < 4 -> wire[at] = iceberg_order_refresh_message_record.orig_a2_x_ord_id[iceberg_order_refresh_message_at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> wire[at] = iceberg_order_refresh_message_record.new_a2_x_ord_id[iceberg_order_refresh_message_at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
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
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.orig_a2_x_ord_id[iceberg_order_refresh_message_at] = wire[at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> iceberg_order_refresh_message_record.new_a2_x_ord_id[iceberg_order_refresh_message_at] = wire[at]; at = at + 1; iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
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
  :: iceberg_order_refresh_message_at < 4 -> assert(iceberg_order_refresh_message_read.orig_a2_x_ord_id[iceberg_order_refresh_message_at] == iceberg_order_refresh_message_written.orig_a2_x_ord_id[iceberg_order_refresh_message_at]); iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> assert(iceberg_order_refresh_message_read.new_a2_x_ord_id[iceberg_order_refresh_message_at] == iceberg_order_refresh_message_written.new_a2_x_ord_id[iceberg_order_refresh_message_at]); iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  iceberg_order_refresh_message_at = 0;
  do
  :: iceberg_order_refresh_message_at < 4 -> assert(iceberg_order_refresh_message_read.quantity[iceberg_order_refresh_message_at] == iceberg_order_refresh_message_written.quantity[iceberg_order_refresh_message_at]); iceberg_order_refresh_message_at = iceberg_order_refresh_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Capture Message: 48 bytes ----------------------------------------- */

/* A2X uses a Trade Capture Report message for the purpose of allowing members to submit Large in Scale (LS), Negotiated Benchmark Cross (NBC) and Matched Principal (MP) trades to the exchange. */
typedef TradeCaptureMessage {
  byte quantity[4];
  byte price[8];
  byte security_id_long[4];
  byte trade_capture_type;
  byte reserved_1;
  byte user_tag[8];
  byte reserved_8[8];
  byte buy_account[2];
  byte buy_order_capacity;
  byte reserved_long_2[8];
  byte sell_account[2];
  byte sell_order_capacity
};

int trade_capture_message_at;

/* every byte of Trade Capture Message set to one value */
inline fill_trade_capture_message(trade_capture_message_record, trade_capture_message_value) {
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 4 -> trade_capture_message_record.quantity[trade_capture_message_at] = trade_capture_message_value; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.price[trade_capture_message_at] = trade_capture_message_value; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 4 -> trade_capture_message_record.security_id_long[trade_capture_message_at] = trade_capture_message_value; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_record.trade_capture_type = trade_capture_message_value;
  trade_capture_message_record.reserved_1 = trade_capture_message_value;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.user_tag[trade_capture_message_at] = trade_capture_message_value; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.reserved_8[trade_capture_message_at] = trade_capture_message_value; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 2 -> trade_capture_message_record.buy_account[trade_capture_message_at] = trade_capture_message_value; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_record.buy_order_capacity = trade_capture_message_value;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.reserved_long_2[trade_capture_message_at] = trade_capture_message_value; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 2 -> trade_capture_message_record.sell_account[trade_capture_message_at] = trade_capture_message_value; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_record.sell_order_capacity = trade_capture_message_value;
  skip
}

/* each byte of Trade Capture Message set to where it lies, so a field read out of place says so */
inline ramp_trade_capture_message(trade_capture_message_record, trade_capture_message_base) {
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 4 -> trade_capture_message_record.quantity[trade_capture_message_at] = (trade_capture_message_base + 0 + trade_capture_message_at + 1) % 256; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.price[trade_capture_message_at] = (trade_capture_message_base + 4 + trade_capture_message_at + 1) % 256; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 4 -> trade_capture_message_record.security_id_long[trade_capture_message_at] = (trade_capture_message_base + 12 + trade_capture_message_at + 1) % 256; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_record.trade_capture_type = (trade_capture_message_base + 16 + 1) % 256;
  trade_capture_message_record.reserved_1 = (trade_capture_message_base + 17 + 1) % 256;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.user_tag[trade_capture_message_at] = (trade_capture_message_base + 18 + trade_capture_message_at + 1) % 256; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.reserved_8[trade_capture_message_at] = (trade_capture_message_base + 26 + trade_capture_message_at + 1) % 256; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 2 -> trade_capture_message_record.buy_account[trade_capture_message_at] = (trade_capture_message_base + 34 + trade_capture_message_at + 1) % 256; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_record.buy_order_capacity = (trade_capture_message_base + 36 + 1) % 256;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.reserved_long_2[trade_capture_message_at] = (trade_capture_message_base + 37 + trade_capture_message_at + 1) % 256; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 2 -> trade_capture_message_record.sell_account[trade_capture_message_at] = (trade_capture_message_base + 45 + trade_capture_message_at + 1) % 256; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_record.sell_order_capacity = (trade_capture_message_base + 47 + 1) % 256;
  skip
}

/* Trade Capture Message to the wire, 48 bytes from where the cursor stands */
inline encode_trade_capture_message(trade_capture_message_record) {
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 4 -> wire[at] = trade_capture_message_record.quantity[trade_capture_message_at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> wire[at] = trade_capture_message_record.price[trade_capture_message_at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 4 -> wire[at] = trade_capture_message_record.security_id_long[trade_capture_message_at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_capture_message_record.trade_capture_type; at = at + 1;
  wire[at] = trade_capture_message_record.reserved_1; at = at + 1;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> wire[at] = trade_capture_message_record.user_tag[trade_capture_message_at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> wire[at] = trade_capture_message_record.reserved_8[trade_capture_message_at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 2 -> wire[at] = trade_capture_message_record.buy_account[trade_capture_message_at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_capture_message_record.buy_order_capacity; at = at + 1;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> wire[at] = trade_capture_message_record.reserved_long_2[trade_capture_message_at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 2 -> wire[at] = trade_capture_message_record.sell_account[trade_capture_message_at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_capture_message_record.sell_order_capacity; at = at + 1;
  skip
}

/* Trade Capture Message off the wire, 48 bytes from where the cursor stands */
inline decode_trade_capture_message(trade_capture_message_record) {
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 4 -> trade_capture_message_record.quantity[trade_capture_message_at] = wire[at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.price[trade_capture_message_at] = wire[at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 4 -> trade_capture_message_record.security_id_long[trade_capture_message_at] = wire[at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_record.trade_capture_type = wire[at]; at = at + 1;
  trade_capture_message_record.reserved_1 = wire[at]; at = at + 1;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.user_tag[trade_capture_message_at] = wire[at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.reserved_8[trade_capture_message_at] = wire[at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 2 -> trade_capture_message_record.buy_account[trade_capture_message_at] = wire[at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_record.buy_order_capacity = wire[at]; at = at + 1;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> trade_capture_message_record.reserved_long_2[trade_capture_message_at] = wire[at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 2 -> trade_capture_message_record.sell_account[trade_capture_message_at] = wire[at]; at = at + 1; trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_record.sell_order_capacity = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Capture Message is what was written, byte for byte */
inline equal_trade_capture_message(trade_capture_message_read, trade_capture_message_written) {
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 4 -> assert(trade_capture_message_read.quantity[trade_capture_message_at] == trade_capture_message_written.quantity[trade_capture_message_at]); trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> assert(trade_capture_message_read.price[trade_capture_message_at] == trade_capture_message_written.price[trade_capture_message_at]); trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 4 -> assert(trade_capture_message_read.security_id_long[trade_capture_message_at] == trade_capture_message_written.security_id_long[trade_capture_message_at]); trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  assert(trade_capture_message_read.trade_capture_type == trade_capture_message_written.trade_capture_type);
  assert(trade_capture_message_read.reserved_1 == trade_capture_message_written.reserved_1);
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> assert(trade_capture_message_read.user_tag[trade_capture_message_at] == trade_capture_message_written.user_tag[trade_capture_message_at]); trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> assert(trade_capture_message_read.reserved_8[trade_capture_message_at] == trade_capture_message_written.reserved_8[trade_capture_message_at]); trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 2 -> assert(trade_capture_message_read.buy_account[trade_capture_message_at] == trade_capture_message_written.buy_account[trade_capture_message_at]); trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  assert(trade_capture_message_read.buy_order_capacity == trade_capture_message_written.buy_order_capacity);
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 8 -> assert(trade_capture_message_read.reserved_long_2[trade_capture_message_at] == trade_capture_message_written.reserved_long_2[trade_capture_message_at]); trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  trade_capture_message_at = 0;
  do
  :: trade_capture_message_at < 2 -> assert(trade_capture_message_read.sell_account[trade_capture_message_at] == trade_capture_message_written.sell_account[trade_capture_message_at]); trade_capture_message_at = trade_capture_message_at + 1
  :: else -> break
  od;
  assert(trade_capture_message_read.sell_order_capacity == trade_capture_message_written.sell_order_capacity);
  skip
}

/* ---- Trade Message: 42 bytes ------------------------------------------------- */

/* The Trade message is published when an order executes. The Trade message is also used to communicate indicative trade reports at lock time for Market at Close orders. Note that the price and tradeRef values will be zero for indicative trade reports published when MaC orders are matched at lock time. */
typedef TradeMessage {
  byte order_ref[4];
  byte quantity[4];
  byte price[8];
  byte side;
  byte trade_ref[4];
  byte ccp_code;
  byte liq_indicator;
  byte security_id_short[2];
  byte trade_timestamp[8];
  byte user_tag[8];
  byte reserved_1
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_ref[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_ref[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.ccp_code = trade_message_value;
  trade_message_record.liq_indicator = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.security_id_short[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_timestamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.user_tag[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.reserved_1 = trade_message_value;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_ref[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = (trade_message_base + 4 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = (trade_message_base + 8 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = (trade_message_base + 16 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_ref[trade_message_at] = (trade_message_base + 17 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.ccp_code = (trade_message_base + 21 + 1) % 256;
  trade_message_record.liq_indicator = (trade_message_base + 22 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.security_id_short[trade_message_at] = (trade_message_base + 23 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_timestamp[trade_message_at] = (trade_message_base + 25 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.user_tag[trade_message_at] = (trade_message_base + 33 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.reserved_1 = (trade_message_base + 41 + 1) % 256;
  skip
}

/* Trade Message to the wire, 42 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.order_ref[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.quantity[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.side; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.trade_ref[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.ccp_code; at = at + 1;
  wire[at] = trade_message_record.liq_indicator; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> wire[at] = trade_message_record.security_id_short[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.trade_timestamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.user_tag[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.reserved_1; at = at + 1;
  skip
}

/* Trade Message off the wire, 42 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.order_ref[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.trade_ref[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.ccp_code = wire[at]; at = at + 1;
  trade_message_record.liq_indicator = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.security_id_short[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.trade_timestamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.user_tag[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.order_ref[trade_message_at] == trade_message_written.order_ref[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.quantity[trade_message_at] == trade_message_written.quantity[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.side == trade_message_written.side);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.trade_ref[trade_message_at] == trade_message_written.trade_ref[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.ccp_code == trade_message_written.ccp_code);
  assert(trade_message_read.liq_indicator == trade_message_written.liq_indicator);
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> assert(trade_message_read.security_id_short[trade_message_at] == trade_message_written.security_id_short[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.trade_timestamp[trade_message_at] == trade_message_written.trade_timestamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.user_tag[trade_message_at] == trade_message_written.user_tag[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.reserved_1 == trade_message_written.reserved_1);
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

/* Order Add Message: encoded, read back, and compared */
proctype check_order_add_message() {
  OrderAddMessage order_add_message_sent;
  OrderAddMessage order_add_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_add_message(order_add_message_sent, 0)
  :: pattern == 1 -> fill_order_add_message(order_add_message_sent, 32)
  :: pattern == 2 -> fill_order_add_message(order_add_message_sent, 255)
  :: else -> ramp_order_add_message(order_add_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_add_message(order_add_message_sent);
    assert(at == 46);
    at = 0;
    decode_order_add_message(order_add_message_got);
    assert(at == 46);
    equal_order_add_message(order_add_message_got, order_add_message_sent)
  }
}

/* Order Add Extended Message: encoded, read back, and compared */
proctype check_order_add_extended_message() {
  OrderAddExtendedMessage order_add_extended_message_sent;
  OrderAddExtendedMessage order_add_extended_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_add_extended_message(order_add_extended_message_sent, 0)
  :: pattern == 1 -> fill_order_add_extended_message(order_add_extended_message_sent, 32)
  :: pattern == 2 -> fill_order_add_extended_message(order_add_extended_message_sent, 255)
  :: else -> ramp_order_add_extended_message(order_add_extended_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_add_extended_message(order_add_extended_message_sent);
    assert(at == 55);
    at = 0;
    decode_order_add_extended_message(order_add_extended_message_got);
    assert(at == 55);
    equal_order_add_extended_message(order_add_extended_message_got, order_add_extended_message_sent)
  }
}

/* Order Cancel Message: encoded, read back, and compared */
proctype check_order_cancel_message() {
  OrderCancelMessage order_cancel_message_sent;
  OrderCancelMessage order_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_message(order_cancel_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_message(order_cancel_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_message(order_cancel_message_sent, 255)
  :: else -> ramp_order_cancel_message(order_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_message(order_cancel_message_sent);
    assert(at == 12);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 12);
    equal_order_cancel_message(order_cancel_message_got, order_cancel_message_sent)
  }
}

/* Order Modify Message: encoded, read back, and compared */
proctype check_order_modify_message() {
  OrderModifyMessage order_modify_message_sent;
  OrderModifyMessage order_modify_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modify_message(order_modify_message_sent, 0)
  :: pattern == 1 -> fill_order_modify_message(order_modify_message_sent, 32)
  :: pattern == 2 -> fill_order_modify_message(order_modify_message_sent, 255)
  :: else -> ramp_order_modify_message(order_modify_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modify_message(order_modify_message_sent);
    assert(at == 24);
    at = 0;
    decode_order_modify_message(order_modify_message_got);
    assert(at == 24);
    equal_order_modify_message(order_modify_message_got, order_modify_message_sent)
  }
}

/* Order Modify Extended Message: encoded, read back, and compared */
proctype check_order_modify_extended_message() {
  OrderModifyExtendedMessage order_modify_extended_message_sent;
  OrderModifyExtendedMessage order_modify_extended_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modify_extended_message(order_modify_extended_message_sent, 0)
  :: pattern == 1 -> fill_order_modify_extended_message(order_modify_extended_message_sent, 32)
  :: pattern == 2 -> fill_order_modify_extended_message(order_modify_extended_message_sent, 255)
  :: else -> ramp_order_modify_extended_message(order_modify_extended_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modify_extended_message(order_modify_extended_message_sent);
    assert(at == 49);
    at = 0;
    decode_order_modify_extended_message(order_modify_extended_message_got);
    assert(at == 49);
    equal_order_modify_extended_message(order_modify_extended_message_got, order_modify_extended_message_sent)
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

/* Trade Capture Message: encoded, read back, and compared */
proctype check_trade_capture_message() {
  TradeCaptureMessage trade_capture_message_sent;
  TradeCaptureMessage trade_capture_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_capture_message(trade_capture_message_sent, 0)
  :: pattern == 1 -> fill_trade_capture_message(trade_capture_message_sent, 32)
  :: pattern == 2 -> fill_trade_capture_message(trade_capture_message_sent, 255)
  :: else -> ramp_trade_capture_message(trade_capture_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_capture_message(trade_capture_message_sent);
    assert(at == 48);
    at = 0;
    decode_trade_capture_message(trade_capture_message_got);
    assert(at == 48);
    equal_trade_capture_message(trade_capture_message_got, trade_capture_message_sent)
  }
}

/* Trade Message: encoded, read back, and compared */
proctype check_trade_message() {
  TradeMessage trade_message_sent;
  TradeMessage trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message(trade_message_sent, 0)
  :: pattern == 1 -> fill_trade_message(trade_message_sent, 32)
  :: pattern == 2 -> fill_trade_message(trade_message_sent, 255)
  :: else -> ramp_trade_message(trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message(trade_message_sent);
    assert(at == 42);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 42);
    equal_trade_message(trade_message_got, trade_message_sent)
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_login_message()
  :: run check_login_response_message()
  :: run check_logout_message()
  :: run check_order_add_message()
  :: run check_order_add_extended_message()
  :: run check_order_cancel_message()
  :: run check_order_modify_message()
  :: run check_order_modify_extended_message()
  :: run check_iceberg_order_refresh_message()
  :: run check_trade_capture_message()
  :: run check_trade_message()
  :: run check_trade_bust_message()
  fi
}
