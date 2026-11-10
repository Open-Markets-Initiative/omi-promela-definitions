/*
 * New York Stock Exchange Trades
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
#define WIRE 64

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 4 bytes ------------------------------------------------- */

/* Nyse Arca Binary Protocol message header */
typedef MessageHeader {
  byte message_body_length[2];
  byte message_type;
  byte padding
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_body_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  message_header_record.padding = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_body_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 2 + 1) % 256;
  message_header_record.padding = (message_header_base + 3 + 1) % 256;
  skip
}

/* Message Header to the wire, 4 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_body_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  wire[at] = message_header_record.padding; at = at + 1;
  skip
}

/* Message Header off the wire, 4 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_body_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  message_header_record.padding = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_body_length[message_header_at] == message_header_written.message_body_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  assert(message_header_read.padding == message_header_written.padding);
  skip
}

/* ---- Login Accepted Message: 6 bytes ----------------------------------------- */

/* Sent to indicate a successful login. Carries the current version of ArcaTrade. */
typedef LoginAcceptedMessage {
  byte version_id[5];
  byte padding_ascii_1
};

int login_accepted_message_at;

/* every byte of Login Accepted Message set to one value */
inline fill_login_accepted_message(login_accepted_message_record, login_accepted_message_value) {
  login_accepted_message_at = 0;
  do
  :: login_accepted_message_at < 5 -> login_accepted_message_record.version_id[login_accepted_message_at] = login_accepted_message_value; login_accepted_message_at = login_accepted_message_at + 1
  :: else -> break
  od;
  login_accepted_message_record.padding_ascii_1 = login_accepted_message_value;
  skip
}

/* each byte of Login Accepted Message set to where it lies, so a field read out of place says so */
inline ramp_login_accepted_message(login_accepted_message_record, login_accepted_message_base) {
  login_accepted_message_at = 0;
  do
  :: login_accepted_message_at < 5 -> login_accepted_message_record.version_id[login_accepted_message_at] = (login_accepted_message_base + 0 + login_accepted_message_at + 1) % 256; login_accepted_message_at = login_accepted_message_at + 1
  :: else -> break
  od;
  login_accepted_message_record.padding_ascii_1 = (login_accepted_message_base + 5 + 1) % 256;
  skip
}

/* Login Accepted Message to the wire, 6 bytes from where the cursor stands */
inline encode_login_accepted_message(login_accepted_message_record) {
  login_accepted_message_at = 0;
  do
  :: login_accepted_message_at < 5 -> wire[at] = login_accepted_message_record.version_id[login_accepted_message_at]; at = at + 1; login_accepted_message_at = login_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = login_accepted_message_record.padding_ascii_1; at = at + 1;
  skip
}

/* Login Accepted Message off the wire, 6 bytes from where the cursor stands */
inline decode_login_accepted_message(login_accepted_message_record) {
  login_accepted_message_at = 0;
  do
  :: login_accepted_message_at < 5 -> login_accepted_message_record.version_id[login_accepted_message_at] = wire[at]; at = at + 1; login_accepted_message_at = login_accepted_message_at + 1
  :: else -> break
  od;
  login_accepted_message_record.padding_ascii_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Accepted Message is what was written, byte for byte */
inline equal_login_accepted_message(login_accepted_message_read, login_accepted_message_written) {
  login_accepted_message_at = 0;
  do
  :: login_accepted_message_at < 5 -> assert(login_accepted_message_read.version_id[login_accepted_message_at] == login_accepted_message_written.version_id[login_accepted_message_at]); login_accepted_message_at = login_accepted_message_at + 1
  :: else -> break
  od;
  assert(login_accepted_message_read.padding_ascii_1 == login_accepted_message_written.padding_ascii_1);
  skip
}

/* ---- Login Rejected Message: 2 bytes ----------------------------------------- */

/* Sent when login fails authentication, the client does not log in within 30 seconds, no trade data feed was subscribed to, the sequence number was invalid, or no connections are available. The socket is closed afterwards. */
typedef LoginRejectedMessage {
  byte reject_code;
  byte padding_ascii_1
};

/* every byte of Login Rejected Message set to one value */
inline fill_login_rejected_message(login_rejected_message_record, login_rejected_message_value) {
  login_rejected_message_record.reject_code = login_rejected_message_value;
  login_rejected_message_record.padding_ascii_1 = login_rejected_message_value;
  skip
}

/* each byte of Login Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_login_rejected_message(login_rejected_message_record, login_rejected_message_base) {
  login_rejected_message_record.reject_code = (login_rejected_message_base + 0 + 1) % 256;
  login_rejected_message_record.padding_ascii_1 = (login_rejected_message_base + 1 + 1) % 256;
  skip
}

/* Login Rejected Message to the wire, 2 bytes from where the cursor stands */
inline encode_login_rejected_message(login_rejected_message_record) {
  wire[at] = login_rejected_message_record.reject_code; at = at + 1;
  wire[at] = login_rejected_message_record.padding_ascii_1; at = at + 1;
  skip
}

/* Login Rejected Message off the wire, 2 bytes from where the cursor stands */
inline decode_login_rejected_message(login_rejected_message_record) {
  login_rejected_message_record.reject_code = wire[at]; at = at + 1;
  login_rejected_message_record.padding_ascii_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Rejected Message is what was written, byte for byte */
inline equal_login_rejected_message(login_rejected_message_read, login_rejected_message_written) {
  assert(login_rejected_message_read.reject_code == login_rejected_message_written.reject_code);
  assert(login_rejected_message_read.padding_ascii_1 == login_rejected_message_written.padding_ascii_1);
  skip
}

/* ---- Test Response Message: 20 bytes ----------------------------------------- */

/* Sent in response to a Test Request, echoing back any text the request carried. */
typedef TestResponseMessage {
  byte test_message[20]
};

int test_response_message_at;

/* every byte of Test Response Message set to one value */
inline fill_test_response_message(test_response_message_record, test_response_message_value) {
  test_response_message_at = 0;
  do
  :: test_response_message_at < 20 -> test_response_message_record.test_message[test_response_message_at] = test_response_message_value; test_response_message_at = test_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Test Response Message set to where it lies, so a field read out of place says so */
inline ramp_test_response_message(test_response_message_record, test_response_message_base) {
  test_response_message_at = 0;
  do
  :: test_response_message_at < 20 -> test_response_message_record.test_message[test_response_message_at] = (test_response_message_base + 0 + test_response_message_at + 1) % 256; test_response_message_at = test_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Test Response Message to the wire, 20 bytes from where the cursor stands */
inline encode_test_response_message(test_response_message_record) {
  test_response_message_at = 0;
  do
  :: test_response_message_at < 20 -> wire[at] = test_response_message_record.test_message[test_response_message_at]; at = at + 1; test_response_message_at = test_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Test Response Message off the wire, 20 bytes from where the cursor stands */
inline decode_test_response_message(test_response_message_record) {
  test_response_message_at = 0;
  do
  :: test_response_message_at < 20 -> test_response_message_record.test_message[test_response_message_at] = wire[at]; at = at + 1; test_response_message_at = test_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Test Response Message is what was written, byte for byte */
inline equal_test_response_message(test_response_message_read, test_response_message_written) {
  test_response_message_at = 0;
  do
  :: test_response_message_at < 20 -> assert(test_response_message_read.test_message[test_response_message_at] == test_response_message_written.test_message[test_response_message_at]); test_response_message_at = test_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Last Sale Message: 64 bytes --------------------------------------------- */

/* Sent when an order partially trades or completely trades. */
typedef LastSaleMessage {
  byte last_sale_time[4];
  byte sequence_number[4];
  byte trade_reference_number[4];
  byte quantity[4];
  byte price[4];
  byte price_scale_code;
  byte system_code;
  byte exchange_code;
  byte trade_condition;
  byte security_type;
  byte nyse_bond_symbol[22];
  byte cusip_isin[14];
  byte padding_ascii_3[3]
};

int last_sale_message_at;

/* every byte of Last Sale Message set to one value */
inline fill_last_sale_message(last_sale_message_record, last_sale_message_value) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.last_sale_time[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.sequence_number[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_reference_number[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.quantity[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.price[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.price_scale_code = last_sale_message_value;
  last_sale_message_record.system_code = last_sale_message_value;
  last_sale_message_record.exchange_code = last_sale_message_value;
  last_sale_message_record.trade_condition = last_sale_message_value;
  last_sale_message_record.security_type = last_sale_message_value;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 22 -> last_sale_message_record.nyse_bond_symbol[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 14 -> last_sale_message_record.cusip_isin[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 3 -> last_sale_message_record.padding_ascii_3[last_sale_message_at] = last_sale_message_value; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Last Sale Message set to where it lies, so a field read out of place says so */
inline ramp_last_sale_message(last_sale_message_record, last_sale_message_base) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.last_sale_time[last_sale_message_at] = (last_sale_message_base + 0 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.sequence_number[last_sale_message_at] = (last_sale_message_base + 4 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_reference_number[last_sale_message_at] = (last_sale_message_base + 8 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.quantity[last_sale_message_at] = (last_sale_message_base + 12 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.price[last_sale_message_at] = (last_sale_message_base + 16 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.price_scale_code = (last_sale_message_base + 20 + 1) % 256;
  last_sale_message_record.system_code = (last_sale_message_base + 21 + 1) % 256;
  last_sale_message_record.exchange_code = (last_sale_message_base + 22 + 1) % 256;
  last_sale_message_record.trade_condition = (last_sale_message_base + 23 + 1) % 256;
  last_sale_message_record.security_type = (last_sale_message_base + 24 + 1) % 256;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 22 -> last_sale_message_record.nyse_bond_symbol[last_sale_message_at] = (last_sale_message_base + 25 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 14 -> last_sale_message_record.cusip_isin[last_sale_message_at] = (last_sale_message_base + 47 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 3 -> last_sale_message_record.padding_ascii_3[last_sale_message_at] = (last_sale_message_base + 61 + last_sale_message_at + 1) % 256; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* Last Sale Message to the wire, 64 bytes from where the cursor stands */
inline encode_last_sale_message(last_sale_message_record) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.last_sale_time[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.sequence_number[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.trade_reference_number[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.quantity[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> wire[at] = last_sale_message_record.price[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  wire[at] = last_sale_message_record.price_scale_code; at = at + 1;
  wire[at] = last_sale_message_record.system_code; at = at + 1;
  wire[at] = last_sale_message_record.exchange_code; at = at + 1;
  wire[at] = last_sale_message_record.trade_condition; at = at + 1;
  wire[at] = last_sale_message_record.security_type; at = at + 1;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 22 -> wire[at] = last_sale_message_record.nyse_bond_symbol[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 14 -> wire[at] = last_sale_message_record.cusip_isin[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 3 -> wire[at] = last_sale_message_record.padding_ascii_3[last_sale_message_at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* Last Sale Message off the wire, 64 bytes from where the cursor stands */
inline decode_last_sale_message(last_sale_message_record) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.last_sale_time[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.sequence_number[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.trade_reference_number[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.quantity[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> last_sale_message_record.price[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_record.price_scale_code = wire[at]; at = at + 1;
  last_sale_message_record.system_code = wire[at]; at = at + 1;
  last_sale_message_record.exchange_code = wire[at]; at = at + 1;
  last_sale_message_record.trade_condition = wire[at]; at = at + 1;
  last_sale_message_record.security_type = wire[at]; at = at + 1;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 22 -> last_sale_message_record.nyse_bond_symbol[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 14 -> last_sale_message_record.cusip_isin[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 3 -> last_sale_message_record.padding_ascii_3[last_sale_message_at] = wire[at]; at = at + 1; last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Last Sale Message is what was written, byte for byte */
inline equal_last_sale_message(last_sale_message_read, last_sale_message_written) {
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.last_sale_time[last_sale_message_at] == last_sale_message_written.last_sale_time[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.sequence_number[last_sale_message_at] == last_sale_message_written.sequence_number[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.trade_reference_number[last_sale_message_at] == last_sale_message_written.trade_reference_number[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.quantity[last_sale_message_at] == last_sale_message_written.quantity[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 4 -> assert(last_sale_message_read.price[last_sale_message_at] == last_sale_message_written.price[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  assert(last_sale_message_read.price_scale_code == last_sale_message_written.price_scale_code);
  assert(last_sale_message_read.system_code == last_sale_message_written.system_code);
  assert(last_sale_message_read.exchange_code == last_sale_message_written.exchange_code);
  assert(last_sale_message_read.trade_condition == last_sale_message_written.trade_condition);
  assert(last_sale_message_read.security_type == last_sale_message_written.security_type);
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 22 -> assert(last_sale_message_read.nyse_bond_symbol[last_sale_message_at] == last_sale_message_written.nyse_bond_symbol[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 14 -> assert(last_sale_message_read.cusip_isin[last_sale_message_at] == last_sale_message_written.cusip_isin[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  last_sale_message_at = 0;
  do
  :: last_sale_message_at < 3 -> assert(last_sale_message_read.padding_ascii_3[last_sale_message_at] == last_sale_message_written.padding_ascii_3[last_sale_message_at]); last_sale_message_at = last_sale_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Bust Or Correction Message: 64 bytes ------------------------------ */

/* Sent when trades are busted or corrected. The Event Code field says which. */
typedef TradeBustOrCorrectionMessage {
  byte last_sale_time[4];
  byte sequence_number[4];
  byte trade_reference_number[4];
  byte quantity[4];
  byte price[4];
  byte price_scale_code;
  byte system_code;
  byte event_code;
  byte exchange_code;
  byte trade_condition;
  byte security_type;
  byte nyse_bond_symbol[22];
  byte cusip_isin[14];
  byte padding_ascii_2[2]
};

int trade_bust_or_correction_message_at;

/* every byte of Trade Bust Or Correction Message set to one value */
inline fill_trade_bust_or_correction_message(trade_bust_or_correction_message_record, trade_bust_or_correction_message_value) {
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.last_sale_time[trade_bust_or_correction_message_at] = trade_bust_or_correction_message_value; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.sequence_number[trade_bust_or_correction_message_at] = trade_bust_or_correction_message_value; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.trade_reference_number[trade_bust_or_correction_message_at] = trade_bust_or_correction_message_value; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.quantity[trade_bust_or_correction_message_at] = trade_bust_or_correction_message_value; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.price[trade_bust_or_correction_message_at] = trade_bust_or_correction_message_value; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_record.price_scale_code = trade_bust_or_correction_message_value;
  trade_bust_or_correction_message_record.system_code = trade_bust_or_correction_message_value;
  trade_bust_or_correction_message_record.event_code = trade_bust_or_correction_message_value;
  trade_bust_or_correction_message_record.exchange_code = trade_bust_or_correction_message_value;
  trade_bust_or_correction_message_record.trade_condition = trade_bust_or_correction_message_value;
  trade_bust_or_correction_message_record.security_type = trade_bust_or_correction_message_value;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 22 -> trade_bust_or_correction_message_record.nyse_bond_symbol[trade_bust_or_correction_message_at] = trade_bust_or_correction_message_value; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 14 -> trade_bust_or_correction_message_record.cusip_isin[trade_bust_or_correction_message_at] = trade_bust_or_correction_message_value; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 2 -> trade_bust_or_correction_message_record.padding_ascii_2[trade_bust_or_correction_message_at] = trade_bust_or_correction_message_value; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Bust Or Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_bust_or_correction_message(trade_bust_or_correction_message_record, trade_bust_or_correction_message_base) {
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.last_sale_time[trade_bust_or_correction_message_at] = (trade_bust_or_correction_message_base + 0 + trade_bust_or_correction_message_at + 1) % 256; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.sequence_number[trade_bust_or_correction_message_at] = (trade_bust_or_correction_message_base + 4 + trade_bust_or_correction_message_at + 1) % 256; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.trade_reference_number[trade_bust_or_correction_message_at] = (trade_bust_or_correction_message_base + 8 + trade_bust_or_correction_message_at + 1) % 256; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.quantity[trade_bust_or_correction_message_at] = (trade_bust_or_correction_message_base + 12 + trade_bust_or_correction_message_at + 1) % 256; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.price[trade_bust_or_correction_message_at] = (trade_bust_or_correction_message_base + 16 + trade_bust_or_correction_message_at + 1) % 256; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_record.price_scale_code = (trade_bust_or_correction_message_base + 20 + 1) % 256;
  trade_bust_or_correction_message_record.system_code = (trade_bust_or_correction_message_base + 21 + 1) % 256;
  trade_bust_or_correction_message_record.event_code = (trade_bust_or_correction_message_base + 22 + 1) % 256;
  trade_bust_or_correction_message_record.exchange_code = (trade_bust_or_correction_message_base + 23 + 1) % 256;
  trade_bust_or_correction_message_record.trade_condition = (trade_bust_or_correction_message_base + 24 + 1) % 256;
  trade_bust_or_correction_message_record.security_type = (trade_bust_or_correction_message_base + 25 + 1) % 256;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 22 -> trade_bust_or_correction_message_record.nyse_bond_symbol[trade_bust_or_correction_message_at] = (trade_bust_or_correction_message_base + 26 + trade_bust_or_correction_message_at + 1) % 256; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 14 -> trade_bust_or_correction_message_record.cusip_isin[trade_bust_or_correction_message_at] = (trade_bust_or_correction_message_base + 48 + trade_bust_or_correction_message_at + 1) % 256; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 2 -> trade_bust_or_correction_message_record.padding_ascii_2[trade_bust_or_correction_message_at] = (trade_bust_or_correction_message_base + 62 + trade_bust_or_correction_message_at + 1) % 256; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Or Correction Message to the wire, 64 bytes from where the cursor stands */
inline encode_trade_bust_or_correction_message(trade_bust_or_correction_message_record) {
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> wire[at] = trade_bust_or_correction_message_record.last_sale_time[trade_bust_or_correction_message_at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> wire[at] = trade_bust_or_correction_message_record.sequence_number[trade_bust_or_correction_message_at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> wire[at] = trade_bust_or_correction_message_record.trade_reference_number[trade_bust_or_correction_message_at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> wire[at] = trade_bust_or_correction_message_record.quantity[trade_bust_or_correction_message_at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> wire[at] = trade_bust_or_correction_message_record.price[trade_bust_or_correction_message_at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_bust_or_correction_message_record.price_scale_code; at = at + 1;
  wire[at] = trade_bust_or_correction_message_record.system_code; at = at + 1;
  wire[at] = trade_bust_or_correction_message_record.event_code; at = at + 1;
  wire[at] = trade_bust_or_correction_message_record.exchange_code; at = at + 1;
  wire[at] = trade_bust_or_correction_message_record.trade_condition; at = at + 1;
  wire[at] = trade_bust_or_correction_message_record.security_type; at = at + 1;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 22 -> wire[at] = trade_bust_or_correction_message_record.nyse_bond_symbol[trade_bust_or_correction_message_at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 14 -> wire[at] = trade_bust_or_correction_message_record.cusip_isin[trade_bust_or_correction_message_at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 2 -> wire[at] = trade_bust_or_correction_message_record.padding_ascii_2[trade_bust_or_correction_message_at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Or Correction Message off the wire, 64 bytes from where the cursor stands */
inline decode_trade_bust_or_correction_message(trade_bust_or_correction_message_record) {
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.last_sale_time[trade_bust_or_correction_message_at] = wire[at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.sequence_number[trade_bust_or_correction_message_at] = wire[at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.trade_reference_number[trade_bust_or_correction_message_at] = wire[at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.quantity[trade_bust_or_correction_message_at] = wire[at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> trade_bust_or_correction_message_record.price[trade_bust_or_correction_message_at] = wire[at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_record.price_scale_code = wire[at]; at = at + 1;
  trade_bust_or_correction_message_record.system_code = wire[at]; at = at + 1;
  trade_bust_or_correction_message_record.event_code = wire[at]; at = at + 1;
  trade_bust_or_correction_message_record.exchange_code = wire[at]; at = at + 1;
  trade_bust_or_correction_message_record.trade_condition = wire[at]; at = at + 1;
  trade_bust_or_correction_message_record.security_type = wire[at]; at = at + 1;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 22 -> trade_bust_or_correction_message_record.nyse_bond_symbol[trade_bust_or_correction_message_at] = wire[at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 14 -> trade_bust_or_correction_message_record.cusip_isin[trade_bust_or_correction_message_at] = wire[at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 2 -> trade_bust_or_correction_message_record.padding_ascii_2[trade_bust_or_correction_message_at] = wire[at]; at = at + 1; trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Bust Or Correction Message is what was written, byte for byte */
inline equal_trade_bust_or_correction_message(trade_bust_or_correction_message_read, trade_bust_or_correction_message_written) {
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> assert(trade_bust_or_correction_message_read.last_sale_time[trade_bust_or_correction_message_at] == trade_bust_or_correction_message_written.last_sale_time[trade_bust_or_correction_message_at]); trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> assert(trade_bust_or_correction_message_read.sequence_number[trade_bust_or_correction_message_at] == trade_bust_or_correction_message_written.sequence_number[trade_bust_or_correction_message_at]); trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> assert(trade_bust_or_correction_message_read.trade_reference_number[trade_bust_or_correction_message_at] == trade_bust_or_correction_message_written.trade_reference_number[trade_bust_or_correction_message_at]); trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> assert(trade_bust_or_correction_message_read.quantity[trade_bust_or_correction_message_at] == trade_bust_or_correction_message_written.quantity[trade_bust_or_correction_message_at]); trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 4 -> assert(trade_bust_or_correction_message_read.price[trade_bust_or_correction_message_at] == trade_bust_or_correction_message_written.price[trade_bust_or_correction_message_at]); trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_bust_or_correction_message_read.price_scale_code == trade_bust_or_correction_message_written.price_scale_code);
  assert(trade_bust_or_correction_message_read.system_code == trade_bust_or_correction_message_written.system_code);
  assert(trade_bust_or_correction_message_read.event_code == trade_bust_or_correction_message_written.event_code);
  assert(trade_bust_or_correction_message_read.exchange_code == trade_bust_or_correction_message_written.exchange_code);
  assert(trade_bust_or_correction_message_read.trade_condition == trade_bust_or_correction_message_written.trade_condition);
  assert(trade_bust_or_correction_message_read.security_type == trade_bust_or_correction_message_written.security_type);
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 22 -> assert(trade_bust_or_correction_message_read.nyse_bond_symbol[trade_bust_or_correction_message_at] == trade_bust_or_correction_message_written.nyse_bond_symbol[trade_bust_or_correction_message_at]); trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 14 -> assert(trade_bust_or_correction_message_read.cusip_isin[trade_bust_or_correction_message_at] == trade_bust_or_correction_message_written.cusip_isin[trade_bust_or_correction_message_at]); trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  trade_bust_or_correction_message_at = 0;
  do
  :: trade_bust_or_correction_message_at < 2 -> assert(trade_bust_or_correction_message_read.padding_ascii_2[trade_bust_or_correction_message_at] == trade_bust_or_correction_message_written.padding_ascii_2[trade_bust_or_correction_message_at]); trade_bust_or_correction_message_at = trade_bust_or_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Nyse Bond Closing Price Message: 64 bytes ------------------------------- */

/* Sent during day end processing with the final closing price and volume for a bond. The specification notes this message is not supported at the time of writing and will be implemented in a future release. */
typedef NyseBondClosingPriceMessage {
  byte closing_time[4];
  byte sequence_number[4];
  byte trade_reference_number[4];
  byte quantity[4];
  byte closing_price[4];
  byte price_scale_code;
  byte system_code;
  byte exchange_code;
  byte trade_condition;
  byte security_type;
  byte nyse_bond_symbol[22];
  byte cusip_isin[14];
  byte padding_ascii_3[3]
};

int nyse_bond_closing_price_message_at;

/* every byte of Nyse Bond Closing Price Message set to one value */
inline fill_nyse_bond_closing_price_message(nyse_bond_closing_price_message_record, nyse_bond_closing_price_message_value) {
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.closing_time[nyse_bond_closing_price_message_at] = nyse_bond_closing_price_message_value; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.sequence_number[nyse_bond_closing_price_message_at] = nyse_bond_closing_price_message_value; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.trade_reference_number[nyse_bond_closing_price_message_at] = nyse_bond_closing_price_message_value; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.quantity[nyse_bond_closing_price_message_at] = nyse_bond_closing_price_message_value; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.closing_price[nyse_bond_closing_price_message_at] = nyse_bond_closing_price_message_value; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_record.price_scale_code = nyse_bond_closing_price_message_value;
  nyse_bond_closing_price_message_record.system_code = nyse_bond_closing_price_message_value;
  nyse_bond_closing_price_message_record.exchange_code = nyse_bond_closing_price_message_value;
  nyse_bond_closing_price_message_record.trade_condition = nyse_bond_closing_price_message_value;
  nyse_bond_closing_price_message_record.security_type = nyse_bond_closing_price_message_value;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 22 -> nyse_bond_closing_price_message_record.nyse_bond_symbol[nyse_bond_closing_price_message_at] = nyse_bond_closing_price_message_value; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 14 -> nyse_bond_closing_price_message_record.cusip_isin[nyse_bond_closing_price_message_at] = nyse_bond_closing_price_message_value; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 3 -> nyse_bond_closing_price_message_record.padding_ascii_3[nyse_bond_closing_price_message_at] = nyse_bond_closing_price_message_value; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Nyse Bond Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_nyse_bond_closing_price_message(nyse_bond_closing_price_message_record, nyse_bond_closing_price_message_base) {
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.closing_time[nyse_bond_closing_price_message_at] = (nyse_bond_closing_price_message_base + 0 + nyse_bond_closing_price_message_at + 1) % 256; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.sequence_number[nyse_bond_closing_price_message_at] = (nyse_bond_closing_price_message_base + 4 + nyse_bond_closing_price_message_at + 1) % 256; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.trade_reference_number[nyse_bond_closing_price_message_at] = (nyse_bond_closing_price_message_base + 8 + nyse_bond_closing_price_message_at + 1) % 256; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.quantity[nyse_bond_closing_price_message_at] = (nyse_bond_closing_price_message_base + 12 + nyse_bond_closing_price_message_at + 1) % 256; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.closing_price[nyse_bond_closing_price_message_at] = (nyse_bond_closing_price_message_base + 16 + nyse_bond_closing_price_message_at + 1) % 256; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_record.price_scale_code = (nyse_bond_closing_price_message_base + 20 + 1) % 256;
  nyse_bond_closing_price_message_record.system_code = (nyse_bond_closing_price_message_base + 21 + 1) % 256;
  nyse_bond_closing_price_message_record.exchange_code = (nyse_bond_closing_price_message_base + 22 + 1) % 256;
  nyse_bond_closing_price_message_record.trade_condition = (nyse_bond_closing_price_message_base + 23 + 1) % 256;
  nyse_bond_closing_price_message_record.security_type = (nyse_bond_closing_price_message_base + 24 + 1) % 256;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 22 -> nyse_bond_closing_price_message_record.nyse_bond_symbol[nyse_bond_closing_price_message_at] = (nyse_bond_closing_price_message_base + 25 + nyse_bond_closing_price_message_at + 1) % 256; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 14 -> nyse_bond_closing_price_message_record.cusip_isin[nyse_bond_closing_price_message_at] = (nyse_bond_closing_price_message_base + 47 + nyse_bond_closing_price_message_at + 1) % 256; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 3 -> nyse_bond_closing_price_message_record.padding_ascii_3[nyse_bond_closing_price_message_at] = (nyse_bond_closing_price_message_base + 61 + nyse_bond_closing_price_message_at + 1) % 256; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Nyse Bond Closing Price Message to the wire, 64 bytes from where the cursor stands */
inline encode_nyse_bond_closing_price_message(nyse_bond_closing_price_message_record) {
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> wire[at] = nyse_bond_closing_price_message_record.closing_time[nyse_bond_closing_price_message_at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> wire[at] = nyse_bond_closing_price_message_record.sequence_number[nyse_bond_closing_price_message_at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> wire[at] = nyse_bond_closing_price_message_record.trade_reference_number[nyse_bond_closing_price_message_at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> wire[at] = nyse_bond_closing_price_message_record.quantity[nyse_bond_closing_price_message_at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> wire[at] = nyse_bond_closing_price_message_record.closing_price[nyse_bond_closing_price_message_at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  wire[at] = nyse_bond_closing_price_message_record.price_scale_code; at = at + 1;
  wire[at] = nyse_bond_closing_price_message_record.system_code; at = at + 1;
  wire[at] = nyse_bond_closing_price_message_record.exchange_code; at = at + 1;
  wire[at] = nyse_bond_closing_price_message_record.trade_condition; at = at + 1;
  wire[at] = nyse_bond_closing_price_message_record.security_type; at = at + 1;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 22 -> wire[at] = nyse_bond_closing_price_message_record.nyse_bond_symbol[nyse_bond_closing_price_message_at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 14 -> wire[at] = nyse_bond_closing_price_message_record.cusip_isin[nyse_bond_closing_price_message_at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 3 -> wire[at] = nyse_bond_closing_price_message_record.padding_ascii_3[nyse_bond_closing_price_message_at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Nyse Bond Closing Price Message off the wire, 64 bytes from where the cursor stands */
inline decode_nyse_bond_closing_price_message(nyse_bond_closing_price_message_record) {
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.closing_time[nyse_bond_closing_price_message_at] = wire[at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.sequence_number[nyse_bond_closing_price_message_at] = wire[at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.trade_reference_number[nyse_bond_closing_price_message_at] = wire[at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.quantity[nyse_bond_closing_price_message_at] = wire[at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> nyse_bond_closing_price_message_record.closing_price[nyse_bond_closing_price_message_at] = wire[at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_record.price_scale_code = wire[at]; at = at + 1;
  nyse_bond_closing_price_message_record.system_code = wire[at]; at = at + 1;
  nyse_bond_closing_price_message_record.exchange_code = wire[at]; at = at + 1;
  nyse_bond_closing_price_message_record.trade_condition = wire[at]; at = at + 1;
  nyse_bond_closing_price_message_record.security_type = wire[at]; at = at + 1;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 22 -> nyse_bond_closing_price_message_record.nyse_bond_symbol[nyse_bond_closing_price_message_at] = wire[at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 14 -> nyse_bond_closing_price_message_record.cusip_isin[nyse_bond_closing_price_message_at] = wire[at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 3 -> nyse_bond_closing_price_message_record.padding_ascii_3[nyse_bond_closing_price_message_at] = wire[at]; at = at + 1; nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Nyse Bond Closing Price Message is what was written, byte for byte */
inline equal_nyse_bond_closing_price_message(nyse_bond_closing_price_message_read, nyse_bond_closing_price_message_written) {
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> assert(nyse_bond_closing_price_message_read.closing_time[nyse_bond_closing_price_message_at] == nyse_bond_closing_price_message_written.closing_time[nyse_bond_closing_price_message_at]); nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> assert(nyse_bond_closing_price_message_read.sequence_number[nyse_bond_closing_price_message_at] == nyse_bond_closing_price_message_written.sequence_number[nyse_bond_closing_price_message_at]); nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> assert(nyse_bond_closing_price_message_read.trade_reference_number[nyse_bond_closing_price_message_at] == nyse_bond_closing_price_message_written.trade_reference_number[nyse_bond_closing_price_message_at]); nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> assert(nyse_bond_closing_price_message_read.quantity[nyse_bond_closing_price_message_at] == nyse_bond_closing_price_message_written.quantity[nyse_bond_closing_price_message_at]); nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 4 -> assert(nyse_bond_closing_price_message_read.closing_price[nyse_bond_closing_price_message_at] == nyse_bond_closing_price_message_written.closing_price[nyse_bond_closing_price_message_at]); nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  assert(nyse_bond_closing_price_message_read.price_scale_code == nyse_bond_closing_price_message_written.price_scale_code);
  assert(nyse_bond_closing_price_message_read.system_code == nyse_bond_closing_price_message_written.system_code);
  assert(nyse_bond_closing_price_message_read.exchange_code == nyse_bond_closing_price_message_written.exchange_code);
  assert(nyse_bond_closing_price_message_read.trade_condition == nyse_bond_closing_price_message_written.trade_condition);
  assert(nyse_bond_closing_price_message_read.security_type == nyse_bond_closing_price_message_written.security_type);
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 22 -> assert(nyse_bond_closing_price_message_read.nyse_bond_symbol[nyse_bond_closing_price_message_at] == nyse_bond_closing_price_message_written.nyse_bond_symbol[nyse_bond_closing_price_message_at]); nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 14 -> assert(nyse_bond_closing_price_message_read.cusip_isin[nyse_bond_closing_price_message_at] == nyse_bond_closing_price_message_written.cusip_isin[nyse_bond_closing_price_message_at]); nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
  :: else -> break
  od;
  nyse_bond_closing_price_message_at = 0;
  do
  :: nyse_bond_closing_price_message_at < 3 -> assert(nyse_bond_closing_price_message_read.padding_ascii_3[nyse_bond_closing_price_message_at] == nyse_bond_closing_price_message_written.padding_ascii_3[nyse_bond_closing_price_message_at]); nyse_bond_closing_price_message_at = nyse_bond_closing_price_message_at + 1
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
    assert(at == 4);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 4);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Login Accepted Message: encoded, read back, and compared */
proctype check_login_accepted_message() {
  LoginAcceptedMessage login_accepted_message_sent;
  LoginAcceptedMessage login_accepted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_accepted_message(login_accepted_message_sent, 0)
  :: pattern == 1 -> fill_login_accepted_message(login_accepted_message_sent, 32)
  :: pattern == 2 -> fill_login_accepted_message(login_accepted_message_sent, 255)
  :: else -> ramp_login_accepted_message(login_accepted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_accepted_message(login_accepted_message_sent);
    assert(at == 6);
    at = 0;
    decode_login_accepted_message(login_accepted_message_got);
    assert(at == 6);
    equal_login_accepted_message(login_accepted_message_got, login_accepted_message_sent)
  }
}

/* Login Rejected Message: encoded, read back, and compared */
proctype check_login_rejected_message() {
  LoginRejectedMessage login_rejected_message_sent;
  LoginRejectedMessage login_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_rejected_message(login_rejected_message_sent, 0)
  :: pattern == 1 -> fill_login_rejected_message(login_rejected_message_sent, 32)
  :: pattern == 2 -> fill_login_rejected_message(login_rejected_message_sent, 255)
  :: else -> ramp_login_rejected_message(login_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_rejected_message(login_rejected_message_sent);
    assert(at == 2);
    at = 0;
    decode_login_rejected_message(login_rejected_message_got);
    assert(at == 2);
    equal_login_rejected_message(login_rejected_message_got, login_rejected_message_sent)
  }
}

/* Test Response Message: encoded, read back, and compared */
proctype check_test_response_message() {
  TestResponseMessage test_response_message_sent;
  TestResponseMessage test_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_test_response_message(test_response_message_sent, 0)
  :: pattern == 1 -> fill_test_response_message(test_response_message_sent, 32)
  :: pattern == 2 -> fill_test_response_message(test_response_message_sent, 255)
  :: else -> ramp_test_response_message(test_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_test_response_message(test_response_message_sent);
    assert(at == 20);
    at = 0;
    decode_test_response_message(test_response_message_got);
    assert(at == 20);
    equal_test_response_message(test_response_message_got, test_response_message_sent)
  }
}

/* Last Sale Message: encoded, read back, and compared */
proctype check_last_sale_message() {
  LastSaleMessage last_sale_message_sent;
  LastSaleMessage last_sale_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_last_sale_message(last_sale_message_sent, 0)
  :: pattern == 1 -> fill_last_sale_message(last_sale_message_sent, 32)
  :: pattern == 2 -> fill_last_sale_message(last_sale_message_sent, 255)
  :: else -> ramp_last_sale_message(last_sale_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_last_sale_message(last_sale_message_sent);
    assert(at == 64);
    at = 0;
    decode_last_sale_message(last_sale_message_got);
    assert(at == 64);
    equal_last_sale_message(last_sale_message_got, last_sale_message_sent)
  }
}

/* Trade Bust Or Correction Message: encoded, read back, and compared */
proctype check_trade_bust_or_correction_message() {
  TradeBustOrCorrectionMessage trade_bust_or_correction_message_sent;
  TradeBustOrCorrectionMessage trade_bust_or_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_bust_or_correction_message(trade_bust_or_correction_message_sent, 0)
  :: pattern == 1 -> fill_trade_bust_or_correction_message(trade_bust_or_correction_message_sent, 32)
  :: pattern == 2 -> fill_trade_bust_or_correction_message(trade_bust_or_correction_message_sent, 255)
  :: else -> ramp_trade_bust_or_correction_message(trade_bust_or_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_bust_or_correction_message(trade_bust_or_correction_message_sent);
    assert(at == 64);
    at = 0;
    decode_trade_bust_or_correction_message(trade_bust_or_correction_message_got);
    assert(at == 64);
    equal_trade_bust_or_correction_message(trade_bust_or_correction_message_got, trade_bust_or_correction_message_sent)
  }
}

/* Nyse Bond Closing Price Message: encoded, read back, and compared */
proctype check_nyse_bond_closing_price_message() {
  NyseBondClosingPriceMessage nyse_bond_closing_price_message_sent;
  NyseBondClosingPriceMessage nyse_bond_closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_nyse_bond_closing_price_message(nyse_bond_closing_price_message_sent, 0)
  :: pattern == 1 -> fill_nyse_bond_closing_price_message(nyse_bond_closing_price_message_sent, 32)
  :: pattern == 2 -> fill_nyse_bond_closing_price_message(nyse_bond_closing_price_message_sent, 255)
  :: else -> ramp_nyse_bond_closing_price_message(nyse_bond_closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_nyse_bond_closing_price_message(nyse_bond_closing_price_message_sent);
    assert(at == 64);
    at = 0;
    decode_nyse_bond_closing_price_message(nyse_bond_closing_price_message_got);
    assert(at == 64);
    equal_nyse_bond_closing_price_message(nyse_bond_closing_price_message_got, nyse_bond_closing_price_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_login_accepted_message()
  :: run check_login_rejected_message()
  :: run check_test_response_message()
  :: run check_last_sale_message()
  :: run check_trade_bust_or_correction_message()
  :: run check_nyse_bond_closing_price_message()
  fi
}
