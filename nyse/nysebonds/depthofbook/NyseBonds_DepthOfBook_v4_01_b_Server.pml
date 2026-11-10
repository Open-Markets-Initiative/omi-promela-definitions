/*
 * New York Stock Exchange DepthOfBook
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
#define WIRE 76

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

/* Sent to indicate a successful login. Carries the current version of the Nyse ArcaBook protocol. */
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

/* Sent when login fails authentication, the client does not log in within 5 seconds, no order data feed was subscribed to, the sequence number was invalid, no connections are available, or a timeout occurred. The socket is closed afterwards. */
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

/* ---- Add Order Message: 76 bytes --------------------------------------------- */

/* Sent for a new open order. The Order Reference Number is unique per order book, while the Sequence Number is unique across all order books. */
typedef AddOrderMessage {
  byte time[4];
  byte sequence_number[4];
  byte order_reference_number[4];
  byte quantity[4];
  byte price[4];
  byte price_scale_code;
  byte exchange_code;
  byte system_code;
  byte buy_sell_indicator;
  byte flat_pricing;
  byte trading_action;
  byte security_type;
  byte order_type;
  byte nyse_bond_symbol[22];
  byte cusip_isin[14];
  byte quote_id[5];
  byte padding_ascii_3[3];
  byte minimum_quantity[4]
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.time[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.sequence_number[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_reference_number[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.price_scale_code = add_order_message_value;
  add_order_message_record.exchange_code = add_order_message_value;
  add_order_message_record.system_code = add_order_message_value;
  add_order_message_record.buy_sell_indicator = add_order_message_value;
  add_order_message_record.flat_pricing = add_order_message_value;
  add_order_message_record.trading_action = add_order_message_value;
  add_order_message_record.security_type = add_order_message_value;
  add_order_message_record.order_type = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 22 -> add_order_message_record.nyse_bond_symbol[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 14 -> add_order_message_record.cusip_isin[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 5 -> add_order_message_record.quote_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> add_order_message_record.padding_ascii_3[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.minimum_quantity[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.time[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.sequence_number[add_order_message_at] = (add_order_message_base + 4 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_reference_number[add_order_message_at] = (add_order_message_base + 8 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = (add_order_message_base + 12 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 16 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.price_scale_code = (add_order_message_base + 20 + 1) % 256;
  add_order_message_record.exchange_code = (add_order_message_base + 21 + 1) % 256;
  add_order_message_record.system_code = (add_order_message_base + 22 + 1) % 256;
  add_order_message_record.buy_sell_indicator = (add_order_message_base + 23 + 1) % 256;
  add_order_message_record.flat_pricing = (add_order_message_base + 24 + 1) % 256;
  add_order_message_record.trading_action = (add_order_message_base + 25 + 1) % 256;
  add_order_message_record.security_type = (add_order_message_base + 26 + 1) % 256;
  add_order_message_record.order_type = (add_order_message_base + 27 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 22 -> add_order_message_record.nyse_bond_symbol[add_order_message_at] = (add_order_message_base + 28 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 14 -> add_order_message_record.cusip_isin[add_order_message_at] = (add_order_message_base + 50 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 5 -> add_order_message_record.quote_id[add_order_message_at] = (add_order_message_base + 64 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> add_order_message_record.padding_ascii_3[add_order_message_at] = (add_order_message_base + 69 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.minimum_quantity[add_order_message_at] = (add_order_message_base + 72 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message to the wire, 76 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.time[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.sequence_number[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.order_reference_number[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.quantity[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.price_scale_code; at = at + 1;
  wire[at] = add_order_message_record.exchange_code; at = at + 1;
  wire[at] = add_order_message_record.system_code; at = at + 1;
  wire[at] = add_order_message_record.buy_sell_indicator; at = at + 1;
  wire[at] = add_order_message_record.flat_pricing; at = at + 1;
  wire[at] = add_order_message_record.trading_action; at = at + 1;
  wire[at] = add_order_message_record.security_type; at = at + 1;
  wire[at] = add_order_message_record.order_type; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 22 -> wire[at] = add_order_message_record.nyse_bond_symbol[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 14 -> wire[at] = add_order_message_record.cusip_isin[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 5 -> wire[at] = add_order_message_record.quote_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> wire[at] = add_order_message_record.padding_ascii_3[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.minimum_quantity[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message off the wire, 76 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.time[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.sequence_number[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_reference_number[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.price_scale_code = wire[at]; at = at + 1;
  add_order_message_record.exchange_code = wire[at]; at = at + 1;
  add_order_message_record.system_code = wire[at]; at = at + 1;
  add_order_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  add_order_message_record.flat_pricing = wire[at]; at = at + 1;
  add_order_message_record.trading_action = wire[at]; at = at + 1;
  add_order_message_record.security_type = wire[at]; at = at + 1;
  add_order_message_record.order_type = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 22 -> add_order_message_record.nyse_bond_symbol[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 14 -> add_order_message_record.cusip_isin[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 5 -> add_order_message_record.quote_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> add_order_message_record.padding_ascii_3[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.minimum_quantity[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.time[add_order_message_at] == add_order_message_written.time[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.sequence_number[add_order_message_at] == add_order_message_written.sequence_number[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.order_reference_number[add_order_message_at] == add_order_message_written.order_reference_number[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.quantity[add_order_message_at] == add_order_message_written.quantity[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.price_scale_code == add_order_message_written.price_scale_code);
  assert(add_order_message_read.exchange_code == add_order_message_written.exchange_code);
  assert(add_order_message_read.system_code == add_order_message_written.system_code);
  assert(add_order_message_read.buy_sell_indicator == add_order_message_written.buy_sell_indicator);
  assert(add_order_message_read.flat_pricing == add_order_message_written.flat_pricing);
  assert(add_order_message_read.trading_action == add_order_message_written.trading_action);
  assert(add_order_message_read.security_type == add_order_message_written.security_type);
  assert(add_order_message_read.order_type == add_order_message_written.order_type);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 22 -> assert(add_order_message_read.nyse_bond_symbol[add_order_message_at] == add_order_message_written.nyse_bond_symbol[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 14 -> assert(add_order_message_read.cusip_isin[add_order_message_at] == add_order_message_written.cusip_isin[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 5 -> assert(add_order_message_read.quote_id[add_order_message_at] == add_order_message_written.quote_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 3 -> assert(add_order_message_read.padding_ascii_3[add_order_message_at] == add_order_message_written.padding_ascii_3[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.minimum_quantity[add_order_message_at] == add_order_message_written.minimum_quantity[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Modify Order Message: 76 bytes ------------------------------------------ */

/* Sent when an order in a Nyse Bonds book is modified: its price or size changes, it is partially filled, or it is routed away with shares remaining. The Order Reference Number refers to the original Add Order. */
typedef ModifyOrderMessage {
  byte time[4];
  byte sequence_number[4];
  byte order_reference_number[4];
  byte quantity[4];
  byte price[4];
  byte price_scale_code;
  byte exchange_code;
  byte system_code;
  byte buy_sell_indicator;
  byte flat_pricing;
  byte trading_action;
  byte security_type;
  byte order_type;
  byte nyse_bond_symbol[22];
  byte cusip_isin[14];
  byte quote_id[5];
  byte padding_ascii_3[3];
  byte minimum_quantity[4]
};

int modify_order_message_at;

/* every byte of Modify Order Message set to one value */
inline fill_modify_order_message(modify_order_message_record, modify_order_message_value) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.time[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.sequence_number[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_reference_number[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.quantity[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.price[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.price_scale_code = modify_order_message_value;
  modify_order_message_record.exchange_code = modify_order_message_value;
  modify_order_message_record.system_code = modify_order_message_value;
  modify_order_message_record.buy_sell_indicator = modify_order_message_value;
  modify_order_message_record.flat_pricing = modify_order_message_value;
  modify_order_message_record.trading_action = modify_order_message_value;
  modify_order_message_record.security_type = modify_order_message_value;
  modify_order_message_record.order_type = modify_order_message_value;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 22 -> modify_order_message_record.nyse_bond_symbol[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 14 -> modify_order_message_record.cusip_isin[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 5 -> modify_order_message_record.quote_id[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 3 -> modify_order_message_record.padding_ascii_3[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.minimum_quantity[modify_order_message_at] = modify_order_message_value; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Modify Order Message set to where it lies, so a field read out of place says so */
inline ramp_modify_order_message(modify_order_message_record, modify_order_message_base) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.time[modify_order_message_at] = (modify_order_message_base + 0 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.sequence_number[modify_order_message_at] = (modify_order_message_base + 4 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_reference_number[modify_order_message_at] = (modify_order_message_base + 8 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.quantity[modify_order_message_at] = (modify_order_message_base + 12 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.price[modify_order_message_at] = (modify_order_message_base + 16 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.price_scale_code = (modify_order_message_base + 20 + 1) % 256;
  modify_order_message_record.exchange_code = (modify_order_message_base + 21 + 1) % 256;
  modify_order_message_record.system_code = (modify_order_message_base + 22 + 1) % 256;
  modify_order_message_record.buy_sell_indicator = (modify_order_message_base + 23 + 1) % 256;
  modify_order_message_record.flat_pricing = (modify_order_message_base + 24 + 1) % 256;
  modify_order_message_record.trading_action = (modify_order_message_base + 25 + 1) % 256;
  modify_order_message_record.security_type = (modify_order_message_base + 26 + 1) % 256;
  modify_order_message_record.order_type = (modify_order_message_base + 27 + 1) % 256;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 22 -> modify_order_message_record.nyse_bond_symbol[modify_order_message_at] = (modify_order_message_base + 28 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 14 -> modify_order_message_record.cusip_isin[modify_order_message_at] = (modify_order_message_base + 50 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 5 -> modify_order_message_record.quote_id[modify_order_message_at] = (modify_order_message_base + 64 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 3 -> modify_order_message_record.padding_ascii_3[modify_order_message_at] = (modify_order_message_base + 69 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.minimum_quantity[modify_order_message_at] = (modify_order_message_base + 72 + modify_order_message_at + 1) % 256; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Message to the wire, 76 bytes from where the cursor stands */
inline encode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.time[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.sequence_number[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.order_reference_number[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.quantity[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.price[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  wire[at] = modify_order_message_record.price_scale_code; at = at + 1;
  wire[at] = modify_order_message_record.exchange_code; at = at + 1;
  wire[at] = modify_order_message_record.system_code; at = at + 1;
  wire[at] = modify_order_message_record.buy_sell_indicator; at = at + 1;
  wire[at] = modify_order_message_record.flat_pricing; at = at + 1;
  wire[at] = modify_order_message_record.trading_action; at = at + 1;
  wire[at] = modify_order_message_record.security_type; at = at + 1;
  wire[at] = modify_order_message_record.order_type; at = at + 1;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 22 -> wire[at] = modify_order_message_record.nyse_bond_symbol[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 14 -> wire[at] = modify_order_message_record.cusip_isin[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 5 -> wire[at] = modify_order_message_record.quote_id[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 3 -> wire[at] = modify_order_message_record.padding_ascii_3[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> wire[at] = modify_order_message_record.minimum_quantity[modify_order_message_at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Modify Order Message off the wire, 76 bytes from where the cursor stands */
inline decode_modify_order_message(modify_order_message_record) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.time[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.sequence_number[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.order_reference_number[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.quantity[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.price[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_record.price_scale_code = wire[at]; at = at + 1;
  modify_order_message_record.exchange_code = wire[at]; at = at + 1;
  modify_order_message_record.system_code = wire[at]; at = at + 1;
  modify_order_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  modify_order_message_record.flat_pricing = wire[at]; at = at + 1;
  modify_order_message_record.trading_action = wire[at]; at = at + 1;
  modify_order_message_record.security_type = wire[at]; at = at + 1;
  modify_order_message_record.order_type = wire[at]; at = at + 1;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 22 -> modify_order_message_record.nyse_bond_symbol[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 14 -> modify_order_message_record.cusip_isin[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 5 -> modify_order_message_record.quote_id[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 3 -> modify_order_message_record.padding_ascii_3[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> modify_order_message_record.minimum_quantity[modify_order_message_at] = wire[at]; at = at + 1; modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Modify Order Message is what was written, byte for byte */
inline equal_modify_order_message(modify_order_message_read, modify_order_message_written) {
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.time[modify_order_message_at] == modify_order_message_written.time[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.sequence_number[modify_order_message_at] == modify_order_message_written.sequence_number[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.order_reference_number[modify_order_message_at] == modify_order_message_written.order_reference_number[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.quantity[modify_order_message_at] == modify_order_message_written.quantity[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.price[modify_order_message_at] == modify_order_message_written.price[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  assert(modify_order_message_read.price_scale_code == modify_order_message_written.price_scale_code);
  assert(modify_order_message_read.exchange_code == modify_order_message_written.exchange_code);
  assert(modify_order_message_read.system_code == modify_order_message_written.system_code);
  assert(modify_order_message_read.buy_sell_indicator == modify_order_message_written.buy_sell_indicator);
  assert(modify_order_message_read.flat_pricing == modify_order_message_written.flat_pricing);
  assert(modify_order_message_read.trading_action == modify_order_message_written.trading_action);
  assert(modify_order_message_read.security_type == modify_order_message_written.security_type);
  assert(modify_order_message_read.order_type == modify_order_message_written.order_type);
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 22 -> assert(modify_order_message_read.nyse_bond_symbol[modify_order_message_at] == modify_order_message_written.nyse_bond_symbol[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 14 -> assert(modify_order_message_read.cusip_isin[modify_order_message_at] == modify_order_message_written.cusip_isin[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 5 -> assert(modify_order_message_read.quote_id[modify_order_message_at] == modify_order_message_written.quote_id[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 3 -> assert(modify_order_message_read.padding_ascii_3[modify_order_message_at] == modify_order_message_written.padding_ascii_3[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  modify_order_message_at = 0;
  do
  :: modify_order_message_at < 4 -> assert(modify_order_message_read.minimum_quantity[modify_order_message_at] == modify_order_message_written.minimum_quantity[modify_order_message_at]); modify_order_message_at = modify_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Delete Order Message: 60 bytes ------------------------------------------ */

/* Sent when an order is taken off the open order book because it was cancelled, expired, routed to an away market, or filled. */
typedef DeleteOrderMessage {
  byte time[4];
  byte sequence_number[4];
  byte order_reference_number[4];
  byte exchange_code;
  byte system_code;
  byte buy_sell_indicator;
  byte flat_pricing;
  byte trading_action;
  byte security_type;
  byte order_type;
  byte nyse_bond_symbol[22];
  byte cusip_isin[14];
  byte quote_id[5]
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.time[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.sequence_number[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.order_reference_number[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.exchange_code = delete_order_message_value;
  delete_order_message_record.system_code = delete_order_message_value;
  delete_order_message_record.buy_sell_indicator = delete_order_message_value;
  delete_order_message_record.flat_pricing = delete_order_message_value;
  delete_order_message_record.trading_action = delete_order_message_value;
  delete_order_message_record.security_type = delete_order_message_value;
  delete_order_message_record.order_type = delete_order_message_value;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 22 -> delete_order_message_record.nyse_bond_symbol[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 14 -> delete_order_message_record.cusip_isin[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 5 -> delete_order_message_record.quote_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_order_message(delete_order_message_record, delete_order_message_base) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.time[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.sequence_number[delete_order_message_at] = (delete_order_message_base + 4 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.order_reference_number[delete_order_message_at] = (delete_order_message_base + 8 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.exchange_code = (delete_order_message_base + 12 + 1) % 256;
  delete_order_message_record.system_code = (delete_order_message_base + 13 + 1) % 256;
  delete_order_message_record.buy_sell_indicator = (delete_order_message_base + 14 + 1) % 256;
  delete_order_message_record.flat_pricing = (delete_order_message_base + 15 + 1) % 256;
  delete_order_message_record.trading_action = (delete_order_message_base + 16 + 1) % 256;
  delete_order_message_record.security_type = (delete_order_message_base + 17 + 1) % 256;
  delete_order_message_record.order_type = (delete_order_message_base + 18 + 1) % 256;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 22 -> delete_order_message_record.nyse_bond_symbol[delete_order_message_at] = (delete_order_message_base + 19 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 14 -> delete_order_message_record.cusip_isin[delete_order_message_at] = (delete_order_message_base + 41 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 5 -> delete_order_message_record.quote_id[delete_order_message_at] = (delete_order_message_base + 55 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message to the wire, 60 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.time[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.sequence_number[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.order_reference_number[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  wire[at] = delete_order_message_record.exchange_code; at = at + 1;
  wire[at] = delete_order_message_record.system_code; at = at + 1;
  wire[at] = delete_order_message_record.buy_sell_indicator; at = at + 1;
  wire[at] = delete_order_message_record.flat_pricing; at = at + 1;
  wire[at] = delete_order_message_record.trading_action; at = at + 1;
  wire[at] = delete_order_message_record.security_type; at = at + 1;
  wire[at] = delete_order_message_record.order_type; at = at + 1;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 22 -> wire[at] = delete_order_message_record.nyse_bond_symbol[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 14 -> wire[at] = delete_order_message_record.cusip_isin[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 5 -> wire[at] = delete_order_message_record.quote_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message off the wire, 60 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.time[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.sequence_number[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.order_reference_number[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_record.exchange_code = wire[at]; at = at + 1;
  delete_order_message_record.system_code = wire[at]; at = at + 1;
  delete_order_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  delete_order_message_record.flat_pricing = wire[at]; at = at + 1;
  delete_order_message_record.trading_action = wire[at]; at = at + 1;
  delete_order_message_record.security_type = wire[at]; at = at + 1;
  delete_order_message_record.order_type = wire[at]; at = at + 1;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 22 -> delete_order_message_record.nyse_bond_symbol[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 14 -> delete_order_message_record.cusip_isin[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 5 -> delete_order_message_record.quote_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Order Message is what was written, byte for byte */
inline equal_delete_order_message(delete_order_message_read, delete_order_message_written) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.time[delete_order_message_at] == delete_order_message_written.time[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.sequence_number[delete_order_message_at] == delete_order_message_written.sequence_number[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.order_reference_number[delete_order_message_at] == delete_order_message_written.order_reference_number[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  assert(delete_order_message_read.exchange_code == delete_order_message_written.exchange_code);
  assert(delete_order_message_read.system_code == delete_order_message_written.system_code);
  assert(delete_order_message_read.buy_sell_indicator == delete_order_message_written.buy_sell_indicator);
  assert(delete_order_message_read.flat_pricing == delete_order_message_written.flat_pricing);
  assert(delete_order_message_read.trading_action == delete_order_message_written.trading_action);
  assert(delete_order_message_read.security_type == delete_order_message_written.security_type);
  assert(delete_order_message_read.order_type == delete_order_message_written.order_type);
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 22 -> assert(delete_order_message_read.nyse_bond_symbol[delete_order_message_at] == delete_order_message_written.nyse_bond_symbol[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 14 -> assert(delete_order_message_read.cusip_isin[delete_order_message_at] == delete_order_message_written.cusip_isin[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 5 -> assert(delete_order_message_read.quote_id[delete_order_message_at] == delete_order_message_written.quote_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Imbalance Message: 72 bytes --------------------------------------------- */

/* Sent in response to orders submitted during pending auctions, at the conclusion of the Opening, Market Order and Closing Auctions, and for Halt Auctions. Total and market imbalance volumes are negative for a sell imbalance. */
typedef ImbalanceMessage {
  byte time[4];
  byte sequence_number[4];
  byte match_quantity[4];
  byte total_imbalance[4];
  byte market_imbalance[4];
  byte price[4];
  byte price_scale_code;
  byte exchange_code;
  byte system_code;
  byte auction_type;
  byte flat_pricing;
  byte trading_action;
  byte security_type;
  byte quote_condition;
  byte nyse_bond_symbol[22];
  byte cusip_isin[14];
  byte auction_time[4]
};

int imbalance_message_at;

/* every byte of Imbalance Message set to one value */
inline fill_imbalance_message(imbalance_message_record, imbalance_message_value) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.time[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.sequence_number[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.match_quantity[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.total_imbalance[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.market_imbalance[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.price_scale_code = imbalance_message_value;
  imbalance_message_record.exchange_code = imbalance_message_value;
  imbalance_message_record.system_code = imbalance_message_value;
  imbalance_message_record.auction_type = imbalance_message_value;
  imbalance_message_record.flat_pricing = imbalance_message_value;
  imbalance_message_record.trading_action = imbalance_message_value;
  imbalance_message_record.security_type = imbalance_message_value;
  imbalance_message_record.quote_condition = imbalance_message_value;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 22 -> imbalance_message_record.nyse_bond_symbol[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 14 -> imbalance_message_record.cusip_isin[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.auction_time[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_imbalance_message(imbalance_message_record, imbalance_message_base) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.time[imbalance_message_at] = (imbalance_message_base + 0 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.sequence_number[imbalance_message_at] = (imbalance_message_base + 4 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.match_quantity[imbalance_message_at] = (imbalance_message_base + 8 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.total_imbalance[imbalance_message_at] = (imbalance_message_base + 12 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.market_imbalance[imbalance_message_at] = (imbalance_message_base + 16 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.price[imbalance_message_at] = (imbalance_message_base + 20 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.price_scale_code = (imbalance_message_base + 24 + 1) % 256;
  imbalance_message_record.exchange_code = (imbalance_message_base + 25 + 1) % 256;
  imbalance_message_record.system_code = (imbalance_message_base + 26 + 1) % 256;
  imbalance_message_record.auction_type = (imbalance_message_base + 27 + 1) % 256;
  imbalance_message_record.flat_pricing = (imbalance_message_base + 28 + 1) % 256;
  imbalance_message_record.trading_action = (imbalance_message_base + 29 + 1) % 256;
  imbalance_message_record.security_type = (imbalance_message_base + 30 + 1) % 256;
  imbalance_message_record.quote_condition = (imbalance_message_base + 31 + 1) % 256;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 22 -> imbalance_message_record.nyse_bond_symbol[imbalance_message_at] = (imbalance_message_base + 32 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 14 -> imbalance_message_record.cusip_isin[imbalance_message_at] = (imbalance_message_base + 54 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.auction_time[imbalance_message_at] = (imbalance_message_base + 68 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Imbalance Message to the wire, 72 bytes from where the cursor stands */
inline encode_imbalance_message(imbalance_message_record) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.time[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.sequence_number[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.match_quantity[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.total_imbalance[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.market_imbalance[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = imbalance_message_record.price_scale_code; at = at + 1;
  wire[at] = imbalance_message_record.exchange_code; at = at + 1;
  wire[at] = imbalance_message_record.system_code; at = at + 1;
  wire[at] = imbalance_message_record.auction_type; at = at + 1;
  wire[at] = imbalance_message_record.flat_pricing; at = at + 1;
  wire[at] = imbalance_message_record.trading_action; at = at + 1;
  wire[at] = imbalance_message_record.security_type; at = at + 1;
  wire[at] = imbalance_message_record.quote_condition; at = at + 1;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 22 -> wire[at] = imbalance_message_record.nyse_bond_symbol[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 14 -> wire[at] = imbalance_message_record.cusip_isin[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.auction_time[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* Imbalance Message off the wire, 72 bytes from where the cursor stands */
inline decode_imbalance_message(imbalance_message_record) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.time[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.sequence_number[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.match_quantity[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.total_imbalance[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.market_imbalance[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.price_scale_code = wire[at]; at = at + 1;
  imbalance_message_record.exchange_code = wire[at]; at = at + 1;
  imbalance_message_record.system_code = wire[at]; at = at + 1;
  imbalance_message_record.auction_type = wire[at]; at = at + 1;
  imbalance_message_record.flat_pricing = wire[at]; at = at + 1;
  imbalance_message_record.trading_action = wire[at]; at = at + 1;
  imbalance_message_record.security_type = wire[at]; at = at + 1;
  imbalance_message_record.quote_condition = wire[at]; at = at + 1;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 22 -> imbalance_message_record.nyse_bond_symbol[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 14 -> imbalance_message_record.cusip_isin[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.auction_time[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Imbalance Message is what was written, byte for byte */
inline equal_imbalance_message(imbalance_message_read, imbalance_message_written) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.time[imbalance_message_at] == imbalance_message_written.time[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.sequence_number[imbalance_message_at] == imbalance_message_written.sequence_number[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.match_quantity[imbalance_message_at] == imbalance_message_written.match_quantity[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.total_imbalance[imbalance_message_at] == imbalance_message_written.total_imbalance[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.market_imbalance[imbalance_message_at] == imbalance_message_written.market_imbalance[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.price[imbalance_message_at] == imbalance_message_written.price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  assert(imbalance_message_read.price_scale_code == imbalance_message_written.price_scale_code);
  assert(imbalance_message_read.exchange_code == imbalance_message_written.exchange_code);
  assert(imbalance_message_read.system_code == imbalance_message_written.system_code);
  assert(imbalance_message_read.auction_type == imbalance_message_written.auction_type);
  assert(imbalance_message_read.flat_pricing == imbalance_message_written.flat_pricing);
  assert(imbalance_message_read.trading_action == imbalance_message_written.trading_action);
  assert(imbalance_message_read.security_type == imbalance_message_written.security_type);
  assert(imbalance_message_read.quote_condition == imbalance_message_written.quote_condition);
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 22 -> assert(imbalance_message_read.nyse_bond_symbol[imbalance_message_at] == imbalance_message_written.nyse_bond_symbol[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 14 -> assert(imbalance_message_read.cusip_isin[imbalance_message_at] == imbalance_message_written.cusip_isin[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.auction_time[imbalance_message_at] == imbalance_message_written.auction_time[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 52 bytes ------------------------------------------ */

/* Sent to indicate a special system event to an order book. The Event Code says what happened and the System Code which book is affected. Also carries the next sequence number subscribers should expect, which is generally the current one plus one but may restart at 1. */
typedef SystemEventMessage {
  byte time[4];
  byte sequence_number[4];
  byte next_expected_sequence_number[4];
  byte event_code;
  byte system_code;
  byte nyse_bond_symbol[22];
  byte cusip_isin[14];
  byte padding_ascii_2[2]
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.time[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.sequence_number[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.next_expected_sequence_number[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_record.system_code = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 22 -> system_event_message_record.nyse_bond_symbol[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 14 -> system_event_message_record.cusip_isin[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.padding_ascii_2[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.time[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.sequence_number[system_event_message_at] = (system_event_message_base + 4 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.next_expected_sequence_number[system_event_message_at] = (system_event_message_base + 8 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 12 + 1) % 256;
  system_event_message_record.system_code = (system_event_message_base + 13 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 22 -> system_event_message_record.nyse_bond_symbol[system_event_message_at] = (system_event_message_base + 14 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 14 -> system_event_message_record.cusip_isin[system_event_message_at] = (system_event_message_base + 36 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.padding_ascii_2[system_event_message_at] = (system_event_message_base + 50 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message to the wire, 52 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.time[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.sequence_number[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.next_expected_sequence_number[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  wire[at] = system_event_message_record.system_code; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 22 -> wire[at] = system_event_message_record.nyse_bond_symbol[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 14 -> wire[at] = system_event_message_record.cusip_isin[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.padding_ascii_2[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message off the wire, 52 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.time[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.sequence_number[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.next_expected_sequence_number[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_record.system_code = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 22 -> system_event_message_record.nyse_bond_symbol[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 14 -> system_event_message_record.cusip_isin[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.padding_ascii_2[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.time[system_event_message_at] == system_event_message_written.time[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.sequence_number[system_event_message_at] == system_event_message_written.sequence_number[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> assert(system_event_message_read.next_expected_sequence_number[system_event_message_at] == system_event_message_written.next_expected_sequence_number[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  assert(system_event_message_read.system_code == system_event_message_written.system_code);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 22 -> assert(system_event_message_read.nyse_bond_symbol[system_event_message_at] == system_event_message_written.nyse_bond_symbol[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 14 -> assert(system_event_message_read.cusip_isin[system_event_message_at] == system_event_message_written.cusip_isin[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.padding_ascii_2[system_event_message_at] == system_event_message_written.padding_ascii_2[system_event_message_at]); system_event_message_at = system_event_message_at + 1
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

/* Add Order Message: encoded, read back, and compared */
proctype check_add_order_message() {
  AddOrderMessage add_order_message_sent;
  AddOrderMessage add_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message(add_order_message_sent, 0)
  :: pattern == 1 -> fill_add_order_message(add_order_message_sent, 32)
  :: pattern == 2 -> fill_add_order_message(add_order_message_sent, 255)
  :: else -> ramp_add_order_message(add_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message(add_order_message_sent);
    assert(at == 76);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 76);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Modify Order Message: encoded, read back, and compared */
proctype check_modify_order_message() {
  ModifyOrderMessage modify_order_message_sent;
  ModifyOrderMessage modify_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_modify_order_message(modify_order_message_sent, 0)
  :: pattern == 1 -> fill_modify_order_message(modify_order_message_sent, 32)
  :: pattern == 2 -> fill_modify_order_message(modify_order_message_sent, 255)
  :: else -> ramp_modify_order_message(modify_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_modify_order_message(modify_order_message_sent);
    assert(at == 76);
    at = 0;
    decode_modify_order_message(modify_order_message_got);
    assert(at == 76);
    equal_modify_order_message(modify_order_message_got, modify_order_message_sent)
  }
}

/* Delete Order Message: encoded, read back, and compared */
proctype check_delete_order_message() {
  DeleteOrderMessage delete_order_message_sent;
  DeleteOrderMessage delete_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_order_message(delete_order_message_sent, 0)
  :: pattern == 1 -> fill_delete_order_message(delete_order_message_sent, 32)
  :: pattern == 2 -> fill_delete_order_message(delete_order_message_sent, 255)
  :: else -> ramp_delete_order_message(delete_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_order_message(delete_order_message_sent);
    assert(at == 60);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 60);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Imbalance Message: encoded, read back, and compared */
proctype check_imbalance_message() {
  ImbalanceMessage imbalance_message_sent;
  ImbalanceMessage imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_imbalance_message(imbalance_message_sent, 0)
  :: pattern == 1 -> fill_imbalance_message(imbalance_message_sent, 32)
  :: pattern == 2 -> fill_imbalance_message(imbalance_message_sent, 255)
  :: else -> ramp_imbalance_message(imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_imbalance_message(imbalance_message_sent);
    assert(at == 72);
    at = 0;
    decode_imbalance_message(imbalance_message_got);
    assert(at == 72);
    equal_imbalance_message(imbalance_message_got, imbalance_message_sent)
  }
}

/* System Event Message: encoded, read back, and compared */
proctype check_system_event_message() {
  SystemEventMessage system_event_message_sent;
  SystemEventMessage system_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_event_message(system_event_message_sent, 0)
  :: pattern == 1 -> fill_system_event_message(system_event_message_sent, 32)
  :: pattern == 2 -> fill_system_event_message(system_event_message_sent, 255)
  :: else -> ramp_system_event_message(system_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_event_message(system_event_message_sent);
    assert(at == 52);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 52);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_login_accepted_message()
  :: run check_login_rejected_message()
  :: run check_test_response_message()
  :: run check_add_order_message()
  :: run check_modify_order_message()
  :: run check_delete_order_message()
  :: run check_imbalance_message()
  :: run check_system_event_message()
  fi
}
