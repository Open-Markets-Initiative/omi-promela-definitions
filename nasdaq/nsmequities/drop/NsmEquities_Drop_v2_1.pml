/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Drop
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
#define WIRE 99

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 11 bytes ------------------------------------------------ */

/* Time Stamp and Type opening every Drop message line */
typedef MessageHeader {
  byte time_stamp[9];
  byte comma;
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.time_stamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.comma = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.time_stamp[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.comma = (message_header_base + 9 + 1) % 256;
  message_header_record.message_type = (message_header_base + 10 + 1) % 256;
  skip
}

/* Message Header to the wire, 11 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 9 -> wire[at] = message_header_record.time_stamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.comma; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 11 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.time_stamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.comma = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 9 -> assert(message_header_read.time_stamp[message_header_at] == message_header_written.time_stamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.comma == message_header_written.comma);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- New Order Accepted Message: 99 bytes ------------------------------------ */

/* New order accepted. */
typedef NewOrderAcceptedMessage {
  byte separator_1;
  byte source[6];
  byte separator_2;
  byte order_token[15];
  byte separator_3;
  byte replaced_token[10];
  byte separator_4;
  byte buy_sell;
  byte separator_5;
  byte shares[6];
  byte separator_6;
  byte stock[6];
  byte separator_7;
  byte price[11];
  byte separator_8;
  byte firm[4];
  byte separator_9;
  byte reference[12];
  byte separator_10;
  byte time_in_force[12];
  byte separator_11;
  byte capacity;
  byte separator_12;
  byte liquidity_code;
  byte separator_13;
  byte clearing_code
};

int new_order_accepted_message_at;

/* every byte of New Order Accepted Message set to one value */
inline fill_new_order_accepted_message(new_order_accepted_message_record, new_order_accepted_message_value) {
  new_order_accepted_message_record.separator_1 = new_order_accepted_message_value;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> new_order_accepted_message_record.source[new_order_accepted_message_at] = new_order_accepted_message_value; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_2 = new_order_accepted_message_value;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 15 -> new_order_accepted_message_record.order_token[new_order_accepted_message_at] = new_order_accepted_message_value; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_3 = new_order_accepted_message_value;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 10 -> new_order_accepted_message_record.replaced_token[new_order_accepted_message_at] = new_order_accepted_message_value; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_4 = new_order_accepted_message_value;
  new_order_accepted_message_record.buy_sell = new_order_accepted_message_value;
  new_order_accepted_message_record.separator_5 = new_order_accepted_message_value;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> new_order_accepted_message_record.shares[new_order_accepted_message_at] = new_order_accepted_message_value; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_6 = new_order_accepted_message_value;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> new_order_accepted_message_record.stock[new_order_accepted_message_at] = new_order_accepted_message_value; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_7 = new_order_accepted_message_value;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 11 -> new_order_accepted_message_record.price[new_order_accepted_message_at] = new_order_accepted_message_value; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_8 = new_order_accepted_message_value;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 4 -> new_order_accepted_message_record.firm[new_order_accepted_message_at] = new_order_accepted_message_value; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_9 = new_order_accepted_message_value;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 12 -> new_order_accepted_message_record.reference[new_order_accepted_message_at] = new_order_accepted_message_value; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_10 = new_order_accepted_message_value;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 12 -> new_order_accepted_message_record.time_in_force[new_order_accepted_message_at] = new_order_accepted_message_value; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_11 = new_order_accepted_message_value;
  new_order_accepted_message_record.capacity = new_order_accepted_message_value;
  new_order_accepted_message_record.separator_12 = new_order_accepted_message_value;
  new_order_accepted_message_record.liquidity_code = new_order_accepted_message_value;
  new_order_accepted_message_record.separator_13 = new_order_accepted_message_value;
  new_order_accepted_message_record.clearing_code = new_order_accepted_message_value;
  skip
}

/* each byte of New Order Accepted Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_accepted_message(new_order_accepted_message_record, new_order_accepted_message_base) {
  new_order_accepted_message_record.separator_1 = (new_order_accepted_message_base + 0 + 1) % 256;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> new_order_accepted_message_record.source[new_order_accepted_message_at] = (new_order_accepted_message_base + 1 + new_order_accepted_message_at + 1) % 256; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_2 = (new_order_accepted_message_base + 7 + 1) % 256;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 15 -> new_order_accepted_message_record.order_token[new_order_accepted_message_at] = (new_order_accepted_message_base + 8 + new_order_accepted_message_at + 1) % 256; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_3 = (new_order_accepted_message_base + 23 + 1) % 256;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 10 -> new_order_accepted_message_record.replaced_token[new_order_accepted_message_at] = (new_order_accepted_message_base + 24 + new_order_accepted_message_at + 1) % 256; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_4 = (new_order_accepted_message_base + 34 + 1) % 256;
  new_order_accepted_message_record.buy_sell = (new_order_accepted_message_base + 35 + 1) % 256;
  new_order_accepted_message_record.separator_5 = (new_order_accepted_message_base + 36 + 1) % 256;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> new_order_accepted_message_record.shares[new_order_accepted_message_at] = (new_order_accepted_message_base + 37 + new_order_accepted_message_at + 1) % 256; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_6 = (new_order_accepted_message_base + 43 + 1) % 256;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> new_order_accepted_message_record.stock[new_order_accepted_message_at] = (new_order_accepted_message_base + 44 + new_order_accepted_message_at + 1) % 256; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_7 = (new_order_accepted_message_base + 50 + 1) % 256;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 11 -> new_order_accepted_message_record.price[new_order_accepted_message_at] = (new_order_accepted_message_base + 51 + new_order_accepted_message_at + 1) % 256; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_8 = (new_order_accepted_message_base + 62 + 1) % 256;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 4 -> new_order_accepted_message_record.firm[new_order_accepted_message_at] = (new_order_accepted_message_base + 63 + new_order_accepted_message_at + 1) % 256; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_9 = (new_order_accepted_message_base + 67 + 1) % 256;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 12 -> new_order_accepted_message_record.reference[new_order_accepted_message_at] = (new_order_accepted_message_base + 68 + new_order_accepted_message_at + 1) % 256; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_10 = (new_order_accepted_message_base + 80 + 1) % 256;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 12 -> new_order_accepted_message_record.time_in_force[new_order_accepted_message_at] = (new_order_accepted_message_base + 81 + new_order_accepted_message_at + 1) % 256; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_11 = (new_order_accepted_message_base + 93 + 1) % 256;
  new_order_accepted_message_record.capacity = (new_order_accepted_message_base + 94 + 1) % 256;
  new_order_accepted_message_record.separator_12 = (new_order_accepted_message_base + 95 + 1) % 256;
  new_order_accepted_message_record.liquidity_code = (new_order_accepted_message_base + 96 + 1) % 256;
  new_order_accepted_message_record.separator_13 = (new_order_accepted_message_base + 97 + 1) % 256;
  new_order_accepted_message_record.clearing_code = (new_order_accepted_message_base + 98 + 1) % 256;
  skip
}

/* New Order Accepted Message to the wire, 99 bytes from where the cursor stands */
inline encode_new_order_accepted_message(new_order_accepted_message_record) {
  wire[at] = new_order_accepted_message_record.separator_1; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> wire[at] = new_order_accepted_message_record.source[new_order_accepted_message_at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_accepted_message_record.separator_2; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 15 -> wire[at] = new_order_accepted_message_record.order_token[new_order_accepted_message_at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_accepted_message_record.separator_3; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 10 -> wire[at] = new_order_accepted_message_record.replaced_token[new_order_accepted_message_at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_accepted_message_record.separator_4; at = at + 1;
  wire[at] = new_order_accepted_message_record.buy_sell; at = at + 1;
  wire[at] = new_order_accepted_message_record.separator_5; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> wire[at] = new_order_accepted_message_record.shares[new_order_accepted_message_at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_accepted_message_record.separator_6; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> wire[at] = new_order_accepted_message_record.stock[new_order_accepted_message_at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_accepted_message_record.separator_7; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 11 -> wire[at] = new_order_accepted_message_record.price[new_order_accepted_message_at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_accepted_message_record.separator_8; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 4 -> wire[at] = new_order_accepted_message_record.firm[new_order_accepted_message_at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_accepted_message_record.separator_9; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 12 -> wire[at] = new_order_accepted_message_record.reference[new_order_accepted_message_at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_accepted_message_record.separator_10; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 12 -> wire[at] = new_order_accepted_message_record.time_in_force[new_order_accepted_message_at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_accepted_message_record.separator_11; at = at + 1;
  wire[at] = new_order_accepted_message_record.capacity; at = at + 1;
  wire[at] = new_order_accepted_message_record.separator_12; at = at + 1;
  wire[at] = new_order_accepted_message_record.liquidity_code; at = at + 1;
  wire[at] = new_order_accepted_message_record.separator_13; at = at + 1;
  wire[at] = new_order_accepted_message_record.clearing_code; at = at + 1;
  skip
}

/* New Order Accepted Message off the wire, 99 bytes from where the cursor stands */
inline decode_new_order_accepted_message(new_order_accepted_message_record) {
  new_order_accepted_message_record.separator_1 = wire[at]; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> new_order_accepted_message_record.source[new_order_accepted_message_at] = wire[at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_2 = wire[at]; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 15 -> new_order_accepted_message_record.order_token[new_order_accepted_message_at] = wire[at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_3 = wire[at]; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 10 -> new_order_accepted_message_record.replaced_token[new_order_accepted_message_at] = wire[at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_4 = wire[at]; at = at + 1;
  new_order_accepted_message_record.buy_sell = wire[at]; at = at + 1;
  new_order_accepted_message_record.separator_5 = wire[at]; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> new_order_accepted_message_record.shares[new_order_accepted_message_at] = wire[at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_6 = wire[at]; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> new_order_accepted_message_record.stock[new_order_accepted_message_at] = wire[at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_7 = wire[at]; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 11 -> new_order_accepted_message_record.price[new_order_accepted_message_at] = wire[at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_8 = wire[at]; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 4 -> new_order_accepted_message_record.firm[new_order_accepted_message_at] = wire[at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_9 = wire[at]; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 12 -> new_order_accepted_message_record.reference[new_order_accepted_message_at] = wire[at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_10 = wire[at]; at = at + 1;
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 12 -> new_order_accepted_message_record.time_in_force[new_order_accepted_message_at] = wire[at]; at = at + 1; new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  new_order_accepted_message_record.separator_11 = wire[at]; at = at + 1;
  new_order_accepted_message_record.capacity = wire[at]; at = at + 1;
  new_order_accepted_message_record.separator_12 = wire[at]; at = at + 1;
  new_order_accepted_message_record.liquidity_code = wire[at]; at = at + 1;
  new_order_accepted_message_record.separator_13 = wire[at]; at = at + 1;
  new_order_accepted_message_record.clearing_code = wire[at]; at = at + 1;
  skip
}

/* what was read of New Order Accepted Message is what was written, byte for byte */
inline equal_new_order_accepted_message(new_order_accepted_message_read, new_order_accepted_message_written) {
  assert(new_order_accepted_message_read.separator_1 == new_order_accepted_message_written.separator_1);
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> assert(new_order_accepted_message_read.source[new_order_accepted_message_at] == new_order_accepted_message_written.source[new_order_accepted_message_at]); new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(new_order_accepted_message_read.separator_2 == new_order_accepted_message_written.separator_2);
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 15 -> assert(new_order_accepted_message_read.order_token[new_order_accepted_message_at] == new_order_accepted_message_written.order_token[new_order_accepted_message_at]); new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(new_order_accepted_message_read.separator_3 == new_order_accepted_message_written.separator_3);
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 10 -> assert(new_order_accepted_message_read.replaced_token[new_order_accepted_message_at] == new_order_accepted_message_written.replaced_token[new_order_accepted_message_at]); new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(new_order_accepted_message_read.separator_4 == new_order_accepted_message_written.separator_4);
  assert(new_order_accepted_message_read.buy_sell == new_order_accepted_message_written.buy_sell);
  assert(new_order_accepted_message_read.separator_5 == new_order_accepted_message_written.separator_5);
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> assert(new_order_accepted_message_read.shares[new_order_accepted_message_at] == new_order_accepted_message_written.shares[new_order_accepted_message_at]); new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(new_order_accepted_message_read.separator_6 == new_order_accepted_message_written.separator_6);
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 6 -> assert(new_order_accepted_message_read.stock[new_order_accepted_message_at] == new_order_accepted_message_written.stock[new_order_accepted_message_at]); new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(new_order_accepted_message_read.separator_7 == new_order_accepted_message_written.separator_7);
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 11 -> assert(new_order_accepted_message_read.price[new_order_accepted_message_at] == new_order_accepted_message_written.price[new_order_accepted_message_at]); new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(new_order_accepted_message_read.separator_8 == new_order_accepted_message_written.separator_8);
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 4 -> assert(new_order_accepted_message_read.firm[new_order_accepted_message_at] == new_order_accepted_message_written.firm[new_order_accepted_message_at]); new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(new_order_accepted_message_read.separator_9 == new_order_accepted_message_written.separator_9);
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 12 -> assert(new_order_accepted_message_read.reference[new_order_accepted_message_at] == new_order_accepted_message_written.reference[new_order_accepted_message_at]); new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(new_order_accepted_message_read.separator_10 == new_order_accepted_message_written.separator_10);
  new_order_accepted_message_at = 0;
  do
  :: new_order_accepted_message_at < 12 -> assert(new_order_accepted_message_read.time_in_force[new_order_accepted_message_at] == new_order_accepted_message_written.time_in_force[new_order_accepted_message_at]); new_order_accepted_message_at = new_order_accepted_message_at + 1
  :: else -> break
  od;
  assert(new_order_accepted_message_read.separator_11 == new_order_accepted_message_written.separator_11);
  assert(new_order_accepted_message_read.capacity == new_order_accepted_message_written.capacity);
  assert(new_order_accepted_message_read.separator_12 == new_order_accepted_message_written.separator_12);
  assert(new_order_accepted_message_read.liquidity_code == new_order_accepted_message_written.liquidity_code);
  assert(new_order_accepted_message_read.separator_13 == new_order_accepted_message_written.separator_13);
  assert(new_order_accepted_message_read.clearing_code == new_order_accepted_message_written.clearing_code);
  skip
}

/* ---- Existing Order Executed Message: 99 bytes ------------------------------- */

/* Existing order executed. */
typedef ExistingOrderExecutedMessage {
  byte separator_1;
  byte source[6];
  byte separator_2;
  byte order_token[15];
  byte separator_3;
  byte replaced_token[10];
  byte separator_4;
  byte buy_sell;
  byte separator_5;
  byte shares[6];
  byte separator_6;
  byte stock[6];
  byte separator_7;
  byte price[11];
  byte separator_8;
  byte firm[4];
  byte separator_9;
  byte reference[12];
  byte separator_10;
  byte match_number[12];
  byte separator_11;
  byte capacity;
  byte separator_12;
  byte liquidity_code;
  byte separator_13;
  byte clearing_code
};

int existing_order_executed_message_at;

/* every byte of Existing Order Executed Message set to one value */
inline fill_existing_order_executed_message(existing_order_executed_message_record, existing_order_executed_message_value) {
  existing_order_executed_message_record.separator_1 = existing_order_executed_message_value;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> existing_order_executed_message_record.source[existing_order_executed_message_at] = existing_order_executed_message_value; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_2 = existing_order_executed_message_value;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 15 -> existing_order_executed_message_record.order_token[existing_order_executed_message_at] = existing_order_executed_message_value; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_3 = existing_order_executed_message_value;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 10 -> existing_order_executed_message_record.replaced_token[existing_order_executed_message_at] = existing_order_executed_message_value; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_4 = existing_order_executed_message_value;
  existing_order_executed_message_record.buy_sell = existing_order_executed_message_value;
  existing_order_executed_message_record.separator_5 = existing_order_executed_message_value;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> existing_order_executed_message_record.shares[existing_order_executed_message_at] = existing_order_executed_message_value; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_6 = existing_order_executed_message_value;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> existing_order_executed_message_record.stock[existing_order_executed_message_at] = existing_order_executed_message_value; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_7 = existing_order_executed_message_value;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 11 -> existing_order_executed_message_record.price[existing_order_executed_message_at] = existing_order_executed_message_value; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_8 = existing_order_executed_message_value;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 4 -> existing_order_executed_message_record.firm[existing_order_executed_message_at] = existing_order_executed_message_value; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_9 = existing_order_executed_message_value;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 12 -> existing_order_executed_message_record.reference[existing_order_executed_message_at] = existing_order_executed_message_value; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_10 = existing_order_executed_message_value;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 12 -> existing_order_executed_message_record.match_number[existing_order_executed_message_at] = existing_order_executed_message_value; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_11 = existing_order_executed_message_value;
  existing_order_executed_message_record.capacity = existing_order_executed_message_value;
  existing_order_executed_message_record.separator_12 = existing_order_executed_message_value;
  existing_order_executed_message_record.liquidity_code = existing_order_executed_message_value;
  existing_order_executed_message_record.separator_13 = existing_order_executed_message_value;
  existing_order_executed_message_record.clearing_code = existing_order_executed_message_value;
  skip
}

/* each byte of Existing Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_existing_order_executed_message(existing_order_executed_message_record, existing_order_executed_message_base) {
  existing_order_executed_message_record.separator_1 = (existing_order_executed_message_base + 0 + 1) % 256;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> existing_order_executed_message_record.source[existing_order_executed_message_at] = (existing_order_executed_message_base + 1 + existing_order_executed_message_at + 1) % 256; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_2 = (existing_order_executed_message_base + 7 + 1) % 256;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 15 -> existing_order_executed_message_record.order_token[existing_order_executed_message_at] = (existing_order_executed_message_base + 8 + existing_order_executed_message_at + 1) % 256; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_3 = (existing_order_executed_message_base + 23 + 1) % 256;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 10 -> existing_order_executed_message_record.replaced_token[existing_order_executed_message_at] = (existing_order_executed_message_base + 24 + existing_order_executed_message_at + 1) % 256; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_4 = (existing_order_executed_message_base + 34 + 1) % 256;
  existing_order_executed_message_record.buy_sell = (existing_order_executed_message_base + 35 + 1) % 256;
  existing_order_executed_message_record.separator_5 = (existing_order_executed_message_base + 36 + 1) % 256;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> existing_order_executed_message_record.shares[existing_order_executed_message_at] = (existing_order_executed_message_base + 37 + existing_order_executed_message_at + 1) % 256; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_6 = (existing_order_executed_message_base + 43 + 1) % 256;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> existing_order_executed_message_record.stock[existing_order_executed_message_at] = (existing_order_executed_message_base + 44 + existing_order_executed_message_at + 1) % 256; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_7 = (existing_order_executed_message_base + 50 + 1) % 256;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 11 -> existing_order_executed_message_record.price[existing_order_executed_message_at] = (existing_order_executed_message_base + 51 + existing_order_executed_message_at + 1) % 256; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_8 = (existing_order_executed_message_base + 62 + 1) % 256;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 4 -> existing_order_executed_message_record.firm[existing_order_executed_message_at] = (existing_order_executed_message_base + 63 + existing_order_executed_message_at + 1) % 256; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_9 = (existing_order_executed_message_base + 67 + 1) % 256;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 12 -> existing_order_executed_message_record.reference[existing_order_executed_message_at] = (existing_order_executed_message_base + 68 + existing_order_executed_message_at + 1) % 256; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_10 = (existing_order_executed_message_base + 80 + 1) % 256;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 12 -> existing_order_executed_message_record.match_number[existing_order_executed_message_at] = (existing_order_executed_message_base + 81 + existing_order_executed_message_at + 1) % 256; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_11 = (existing_order_executed_message_base + 93 + 1) % 256;
  existing_order_executed_message_record.capacity = (existing_order_executed_message_base + 94 + 1) % 256;
  existing_order_executed_message_record.separator_12 = (existing_order_executed_message_base + 95 + 1) % 256;
  existing_order_executed_message_record.liquidity_code = (existing_order_executed_message_base + 96 + 1) % 256;
  existing_order_executed_message_record.separator_13 = (existing_order_executed_message_base + 97 + 1) % 256;
  existing_order_executed_message_record.clearing_code = (existing_order_executed_message_base + 98 + 1) % 256;
  skip
}

/* Existing Order Executed Message to the wire, 99 bytes from where the cursor stands */
inline encode_existing_order_executed_message(existing_order_executed_message_record) {
  wire[at] = existing_order_executed_message_record.separator_1; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> wire[at] = existing_order_executed_message_record.source[existing_order_executed_message_at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_executed_message_record.separator_2; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 15 -> wire[at] = existing_order_executed_message_record.order_token[existing_order_executed_message_at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_executed_message_record.separator_3; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 10 -> wire[at] = existing_order_executed_message_record.replaced_token[existing_order_executed_message_at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_executed_message_record.separator_4; at = at + 1;
  wire[at] = existing_order_executed_message_record.buy_sell; at = at + 1;
  wire[at] = existing_order_executed_message_record.separator_5; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> wire[at] = existing_order_executed_message_record.shares[existing_order_executed_message_at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_executed_message_record.separator_6; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> wire[at] = existing_order_executed_message_record.stock[existing_order_executed_message_at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_executed_message_record.separator_7; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 11 -> wire[at] = existing_order_executed_message_record.price[existing_order_executed_message_at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_executed_message_record.separator_8; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 4 -> wire[at] = existing_order_executed_message_record.firm[existing_order_executed_message_at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_executed_message_record.separator_9; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 12 -> wire[at] = existing_order_executed_message_record.reference[existing_order_executed_message_at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_executed_message_record.separator_10; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 12 -> wire[at] = existing_order_executed_message_record.match_number[existing_order_executed_message_at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_executed_message_record.separator_11; at = at + 1;
  wire[at] = existing_order_executed_message_record.capacity; at = at + 1;
  wire[at] = existing_order_executed_message_record.separator_12; at = at + 1;
  wire[at] = existing_order_executed_message_record.liquidity_code; at = at + 1;
  wire[at] = existing_order_executed_message_record.separator_13; at = at + 1;
  wire[at] = existing_order_executed_message_record.clearing_code; at = at + 1;
  skip
}

/* Existing Order Executed Message off the wire, 99 bytes from where the cursor stands */
inline decode_existing_order_executed_message(existing_order_executed_message_record) {
  existing_order_executed_message_record.separator_1 = wire[at]; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> existing_order_executed_message_record.source[existing_order_executed_message_at] = wire[at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_2 = wire[at]; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 15 -> existing_order_executed_message_record.order_token[existing_order_executed_message_at] = wire[at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_3 = wire[at]; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 10 -> existing_order_executed_message_record.replaced_token[existing_order_executed_message_at] = wire[at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_4 = wire[at]; at = at + 1;
  existing_order_executed_message_record.buy_sell = wire[at]; at = at + 1;
  existing_order_executed_message_record.separator_5 = wire[at]; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> existing_order_executed_message_record.shares[existing_order_executed_message_at] = wire[at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_6 = wire[at]; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> existing_order_executed_message_record.stock[existing_order_executed_message_at] = wire[at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_7 = wire[at]; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 11 -> existing_order_executed_message_record.price[existing_order_executed_message_at] = wire[at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_8 = wire[at]; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 4 -> existing_order_executed_message_record.firm[existing_order_executed_message_at] = wire[at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_9 = wire[at]; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 12 -> existing_order_executed_message_record.reference[existing_order_executed_message_at] = wire[at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_10 = wire[at]; at = at + 1;
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 12 -> existing_order_executed_message_record.match_number[existing_order_executed_message_at] = wire[at]; at = at + 1; existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  existing_order_executed_message_record.separator_11 = wire[at]; at = at + 1;
  existing_order_executed_message_record.capacity = wire[at]; at = at + 1;
  existing_order_executed_message_record.separator_12 = wire[at]; at = at + 1;
  existing_order_executed_message_record.liquidity_code = wire[at]; at = at + 1;
  existing_order_executed_message_record.separator_13 = wire[at]; at = at + 1;
  existing_order_executed_message_record.clearing_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Existing Order Executed Message is what was written, byte for byte */
inline equal_existing_order_executed_message(existing_order_executed_message_read, existing_order_executed_message_written) {
  assert(existing_order_executed_message_read.separator_1 == existing_order_executed_message_written.separator_1);
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> assert(existing_order_executed_message_read.source[existing_order_executed_message_at] == existing_order_executed_message_written.source[existing_order_executed_message_at]); existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  assert(existing_order_executed_message_read.separator_2 == existing_order_executed_message_written.separator_2);
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 15 -> assert(existing_order_executed_message_read.order_token[existing_order_executed_message_at] == existing_order_executed_message_written.order_token[existing_order_executed_message_at]); existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  assert(existing_order_executed_message_read.separator_3 == existing_order_executed_message_written.separator_3);
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 10 -> assert(existing_order_executed_message_read.replaced_token[existing_order_executed_message_at] == existing_order_executed_message_written.replaced_token[existing_order_executed_message_at]); existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  assert(existing_order_executed_message_read.separator_4 == existing_order_executed_message_written.separator_4);
  assert(existing_order_executed_message_read.buy_sell == existing_order_executed_message_written.buy_sell);
  assert(existing_order_executed_message_read.separator_5 == existing_order_executed_message_written.separator_5);
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> assert(existing_order_executed_message_read.shares[existing_order_executed_message_at] == existing_order_executed_message_written.shares[existing_order_executed_message_at]); existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  assert(existing_order_executed_message_read.separator_6 == existing_order_executed_message_written.separator_6);
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 6 -> assert(existing_order_executed_message_read.stock[existing_order_executed_message_at] == existing_order_executed_message_written.stock[existing_order_executed_message_at]); existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  assert(existing_order_executed_message_read.separator_7 == existing_order_executed_message_written.separator_7);
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 11 -> assert(existing_order_executed_message_read.price[existing_order_executed_message_at] == existing_order_executed_message_written.price[existing_order_executed_message_at]); existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  assert(existing_order_executed_message_read.separator_8 == existing_order_executed_message_written.separator_8);
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 4 -> assert(existing_order_executed_message_read.firm[existing_order_executed_message_at] == existing_order_executed_message_written.firm[existing_order_executed_message_at]); existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  assert(existing_order_executed_message_read.separator_9 == existing_order_executed_message_written.separator_9);
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 12 -> assert(existing_order_executed_message_read.reference[existing_order_executed_message_at] == existing_order_executed_message_written.reference[existing_order_executed_message_at]); existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  assert(existing_order_executed_message_read.separator_10 == existing_order_executed_message_written.separator_10);
  existing_order_executed_message_at = 0;
  do
  :: existing_order_executed_message_at < 12 -> assert(existing_order_executed_message_read.match_number[existing_order_executed_message_at] == existing_order_executed_message_written.match_number[existing_order_executed_message_at]); existing_order_executed_message_at = existing_order_executed_message_at + 1
  :: else -> break
  od;
  assert(existing_order_executed_message_read.separator_11 == existing_order_executed_message_written.separator_11);
  assert(existing_order_executed_message_read.capacity == existing_order_executed_message_written.capacity);
  assert(existing_order_executed_message_read.separator_12 == existing_order_executed_message_written.separator_12);
  assert(existing_order_executed_message_read.liquidity_code == existing_order_executed_message_written.liquidity_code);
  assert(existing_order_executed_message_read.separator_13 == existing_order_executed_message_written.separator_13);
  assert(existing_order_executed_message_read.clearing_code == existing_order_executed_message_written.clearing_code);
  skip
}

/* ---- Existing Order Canceled Message: 99 bytes ------------------------------- */

/* Existing order canceled. */
typedef ExistingOrderCanceledMessage {
  byte separator_1;
  byte source[6];
  byte separator_2;
  byte order_token[15];
  byte separator_3;
  byte replaced_token[10];
  byte separator_4;
  byte buy_sell;
  byte separator_5;
  byte shares[6];
  byte separator_6;
  byte stock[6];
  byte separator_7;
  byte price[11];
  byte separator_8;
  byte firm[4];
  byte separator_9;
  byte reference[12];
  byte separator_10;
  byte time_in_force[12];
  byte separator_11;
  byte capacity;
  byte separator_12;
  byte cancel_reason;
  byte separator_13;
  byte clearing_code
};

int existing_order_canceled_message_at;

/* every byte of Existing Order Canceled Message set to one value */
inline fill_existing_order_canceled_message(existing_order_canceled_message_record, existing_order_canceled_message_value) {
  existing_order_canceled_message_record.separator_1 = existing_order_canceled_message_value;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> existing_order_canceled_message_record.source[existing_order_canceled_message_at] = existing_order_canceled_message_value; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_2 = existing_order_canceled_message_value;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 15 -> existing_order_canceled_message_record.order_token[existing_order_canceled_message_at] = existing_order_canceled_message_value; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_3 = existing_order_canceled_message_value;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 10 -> existing_order_canceled_message_record.replaced_token[existing_order_canceled_message_at] = existing_order_canceled_message_value; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_4 = existing_order_canceled_message_value;
  existing_order_canceled_message_record.buy_sell = existing_order_canceled_message_value;
  existing_order_canceled_message_record.separator_5 = existing_order_canceled_message_value;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> existing_order_canceled_message_record.shares[existing_order_canceled_message_at] = existing_order_canceled_message_value; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_6 = existing_order_canceled_message_value;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> existing_order_canceled_message_record.stock[existing_order_canceled_message_at] = existing_order_canceled_message_value; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_7 = existing_order_canceled_message_value;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 11 -> existing_order_canceled_message_record.price[existing_order_canceled_message_at] = existing_order_canceled_message_value; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_8 = existing_order_canceled_message_value;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 4 -> existing_order_canceled_message_record.firm[existing_order_canceled_message_at] = existing_order_canceled_message_value; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_9 = existing_order_canceled_message_value;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 12 -> existing_order_canceled_message_record.reference[existing_order_canceled_message_at] = existing_order_canceled_message_value; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_10 = existing_order_canceled_message_value;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 12 -> existing_order_canceled_message_record.time_in_force[existing_order_canceled_message_at] = existing_order_canceled_message_value; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_11 = existing_order_canceled_message_value;
  existing_order_canceled_message_record.capacity = existing_order_canceled_message_value;
  existing_order_canceled_message_record.separator_12 = existing_order_canceled_message_value;
  existing_order_canceled_message_record.cancel_reason = existing_order_canceled_message_value;
  existing_order_canceled_message_record.separator_13 = existing_order_canceled_message_value;
  existing_order_canceled_message_record.clearing_code = existing_order_canceled_message_value;
  skip
}

/* each byte of Existing Order Canceled Message set to where it lies, so a field read out of place says so */
inline ramp_existing_order_canceled_message(existing_order_canceled_message_record, existing_order_canceled_message_base) {
  existing_order_canceled_message_record.separator_1 = (existing_order_canceled_message_base + 0 + 1) % 256;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> existing_order_canceled_message_record.source[existing_order_canceled_message_at] = (existing_order_canceled_message_base + 1 + existing_order_canceled_message_at + 1) % 256; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_2 = (existing_order_canceled_message_base + 7 + 1) % 256;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 15 -> existing_order_canceled_message_record.order_token[existing_order_canceled_message_at] = (existing_order_canceled_message_base + 8 + existing_order_canceled_message_at + 1) % 256; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_3 = (existing_order_canceled_message_base + 23 + 1) % 256;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 10 -> existing_order_canceled_message_record.replaced_token[existing_order_canceled_message_at] = (existing_order_canceled_message_base + 24 + existing_order_canceled_message_at + 1) % 256; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_4 = (existing_order_canceled_message_base + 34 + 1) % 256;
  existing_order_canceled_message_record.buy_sell = (existing_order_canceled_message_base + 35 + 1) % 256;
  existing_order_canceled_message_record.separator_5 = (existing_order_canceled_message_base + 36 + 1) % 256;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> existing_order_canceled_message_record.shares[existing_order_canceled_message_at] = (existing_order_canceled_message_base + 37 + existing_order_canceled_message_at + 1) % 256; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_6 = (existing_order_canceled_message_base + 43 + 1) % 256;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> existing_order_canceled_message_record.stock[existing_order_canceled_message_at] = (existing_order_canceled_message_base + 44 + existing_order_canceled_message_at + 1) % 256; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_7 = (existing_order_canceled_message_base + 50 + 1) % 256;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 11 -> existing_order_canceled_message_record.price[existing_order_canceled_message_at] = (existing_order_canceled_message_base + 51 + existing_order_canceled_message_at + 1) % 256; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_8 = (existing_order_canceled_message_base + 62 + 1) % 256;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 4 -> existing_order_canceled_message_record.firm[existing_order_canceled_message_at] = (existing_order_canceled_message_base + 63 + existing_order_canceled_message_at + 1) % 256; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_9 = (existing_order_canceled_message_base + 67 + 1) % 256;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 12 -> existing_order_canceled_message_record.reference[existing_order_canceled_message_at] = (existing_order_canceled_message_base + 68 + existing_order_canceled_message_at + 1) % 256; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_10 = (existing_order_canceled_message_base + 80 + 1) % 256;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 12 -> existing_order_canceled_message_record.time_in_force[existing_order_canceled_message_at] = (existing_order_canceled_message_base + 81 + existing_order_canceled_message_at + 1) % 256; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_11 = (existing_order_canceled_message_base + 93 + 1) % 256;
  existing_order_canceled_message_record.capacity = (existing_order_canceled_message_base + 94 + 1) % 256;
  existing_order_canceled_message_record.separator_12 = (existing_order_canceled_message_base + 95 + 1) % 256;
  existing_order_canceled_message_record.cancel_reason = (existing_order_canceled_message_base + 96 + 1) % 256;
  existing_order_canceled_message_record.separator_13 = (existing_order_canceled_message_base + 97 + 1) % 256;
  existing_order_canceled_message_record.clearing_code = (existing_order_canceled_message_base + 98 + 1) % 256;
  skip
}

/* Existing Order Canceled Message to the wire, 99 bytes from where the cursor stands */
inline encode_existing_order_canceled_message(existing_order_canceled_message_record) {
  wire[at] = existing_order_canceled_message_record.separator_1; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> wire[at] = existing_order_canceled_message_record.source[existing_order_canceled_message_at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_canceled_message_record.separator_2; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 15 -> wire[at] = existing_order_canceled_message_record.order_token[existing_order_canceled_message_at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_canceled_message_record.separator_3; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 10 -> wire[at] = existing_order_canceled_message_record.replaced_token[existing_order_canceled_message_at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_canceled_message_record.separator_4; at = at + 1;
  wire[at] = existing_order_canceled_message_record.buy_sell; at = at + 1;
  wire[at] = existing_order_canceled_message_record.separator_5; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> wire[at] = existing_order_canceled_message_record.shares[existing_order_canceled_message_at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_canceled_message_record.separator_6; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> wire[at] = existing_order_canceled_message_record.stock[existing_order_canceled_message_at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_canceled_message_record.separator_7; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 11 -> wire[at] = existing_order_canceled_message_record.price[existing_order_canceled_message_at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_canceled_message_record.separator_8; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 4 -> wire[at] = existing_order_canceled_message_record.firm[existing_order_canceled_message_at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_canceled_message_record.separator_9; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 12 -> wire[at] = existing_order_canceled_message_record.reference[existing_order_canceled_message_at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_canceled_message_record.separator_10; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 12 -> wire[at] = existing_order_canceled_message_record.time_in_force[existing_order_canceled_message_at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_canceled_message_record.separator_11; at = at + 1;
  wire[at] = existing_order_canceled_message_record.capacity; at = at + 1;
  wire[at] = existing_order_canceled_message_record.separator_12; at = at + 1;
  wire[at] = existing_order_canceled_message_record.cancel_reason; at = at + 1;
  wire[at] = existing_order_canceled_message_record.separator_13; at = at + 1;
  wire[at] = existing_order_canceled_message_record.clearing_code; at = at + 1;
  skip
}

/* Existing Order Canceled Message off the wire, 99 bytes from where the cursor stands */
inline decode_existing_order_canceled_message(existing_order_canceled_message_record) {
  existing_order_canceled_message_record.separator_1 = wire[at]; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> existing_order_canceled_message_record.source[existing_order_canceled_message_at] = wire[at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_2 = wire[at]; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 15 -> existing_order_canceled_message_record.order_token[existing_order_canceled_message_at] = wire[at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_3 = wire[at]; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 10 -> existing_order_canceled_message_record.replaced_token[existing_order_canceled_message_at] = wire[at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_4 = wire[at]; at = at + 1;
  existing_order_canceled_message_record.buy_sell = wire[at]; at = at + 1;
  existing_order_canceled_message_record.separator_5 = wire[at]; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> existing_order_canceled_message_record.shares[existing_order_canceled_message_at] = wire[at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_6 = wire[at]; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> existing_order_canceled_message_record.stock[existing_order_canceled_message_at] = wire[at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_7 = wire[at]; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 11 -> existing_order_canceled_message_record.price[existing_order_canceled_message_at] = wire[at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_8 = wire[at]; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 4 -> existing_order_canceled_message_record.firm[existing_order_canceled_message_at] = wire[at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_9 = wire[at]; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 12 -> existing_order_canceled_message_record.reference[existing_order_canceled_message_at] = wire[at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_10 = wire[at]; at = at + 1;
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 12 -> existing_order_canceled_message_record.time_in_force[existing_order_canceled_message_at] = wire[at]; at = at + 1; existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  existing_order_canceled_message_record.separator_11 = wire[at]; at = at + 1;
  existing_order_canceled_message_record.capacity = wire[at]; at = at + 1;
  existing_order_canceled_message_record.separator_12 = wire[at]; at = at + 1;
  existing_order_canceled_message_record.cancel_reason = wire[at]; at = at + 1;
  existing_order_canceled_message_record.separator_13 = wire[at]; at = at + 1;
  existing_order_canceled_message_record.clearing_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Existing Order Canceled Message is what was written, byte for byte */
inline equal_existing_order_canceled_message(existing_order_canceled_message_read, existing_order_canceled_message_written) {
  assert(existing_order_canceled_message_read.separator_1 == existing_order_canceled_message_written.separator_1);
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> assert(existing_order_canceled_message_read.source[existing_order_canceled_message_at] == existing_order_canceled_message_written.source[existing_order_canceled_message_at]); existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  assert(existing_order_canceled_message_read.separator_2 == existing_order_canceled_message_written.separator_2);
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 15 -> assert(existing_order_canceled_message_read.order_token[existing_order_canceled_message_at] == existing_order_canceled_message_written.order_token[existing_order_canceled_message_at]); existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  assert(existing_order_canceled_message_read.separator_3 == existing_order_canceled_message_written.separator_3);
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 10 -> assert(existing_order_canceled_message_read.replaced_token[existing_order_canceled_message_at] == existing_order_canceled_message_written.replaced_token[existing_order_canceled_message_at]); existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  assert(existing_order_canceled_message_read.separator_4 == existing_order_canceled_message_written.separator_4);
  assert(existing_order_canceled_message_read.buy_sell == existing_order_canceled_message_written.buy_sell);
  assert(existing_order_canceled_message_read.separator_5 == existing_order_canceled_message_written.separator_5);
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> assert(existing_order_canceled_message_read.shares[existing_order_canceled_message_at] == existing_order_canceled_message_written.shares[existing_order_canceled_message_at]); existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  assert(existing_order_canceled_message_read.separator_6 == existing_order_canceled_message_written.separator_6);
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 6 -> assert(existing_order_canceled_message_read.stock[existing_order_canceled_message_at] == existing_order_canceled_message_written.stock[existing_order_canceled_message_at]); existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  assert(existing_order_canceled_message_read.separator_7 == existing_order_canceled_message_written.separator_7);
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 11 -> assert(existing_order_canceled_message_read.price[existing_order_canceled_message_at] == existing_order_canceled_message_written.price[existing_order_canceled_message_at]); existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  assert(existing_order_canceled_message_read.separator_8 == existing_order_canceled_message_written.separator_8);
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 4 -> assert(existing_order_canceled_message_read.firm[existing_order_canceled_message_at] == existing_order_canceled_message_written.firm[existing_order_canceled_message_at]); existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  assert(existing_order_canceled_message_read.separator_9 == existing_order_canceled_message_written.separator_9);
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 12 -> assert(existing_order_canceled_message_read.reference[existing_order_canceled_message_at] == existing_order_canceled_message_written.reference[existing_order_canceled_message_at]); existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  assert(existing_order_canceled_message_read.separator_10 == existing_order_canceled_message_written.separator_10);
  existing_order_canceled_message_at = 0;
  do
  :: existing_order_canceled_message_at < 12 -> assert(existing_order_canceled_message_read.time_in_force[existing_order_canceled_message_at] == existing_order_canceled_message_written.time_in_force[existing_order_canceled_message_at]); existing_order_canceled_message_at = existing_order_canceled_message_at + 1
  :: else -> break
  od;
  assert(existing_order_canceled_message_read.separator_11 == existing_order_canceled_message_written.separator_11);
  assert(existing_order_canceled_message_read.capacity == existing_order_canceled_message_written.capacity);
  assert(existing_order_canceled_message_read.separator_12 == existing_order_canceled_message_written.separator_12);
  assert(existing_order_canceled_message_read.cancel_reason == existing_order_canceled_message_written.cancel_reason);
  assert(existing_order_canceled_message_read.separator_13 == existing_order_canceled_message_written.separator_13);
  assert(existing_order_canceled_message_read.clearing_code == existing_order_canceled_message_written.clearing_code);
  skip
}

/* ---- Previous Execution Broken Message: 99 bytes ----------------------------- */

/* Previous execution broken. */
typedef PreviousExecutionBrokenMessage {
  byte separator_1;
  byte source[6];
  byte separator_2;
  byte order_token[15];
  byte separator_3;
  byte replaced_token[10];
  byte separator_4;
  byte buy_sell;
  byte separator_5;
  byte shares[6];
  byte separator_6;
  byte stock[6];
  byte separator_7;
  byte price[11];
  byte separator_8;
  byte firm[4];
  byte separator_9;
  byte reference[12];
  byte separator_10;
  byte match_number[12];
  byte separator_11;
  byte capacity;
  byte separator_12;
  byte liquidity_code;
  byte separator_13;
  byte clearing_code
};

int previous_execution_broken_message_at;

/* every byte of Previous Execution Broken Message set to one value */
inline fill_previous_execution_broken_message(previous_execution_broken_message_record, previous_execution_broken_message_value) {
  previous_execution_broken_message_record.separator_1 = previous_execution_broken_message_value;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> previous_execution_broken_message_record.source[previous_execution_broken_message_at] = previous_execution_broken_message_value; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_2 = previous_execution_broken_message_value;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 15 -> previous_execution_broken_message_record.order_token[previous_execution_broken_message_at] = previous_execution_broken_message_value; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_3 = previous_execution_broken_message_value;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 10 -> previous_execution_broken_message_record.replaced_token[previous_execution_broken_message_at] = previous_execution_broken_message_value; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_4 = previous_execution_broken_message_value;
  previous_execution_broken_message_record.buy_sell = previous_execution_broken_message_value;
  previous_execution_broken_message_record.separator_5 = previous_execution_broken_message_value;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> previous_execution_broken_message_record.shares[previous_execution_broken_message_at] = previous_execution_broken_message_value; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_6 = previous_execution_broken_message_value;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> previous_execution_broken_message_record.stock[previous_execution_broken_message_at] = previous_execution_broken_message_value; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_7 = previous_execution_broken_message_value;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 11 -> previous_execution_broken_message_record.price[previous_execution_broken_message_at] = previous_execution_broken_message_value; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_8 = previous_execution_broken_message_value;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 4 -> previous_execution_broken_message_record.firm[previous_execution_broken_message_at] = previous_execution_broken_message_value; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_9 = previous_execution_broken_message_value;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 12 -> previous_execution_broken_message_record.reference[previous_execution_broken_message_at] = previous_execution_broken_message_value; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_10 = previous_execution_broken_message_value;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 12 -> previous_execution_broken_message_record.match_number[previous_execution_broken_message_at] = previous_execution_broken_message_value; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_11 = previous_execution_broken_message_value;
  previous_execution_broken_message_record.capacity = previous_execution_broken_message_value;
  previous_execution_broken_message_record.separator_12 = previous_execution_broken_message_value;
  previous_execution_broken_message_record.liquidity_code = previous_execution_broken_message_value;
  previous_execution_broken_message_record.separator_13 = previous_execution_broken_message_value;
  previous_execution_broken_message_record.clearing_code = previous_execution_broken_message_value;
  skip
}

/* each byte of Previous Execution Broken Message set to where it lies, so a field read out of place says so */
inline ramp_previous_execution_broken_message(previous_execution_broken_message_record, previous_execution_broken_message_base) {
  previous_execution_broken_message_record.separator_1 = (previous_execution_broken_message_base + 0 + 1) % 256;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> previous_execution_broken_message_record.source[previous_execution_broken_message_at] = (previous_execution_broken_message_base + 1 + previous_execution_broken_message_at + 1) % 256; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_2 = (previous_execution_broken_message_base + 7 + 1) % 256;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 15 -> previous_execution_broken_message_record.order_token[previous_execution_broken_message_at] = (previous_execution_broken_message_base + 8 + previous_execution_broken_message_at + 1) % 256; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_3 = (previous_execution_broken_message_base + 23 + 1) % 256;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 10 -> previous_execution_broken_message_record.replaced_token[previous_execution_broken_message_at] = (previous_execution_broken_message_base + 24 + previous_execution_broken_message_at + 1) % 256; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_4 = (previous_execution_broken_message_base + 34 + 1) % 256;
  previous_execution_broken_message_record.buy_sell = (previous_execution_broken_message_base + 35 + 1) % 256;
  previous_execution_broken_message_record.separator_5 = (previous_execution_broken_message_base + 36 + 1) % 256;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> previous_execution_broken_message_record.shares[previous_execution_broken_message_at] = (previous_execution_broken_message_base + 37 + previous_execution_broken_message_at + 1) % 256; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_6 = (previous_execution_broken_message_base + 43 + 1) % 256;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> previous_execution_broken_message_record.stock[previous_execution_broken_message_at] = (previous_execution_broken_message_base + 44 + previous_execution_broken_message_at + 1) % 256; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_7 = (previous_execution_broken_message_base + 50 + 1) % 256;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 11 -> previous_execution_broken_message_record.price[previous_execution_broken_message_at] = (previous_execution_broken_message_base + 51 + previous_execution_broken_message_at + 1) % 256; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_8 = (previous_execution_broken_message_base + 62 + 1) % 256;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 4 -> previous_execution_broken_message_record.firm[previous_execution_broken_message_at] = (previous_execution_broken_message_base + 63 + previous_execution_broken_message_at + 1) % 256; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_9 = (previous_execution_broken_message_base + 67 + 1) % 256;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 12 -> previous_execution_broken_message_record.reference[previous_execution_broken_message_at] = (previous_execution_broken_message_base + 68 + previous_execution_broken_message_at + 1) % 256; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_10 = (previous_execution_broken_message_base + 80 + 1) % 256;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 12 -> previous_execution_broken_message_record.match_number[previous_execution_broken_message_at] = (previous_execution_broken_message_base + 81 + previous_execution_broken_message_at + 1) % 256; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_11 = (previous_execution_broken_message_base + 93 + 1) % 256;
  previous_execution_broken_message_record.capacity = (previous_execution_broken_message_base + 94 + 1) % 256;
  previous_execution_broken_message_record.separator_12 = (previous_execution_broken_message_base + 95 + 1) % 256;
  previous_execution_broken_message_record.liquidity_code = (previous_execution_broken_message_base + 96 + 1) % 256;
  previous_execution_broken_message_record.separator_13 = (previous_execution_broken_message_base + 97 + 1) % 256;
  previous_execution_broken_message_record.clearing_code = (previous_execution_broken_message_base + 98 + 1) % 256;
  skip
}

/* Previous Execution Broken Message to the wire, 99 bytes from where the cursor stands */
inline encode_previous_execution_broken_message(previous_execution_broken_message_record) {
  wire[at] = previous_execution_broken_message_record.separator_1; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> wire[at] = previous_execution_broken_message_record.source[previous_execution_broken_message_at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  wire[at] = previous_execution_broken_message_record.separator_2; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 15 -> wire[at] = previous_execution_broken_message_record.order_token[previous_execution_broken_message_at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  wire[at] = previous_execution_broken_message_record.separator_3; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 10 -> wire[at] = previous_execution_broken_message_record.replaced_token[previous_execution_broken_message_at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  wire[at] = previous_execution_broken_message_record.separator_4; at = at + 1;
  wire[at] = previous_execution_broken_message_record.buy_sell; at = at + 1;
  wire[at] = previous_execution_broken_message_record.separator_5; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> wire[at] = previous_execution_broken_message_record.shares[previous_execution_broken_message_at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  wire[at] = previous_execution_broken_message_record.separator_6; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> wire[at] = previous_execution_broken_message_record.stock[previous_execution_broken_message_at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  wire[at] = previous_execution_broken_message_record.separator_7; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 11 -> wire[at] = previous_execution_broken_message_record.price[previous_execution_broken_message_at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  wire[at] = previous_execution_broken_message_record.separator_8; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 4 -> wire[at] = previous_execution_broken_message_record.firm[previous_execution_broken_message_at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  wire[at] = previous_execution_broken_message_record.separator_9; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 12 -> wire[at] = previous_execution_broken_message_record.reference[previous_execution_broken_message_at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  wire[at] = previous_execution_broken_message_record.separator_10; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 12 -> wire[at] = previous_execution_broken_message_record.match_number[previous_execution_broken_message_at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  wire[at] = previous_execution_broken_message_record.separator_11; at = at + 1;
  wire[at] = previous_execution_broken_message_record.capacity; at = at + 1;
  wire[at] = previous_execution_broken_message_record.separator_12; at = at + 1;
  wire[at] = previous_execution_broken_message_record.liquidity_code; at = at + 1;
  wire[at] = previous_execution_broken_message_record.separator_13; at = at + 1;
  wire[at] = previous_execution_broken_message_record.clearing_code; at = at + 1;
  skip
}

/* Previous Execution Broken Message off the wire, 99 bytes from where the cursor stands */
inline decode_previous_execution_broken_message(previous_execution_broken_message_record) {
  previous_execution_broken_message_record.separator_1 = wire[at]; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> previous_execution_broken_message_record.source[previous_execution_broken_message_at] = wire[at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_2 = wire[at]; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 15 -> previous_execution_broken_message_record.order_token[previous_execution_broken_message_at] = wire[at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_3 = wire[at]; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 10 -> previous_execution_broken_message_record.replaced_token[previous_execution_broken_message_at] = wire[at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_4 = wire[at]; at = at + 1;
  previous_execution_broken_message_record.buy_sell = wire[at]; at = at + 1;
  previous_execution_broken_message_record.separator_5 = wire[at]; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> previous_execution_broken_message_record.shares[previous_execution_broken_message_at] = wire[at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_6 = wire[at]; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> previous_execution_broken_message_record.stock[previous_execution_broken_message_at] = wire[at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_7 = wire[at]; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 11 -> previous_execution_broken_message_record.price[previous_execution_broken_message_at] = wire[at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_8 = wire[at]; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 4 -> previous_execution_broken_message_record.firm[previous_execution_broken_message_at] = wire[at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_9 = wire[at]; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 12 -> previous_execution_broken_message_record.reference[previous_execution_broken_message_at] = wire[at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_10 = wire[at]; at = at + 1;
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 12 -> previous_execution_broken_message_record.match_number[previous_execution_broken_message_at] = wire[at]; at = at + 1; previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  previous_execution_broken_message_record.separator_11 = wire[at]; at = at + 1;
  previous_execution_broken_message_record.capacity = wire[at]; at = at + 1;
  previous_execution_broken_message_record.separator_12 = wire[at]; at = at + 1;
  previous_execution_broken_message_record.liquidity_code = wire[at]; at = at + 1;
  previous_execution_broken_message_record.separator_13 = wire[at]; at = at + 1;
  previous_execution_broken_message_record.clearing_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Previous Execution Broken Message is what was written, byte for byte */
inline equal_previous_execution_broken_message(previous_execution_broken_message_read, previous_execution_broken_message_written) {
  assert(previous_execution_broken_message_read.separator_1 == previous_execution_broken_message_written.separator_1);
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> assert(previous_execution_broken_message_read.source[previous_execution_broken_message_at] == previous_execution_broken_message_written.source[previous_execution_broken_message_at]); previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  assert(previous_execution_broken_message_read.separator_2 == previous_execution_broken_message_written.separator_2);
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 15 -> assert(previous_execution_broken_message_read.order_token[previous_execution_broken_message_at] == previous_execution_broken_message_written.order_token[previous_execution_broken_message_at]); previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  assert(previous_execution_broken_message_read.separator_3 == previous_execution_broken_message_written.separator_3);
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 10 -> assert(previous_execution_broken_message_read.replaced_token[previous_execution_broken_message_at] == previous_execution_broken_message_written.replaced_token[previous_execution_broken_message_at]); previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  assert(previous_execution_broken_message_read.separator_4 == previous_execution_broken_message_written.separator_4);
  assert(previous_execution_broken_message_read.buy_sell == previous_execution_broken_message_written.buy_sell);
  assert(previous_execution_broken_message_read.separator_5 == previous_execution_broken_message_written.separator_5);
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> assert(previous_execution_broken_message_read.shares[previous_execution_broken_message_at] == previous_execution_broken_message_written.shares[previous_execution_broken_message_at]); previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  assert(previous_execution_broken_message_read.separator_6 == previous_execution_broken_message_written.separator_6);
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 6 -> assert(previous_execution_broken_message_read.stock[previous_execution_broken_message_at] == previous_execution_broken_message_written.stock[previous_execution_broken_message_at]); previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  assert(previous_execution_broken_message_read.separator_7 == previous_execution_broken_message_written.separator_7);
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 11 -> assert(previous_execution_broken_message_read.price[previous_execution_broken_message_at] == previous_execution_broken_message_written.price[previous_execution_broken_message_at]); previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  assert(previous_execution_broken_message_read.separator_8 == previous_execution_broken_message_written.separator_8);
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 4 -> assert(previous_execution_broken_message_read.firm[previous_execution_broken_message_at] == previous_execution_broken_message_written.firm[previous_execution_broken_message_at]); previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  assert(previous_execution_broken_message_read.separator_9 == previous_execution_broken_message_written.separator_9);
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 12 -> assert(previous_execution_broken_message_read.reference[previous_execution_broken_message_at] == previous_execution_broken_message_written.reference[previous_execution_broken_message_at]); previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  assert(previous_execution_broken_message_read.separator_10 == previous_execution_broken_message_written.separator_10);
  previous_execution_broken_message_at = 0;
  do
  :: previous_execution_broken_message_at < 12 -> assert(previous_execution_broken_message_read.match_number[previous_execution_broken_message_at] == previous_execution_broken_message_written.match_number[previous_execution_broken_message_at]); previous_execution_broken_message_at = previous_execution_broken_message_at + 1
  :: else -> break
  od;
  assert(previous_execution_broken_message_read.separator_11 == previous_execution_broken_message_written.separator_11);
  assert(previous_execution_broken_message_read.capacity == previous_execution_broken_message_written.capacity);
  assert(previous_execution_broken_message_read.separator_12 == previous_execution_broken_message_written.separator_12);
  assert(previous_execution_broken_message_read.liquidity_code == previous_execution_broken_message_written.liquidity_code);
  assert(previous_execution_broken_message_read.separator_13 == previous_execution_broken_message_written.separator_13);
  assert(previous_execution_broken_message_read.clearing_code == previous_execution_broken_message_written.clearing_code);
  skip
}

/* ---- Existing Order Replaced Message: 99 bytes ------------------------------- */

/* Existing order replaced. */
typedef ExistingOrderReplacedMessage {
  byte separator_1;
  byte source[6];
  byte separator_2;
  byte order_token[15];
  byte separator_3;
  byte replaced_token[10];
  byte separator_4;
  byte buy_sell;
  byte separator_5;
  byte shares[6];
  byte separator_6;
  byte stock[6];
  byte separator_7;
  byte price[11];
  byte separator_8;
  byte firm[4];
  byte separator_9;
  byte reference[12];
  byte separator_10;
  byte time_in_force[12];
  byte separator_11;
  byte capacity;
  byte separator_12;
  byte liquidity_code;
  byte separator_13;
  byte clearing_code
};

int existing_order_replaced_message_at;

/* every byte of Existing Order Replaced Message set to one value */
inline fill_existing_order_replaced_message(existing_order_replaced_message_record, existing_order_replaced_message_value) {
  existing_order_replaced_message_record.separator_1 = existing_order_replaced_message_value;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> existing_order_replaced_message_record.source[existing_order_replaced_message_at] = existing_order_replaced_message_value; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_2 = existing_order_replaced_message_value;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 15 -> existing_order_replaced_message_record.order_token[existing_order_replaced_message_at] = existing_order_replaced_message_value; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_3 = existing_order_replaced_message_value;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 10 -> existing_order_replaced_message_record.replaced_token[existing_order_replaced_message_at] = existing_order_replaced_message_value; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_4 = existing_order_replaced_message_value;
  existing_order_replaced_message_record.buy_sell = existing_order_replaced_message_value;
  existing_order_replaced_message_record.separator_5 = existing_order_replaced_message_value;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> existing_order_replaced_message_record.shares[existing_order_replaced_message_at] = existing_order_replaced_message_value; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_6 = existing_order_replaced_message_value;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> existing_order_replaced_message_record.stock[existing_order_replaced_message_at] = existing_order_replaced_message_value; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_7 = existing_order_replaced_message_value;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 11 -> existing_order_replaced_message_record.price[existing_order_replaced_message_at] = existing_order_replaced_message_value; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_8 = existing_order_replaced_message_value;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 4 -> existing_order_replaced_message_record.firm[existing_order_replaced_message_at] = existing_order_replaced_message_value; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_9 = existing_order_replaced_message_value;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 12 -> existing_order_replaced_message_record.reference[existing_order_replaced_message_at] = existing_order_replaced_message_value; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_10 = existing_order_replaced_message_value;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 12 -> existing_order_replaced_message_record.time_in_force[existing_order_replaced_message_at] = existing_order_replaced_message_value; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_11 = existing_order_replaced_message_value;
  existing_order_replaced_message_record.capacity = existing_order_replaced_message_value;
  existing_order_replaced_message_record.separator_12 = existing_order_replaced_message_value;
  existing_order_replaced_message_record.liquidity_code = existing_order_replaced_message_value;
  existing_order_replaced_message_record.separator_13 = existing_order_replaced_message_value;
  existing_order_replaced_message_record.clearing_code = existing_order_replaced_message_value;
  skip
}

/* each byte of Existing Order Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_existing_order_replaced_message(existing_order_replaced_message_record, existing_order_replaced_message_base) {
  existing_order_replaced_message_record.separator_1 = (existing_order_replaced_message_base + 0 + 1) % 256;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> existing_order_replaced_message_record.source[existing_order_replaced_message_at] = (existing_order_replaced_message_base + 1 + existing_order_replaced_message_at + 1) % 256; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_2 = (existing_order_replaced_message_base + 7 + 1) % 256;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 15 -> existing_order_replaced_message_record.order_token[existing_order_replaced_message_at] = (existing_order_replaced_message_base + 8 + existing_order_replaced_message_at + 1) % 256; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_3 = (existing_order_replaced_message_base + 23 + 1) % 256;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 10 -> existing_order_replaced_message_record.replaced_token[existing_order_replaced_message_at] = (existing_order_replaced_message_base + 24 + existing_order_replaced_message_at + 1) % 256; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_4 = (existing_order_replaced_message_base + 34 + 1) % 256;
  existing_order_replaced_message_record.buy_sell = (existing_order_replaced_message_base + 35 + 1) % 256;
  existing_order_replaced_message_record.separator_5 = (existing_order_replaced_message_base + 36 + 1) % 256;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> existing_order_replaced_message_record.shares[existing_order_replaced_message_at] = (existing_order_replaced_message_base + 37 + existing_order_replaced_message_at + 1) % 256; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_6 = (existing_order_replaced_message_base + 43 + 1) % 256;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> existing_order_replaced_message_record.stock[existing_order_replaced_message_at] = (existing_order_replaced_message_base + 44 + existing_order_replaced_message_at + 1) % 256; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_7 = (existing_order_replaced_message_base + 50 + 1) % 256;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 11 -> existing_order_replaced_message_record.price[existing_order_replaced_message_at] = (existing_order_replaced_message_base + 51 + existing_order_replaced_message_at + 1) % 256; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_8 = (existing_order_replaced_message_base + 62 + 1) % 256;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 4 -> existing_order_replaced_message_record.firm[existing_order_replaced_message_at] = (existing_order_replaced_message_base + 63 + existing_order_replaced_message_at + 1) % 256; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_9 = (existing_order_replaced_message_base + 67 + 1) % 256;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 12 -> existing_order_replaced_message_record.reference[existing_order_replaced_message_at] = (existing_order_replaced_message_base + 68 + existing_order_replaced_message_at + 1) % 256; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_10 = (existing_order_replaced_message_base + 80 + 1) % 256;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 12 -> existing_order_replaced_message_record.time_in_force[existing_order_replaced_message_at] = (existing_order_replaced_message_base + 81 + existing_order_replaced_message_at + 1) % 256; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_11 = (existing_order_replaced_message_base + 93 + 1) % 256;
  existing_order_replaced_message_record.capacity = (existing_order_replaced_message_base + 94 + 1) % 256;
  existing_order_replaced_message_record.separator_12 = (existing_order_replaced_message_base + 95 + 1) % 256;
  existing_order_replaced_message_record.liquidity_code = (existing_order_replaced_message_base + 96 + 1) % 256;
  existing_order_replaced_message_record.separator_13 = (existing_order_replaced_message_base + 97 + 1) % 256;
  existing_order_replaced_message_record.clearing_code = (existing_order_replaced_message_base + 98 + 1) % 256;
  skip
}

/* Existing Order Replaced Message to the wire, 99 bytes from where the cursor stands */
inline encode_existing_order_replaced_message(existing_order_replaced_message_record) {
  wire[at] = existing_order_replaced_message_record.separator_1; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> wire[at] = existing_order_replaced_message_record.source[existing_order_replaced_message_at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_replaced_message_record.separator_2; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 15 -> wire[at] = existing_order_replaced_message_record.order_token[existing_order_replaced_message_at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_replaced_message_record.separator_3; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 10 -> wire[at] = existing_order_replaced_message_record.replaced_token[existing_order_replaced_message_at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_replaced_message_record.separator_4; at = at + 1;
  wire[at] = existing_order_replaced_message_record.buy_sell; at = at + 1;
  wire[at] = existing_order_replaced_message_record.separator_5; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> wire[at] = existing_order_replaced_message_record.shares[existing_order_replaced_message_at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_replaced_message_record.separator_6; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> wire[at] = existing_order_replaced_message_record.stock[existing_order_replaced_message_at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_replaced_message_record.separator_7; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 11 -> wire[at] = existing_order_replaced_message_record.price[existing_order_replaced_message_at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_replaced_message_record.separator_8; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 4 -> wire[at] = existing_order_replaced_message_record.firm[existing_order_replaced_message_at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_replaced_message_record.separator_9; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 12 -> wire[at] = existing_order_replaced_message_record.reference[existing_order_replaced_message_at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_replaced_message_record.separator_10; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 12 -> wire[at] = existing_order_replaced_message_record.time_in_force[existing_order_replaced_message_at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_replaced_message_record.separator_11; at = at + 1;
  wire[at] = existing_order_replaced_message_record.capacity; at = at + 1;
  wire[at] = existing_order_replaced_message_record.separator_12; at = at + 1;
  wire[at] = existing_order_replaced_message_record.liquidity_code; at = at + 1;
  wire[at] = existing_order_replaced_message_record.separator_13; at = at + 1;
  wire[at] = existing_order_replaced_message_record.clearing_code; at = at + 1;
  skip
}

/* Existing Order Replaced Message off the wire, 99 bytes from where the cursor stands */
inline decode_existing_order_replaced_message(existing_order_replaced_message_record) {
  existing_order_replaced_message_record.separator_1 = wire[at]; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> existing_order_replaced_message_record.source[existing_order_replaced_message_at] = wire[at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_2 = wire[at]; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 15 -> existing_order_replaced_message_record.order_token[existing_order_replaced_message_at] = wire[at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_3 = wire[at]; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 10 -> existing_order_replaced_message_record.replaced_token[existing_order_replaced_message_at] = wire[at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_4 = wire[at]; at = at + 1;
  existing_order_replaced_message_record.buy_sell = wire[at]; at = at + 1;
  existing_order_replaced_message_record.separator_5 = wire[at]; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> existing_order_replaced_message_record.shares[existing_order_replaced_message_at] = wire[at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_6 = wire[at]; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> existing_order_replaced_message_record.stock[existing_order_replaced_message_at] = wire[at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_7 = wire[at]; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 11 -> existing_order_replaced_message_record.price[existing_order_replaced_message_at] = wire[at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_8 = wire[at]; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 4 -> existing_order_replaced_message_record.firm[existing_order_replaced_message_at] = wire[at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_9 = wire[at]; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 12 -> existing_order_replaced_message_record.reference[existing_order_replaced_message_at] = wire[at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_10 = wire[at]; at = at + 1;
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 12 -> existing_order_replaced_message_record.time_in_force[existing_order_replaced_message_at] = wire[at]; at = at + 1; existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  existing_order_replaced_message_record.separator_11 = wire[at]; at = at + 1;
  existing_order_replaced_message_record.capacity = wire[at]; at = at + 1;
  existing_order_replaced_message_record.separator_12 = wire[at]; at = at + 1;
  existing_order_replaced_message_record.liquidity_code = wire[at]; at = at + 1;
  existing_order_replaced_message_record.separator_13 = wire[at]; at = at + 1;
  existing_order_replaced_message_record.clearing_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Existing Order Replaced Message is what was written, byte for byte */
inline equal_existing_order_replaced_message(existing_order_replaced_message_read, existing_order_replaced_message_written) {
  assert(existing_order_replaced_message_read.separator_1 == existing_order_replaced_message_written.separator_1);
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> assert(existing_order_replaced_message_read.source[existing_order_replaced_message_at] == existing_order_replaced_message_written.source[existing_order_replaced_message_at]); existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  assert(existing_order_replaced_message_read.separator_2 == existing_order_replaced_message_written.separator_2);
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 15 -> assert(existing_order_replaced_message_read.order_token[existing_order_replaced_message_at] == existing_order_replaced_message_written.order_token[existing_order_replaced_message_at]); existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  assert(existing_order_replaced_message_read.separator_3 == existing_order_replaced_message_written.separator_3);
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 10 -> assert(existing_order_replaced_message_read.replaced_token[existing_order_replaced_message_at] == existing_order_replaced_message_written.replaced_token[existing_order_replaced_message_at]); existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  assert(existing_order_replaced_message_read.separator_4 == existing_order_replaced_message_written.separator_4);
  assert(existing_order_replaced_message_read.buy_sell == existing_order_replaced_message_written.buy_sell);
  assert(existing_order_replaced_message_read.separator_5 == existing_order_replaced_message_written.separator_5);
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> assert(existing_order_replaced_message_read.shares[existing_order_replaced_message_at] == existing_order_replaced_message_written.shares[existing_order_replaced_message_at]); existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  assert(existing_order_replaced_message_read.separator_6 == existing_order_replaced_message_written.separator_6);
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 6 -> assert(existing_order_replaced_message_read.stock[existing_order_replaced_message_at] == existing_order_replaced_message_written.stock[existing_order_replaced_message_at]); existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  assert(existing_order_replaced_message_read.separator_7 == existing_order_replaced_message_written.separator_7);
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 11 -> assert(existing_order_replaced_message_read.price[existing_order_replaced_message_at] == existing_order_replaced_message_written.price[existing_order_replaced_message_at]); existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  assert(existing_order_replaced_message_read.separator_8 == existing_order_replaced_message_written.separator_8);
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 4 -> assert(existing_order_replaced_message_read.firm[existing_order_replaced_message_at] == existing_order_replaced_message_written.firm[existing_order_replaced_message_at]); existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  assert(existing_order_replaced_message_read.separator_9 == existing_order_replaced_message_written.separator_9);
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 12 -> assert(existing_order_replaced_message_read.reference[existing_order_replaced_message_at] == existing_order_replaced_message_written.reference[existing_order_replaced_message_at]); existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  assert(existing_order_replaced_message_read.separator_10 == existing_order_replaced_message_written.separator_10);
  existing_order_replaced_message_at = 0;
  do
  :: existing_order_replaced_message_at < 12 -> assert(existing_order_replaced_message_read.time_in_force[existing_order_replaced_message_at] == existing_order_replaced_message_written.time_in_force[existing_order_replaced_message_at]); existing_order_replaced_message_at = existing_order_replaced_message_at + 1
  :: else -> break
  od;
  assert(existing_order_replaced_message_read.separator_11 == existing_order_replaced_message_written.separator_11);
  assert(existing_order_replaced_message_read.capacity == existing_order_replaced_message_written.capacity);
  assert(existing_order_replaced_message_read.separator_12 == existing_order_replaced_message_written.separator_12);
  assert(existing_order_replaced_message_read.liquidity_code == existing_order_replaced_message_written.liquidity_code);
  assert(existing_order_replaced_message_read.separator_13 == existing_order_replaced_message_written.separator_13);
  assert(existing_order_replaced_message_read.clearing_code == existing_order_replaced_message_written.clearing_code);
  skip
}

/* ---- Existing Order Cancelled Aiq Message: 99 bytes -------------------------- */

/* Existing order cancelled (AIQ). */
typedef ExistingOrderCancelledAiqMessage {
  byte separator_1;
  byte source[6];
  byte separator_2;
  byte order_token[15];
  byte separator_3;
  byte replaced_token[10];
  byte separator_4;
  byte buy_sell;
  byte separator_5;
  byte shares[6];
  byte separator_6;
  byte stock[6];
  byte separator_7;
  byte price[11];
  byte separator_8;
  byte firm[4];
  byte separator_9;
  byte reference[12];
  byte separator_10;
  byte time_in_force[12];
  byte separator_11;
  byte capacity;
  byte separator_12;
  byte cancel_reason;
  byte separator_13;
  byte clearing_code
};

int existing_order_cancelled_aiq_message_at;

/* every byte of Existing Order Cancelled Aiq Message set to one value */
inline fill_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_record, existing_order_cancelled_aiq_message_value) {
  existing_order_cancelled_aiq_message_record.separator_1 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> existing_order_cancelled_aiq_message_record.source[existing_order_cancelled_aiq_message_at] = existing_order_cancelled_aiq_message_value; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_2 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 15 -> existing_order_cancelled_aiq_message_record.order_token[existing_order_cancelled_aiq_message_at] = existing_order_cancelled_aiq_message_value; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_3 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 10 -> existing_order_cancelled_aiq_message_record.replaced_token[existing_order_cancelled_aiq_message_at] = existing_order_cancelled_aiq_message_value; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_4 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_record.buy_sell = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_record.separator_5 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> existing_order_cancelled_aiq_message_record.shares[existing_order_cancelled_aiq_message_at] = existing_order_cancelled_aiq_message_value; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_6 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> existing_order_cancelled_aiq_message_record.stock[existing_order_cancelled_aiq_message_at] = existing_order_cancelled_aiq_message_value; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_7 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 11 -> existing_order_cancelled_aiq_message_record.price[existing_order_cancelled_aiq_message_at] = existing_order_cancelled_aiq_message_value; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_8 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 4 -> existing_order_cancelled_aiq_message_record.firm[existing_order_cancelled_aiq_message_at] = existing_order_cancelled_aiq_message_value; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_9 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 12 -> existing_order_cancelled_aiq_message_record.reference[existing_order_cancelled_aiq_message_at] = existing_order_cancelled_aiq_message_value; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_10 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 12 -> existing_order_cancelled_aiq_message_record.time_in_force[existing_order_cancelled_aiq_message_at] = existing_order_cancelled_aiq_message_value; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_11 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_record.capacity = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_record.separator_12 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_record.cancel_reason = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_record.separator_13 = existing_order_cancelled_aiq_message_value;
  existing_order_cancelled_aiq_message_record.clearing_code = existing_order_cancelled_aiq_message_value;
  skip
}

/* each byte of Existing Order Cancelled Aiq Message set to where it lies, so a field read out of place says so */
inline ramp_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_record, existing_order_cancelled_aiq_message_base) {
  existing_order_cancelled_aiq_message_record.separator_1 = (existing_order_cancelled_aiq_message_base + 0 + 1) % 256;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> existing_order_cancelled_aiq_message_record.source[existing_order_cancelled_aiq_message_at] = (existing_order_cancelled_aiq_message_base + 1 + existing_order_cancelled_aiq_message_at + 1) % 256; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_2 = (existing_order_cancelled_aiq_message_base + 7 + 1) % 256;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 15 -> existing_order_cancelled_aiq_message_record.order_token[existing_order_cancelled_aiq_message_at] = (existing_order_cancelled_aiq_message_base + 8 + existing_order_cancelled_aiq_message_at + 1) % 256; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_3 = (existing_order_cancelled_aiq_message_base + 23 + 1) % 256;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 10 -> existing_order_cancelled_aiq_message_record.replaced_token[existing_order_cancelled_aiq_message_at] = (existing_order_cancelled_aiq_message_base + 24 + existing_order_cancelled_aiq_message_at + 1) % 256; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_4 = (existing_order_cancelled_aiq_message_base + 34 + 1) % 256;
  existing_order_cancelled_aiq_message_record.buy_sell = (existing_order_cancelled_aiq_message_base + 35 + 1) % 256;
  existing_order_cancelled_aiq_message_record.separator_5 = (existing_order_cancelled_aiq_message_base + 36 + 1) % 256;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> existing_order_cancelled_aiq_message_record.shares[existing_order_cancelled_aiq_message_at] = (existing_order_cancelled_aiq_message_base + 37 + existing_order_cancelled_aiq_message_at + 1) % 256; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_6 = (existing_order_cancelled_aiq_message_base + 43 + 1) % 256;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> existing_order_cancelled_aiq_message_record.stock[existing_order_cancelled_aiq_message_at] = (existing_order_cancelled_aiq_message_base + 44 + existing_order_cancelled_aiq_message_at + 1) % 256; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_7 = (existing_order_cancelled_aiq_message_base + 50 + 1) % 256;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 11 -> existing_order_cancelled_aiq_message_record.price[existing_order_cancelled_aiq_message_at] = (existing_order_cancelled_aiq_message_base + 51 + existing_order_cancelled_aiq_message_at + 1) % 256; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_8 = (existing_order_cancelled_aiq_message_base + 62 + 1) % 256;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 4 -> existing_order_cancelled_aiq_message_record.firm[existing_order_cancelled_aiq_message_at] = (existing_order_cancelled_aiq_message_base + 63 + existing_order_cancelled_aiq_message_at + 1) % 256; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_9 = (existing_order_cancelled_aiq_message_base + 67 + 1) % 256;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 12 -> existing_order_cancelled_aiq_message_record.reference[existing_order_cancelled_aiq_message_at] = (existing_order_cancelled_aiq_message_base + 68 + existing_order_cancelled_aiq_message_at + 1) % 256; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_10 = (existing_order_cancelled_aiq_message_base + 80 + 1) % 256;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 12 -> existing_order_cancelled_aiq_message_record.time_in_force[existing_order_cancelled_aiq_message_at] = (existing_order_cancelled_aiq_message_base + 81 + existing_order_cancelled_aiq_message_at + 1) % 256; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_11 = (existing_order_cancelled_aiq_message_base + 93 + 1) % 256;
  existing_order_cancelled_aiq_message_record.capacity = (existing_order_cancelled_aiq_message_base + 94 + 1) % 256;
  existing_order_cancelled_aiq_message_record.separator_12 = (existing_order_cancelled_aiq_message_base + 95 + 1) % 256;
  existing_order_cancelled_aiq_message_record.cancel_reason = (existing_order_cancelled_aiq_message_base + 96 + 1) % 256;
  existing_order_cancelled_aiq_message_record.separator_13 = (existing_order_cancelled_aiq_message_base + 97 + 1) % 256;
  existing_order_cancelled_aiq_message_record.clearing_code = (existing_order_cancelled_aiq_message_base + 98 + 1) % 256;
  skip
}

/* Existing Order Cancelled Aiq Message to the wire, 99 bytes from where the cursor stands */
inline encode_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_record) {
  wire[at] = existing_order_cancelled_aiq_message_record.separator_1; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> wire[at] = existing_order_cancelled_aiq_message_record.source[existing_order_cancelled_aiq_message_at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_2; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 15 -> wire[at] = existing_order_cancelled_aiq_message_record.order_token[existing_order_cancelled_aiq_message_at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_3; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 10 -> wire[at] = existing_order_cancelled_aiq_message_record.replaced_token[existing_order_cancelled_aiq_message_at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_4; at = at + 1;
  wire[at] = existing_order_cancelled_aiq_message_record.buy_sell; at = at + 1;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_5; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> wire[at] = existing_order_cancelled_aiq_message_record.shares[existing_order_cancelled_aiq_message_at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_6; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> wire[at] = existing_order_cancelled_aiq_message_record.stock[existing_order_cancelled_aiq_message_at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_7; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 11 -> wire[at] = existing_order_cancelled_aiq_message_record.price[existing_order_cancelled_aiq_message_at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_8; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 4 -> wire[at] = existing_order_cancelled_aiq_message_record.firm[existing_order_cancelled_aiq_message_at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_9; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 12 -> wire[at] = existing_order_cancelled_aiq_message_record.reference[existing_order_cancelled_aiq_message_at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_10; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 12 -> wire[at] = existing_order_cancelled_aiq_message_record.time_in_force[existing_order_cancelled_aiq_message_at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_11; at = at + 1;
  wire[at] = existing_order_cancelled_aiq_message_record.capacity; at = at + 1;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_12; at = at + 1;
  wire[at] = existing_order_cancelled_aiq_message_record.cancel_reason; at = at + 1;
  wire[at] = existing_order_cancelled_aiq_message_record.separator_13; at = at + 1;
  wire[at] = existing_order_cancelled_aiq_message_record.clearing_code; at = at + 1;
  skip
}

/* Existing Order Cancelled Aiq Message off the wire, 99 bytes from where the cursor stands */
inline decode_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_record) {
  existing_order_cancelled_aiq_message_record.separator_1 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> existing_order_cancelled_aiq_message_record.source[existing_order_cancelled_aiq_message_at] = wire[at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_2 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 15 -> existing_order_cancelled_aiq_message_record.order_token[existing_order_cancelled_aiq_message_at] = wire[at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_3 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 10 -> existing_order_cancelled_aiq_message_record.replaced_token[existing_order_cancelled_aiq_message_at] = wire[at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_4 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_record.buy_sell = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_record.separator_5 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> existing_order_cancelled_aiq_message_record.shares[existing_order_cancelled_aiq_message_at] = wire[at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_6 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> existing_order_cancelled_aiq_message_record.stock[existing_order_cancelled_aiq_message_at] = wire[at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_7 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 11 -> existing_order_cancelled_aiq_message_record.price[existing_order_cancelled_aiq_message_at] = wire[at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_8 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 4 -> existing_order_cancelled_aiq_message_record.firm[existing_order_cancelled_aiq_message_at] = wire[at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_9 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 12 -> existing_order_cancelled_aiq_message_record.reference[existing_order_cancelled_aiq_message_at] = wire[at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_10 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 12 -> existing_order_cancelled_aiq_message_record.time_in_force[existing_order_cancelled_aiq_message_at] = wire[at]; at = at + 1; existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  existing_order_cancelled_aiq_message_record.separator_11 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_record.capacity = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_record.separator_12 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_record.cancel_reason = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_record.separator_13 = wire[at]; at = at + 1;
  existing_order_cancelled_aiq_message_record.clearing_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Existing Order Cancelled Aiq Message is what was written, byte for byte */
inline equal_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_read, existing_order_cancelled_aiq_message_written) {
  assert(existing_order_cancelled_aiq_message_read.separator_1 == existing_order_cancelled_aiq_message_written.separator_1);
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> assert(existing_order_cancelled_aiq_message_read.source[existing_order_cancelled_aiq_message_at] == existing_order_cancelled_aiq_message_written.source[existing_order_cancelled_aiq_message_at]); existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  assert(existing_order_cancelled_aiq_message_read.separator_2 == existing_order_cancelled_aiq_message_written.separator_2);
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 15 -> assert(existing_order_cancelled_aiq_message_read.order_token[existing_order_cancelled_aiq_message_at] == existing_order_cancelled_aiq_message_written.order_token[existing_order_cancelled_aiq_message_at]); existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  assert(existing_order_cancelled_aiq_message_read.separator_3 == existing_order_cancelled_aiq_message_written.separator_3);
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 10 -> assert(existing_order_cancelled_aiq_message_read.replaced_token[existing_order_cancelled_aiq_message_at] == existing_order_cancelled_aiq_message_written.replaced_token[existing_order_cancelled_aiq_message_at]); existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  assert(existing_order_cancelled_aiq_message_read.separator_4 == existing_order_cancelled_aiq_message_written.separator_4);
  assert(existing_order_cancelled_aiq_message_read.buy_sell == existing_order_cancelled_aiq_message_written.buy_sell);
  assert(existing_order_cancelled_aiq_message_read.separator_5 == existing_order_cancelled_aiq_message_written.separator_5);
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> assert(existing_order_cancelled_aiq_message_read.shares[existing_order_cancelled_aiq_message_at] == existing_order_cancelled_aiq_message_written.shares[existing_order_cancelled_aiq_message_at]); existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  assert(existing_order_cancelled_aiq_message_read.separator_6 == existing_order_cancelled_aiq_message_written.separator_6);
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 6 -> assert(existing_order_cancelled_aiq_message_read.stock[existing_order_cancelled_aiq_message_at] == existing_order_cancelled_aiq_message_written.stock[existing_order_cancelled_aiq_message_at]); existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  assert(existing_order_cancelled_aiq_message_read.separator_7 == existing_order_cancelled_aiq_message_written.separator_7);
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 11 -> assert(existing_order_cancelled_aiq_message_read.price[existing_order_cancelled_aiq_message_at] == existing_order_cancelled_aiq_message_written.price[existing_order_cancelled_aiq_message_at]); existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  assert(existing_order_cancelled_aiq_message_read.separator_8 == existing_order_cancelled_aiq_message_written.separator_8);
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 4 -> assert(existing_order_cancelled_aiq_message_read.firm[existing_order_cancelled_aiq_message_at] == existing_order_cancelled_aiq_message_written.firm[existing_order_cancelled_aiq_message_at]); existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  assert(existing_order_cancelled_aiq_message_read.separator_9 == existing_order_cancelled_aiq_message_written.separator_9);
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 12 -> assert(existing_order_cancelled_aiq_message_read.reference[existing_order_cancelled_aiq_message_at] == existing_order_cancelled_aiq_message_written.reference[existing_order_cancelled_aiq_message_at]); existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  assert(existing_order_cancelled_aiq_message_read.separator_10 == existing_order_cancelled_aiq_message_written.separator_10);
  existing_order_cancelled_aiq_message_at = 0;
  do
  :: existing_order_cancelled_aiq_message_at < 12 -> assert(existing_order_cancelled_aiq_message_read.time_in_force[existing_order_cancelled_aiq_message_at] == existing_order_cancelled_aiq_message_written.time_in_force[existing_order_cancelled_aiq_message_at]); existing_order_cancelled_aiq_message_at = existing_order_cancelled_aiq_message_at + 1
  :: else -> break
  od;
  assert(existing_order_cancelled_aiq_message_read.separator_11 == existing_order_cancelled_aiq_message_written.separator_11);
  assert(existing_order_cancelled_aiq_message_read.capacity == existing_order_cancelled_aiq_message_written.capacity);
  assert(existing_order_cancelled_aiq_message_read.separator_12 == existing_order_cancelled_aiq_message_written.separator_12);
  assert(existing_order_cancelled_aiq_message_read.cancel_reason == existing_order_cancelled_aiq_message_written.cancel_reason);
  assert(existing_order_cancelled_aiq_message_read.separator_13 == existing_order_cancelled_aiq_message_written.separator_13);
  assert(existing_order_cancelled_aiq_message_read.clearing_code == existing_order_cancelled_aiq_message_written.clearing_code);
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

/* New Order Accepted Message: encoded, read back, and compared */
proctype check_new_order_accepted_message() {
  NewOrderAcceptedMessage new_order_accepted_message_sent;
  NewOrderAcceptedMessage new_order_accepted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_accepted_message(new_order_accepted_message_sent, 0)
  :: pattern == 1 -> fill_new_order_accepted_message(new_order_accepted_message_sent, 32)
  :: pattern == 2 -> fill_new_order_accepted_message(new_order_accepted_message_sent, 255)
  :: else -> ramp_new_order_accepted_message(new_order_accepted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_accepted_message(new_order_accepted_message_sent);
    assert(at == 99);
    at = 0;
    decode_new_order_accepted_message(new_order_accepted_message_got);
    assert(at == 99);
    equal_new_order_accepted_message(new_order_accepted_message_got, new_order_accepted_message_sent)
  }
}

/* Existing Order Executed Message: encoded, read back, and compared */
proctype check_existing_order_executed_message() {
  ExistingOrderExecutedMessage existing_order_executed_message_sent;
  ExistingOrderExecutedMessage existing_order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_existing_order_executed_message(existing_order_executed_message_sent, 0)
  :: pattern == 1 -> fill_existing_order_executed_message(existing_order_executed_message_sent, 32)
  :: pattern == 2 -> fill_existing_order_executed_message(existing_order_executed_message_sent, 255)
  :: else -> ramp_existing_order_executed_message(existing_order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_existing_order_executed_message(existing_order_executed_message_sent);
    assert(at == 99);
    at = 0;
    decode_existing_order_executed_message(existing_order_executed_message_got);
    assert(at == 99);
    equal_existing_order_executed_message(existing_order_executed_message_got, existing_order_executed_message_sent)
  }
}

/* Existing Order Canceled Message: encoded, read back, and compared */
proctype check_existing_order_canceled_message() {
  ExistingOrderCanceledMessage existing_order_canceled_message_sent;
  ExistingOrderCanceledMessage existing_order_canceled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_existing_order_canceled_message(existing_order_canceled_message_sent, 0)
  :: pattern == 1 -> fill_existing_order_canceled_message(existing_order_canceled_message_sent, 32)
  :: pattern == 2 -> fill_existing_order_canceled_message(existing_order_canceled_message_sent, 255)
  :: else -> ramp_existing_order_canceled_message(existing_order_canceled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_existing_order_canceled_message(existing_order_canceled_message_sent);
    assert(at == 99);
    at = 0;
    decode_existing_order_canceled_message(existing_order_canceled_message_got);
    assert(at == 99);
    equal_existing_order_canceled_message(existing_order_canceled_message_got, existing_order_canceled_message_sent)
  }
}

/* Previous Execution Broken Message: encoded, read back, and compared */
proctype check_previous_execution_broken_message() {
  PreviousExecutionBrokenMessage previous_execution_broken_message_sent;
  PreviousExecutionBrokenMessage previous_execution_broken_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_previous_execution_broken_message(previous_execution_broken_message_sent, 0)
  :: pattern == 1 -> fill_previous_execution_broken_message(previous_execution_broken_message_sent, 32)
  :: pattern == 2 -> fill_previous_execution_broken_message(previous_execution_broken_message_sent, 255)
  :: else -> ramp_previous_execution_broken_message(previous_execution_broken_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_previous_execution_broken_message(previous_execution_broken_message_sent);
    assert(at == 99);
    at = 0;
    decode_previous_execution_broken_message(previous_execution_broken_message_got);
    assert(at == 99);
    equal_previous_execution_broken_message(previous_execution_broken_message_got, previous_execution_broken_message_sent)
  }
}

/* Existing Order Replaced Message: encoded, read back, and compared */
proctype check_existing_order_replaced_message() {
  ExistingOrderReplacedMessage existing_order_replaced_message_sent;
  ExistingOrderReplacedMessage existing_order_replaced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_existing_order_replaced_message(existing_order_replaced_message_sent, 0)
  :: pattern == 1 -> fill_existing_order_replaced_message(existing_order_replaced_message_sent, 32)
  :: pattern == 2 -> fill_existing_order_replaced_message(existing_order_replaced_message_sent, 255)
  :: else -> ramp_existing_order_replaced_message(existing_order_replaced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_existing_order_replaced_message(existing_order_replaced_message_sent);
    assert(at == 99);
    at = 0;
    decode_existing_order_replaced_message(existing_order_replaced_message_got);
    assert(at == 99);
    equal_existing_order_replaced_message(existing_order_replaced_message_got, existing_order_replaced_message_sent)
  }
}

/* Existing Order Cancelled Aiq Message: encoded, read back, and compared */
proctype check_existing_order_cancelled_aiq_message() {
  ExistingOrderCancelledAiqMessage existing_order_cancelled_aiq_message_sent;
  ExistingOrderCancelledAiqMessage existing_order_cancelled_aiq_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_sent, 0)
  :: pattern == 1 -> fill_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_sent, 32)
  :: pattern == 2 -> fill_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_sent, 255)
  :: else -> ramp_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_sent);
    assert(at == 99);
    at = 0;
    decode_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_got);
    assert(at == 99);
    equal_existing_order_cancelled_aiq_message(existing_order_cancelled_aiq_message_got, existing_order_cancelled_aiq_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_new_order_accepted_message()
  :: run check_existing_order_executed_message()
  :: run check_existing_order_canceled_message()
  :: run check_previous_execution_broken_message()
  :: run check_existing_order_replaced_message()
  :: run check_existing_order_cancelled_aiq_message()
  fi
}
