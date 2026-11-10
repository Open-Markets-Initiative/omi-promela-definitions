/*
 * AsiaNext Aquis Trading Protocol
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
#define WIRE 44

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 11 bytes ------------------------------------------------ */

/* AsiaNext Atp message header */
typedef MessageHeader {
  byte msg_length[2];
  byte msg_type;
  byte msg_seq_no[8]
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
  :: message_header_at < 8 -> message_header_record.msg_seq_no[message_header_at] = message_header_value; message_header_at = message_header_at + 1
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
  :: message_header_at < 8 -> message_header_record.msg_seq_no[message_header_at] = (message_header_base + 3 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 11 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.msg_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.msg_type; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.msg_seq_no[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 11 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.msg_type = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.msg_seq_no[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
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
  :: message_header_at < 8 -> assert(message_header_read.msg_seq_no[message_header_at] == message_header_written.msg_seq_no[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Message: 44 bytes ------------------------------------------------- */

/* The Login message is sent by the trading Member as the initial message used to establish a trading session. It is also used to re-establish a session after a break. */
typedef LoginMessage {
  byte protocol_version[2];
  byte sender_id[16];
  byte password[16];
  byte inactivity_timeout[2];
  byte atp_seq_no[8]
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
  :: login_message_at < 8 -> login_message_record.atp_seq_no[login_message_at] = login_message_value; login_message_at = login_message_at + 1
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
  :: login_message_at < 8 -> login_message_record.atp_seq_no[login_message_at] = (login_message_base + 36 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message to the wire, 44 bytes from where the cursor stands */
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
  :: login_message_at < 8 -> wire[at] = login_message_record.atp_seq_no[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message off the wire, 44 bytes from where the cursor stands */
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
  :: login_message_at < 8 -> login_message_record.atp_seq_no[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
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
  :: login_message_at < 8 -> assert(login_message_read.atp_seq_no[login_message_at] == login_message_written.atp_seq_no[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 9 bytes ----------------------------------------- */

/* The Login Response message is sent by AsiaNext to acknowledge a Login request, and either accept or reject it. */
typedef LoginResponseMessage {
  byte result_code;
  byte client_seq_no[8]
};

int login_response_message_at;

/* every byte of Login Response Message set to one value */
inline fill_login_response_message(login_response_message_record, login_response_message_value) {
  login_response_message_record.result_code = login_response_message_value;
  login_response_message_at = 0;
  do
  :: login_response_message_at < 8 -> login_response_message_record.client_seq_no[login_response_message_at] = login_response_message_value; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Response Message set to where it lies, so a field read out of place says so */
inline ramp_login_response_message(login_response_message_record, login_response_message_base) {
  login_response_message_record.result_code = (login_response_message_base + 0 + 1) % 256;
  login_response_message_at = 0;
  do
  :: login_response_message_at < 8 -> login_response_message_record.client_seq_no[login_response_message_at] = (login_response_message_base + 1 + login_response_message_at + 1) % 256; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response Message to the wire, 9 bytes from where the cursor stands */
inline encode_login_response_message(login_response_message_record) {
  wire[at] = login_response_message_record.result_code; at = at + 1;
  login_response_message_at = 0;
  do
  :: login_response_message_at < 8 -> wire[at] = login_response_message_record.client_seq_no[login_response_message_at]; at = at + 1; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response Message off the wire, 9 bytes from where the cursor stands */
inline decode_login_response_message(login_response_message_record) {
  login_response_message_record.result_code = wire[at]; at = at + 1;
  login_response_message_at = 0;
  do
  :: login_response_message_at < 8 -> login_response_message_record.client_seq_no[login_response_message_at] = wire[at]; at = at + 1; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Response Message is what was written, byte for byte */
inline equal_login_response_message(login_response_message_read, login_response_message_written) {
  assert(login_response_message_read.result_code == login_response_message_written.result_code);
  login_response_message_at = 0;
  do
  :: login_response_message_at < 8 -> assert(login_response_message_read.client_seq_no[login_response_message_at] == login_response_message_written.client_seq_no[login_response_message_at]); login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logout Message: 33 bytes ------------------------------------------------ */

/* The Logout message is usually sent as a response to the Logout Request. However it may also be sent by AsiaNext in case of a low sequence number or other protocol violation, or for other reasons. */
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

/* ---- Quote Request Message: 37 bytes ----------------------------------------- */

/* The Quote Request Message is sent to commence RFQ session. */
typedef QuoteRequestMessage {
  byte security_id_long[4];
  byte quantity[4];
  byte side;
  byte user_tag[8];
  byte market_maker_code_1[4];
  byte market_maker_code_2[4];
  byte market_maker_code_3[4];
  byte market_maker_code_4[4];
  byte market_maker_code_5[4]
};

int quote_request_message_at;

/* every byte of Quote Request Message set to one value */
inline fill_quote_request_message(quote_request_message_record, quote_request_message_value) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.security_id_long[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.quantity[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_record.side = quote_request_message_value;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.user_tag[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_1[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_2[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_3[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_4[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_5[quote_request_message_at] = quote_request_message_value; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Request Message set to where it lies, so a field read out of place says so */
inline ramp_quote_request_message(quote_request_message_record, quote_request_message_base) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.security_id_long[quote_request_message_at] = (quote_request_message_base + 0 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.quantity[quote_request_message_at] = (quote_request_message_base + 4 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_record.side = (quote_request_message_base + 8 + 1) % 256;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.user_tag[quote_request_message_at] = (quote_request_message_base + 9 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_1[quote_request_message_at] = (quote_request_message_base + 17 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_2[quote_request_message_at] = (quote_request_message_base + 21 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_3[quote_request_message_at] = (quote_request_message_base + 25 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_4[quote_request_message_at] = (quote_request_message_base + 29 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_5[quote_request_message_at] = (quote_request_message_base + 33 + quote_request_message_at + 1) % 256; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request Message to the wire, 37 bytes from where the cursor stands */
inline encode_quote_request_message(quote_request_message_record) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> wire[at] = quote_request_message_record.security_id_long[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> wire[at] = quote_request_message_record.quantity[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_request_message_record.side; at = at + 1;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> wire[at] = quote_request_message_record.user_tag[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> wire[at] = quote_request_message_record.market_maker_code_1[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> wire[at] = quote_request_message_record.market_maker_code_2[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> wire[at] = quote_request_message_record.market_maker_code_3[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> wire[at] = quote_request_message_record.market_maker_code_4[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> wire[at] = quote_request_message_record.market_maker_code_5[quote_request_message_at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request Message off the wire, 37 bytes from where the cursor stands */
inline decode_quote_request_message(quote_request_message_record) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.security_id_long[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.quantity[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_record.side = wire[at]; at = at + 1;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> quote_request_message_record.user_tag[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_1[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_2[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_3[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_4[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> quote_request_message_record.market_maker_code_5[quote_request_message_at] = wire[at]; at = at + 1; quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Request Message is what was written, byte for byte */
inline equal_quote_request_message(quote_request_message_read, quote_request_message_written) {
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> assert(quote_request_message_read.security_id_long[quote_request_message_at] == quote_request_message_written.security_id_long[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> assert(quote_request_message_read.quantity[quote_request_message_at] == quote_request_message_written.quantity[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  assert(quote_request_message_read.side == quote_request_message_written.side);
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 8 -> assert(quote_request_message_read.user_tag[quote_request_message_at] == quote_request_message_written.user_tag[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> assert(quote_request_message_read.market_maker_code_1[quote_request_message_at] == quote_request_message_written.market_maker_code_1[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> assert(quote_request_message_read.market_maker_code_2[quote_request_message_at] == quote_request_message_written.market_maker_code_2[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> assert(quote_request_message_read.market_maker_code_3[quote_request_message_at] == quote_request_message_written.market_maker_code_3[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> assert(quote_request_message_read.market_maker_code_4[quote_request_message_at] == quote_request_message_written.market_maker_code_4[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  quote_request_message_at = 0;
  do
  :: quote_request_message_at < 4 -> assert(quote_request_message_read.market_maker_code_5[quote_request_message_at] == quote_request_message_written.market_maker_code_5[quote_request_message_at]); quote_request_message_at = quote_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Request Notification Message: 35 bytes ---------------------------- */

/* The Quote Request Notification is sent back to requestor to acknowledge the Quote Request. It is also sent to Market Maker to share the Quote Request. */
typedef QuoteRequestNotificationMessage {
  byte rfq_session_id[8];
  byte security_id_long[4];
  byte quantity[4];
  byte side;
  byte quote_request_status;
  byte status_details;
  byte msg_ref[8];
  byte user_tag[8]
};

int quote_request_notification_message_at;

/* every byte of Quote Request Notification Message set to one value */
inline fill_quote_request_notification_message(quote_request_notification_message_record, quote_request_notification_message_value) {
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> quote_request_notification_message_record.rfq_session_id[quote_request_notification_message_at] = quote_request_notification_message_value; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 4 -> quote_request_notification_message_record.security_id_long[quote_request_notification_message_at] = quote_request_notification_message_value; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 4 -> quote_request_notification_message_record.quantity[quote_request_notification_message_at] = quote_request_notification_message_value; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_record.side = quote_request_notification_message_value;
  quote_request_notification_message_record.quote_request_status = quote_request_notification_message_value;
  quote_request_notification_message_record.status_details = quote_request_notification_message_value;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> quote_request_notification_message_record.msg_ref[quote_request_notification_message_at] = quote_request_notification_message_value; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> quote_request_notification_message_record.user_tag[quote_request_notification_message_at] = quote_request_notification_message_value; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Request Notification Message set to where it lies, so a field read out of place says so */
inline ramp_quote_request_notification_message(quote_request_notification_message_record, quote_request_notification_message_base) {
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> quote_request_notification_message_record.rfq_session_id[quote_request_notification_message_at] = (quote_request_notification_message_base + 0 + quote_request_notification_message_at + 1) % 256; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 4 -> quote_request_notification_message_record.security_id_long[quote_request_notification_message_at] = (quote_request_notification_message_base + 8 + quote_request_notification_message_at + 1) % 256; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 4 -> quote_request_notification_message_record.quantity[quote_request_notification_message_at] = (quote_request_notification_message_base + 12 + quote_request_notification_message_at + 1) % 256; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_record.side = (quote_request_notification_message_base + 16 + 1) % 256;
  quote_request_notification_message_record.quote_request_status = (quote_request_notification_message_base + 17 + 1) % 256;
  quote_request_notification_message_record.status_details = (quote_request_notification_message_base + 18 + 1) % 256;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> quote_request_notification_message_record.msg_ref[quote_request_notification_message_at] = (quote_request_notification_message_base + 19 + quote_request_notification_message_at + 1) % 256; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> quote_request_notification_message_record.user_tag[quote_request_notification_message_at] = (quote_request_notification_message_base + 27 + quote_request_notification_message_at + 1) % 256; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request Notification Message to the wire, 35 bytes from where the cursor stands */
inline encode_quote_request_notification_message(quote_request_notification_message_record) {
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> wire[at] = quote_request_notification_message_record.rfq_session_id[quote_request_notification_message_at]; at = at + 1; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 4 -> wire[at] = quote_request_notification_message_record.security_id_long[quote_request_notification_message_at]; at = at + 1; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 4 -> wire[at] = quote_request_notification_message_record.quantity[quote_request_notification_message_at]; at = at + 1; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_request_notification_message_record.side; at = at + 1;
  wire[at] = quote_request_notification_message_record.quote_request_status; at = at + 1;
  wire[at] = quote_request_notification_message_record.status_details; at = at + 1;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> wire[at] = quote_request_notification_message_record.msg_ref[quote_request_notification_message_at]; at = at + 1; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> wire[at] = quote_request_notification_message_record.user_tag[quote_request_notification_message_at]; at = at + 1; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Request Notification Message off the wire, 35 bytes from where the cursor stands */
inline decode_quote_request_notification_message(quote_request_notification_message_record) {
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> quote_request_notification_message_record.rfq_session_id[quote_request_notification_message_at] = wire[at]; at = at + 1; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 4 -> quote_request_notification_message_record.security_id_long[quote_request_notification_message_at] = wire[at]; at = at + 1; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 4 -> quote_request_notification_message_record.quantity[quote_request_notification_message_at] = wire[at]; at = at + 1; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_record.side = wire[at]; at = at + 1;
  quote_request_notification_message_record.quote_request_status = wire[at]; at = at + 1;
  quote_request_notification_message_record.status_details = wire[at]; at = at + 1;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> quote_request_notification_message_record.msg_ref[quote_request_notification_message_at] = wire[at]; at = at + 1; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> quote_request_notification_message_record.user_tag[quote_request_notification_message_at] = wire[at]; at = at + 1; quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Request Notification Message is what was written, byte for byte */
inline equal_quote_request_notification_message(quote_request_notification_message_read, quote_request_notification_message_written) {
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> assert(quote_request_notification_message_read.rfq_session_id[quote_request_notification_message_at] == quote_request_notification_message_written.rfq_session_id[quote_request_notification_message_at]); quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 4 -> assert(quote_request_notification_message_read.security_id_long[quote_request_notification_message_at] == quote_request_notification_message_written.security_id_long[quote_request_notification_message_at]); quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 4 -> assert(quote_request_notification_message_read.quantity[quote_request_notification_message_at] == quote_request_notification_message_written.quantity[quote_request_notification_message_at]); quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  assert(quote_request_notification_message_read.side == quote_request_notification_message_written.side);
  assert(quote_request_notification_message_read.quote_request_status == quote_request_notification_message_written.quote_request_status);
  assert(quote_request_notification_message_read.status_details == quote_request_notification_message_written.status_details);
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> assert(quote_request_notification_message_read.msg_ref[quote_request_notification_message_at] == quote_request_notification_message_written.msg_ref[quote_request_notification_message_at]); quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  quote_request_notification_message_at = 0;
  do
  :: quote_request_notification_message_at < 8 -> assert(quote_request_notification_message_read.user_tag[quote_request_notification_message_at] == quote_request_notification_message_written.user_tag[quote_request_notification_message_at]); quote_request_notification_message_at = quote_request_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Add Message: 31 bytes --------------------------------------------- */

/* The Quote Add Message is used to disseminate quotes sent by Market Makers to the RFQ session requestor. */
typedef QuoteAddMessage {
  byte aqx_order_id[8];
  byte security_id_short[2];
  byte side;
  byte quantity[4];
  byte price[8];
  byte rfq_session_id[8]
};

int quote_add_message_at;

/* every byte of Quote Add Message set to one value */
inline fill_quote_add_message(quote_add_message_record, quote_add_message_value) {
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> quote_add_message_record.aqx_order_id[quote_add_message_at] = quote_add_message_value; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 2 -> quote_add_message_record.security_id_short[quote_add_message_at] = quote_add_message_value; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_record.side = quote_add_message_value;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 4 -> quote_add_message_record.quantity[quote_add_message_at] = quote_add_message_value; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> quote_add_message_record.price[quote_add_message_at] = quote_add_message_value; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> quote_add_message_record.rfq_session_id[quote_add_message_at] = quote_add_message_value; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Add Message set to where it lies, so a field read out of place says so */
inline ramp_quote_add_message(quote_add_message_record, quote_add_message_base) {
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> quote_add_message_record.aqx_order_id[quote_add_message_at] = (quote_add_message_base + 0 + quote_add_message_at + 1) % 256; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 2 -> quote_add_message_record.security_id_short[quote_add_message_at] = (quote_add_message_base + 8 + quote_add_message_at + 1) % 256; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_record.side = (quote_add_message_base + 10 + 1) % 256;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 4 -> quote_add_message_record.quantity[quote_add_message_at] = (quote_add_message_base + 11 + quote_add_message_at + 1) % 256; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> quote_add_message_record.price[quote_add_message_at] = (quote_add_message_base + 15 + quote_add_message_at + 1) % 256; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> quote_add_message_record.rfq_session_id[quote_add_message_at] = (quote_add_message_base + 23 + quote_add_message_at + 1) % 256; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Add Message to the wire, 31 bytes from where the cursor stands */
inline encode_quote_add_message(quote_add_message_record) {
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> wire[at] = quote_add_message_record.aqx_order_id[quote_add_message_at]; at = at + 1; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 2 -> wire[at] = quote_add_message_record.security_id_short[quote_add_message_at]; at = at + 1; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_add_message_record.side; at = at + 1;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 4 -> wire[at] = quote_add_message_record.quantity[quote_add_message_at]; at = at + 1; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> wire[at] = quote_add_message_record.price[quote_add_message_at]; at = at + 1; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> wire[at] = quote_add_message_record.rfq_session_id[quote_add_message_at]; at = at + 1; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Add Message off the wire, 31 bytes from where the cursor stands */
inline decode_quote_add_message(quote_add_message_record) {
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> quote_add_message_record.aqx_order_id[quote_add_message_at] = wire[at]; at = at + 1; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 2 -> quote_add_message_record.security_id_short[quote_add_message_at] = wire[at]; at = at + 1; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_record.side = wire[at]; at = at + 1;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 4 -> quote_add_message_record.quantity[quote_add_message_at] = wire[at]; at = at + 1; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> quote_add_message_record.price[quote_add_message_at] = wire[at]; at = at + 1; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> quote_add_message_record.rfq_session_id[quote_add_message_at] = wire[at]; at = at + 1; quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Add Message is what was written, byte for byte */
inline equal_quote_add_message(quote_add_message_read, quote_add_message_written) {
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> assert(quote_add_message_read.aqx_order_id[quote_add_message_at] == quote_add_message_written.aqx_order_id[quote_add_message_at]); quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 2 -> assert(quote_add_message_read.security_id_short[quote_add_message_at] == quote_add_message_written.security_id_short[quote_add_message_at]); quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  assert(quote_add_message_read.side == quote_add_message_written.side);
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 4 -> assert(quote_add_message_read.quantity[quote_add_message_at] == quote_add_message_written.quantity[quote_add_message_at]); quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> assert(quote_add_message_read.price[quote_add_message_at] == quote_add_message_written.price[quote_add_message_at]); quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  quote_add_message_at = 0;
  do
  :: quote_add_message_at < 8 -> assert(quote_add_message_read.rfq_session_id[quote_add_message_at] == quote_add_message_written.rfq_session_id[quote_add_message_at]); quote_add_message_at = quote_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Modify Message: 22 bytes ------------------------------------------ */

/* Quote Modify Message is used to disseminate any quote modification submitted by the market makers to the RFQ session requestor. */
typedef QuoteModifyMessage {
  byte aqx_order_id[8];
  byte security_id_short[2];
  byte quantity[4];
  byte price[8]
};

int quote_modify_message_at;

/* every byte of Quote Modify Message set to one value */
inline fill_quote_modify_message(quote_modify_message_record, quote_modify_message_value) {
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 8 -> quote_modify_message_record.aqx_order_id[quote_modify_message_at] = quote_modify_message_value; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 2 -> quote_modify_message_record.security_id_short[quote_modify_message_at] = quote_modify_message_value; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 4 -> quote_modify_message_record.quantity[quote_modify_message_at] = quote_modify_message_value; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 8 -> quote_modify_message_record.price[quote_modify_message_at] = quote_modify_message_value; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Modify Message set to where it lies, so a field read out of place says so */
inline ramp_quote_modify_message(quote_modify_message_record, quote_modify_message_base) {
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 8 -> quote_modify_message_record.aqx_order_id[quote_modify_message_at] = (quote_modify_message_base + 0 + quote_modify_message_at + 1) % 256; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 2 -> quote_modify_message_record.security_id_short[quote_modify_message_at] = (quote_modify_message_base + 8 + quote_modify_message_at + 1) % 256; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 4 -> quote_modify_message_record.quantity[quote_modify_message_at] = (quote_modify_message_base + 10 + quote_modify_message_at + 1) % 256; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 8 -> quote_modify_message_record.price[quote_modify_message_at] = (quote_modify_message_base + 14 + quote_modify_message_at + 1) % 256; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Modify Message to the wire, 22 bytes from where the cursor stands */
inline encode_quote_modify_message(quote_modify_message_record) {
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 8 -> wire[at] = quote_modify_message_record.aqx_order_id[quote_modify_message_at]; at = at + 1; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 2 -> wire[at] = quote_modify_message_record.security_id_short[quote_modify_message_at]; at = at + 1; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 4 -> wire[at] = quote_modify_message_record.quantity[quote_modify_message_at]; at = at + 1; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 8 -> wire[at] = quote_modify_message_record.price[quote_modify_message_at]; at = at + 1; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Modify Message off the wire, 22 bytes from where the cursor stands */
inline decode_quote_modify_message(quote_modify_message_record) {
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 8 -> quote_modify_message_record.aqx_order_id[quote_modify_message_at] = wire[at]; at = at + 1; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 2 -> quote_modify_message_record.security_id_short[quote_modify_message_at] = wire[at]; at = at + 1; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 4 -> quote_modify_message_record.quantity[quote_modify_message_at] = wire[at]; at = at + 1; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 8 -> quote_modify_message_record.price[quote_modify_message_at] = wire[at]; at = at + 1; quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Modify Message is what was written, byte for byte */
inline equal_quote_modify_message(quote_modify_message_read, quote_modify_message_written) {
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 8 -> assert(quote_modify_message_read.aqx_order_id[quote_modify_message_at] == quote_modify_message_written.aqx_order_id[quote_modify_message_at]); quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 2 -> assert(quote_modify_message_read.security_id_short[quote_modify_message_at] == quote_modify_message_written.security_id_short[quote_modify_message_at]); quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 4 -> assert(quote_modify_message_read.quantity[quote_modify_message_at] == quote_modify_message_written.quantity[quote_modify_message_at]); quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  quote_modify_message_at = 0;
  do
  :: quote_modify_message_at < 8 -> assert(quote_modify_message_read.price[quote_modify_message_at] == quote_modify_message_written.price[quote_modify_message_at]); quote_modify_message_at = quote_modify_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Cancel Message: 10 bytes ------------------------------------------ */

/* Quote Cancel Message is used to disseminate any quote cancelation messages submitted by the market makers to the RFQ session requestor. */
typedef QuoteCancelMessage {
  byte aqx_order_id[8];
  byte security_id_short[2]
};

int quote_cancel_message_at;

/* every byte of Quote Cancel Message set to one value */
inline fill_quote_cancel_message(quote_cancel_message_record, quote_cancel_message_value) {
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 8 -> quote_cancel_message_record.aqx_order_id[quote_cancel_message_at] = quote_cancel_message_value; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> quote_cancel_message_record.security_id_short[quote_cancel_message_at] = quote_cancel_message_value; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_quote_cancel_message(quote_cancel_message_record, quote_cancel_message_base) {
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 8 -> quote_cancel_message_record.aqx_order_id[quote_cancel_message_at] = (quote_cancel_message_base + 0 + quote_cancel_message_at + 1) % 256; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> quote_cancel_message_record.security_id_short[quote_cancel_message_at] = (quote_cancel_message_base + 8 + quote_cancel_message_at + 1) % 256; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Cancel Message to the wire, 10 bytes from where the cursor stands */
inline encode_quote_cancel_message(quote_cancel_message_record) {
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 8 -> wire[at] = quote_cancel_message_record.aqx_order_id[quote_cancel_message_at]; at = at + 1; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> wire[at] = quote_cancel_message_record.security_id_short[quote_cancel_message_at]; at = at + 1; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Cancel Message off the wire, 10 bytes from where the cursor stands */
inline decode_quote_cancel_message(quote_cancel_message_record) {
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 8 -> quote_cancel_message_record.aqx_order_id[quote_cancel_message_at] = wire[at]; at = at + 1; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> quote_cancel_message_record.security_id_short[quote_cancel_message_at] = wire[at]; at = at + 1; quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Cancel Message is what was written, byte for byte */
inline equal_quote_cancel_message(quote_cancel_message_read, quote_cancel_message_written) {
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 8 -> assert(quote_cancel_message_read.aqx_order_id[quote_cancel_message_at] == quote_cancel_message_written.aqx_order_id[quote_cancel_message_at]); quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  quote_cancel_message_at = 0;
  do
  :: quote_cancel_message_at < 2 -> assert(quote_cancel_message_read.security_id_short[quote_cancel_message_at] == quote_cancel_message_written.security_id_short[quote_cancel_message_at]); quote_cancel_message_at = quote_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Bust Message: 37 bytes -------------------------------------------- */

/* If a trade is invalidated, a Trade Bust message is sent to notify the trading Member. */
typedef TradeBustMessage {
  byte order_ref[8];
  byte quantity[4];
  byte price[8];
  byte side;
  byte trade_ref[8];
  byte timestamp[8]
};

int trade_bust_message_at;

/* every byte of Trade Bust Message set to one value */
inline fill_trade_bust_message(trade_bust_message_record, trade_bust_message_value) {
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.order_ref[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
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
  :: trade_bust_message_at < 8 -> trade_bust_message_record.trade_ref[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.timestamp[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Bust Message set to where it lies, so a field read out of place says so */
inline ramp_trade_bust_message(trade_bust_message_record, trade_bust_message_base) {
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.order_ref[trade_bust_message_at] = (trade_bust_message_base + 0 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.quantity[trade_bust_message_at] = (trade_bust_message_base + 8 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.price[trade_bust_message_at] = (trade_bust_message_base + 12 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_record.side = (trade_bust_message_base + 20 + 1) % 256;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.trade_ref[trade_bust_message_at] = (trade_bust_message_base + 21 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.timestamp[trade_bust_message_at] = (trade_bust_message_base + 29 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Message to the wire, 37 bytes from where the cursor stands */
inline encode_trade_bust_message(trade_bust_message_record) {
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> wire[at] = trade_bust_message_record.order_ref[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
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
  :: trade_bust_message_at < 8 -> wire[at] = trade_bust_message_record.trade_ref[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> wire[at] = trade_bust_message_record.timestamp[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Message off the wire, 37 bytes from where the cursor stands */
inline decode_trade_bust_message(trade_bust_message_record) {
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.order_ref[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
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
  :: trade_bust_message_at < 8 -> trade_bust_message_record.trade_ref[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.timestamp[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Bust Message is what was written, byte for byte */
inline equal_trade_bust_message(trade_bust_message_read, trade_bust_message_written) {
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> assert(trade_bust_message_read.order_ref[trade_bust_message_at] == trade_bust_message_written.order_ref[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
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
  :: trade_bust_message_at < 8 -> assert(trade_bust_message_read.trade_ref[trade_bust_message_at] == trade_bust_message_written.trade_ref[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> assert(trade_bust_message_read.timestamp[trade_bust_message_at] == trade_bust_message_written.timestamp[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
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
    assert(at == 11);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 11);
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
    assert(at == 44);
    at = 0;
    decode_login_message(login_message_got);
    assert(at == 44);
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
    assert(at == 9);
    at = 0;
    decode_login_response_message(login_response_message_got);
    assert(at == 9);
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

/* Quote Request Message: encoded, read back, and compared */
proctype check_quote_request_message() {
  QuoteRequestMessage quote_request_message_sent;
  QuoteRequestMessage quote_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_request_message(quote_request_message_sent, 0)
  :: pattern == 1 -> fill_quote_request_message(quote_request_message_sent, 32)
  :: pattern == 2 -> fill_quote_request_message(quote_request_message_sent, 255)
  :: else -> ramp_quote_request_message(quote_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_request_message(quote_request_message_sent);
    assert(at == 37);
    at = 0;
    decode_quote_request_message(quote_request_message_got);
    assert(at == 37);
    equal_quote_request_message(quote_request_message_got, quote_request_message_sent)
  }
}

/* Quote Request Notification Message: encoded, read back, and compared */
proctype check_quote_request_notification_message() {
  QuoteRequestNotificationMessage quote_request_notification_message_sent;
  QuoteRequestNotificationMessage quote_request_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_request_notification_message(quote_request_notification_message_sent, 0)
  :: pattern == 1 -> fill_quote_request_notification_message(quote_request_notification_message_sent, 32)
  :: pattern == 2 -> fill_quote_request_notification_message(quote_request_notification_message_sent, 255)
  :: else -> ramp_quote_request_notification_message(quote_request_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_request_notification_message(quote_request_notification_message_sent);
    assert(at == 35);
    at = 0;
    decode_quote_request_notification_message(quote_request_notification_message_got);
    assert(at == 35);
    equal_quote_request_notification_message(quote_request_notification_message_got, quote_request_notification_message_sent)
  }
}

/* Quote Add Message: encoded, read back, and compared */
proctype check_quote_add_message() {
  QuoteAddMessage quote_add_message_sent;
  QuoteAddMessage quote_add_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_add_message(quote_add_message_sent, 0)
  :: pattern == 1 -> fill_quote_add_message(quote_add_message_sent, 32)
  :: pattern == 2 -> fill_quote_add_message(quote_add_message_sent, 255)
  :: else -> ramp_quote_add_message(quote_add_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_add_message(quote_add_message_sent);
    assert(at == 31);
    at = 0;
    decode_quote_add_message(quote_add_message_got);
    assert(at == 31);
    equal_quote_add_message(quote_add_message_got, quote_add_message_sent)
  }
}

/* Quote Modify Message: encoded, read back, and compared */
proctype check_quote_modify_message() {
  QuoteModifyMessage quote_modify_message_sent;
  QuoteModifyMessage quote_modify_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_modify_message(quote_modify_message_sent, 0)
  :: pattern == 1 -> fill_quote_modify_message(quote_modify_message_sent, 32)
  :: pattern == 2 -> fill_quote_modify_message(quote_modify_message_sent, 255)
  :: else -> ramp_quote_modify_message(quote_modify_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_modify_message(quote_modify_message_sent);
    assert(at == 22);
    at = 0;
    decode_quote_modify_message(quote_modify_message_got);
    assert(at == 22);
    equal_quote_modify_message(quote_modify_message_got, quote_modify_message_sent)
  }
}

/* Quote Cancel Message: encoded, read back, and compared */
proctype check_quote_cancel_message() {
  QuoteCancelMessage quote_cancel_message_sent;
  QuoteCancelMessage quote_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_cancel_message(quote_cancel_message_sent, 0)
  :: pattern == 1 -> fill_quote_cancel_message(quote_cancel_message_sent, 32)
  :: pattern == 2 -> fill_quote_cancel_message(quote_cancel_message_sent, 255)
  :: else -> ramp_quote_cancel_message(quote_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_cancel_message(quote_cancel_message_sent);
    assert(at == 10);
    at = 0;
    decode_quote_cancel_message(quote_cancel_message_got);
    assert(at == 10);
    equal_quote_cancel_message(quote_cancel_message_got, quote_cancel_message_sent)
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
    assert(at == 37);
    at = 0;
    decode_trade_bust_message(trade_bust_message_got);
    assert(at == 37);
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
  :: run check_quote_request_message()
  :: run check_quote_request_notification_message()
  :: run check_quote_add_message()
  :: run check_quote_modify_message()
  :: run check_quote_cancel_message()
  :: run check_trade_bust_message()
  fi
}
