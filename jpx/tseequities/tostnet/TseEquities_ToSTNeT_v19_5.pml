/*
 * Japan Exchange Group ToSTNeT
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
 *   - the dispatch that chooses a message by its type
 *   - a run filling what frames it
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 72

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Serial No: 11 bytes --------------------------------------------- */

/* Numbered from 1 on each Multicast Group, with the multicast group number in the first to third byte */
typedef MessageSerialNo {
  byte multicast_group_number[3];
  byte sequence_number[8]
};

int message_serial_no_at;

/* every byte of Message Serial No set to one value */
inline fill_message_serial_no(message_serial_no_record, message_serial_no_value) {
  message_serial_no_at = 0;
  do
  :: message_serial_no_at < 3 -> message_serial_no_record.multicast_group_number[message_serial_no_at] = message_serial_no_value; message_serial_no_at = message_serial_no_at + 1
  :: else -> break
  od;
  message_serial_no_at = 0;
  do
  :: message_serial_no_at < 8 -> message_serial_no_record.sequence_number[message_serial_no_at] = message_serial_no_value; message_serial_no_at = message_serial_no_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Serial No set to where it lies, so a field read out of place says so */
inline ramp_message_serial_no(message_serial_no_record, message_serial_no_base) {
  message_serial_no_at = 0;
  do
  :: message_serial_no_at < 3 -> message_serial_no_record.multicast_group_number[message_serial_no_at] = (message_serial_no_base + 0 + message_serial_no_at + 1) % 256; message_serial_no_at = message_serial_no_at + 1
  :: else -> break
  od;
  message_serial_no_at = 0;
  do
  :: message_serial_no_at < 8 -> message_serial_no_record.sequence_number[message_serial_no_at] = (message_serial_no_base + 3 + message_serial_no_at + 1) % 256; message_serial_no_at = message_serial_no_at + 1
  :: else -> break
  od;
  skip
}

/* Message Serial No to the wire, 11 bytes from where the cursor stands */
inline encode_message_serial_no(message_serial_no_record) {
  message_serial_no_at = 0;
  do
  :: message_serial_no_at < 3 -> wire[at] = message_serial_no_record.multicast_group_number[message_serial_no_at]; at = at + 1; message_serial_no_at = message_serial_no_at + 1
  :: else -> break
  od;
  message_serial_no_at = 0;
  do
  :: message_serial_no_at < 8 -> wire[at] = message_serial_no_record.sequence_number[message_serial_no_at]; at = at + 1; message_serial_no_at = message_serial_no_at + 1
  :: else -> break
  od;
  skip
}

/* Message Serial No off the wire, 11 bytes from where the cursor stands */
inline decode_message_serial_no(message_serial_no_record) {
  message_serial_no_at = 0;
  do
  :: message_serial_no_at < 3 -> message_serial_no_record.multicast_group_number[message_serial_no_at] = wire[at]; at = at + 1; message_serial_no_at = message_serial_no_at + 1
  :: else -> break
  od;
  message_serial_no_at = 0;
  do
  :: message_serial_no_at < 8 -> message_serial_no_record.sequence_number[message_serial_no_at] = wire[at]; at = at + 1; message_serial_no_at = message_serial_no_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Serial No is what was written, byte for byte */
inline equal_message_serial_no(message_serial_no_read, message_serial_no_written) {
  message_serial_no_at = 0;
  do
  :: message_serial_no_at < 3 -> assert(message_serial_no_read.multicast_group_number[message_serial_no_at] == message_serial_no_written.multicast_group_number[message_serial_no_at]); message_serial_no_at = message_serial_no_at + 1
  :: else -> break
  od;
  message_serial_no_at = 0;
  do
  :: message_serial_no_at < 8 -> assert(message_serial_no_read.sequence_number[message_serial_no_at] == message_serial_no_written.sequence_number[message_serial_no_at]); message_serial_no_at = message_serial_no_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Issue Classification: 4 bytes ------------------------------------------- */

/* Set in issue realtime message and issue basic message. In the case of Control, Index and Statistics Message, space is set. */
typedef IssueClassification {
  byte issue_classification_large_classification[2];
  byte issue_classification_medium_classification[2]
};

int issue_classification_at;

/* every byte of Issue Classification set to one value */
inline fill_issue_classification(issue_classification_record, issue_classification_value) {
  issue_classification_at = 0;
  do
  :: issue_classification_at < 2 -> issue_classification_record.issue_classification_large_classification[issue_classification_at] = issue_classification_value; issue_classification_at = issue_classification_at + 1
  :: else -> break
  od;
  issue_classification_at = 0;
  do
  :: issue_classification_at < 2 -> issue_classification_record.issue_classification_medium_classification[issue_classification_at] = issue_classification_value; issue_classification_at = issue_classification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Issue Classification set to where it lies, so a field read out of place says so */
inline ramp_issue_classification(issue_classification_record, issue_classification_base) {
  issue_classification_at = 0;
  do
  :: issue_classification_at < 2 -> issue_classification_record.issue_classification_large_classification[issue_classification_at] = (issue_classification_base + 0 + issue_classification_at + 1) % 256; issue_classification_at = issue_classification_at + 1
  :: else -> break
  od;
  issue_classification_at = 0;
  do
  :: issue_classification_at < 2 -> issue_classification_record.issue_classification_medium_classification[issue_classification_at] = (issue_classification_base + 2 + issue_classification_at + 1) % 256; issue_classification_at = issue_classification_at + 1
  :: else -> break
  od;
  skip
}

/* Issue Classification to the wire, 4 bytes from where the cursor stands */
inline encode_issue_classification(issue_classification_record) {
  issue_classification_at = 0;
  do
  :: issue_classification_at < 2 -> wire[at] = issue_classification_record.issue_classification_large_classification[issue_classification_at]; at = at + 1; issue_classification_at = issue_classification_at + 1
  :: else -> break
  od;
  issue_classification_at = 0;
  do
  :: issue_classification_at < 2 -> wire[at] = issue_classification_record.issue_classification_medium_classification[issue_classification_at]; at = at + 1; issue_classification_at = issue_classification_at + 1
  :: else -> break
  od;
  skip
}

/* Issue Classification off the wire, 4 bytes from where the cursor stands */
inline decode_issue_classification(issue_classification_record) {
  issue_classification_at = 0;
  do
  :: issue_classification_at < 2 -> issue_classification_record.issue_classification_large_classification[issue_classification_at] = wire[at]; at = at + 1; issue_classification_at = issue_classification_at + 1
  :: else -> break
  od;
  issue_classification_at = 0;
  do
  :: issue_classification_at < 2 -> issue_classification_record.issue_classification_medium_classification[issue_classification_at] = wire[at]; at = at + 1; issue_classification_at = issue_classification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Issue Classification is what was written, byte for byte */
inline equal_issue_classification(issue_classification_read, issue_classification_written) {
  issue_classification_at = 0;
  do
  :: issue_classification_at < 2 -> assert(issue_classification_read.issue_classification_large_classification[issue_classification_at] == issue_classification_written.issue_classification_large_classification[issue_classification_at]); issue_classification_at = issue_classification_at + 1
  :: else -> break
  od;
  issue_classification_at = 0;
  do
  :: issue_classification_at < 2 -> assert(issue_classification_read.issue_classification_medium_classification[issue_classification_at] == issue_classification_written.issue_classification_medium_classification[issue_classification_at]); issue_classification_at = issue_classification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Issue Code: 12 bytes ---------------------------------------------- */

/* Issue Code layout a. Stocks, used when Issue Classification Large Classification is 01 Stock-Related. FLEX Issue Code is set with right-align. */
typedef StockIssueCode {
  byte stock_space[7];
  byte stock_proper_name_code[4];
  byte stock_reserved_code
};

int stock_issue_code_at;

/* every byte of Stock Issue Code set to one value */
inline fill_stock_issue_code(stock_issue_code_record, stock_issue_code_value) {
  stock_issue_code_at = 0;
  do
  :: stock_issue_code_at < 7 -> stock_issue_code_record.stock_space[stock_issue_code_at] = stock_issue_code_value; stock_issue_code_at = stock_issue_code_at + 1
  :: else -> break
  od;
  stock_issue_code_at = 0;
  do
  :: stock_issue_code_at < 4 -> stock_issue_code_record.stock_proper_name_code[stock_issue_code_at] = stock_issue_code_value; stock_issue_code_at = stock_issue_code_at + 1
  :: else -> break
  od;
  stock_issue_code_record.stock_reserved_code = stock_issue_code_value;
  skip
}

/* each byte of Stock Issue Code set to where it lies, so a field read out of place says so */
inline ramp_stock_issue_code(stock_issue_code_record, stock_issue_code_base) {
  stock_issue_code_at = 0;
  do
  :: stock_issue_code_at < 7 -> stock_issue_code_record.stock_space[stock_issue_code_at] = (stock_issue_code_base + 0 + stock_issue_code_at + 1) % 256; stock_issue_code_at = stock_issue_code_at + 1
  :: else -> break
  od;
  stock_issue_code_at = 0;
  do
  :: stock_issue_code_at < 4 -> stock_issue_code_record.stock_proper_name_code[stock_issue_code_at] = (stock_issue_code_base + 7 + stock_issue_code_at + 1) % 256; stock_issue_code_at = stock_issue_code_at + 1
  :: else -> break
  od;
  stock_issue_code_record.stock_reserved_code = (stock_issue_code_base + 11 + 1) % 256;
  skip
}

/* Stock Issue Code to the wire, 12 bytes from where the cursor stands */
inline encode_stock_issue_code(stock_issue_code_record) {
  stock_issue_code_at = 0;
  do
  :: stock_issue_code_at < 7 -> wire[at] = stock_issue_code_record.stock_space[stock_issue_code_at]; at = at + 1; stock_issue_code_at = stock_issue_code_at + 1
  :: else -> break
  od;
  stock_issue_code_at = 0;
  do
  :: stock_issue_code_at < 4 -> wire[at] = stock_issue_code_record.stock_proper_name_code[stock_issue_code_at]; at = at + 1; stock_issue_code_at = stock_issue_code_at + 1
  :: else -> break
  od;
  wire[at] = stock_issue_code_record.stock_reserved_code; at = at + 1;
  skip
}

/* Stock Issue Code off the wire, 12 bytes from where the cursor stands */
inline decode_stock_issue_code(stock_issue_code_record) {
  stock_issue_code_at = 0;
  do
  :: stock_issue_code_at < 7 -> stock_issue_code_record.stock_space[stock_issue_code_at] = wire[at]; at = at + 1; stock_issue_code_at = stock_issue_code_at + 1
  :: else -> break
  od;
  stock_issue_code_at = 0;
  do
  :: stock_issue_code_at < 4 -> stock_issue_code_record.stock_proper_name_code[stock_issue_code_at] = wire[at]; at = at + 1; stock_issue_code_at = stock_issue_code_at + 1
  :: else -> break
  od;
  stock_issue_code_record.stock_reserved_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Issue Code is what was written, byte for byte */
inline equal_stock_issue_code(stock_issue_code_read, stock_issue_code_written) {
  stock_issue_code_at = 0;
  do
  :: stock_issue_code_at < 7 -> assert(stock_issue_code_read.stock_space[stock_issue_code_at] == stock_issue_code_written.stock_space[stock_issue_code_at]); stock_issue_code_at = stock_issue_code_at + 1
  :: else -> break
  od;
  stock_issue_code_at = 0;
  do
  :: stock_issue_code_at < 4 -> assert(stock_issue_code_read.stock_proper_name_code[stock_issue_code_at] == stock_issue_code_written.stock_proper_name_code[stock_issue_code_at]); stock_issue_code_at = stock_issue_code_at + 1
  :: else -> break
  od;
  assert(stock_issue_code_read.stock_reserved_code == stock_issue_code_written.stock_reserved_code);
  skip
}

/* ---- CB Issue Code: 12 bytes ------------------------------------------------- */

/* Issue Code layout used when Issue Classification Large Classification is 02 CB-Related. The figure carries no label of its own in 5.3.3 (7). FLEX Issue Code is set with right-align. */
typedef CBIssueCode {
  byte c_b_space[3];
  byte c_b_reserved_code;
  byte time_symbol[4];
  byte c_b_proper_name_code[4]
};

int c_b_issue_code_at;

/* every byte of CB Issue Code set to one value */
inline fill_c_b_issue_code(c_b_issue_code_record, c_b_issue_code_value) {
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 3 -> c_b_issue_code_record.c_b_space[c_b_issue_code_at] = c_b_issue_code_value; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  c_b_issue_code_record.c_b_reserved_code = c_b_issue_code_value;
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 4 -> c_b_issue_code_record.time_symbol[c_b_issue_code_at] = c_b_issue_code_value; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 4 -> c_b_issue_code_record.c_b_proper_name_code[c_b_issue_code_at] = c_b_issue_code_value; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of CB Issue Code set to where it lies, so a field read out of place says so */
inline ramp_c_b_issue_code(c_b_issue_code_record, c_b_issue_code_base) {
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 3 -> c_b_issue_code_record.c_b_space[c_b_issue_code_at] = (c_b_issue_code_base + 0 + c_b_issue_code_at + 1) % 256; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  c_b_issue_code_record.c_b_reserved_code = (c_b_issue_code_base + 3 + 1) % 256;
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 4 -> c_b_issue_code_record.time_symbol[c_b_issue_code_at] = (c_b_issue_code_base + 4 + c_b_issue_code_at + 1) % 256; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 4 -> c_b_issue_code_record.c_b_proper_name_code[c_b_issue_code_at] = (c_b_issue_code_base + 8 + c_b_issue_code_at + 1) % 256; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  skip
}

/* CB Issue Code to the wire, 12 bytes from where the cursor stands */
inline encode_c_b_issue_code(c_b_issue_code_record) {
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 3 -> wire[at] = c_b_issue_code_record.c_b_space[c_b_issue_code_at]; at = at + 1; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  wire[at] = c_b_issue_code_record.c_b_reserved_code; at = at + 1;
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 4 -> wire[at] = c_b_issue_code_record.time_symbol[c_b_issue_code_at]; at = at + 1; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 4 -> wire[at] = c_b_issue_code_record.c_b_proper_name_code[c_b_issue_code_at]; at = at + 1; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  skip
}

/* CB Issue Code off the wire, 12 bytes from where the cursor stands */
inline decode_c_b_issue_code(c_b_issue_code_record) {
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 3 -> c_b_issue_code_record.c_b_space[c_b_issue_code_at] = wire[at]; at = at + 1; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  c_b_issue_code_record.c_b_reserved_code = wire[at]; at = at + 1;
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 4 -> c_b_issue_code_record.time_symbol[c_b_issue_code_at] = wire[at]; at = at + 1; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 4 -> c_b_issue_code_record.c_b_proper_name_code[c_b_issue_code_at] = wire[at]; at = at + 1; c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of CB Issue Code is what was written, byte for byte */
inline equal_c_b_issue_code(c_b_issue_code_read, c_b_issue_code_written) {
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 3 -> assert(c_b_issue_code_read.c_b_space[c_b_issue_code_at] == c_b_issue_code_written.c_b_space[c_b_issue_code_at]); c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  assert(c_b_issue_code_read.c_b_reserved_code == c_b_issue_code_written.c_b_reserved_code);
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 4 -> assert(c_b_issue_code_read.time_symbol[c_b_issue_code_at] == c_b_issue_code_written.time_symbol[c_b_issue_code_at]); c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  c_b_issue_code_at = 0;
  do
  :: c_b_issue_code_at < 4 -> assert(c_b_issue_code_read.c_b_proper_name_code[c_b_issue_code_at] == c_b_issue_code_written.c_b_proper_name_code[c_b_issue_code_at]); c_b_issue_code_at = c_b_issue_code_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Halt: 8 bytes --------------------------------------------------- */

/* Trading Halt */
typedef TradingHalt {
  byte state_flag[2];
  byte time_c_6[6]
};

int trading_halt_at;

/* every byte of Trading Halt set to one value */
inline fill_trading_halt(trading_halt_record, trading_halt_value) {
  trading_halt_at = 0;
  do
  :: trading_halt_at < 2 -> trading_halt_record.state_flag[trading_halt_at] = trading_halt_value; trading_halt_at = trading_halt_at + 1
  :: else -> break
  od;
  trading_halt_at = 0;
  do
  :: trading_halt_at < 6 -> trading_halt_record.time_c_6[trading_halt_at] = trading_halt_value; trading_halt_at = trading_halt_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Halt set to where it lies, so a field read out of place says so */
inline ramp_trading_halt(trading_halt_record, trading_halt_base) {
  trading_halt_at = 0;
  do
  :: trading_halt_at < 2 -> trading_halt_record.state_flag[trading_halt_at] = (trading_halt_base + 0 + trading_halt_at + 1) % 256; trading_halt_at = trading_halt_at + 1
  :: else -> break
  od;
  trading_halt_at = 0;
  do
  :: trading_halt_at < 6 -> trading_halt_record.time_c_6[trading_halt_at] = (trading_halt_base + 2 + trading_halt_at + 1) % 256; trading_halt_at = trading_halt_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Halt to the wire, 8 bytes from where the cursor stands */
inline encode_trading_halt(trading_halt_record) {
  trading_halt_at = 0;
  do
  :: trading_halt_at < 2 -> wire[at] = trading_halt_record.state_flag[trading_halt_at]; at = at + 1; trading_halt_at = trading_halt_at + 1
  :: else -> break
  od;
  trading_halt_at = 0;
  do
  :: trading_halt_at < 6 -> wire[at] = trading_halt_record.time_c_6[trading_halt_at]; at = at + 1; trading_halt_at = trading_halt_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Halt off the wire, 8 bytes from where the cursor stands */
inline decode_trading_halt(trading_halt_record) {
  trading_halt_at = 0;
  do
  :: trading_halt_at < 2 -> trading_halt_record.state_flag[trading_halt_at] = wire[at]; at = at + 1; trading_halt_at = trading_halt_at + 1
  :: else -> break
  od;
  trading_halt_at = 0;
  do
  :: trading_halt_at < 6 -> trading_halt_record.time_c_6[trading_halt_at] = wire[at]; at = at + 1; trading_halt_at = trading_halt_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Halt is what was written, byte for byte */
inline equal_trading_halt(trading_halt_read, trading_halt_written) {
  trading_halt_at = 0;
  do
  :: trading_halt_at < 2 -> assert(trading_halt_read.state_flag[trading_halt_at] == trading_halt_written.state_flag[trading_halt_at]); trading_halt_at = trading_halt_at + 1
  :: else -> break
  od;
  trading_halt_at = 0;
  do
  :: trading_halt_at < 6 -> assert(trading_halt_read.time_c_6[trading_halt_at] == trading_halt_written.time_c_6[trading_halt_at]); trading_halt_at = trading_halt_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price: 30 bytes --------------------------------------------------------- */

/* Price */
typedef Price {
  byte price_code[2];
  byte lot_size_unit_flag;
  byte price_c_14[14];
  byte sign;
  byte time_c_12[12]
};

int price_at;

/* every byte of Price set to one value */
inline fill_price(price_record, price_value) {
  price_at = 0;
  do
  :: price_at < 2 -> price_record.price_code[price_at] = price_value; price_at = price_at + 1
  :: else -> break
  od;
  price_record.lot_size_unit_flag = price_value;
  price_at = 0;
  do
  :: price_at < 14 -> price_record.price_c_14[price_at] = price_value; price_at = price_at + 1
  :: else -> break
  od;
  price_record.sign = price_value;
  price_at = 0;
  do
  :: price_at < 12 -> price_record.time_c_12[price_at] = price_value; price_at = price_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price set to where it lies, so a field read out of place says so */
inline ramp_price(price_record, price_base) {
  price_at = 0;
  do
  :: price_at < 2 -> price_record.price_code[price_at] = (price_base + 0 + price_at + 1) % 256; price_at = price_at + 1
  :: else -> break
  od;
  price_record.lot_size_unit_flag = (price_base + 2 + 1) % 256;
  price_at = 0;
  do
  :: price_at < 14 -> price_record.price_c_14[price_at] = (price_base + 3 + price_at + 1) % 256; price_at = price_at + 1
  :: else -> break
  od;
  price_record.sign = (price_base + 17 + 1) % 256;
  price_at = 0;
  do
  :: price_at < 12 -> price_record.time_c_12[price_at] = (price_base + 18 + price_at + 1) % 256; price_at = price_at + 1
  :: else -> break
  od;
  skip
}

/* Price to the wire, 30 bytes from where the cursor stands */
inline encode_price(price_record) {
  price_at = 0;
  do
  :: price_at < 2 -> wire[at] = price_record.price_code[price_at]; at = at + 1; price_at = price_at + 1
  :: else -> break
  od;
  wire[at] = price_record.lot_size_unit_flag; at = at + 1;
  price_at = 0;
  do
  :: price_at < 14 -> wire[at] = price_record.price_c_14[price_at]; at = at + 1; price_at = price_at + 1
  :: else -> break
  od;
  wire[at] = price_record.sign; at = at + 1;
  price_at = 0;
  do
  :: price_at < 12 -> wire[at] = price_record.time_c_12[price_at]; at = at + 1; price_at = price_at + 1
  :: else -> break
  od;
  skip
}

/* Price off the wire, 30 bytes from where the cursor stands */
inline decode_price(price_record) {
  price_at = 0;
  do
  :: price_at < 2 -> price_record.price_code[price_at] = wire[at]; at = at + 1; price_at = price_at + 1
  :: else -> break
  od;
  price_record.lot_size_unit_flag = wire[at]; at = at + 1;
  price_at = 0;
  do
  :: price_at < 14 -> price_record.price_c_14[price_at] = wire[at]; at = at + 1; price_at = price_at + 1
  :: else -> break
  od;
  price_record.sign = wire[at]; at = at + 1;
  price_at = 0;
  do
  :: price_at < 12 -> price_record.time_c_12[price_at] = wire[at]; at = at + 1; price_at = price_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price is what was written, byte for byte */
inline equal_price(price_read, price_written) {
  price_at = 0;
  do
  :: price_at < 2 -> assert(price_read.price_code[price_at] == price_written.price_code[price_at]); price_at = price_at + 1
  :: else -> break
  od;
  assert(price_read.lot_size_unit_flag == price_written.lot_size_unit_flag);
  price_at = 0;
  do
  :: price_at < 14 -> assert(price_read.price_c_14[price_at] == price_written.price_c_14[price_at]); price_at = price_at + 1
  :: else -> break
  od;
  assert(price_read.sign == price_written.sign);
  price_at = 0;
  do
  :: price_at < 12 -> assert(price_read.time_c_12[price_at] == price_written.time_c_12[price_at]); price_at = price_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Volume: 15 bytes ------------------------------------------------ */

/* Trading Volume */
typedef TradingVolume {
  byte trading_volume_turnover_unit_flag;
  byte trading_volume_c_14[14]
};

int trading_volume_at;

/* every byte of Trading Volume set to one value */
inline fill_trading_volume(trading_volume_record, trading_volume_value) {
  trading_volume_record.trading_volume_turnover_unit_flag = trading_volume_value;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.trading_volume_c_14[trading_volume_at] = trading_volume_value; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Volume set to where it lies, so a field read out of place says so */
inline ramp_trading_volume(trading_volume_record, trading_volume_base) {
  trading_volume_record.trading_volume_turnover_unit_flag = (trading_volume_base + 0 + 1) % 256;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.trading_volume_c_14[trading_volume_at] = (trading_volume_base + 1 + trading_volume_at + 1) % 256; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Volume to the wire, 15 bytes from where the cursor stands */
inline encode_trading_volume(trading_volume_record) {
  wire[at] = trading_volume_record.trading_volume_turnover_unit_flag; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> wire[at] = trading_volume_record.trading_volume_c_14[trading_volume_at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Volume off the wire, 15 bytes from where the cursor stands */
inline decode_trading_volume(trading_volume_record) {
  trading_volume_record.trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.trading_volume_c_14[trading_volume_at] = wire[at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Volume is what was written, byte for byte */
inline equal_trading_volume(trading_volume_read, trading_volume_written) {
  assert(trading_volume_read.trading_volume_turnover_unit_flag == trading_volume_written.trading_volume_turnover_unit_flag);
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> assert(trading_volume_read.trading_volume_c_14[trading_volume_at] == trading_volume_written.trading_volume_c_14[trading_volume_at]); trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Turnover: 15 bytes ------------------------------------------------------ */

/* Turnover */
typedef Turnover {
  byte trading_volume_turnover_unit_flag;
  byte turnover_c_14[14]
};

int turnover_at;

/* every byte of Turnover set to one value */
inline fill_turnover(turnover_record, turnover_value) {
  turnover_record.trading_volume_turnover_unit_flag = turnover_value;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.turnover_c_14[turnover_at] = turnover_value; turnover_at = turnover_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Turnover set to where it lies, so a field read out of place says so */
inline ramp_turnover(turnover_record, turnover_base) {
  turnover_record.trading_volume_turnover_unit_flag = (turnover_base + 0 + 1) % 256;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.turnover_c_14[turnover_at] = (turnover_base + 1 + turnover_at + 1) % 256; turnover_at = turnover_at + 1
  :: else -> break
  od;
  skip
}

/* Turnover to the wire, 15 bytes from where the cursor stands */
inline encode_turnover(turnover_record) {
  wire[at] = turnover_record.trading_volume_turnover_unit_flag; at = at + 1;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> wire[at] = turnover_record.turnover_c_14[turnover_at]; at = at + 1; turnover_at = turnover_at + 1
  :: else -> break
  od;
  skip
}

/* Turnover off the wire, 15 bytes from where the cursor stands */
inline decode_turnover(turnover_record) {
  turnover_record.trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.turnover_c_14[turnover_at] = wire[at]; at = at + 1; turnover_at = turnover_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Turnover is what was written, byte for byte */
inline equal_turnover(turnover_read, turnover_written) {
  assert(turnover_read.trading_volume_turnover_unit_flag == turnover_written.trading_volume_turnover_unit_flag);
  turnover_at = 0;
  do
  :: turnover_at < 14 -> assert(turnover_read.turnover_c_14[turnover_at] == turnover_written.turnover_c_14[turnover_at]); turnover_at = turnover_at + 1
  :: else -> break
  od;
  skip
}

/* ---- ToSTNeT By-Issue Information Message: 72 bytes -------------------------- */

/* In this tag, information concerning trade and trading halt for an issue (single-issue transaction, basket transaction, or closing price transaction) on the ToSTNeT is set. This data appears as part of realtime data. */
typedef ToSTNeTBy_IssueInformationMessage {
  byte reserved_2[2];
  byte market_identification_flag;
  TradingHalt trading_halt;
  byte transaction_identification_flag;
  Price price;
  TradingVolume trading_volume;
  Turnover turnover
};

int to_s_t_ne_t_by_issue_information_message_at;

/* every byte of ToSTNeT By-Issue Information Message set to one value */
inline fill_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_record, to_s_t_ne_t_by_issue_information_message_value) {
  to_s_t_ne_t_by_issue_information_message_at = 0;
  do
  :: to_s_t_ne_t_by_issue_information_message_at < 2 -> to_s_t_ne_t_by_issue_information_message_record.reserved_2[to_s_t_ne_t_by_issue_information_message_at] = to_s_t_ne_t_by_issue_information_message_value; to_s_t_ne_t_by_issue_information_message_at = to_s_t_ne_t_by_issue_information_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_by_issue_information_message_record.market_identification_flag = to_s_t_ne_t_by_issue_information_message_value;
  fill_trading_halt(to_s_t_ne_t_by_issue_information_message_record.trading_halt, to_s_t_ne_t_by_issue_information_message_value);
  to_s_t_ne_t_by_issue_information_message_record.transaction_identification_flag = to_s_t_ne_t_by_issue_information_message_value;
  fill_price(to_s_t_ne_t_by_issue_information_message_record.price, to_s_t_ne_t_by_issue_information_message_value);
  fill_trading_volume(to_s_t_ne_t_by_issue_information_message_record.trading_volume, to_s_t_ne_t_by_issue_information_message_value);
  fill_turnover(to_s_t_ne_t_by_issue_information_message_record.turnover, to_s_t_ne_t_by_issue_information_message_value);
  skip
}

/* each byte of ToSTNeT By-Issue Information Message set to where it lies, so a field read out of place says so */
inline ramp_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_record, to_s_t_ne_t_by_issue_information_message_base) {
  to_s_t_ne_t_by_issue_information_message_at = 0;
  do
  :: to_s_t_ne_t_by_issue_information_message_at < 2 -> to_s_t_ne_t_by_issue_information_message_record.reserved_2[to_s_t_ne_t_by_issue_information_message_at] = (to_s_t_ne_t_by_issue_information_message_base + 0 + to_s_t_ne_t_by_issue_information_message_at + 1) % 256; to_s_t_ne_t_by_issue_information_message_at = to_s_t_ne_t_by_issue_information_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_by_issue_information_message_record.market_identification_flag = (to_s_t_ne_t_by_issue_information_message_base + 2 + 1) % 256;
  ramp_trading_halt(to_s_t_ne_t_by_issue_information_message_record.trading_halt, to_s_t_ne_t_by_issue_information_message_base + 3);
  to_s_t_ne_t_by_issue_information_message_record.transaction_identification_flag = (to_s_t_ne_t_by_issue_information_message_base + 11 + 1) % 256;
  ramp_price(to_s_t_ne_t_by_issue_information_message_record.price, to_s_t_ne_t_by_issue_information_message_base + 12);
  ramp_trading_volume(to_s_t_ne_t_by_issue_information_message_record.trading_volume, to_s_t_ne_t_by_issue_information_message_base + 42);
  ramp_turnover(to_s_t_ne_t_by_issue_information_message_record.turnover, to_s_t_ne_t_by_issue_information_message_base + 57);
  skip
}

/* ToSTNeT By-Issue Information Message to the wire, 72 bytes from where the cursor stands */
inline encode_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_record) {
  to_s_t_ne_t_by_issue_information_message_at = 0;
  do
  :: to_s_t_ne_t_by_issue_information_message_at < 2 -> wire[at] = to_s_t_ne_t_by_issue_information_message_record.reserved_2[to_s_t_ne_t_by_issue_information_message_at]; at = at + 1; to_s_t_ne_t_by_issue_information_message_at = to_s_t_ne_t_by_issue_information_message_at + 1
  :: else -> break
  od;
  wire[at] = to_s_t_ne_t_by_issue_information_message_record.market_identification_flag; at = at + 1;
  encode_trading_halt(to_s_t_ne_t_by_issue_information_message_record.trading_halt);
  wire[at] = to_s_t_ne_t_by_issue_information_message_record.transaction_identification_flag; at = at + 1;
  encode_price(to_s_t_ne_t_by_issue_information_message_record.price);
  encode_trading_volume(to_s_t_ne_t_by_issue_information_message_record.trading_volume);
  encode_turnover(to_s_t_ne_t_by_issue_information_message_record.turnover);
  skip
}

/* ToSTNeT By-Issue Information Message off the wire, 72 bytes from where the cursor stands */
inline decode_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_record) {
  to_s_t_ne_t_by_issue_information_message_at = 0;
  do
  :: to_s_t_ne_t_by_issue_information_message_at < 2 -> to_s_t_ne_t_by_issue_information_message_record.reserved_2[to_s_t_ne_t_by_issue_information_message_at] = wire[at]; at = at + 1; to_s_t_ne_t_by_issue_information_message_at = to_s_t_ne_t_by_issue_information_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_by_issue_information_message_record.market_identification_flag = wire[at]; at = at + 1;
  decode_trading_halt(to_s_t_ne_t_by_issue_information_message_record.trading_halt);
  to_s_t_ne_t_by_issue_information_message_record.transaction_identification_flag = wire[at]; at = at + 1;
  decode_price(to_s_t_ne_t_by_issue_information_message_record.price);
  decode_trading_volume(to_s_t_ne_t_by_issue_information_message_record.trading_volume);
  decode_turnover(to_s_t_ne_t_by_issue_information_message_record.turnover);
  skip
}

/* what was read of ToSTNeT By-Issue Information Message is what was written, byte for byte */
inline equal_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_read, to_s_t_ne_t_by_issue_information_message_written) {
  to_s_t_ne_t_by_issue_information_message_at = 0;
  do
  :: to_s_t_ne_t_by_issue_information_message_at < 2 -> assert(to_s_t_ne_t_by_issue_information_message_read.reserved_2[to_s_t_ne_t_by_issue_information_message_at] == to_s_t_ne_t_by_issue_information_message_written.reserved_2[to_s_t_ne_t_by_issue_information_message_at]); to_s_t_ne_t_by_issue_information_message_at = to_s_t_ne_t_by_issue_information_message_at + 1
  :: else -> break
  od;
  assert(to_s_t_ne_t_by_issue_information_message_read.market_identification_flag == to_s_t_ne_t_by_issue_information_message_written.market_identification_flag);
  equal_trading_halt(to_s_t_ne_t_by_issue_information_message_read.trading_halt, to_s_t_ne_t_by_issue_information_message_written.trading_halt);
  assert(to_s_t_ne_t_by_issue_information_message_read.transaction_identification_flag == to_s_t_ne_t_by_issue_information_message_written.transaction_identification_flag);
  equal_price(to_s_t_ne_t_by_issue_information_message_read.price, to_s_t_ne_t_by_issue_information_message_written.price);
  equal_trading_volume(to_s_t_ne_t_by_issue_information_message_read.trading_volume, to_s_t_ne_t_by_issue_information_message_written.trading_volume);
  equal_turnover(to_s_t_ne_t_by_issue_information_message_read.turnover, to_s_t_ne_t_by_issue_information_message_written.turnover);
  skip
}

/* ---- State: 8 bytes ---------------------------------------------------------- */

/* State */
typedef State_ {
  byte market_state_flag[2];
  byte time_c_6[6]
};

int state_at;

/* every byte of State set to one value */
inline fill_state(state_record, state_value) {
  state_at = 0;
  do
  :: state_at < 2 -> state_record.market_state_flag[state_at] = state_value; state_at = state_at + 1
  :: else -> break
  od;
  state_at = 0;
  do
  :: state_at < 6 -> state_record.time_c_6[state_at] = state_value; state_at = state_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of State set to where it lies, so a field read out of place says so */
inline ramp_state(state_record, state_base) {
  state_at = 0;
  do
  :: state_at < 2 -> state_record.market_state_flag[state_at] = (state_base + 0 + state_at + 1) % 256; state_at = state_at + 1
  :: else -> break
  od;
  state_at = 0;
  do
  :: state_at < 6 -> state_record.time_c_6[state_at] = (state_base + 2 + state_at + 1) % 256; state_at = state_at + 1
  :: else -> break
  od;
  skip
}

/* State to the wire, 8 bytes from where the cursor stands */
inline encode_state(state_record) {
  state_at = 0;
  do
  :: state_at < 2 -> wire[at] = state_record.market_state_flag[state_at]; at = at + 1; state_at = state_at + 1
  :: else -> break
  od;
  state_at = 0;
  do
  :: state_at < 6 -> wire[at] = state_record.time_c_6[state_at]; at = at + 1; state_at = state_at + 1
  :: else -> break
  od;
  skip
}

/* State off the wire, 8 bytes from where the cursor stands */
inline decode_state(state_record) {
  state_at = 0;
  do
  :: state_at < 2 -> state_record.market_state_flag[state_at] = wire[at]; at = at + 1; state_at = state_at + 1
  :: else -> break
  od;
  state_at = 0;
  do
  :: state_at < 6 -> state_record.time_c_6[state_at] = wire[at]; at = at + 1; state_at = state_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of State is what was written, byte for byte */
inline equal_state(state_read, state_written) {
  state_at = 0;
  do
  :: state_at < 2 -> assert(state_read.market_state_flag[state_at] == state_written.market_state_flag[state_at]); state_at = state_at + 1
  :: else -> break
  od;
  state_at = 0;
  do
  :: state_at < 6 -> assert(state_read.time_c_6[state_at] == state_written.time_c_6[state_at]); state_at = state_at + 1
  :: else -> break
  od;
  skip
}

/* ---- ToSTNeT Market Information Message: 11 bytes ---------------------------- */

/* In this tag, state information on the ToSTNeT will be set. This data appears as part of realtime data. */
typedef ToSTNeTMarketInformationMessage {
  byte reserved_2[2];
  byte market_identification_flag;
  State_ state
};

int to_s_t_ne_t_market_information_message_at;

/* every byte of ToSTNeT Market Information Message set to one value */
inline fill_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_record, to_s_t_ne_t_market_information_message_value) {
  to_s_t_ne_t_market_information_message_at = 0;
  do
  :: to_s_t_ne_t_market_information_message_at < 2 -> to_s_t_ne_t_market_information_message_record.reserved_2[to_s_t_ne_t_market_information_message_at] = to_s_t_ne_t_market_information_message_value; to_s_t_ne_t_market_information_message_at = to_s_t_ne_t_market_information_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_market_information_message_record.market_identification_flag = to_s_t_ne_t_market_information_message_value;
  fill_state(to_s_t_ne_t_market_information_message_record.state, to_s_t_ne_t_market_information_message_value);
  skip
}

/* each byte of ToSTNeT Market Information Message set to where it lies, so a field read out of place says so */
inline ramp_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_record, to_s_t_ne_t_market_information_message_base) {
  to_s_t_ne_t_market_information_message_at = 0;
  do
  :: to_s_t_ne_t_market_information_message_at < 2 -> to_s_t_ne_t_market_information_message_record.reserved_2[to_s_t_ne_t_market_information_message_at] = (to_s_t_ne_t_market_information_message_base + 0 + to_s_t_ne_t_market_information_message_at + 1) % 256; to_s_t_ne_t_market_information_message_at = to_s_t_ne_t_market_information_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_market_information_message_record.market_identification_flag = (to_s_t_ne_t_market_information_message_base + 2 + 1) % 256;
  ramp_state(to_s_t_ne_t_market_information_message_record.state, to_s_t_ne_t_market_information_message_base + 3);
  skip
}

/* ToSTNeT Market Information Message to the wire, 11 bytes from where the cursor stands */
inline encode_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_record) {
  to_s_t_ne_t_market_information_message_at = 0;
  do
  :: to_s_t_ne_t_market_information_message_at < 2 -> wire[at] = to_s_t_ne_t_market_information_message_record.reserved_2[to_s_t_ne_t_market_information_message_at]; at = at + 1; to_s_t_ne_t_market_information_message_at = to_s_t_ne_t_market_information_message_at + 1
  :: else -> break
  od;
  wire[at] = to_s_t_ne_t_market_information_message_record.market_identification_flag; at = at + 1;
  encode_state(to_s_t_ne_t_market_information_message_record.state);
  skip
}

/* ToSTNeT Market Information Message off the wire, 11 bytes from where the cursor stands */
inline decode_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_record) {
  to_s_t_ne_t_market_information_message_at = 0;
  do
  :: to_s_t_ne_t_market_information_message_at < 2 -> to_s_t_ne_t_market_information_message_record.reserved_2[to_s_t_ne_t_market_information_message_at] = wire[at]; at = at + 1; to_s_t_ne_t_market_information_message_at = to_s_t_ne_t_market_information_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_market_information_message_record.market_identification_flag = wire[at]; at = at + 1;
  decode_state(to_s_t_ne_t_market_information_message_record.state);
  skip
}

/* what was read of ToSTNeT Market Information Message is what was written, byte for byte */
inline equal_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_read, to_s_t_ne_t_market_information_message_written) {
  to_s_t_ne_t_market_information_message_at = 0;
  do
  :: to_s_t_ne_t_market_information_message_at < 2 -> assert(to_s_t_ne_t_market_information_message_read.reserved_2[to_s_t_ne_t_market_information_message_at] == to_s_t_ne_t_market_information_message_written.reserved_2[to_s_t_ne_t_market_information_message_at]); to_s_t_ne_t_market_information_message_at = to_s_t_ne_t_market_information_message_at + 1
  :: else -> break
  od;
  assert(to_s_t_ne_t_market_information_message_read.market_identification_flag == to_s_t_ne_t_market_information_message_written.market_identification_flag);
  equal_state(to_s_t_ne_t_market_information_message_read.state, to_s_t_ne_t_market_information_message_written.state);
  skip
}

/* ---- Control Message: 10 bytes ----------------------------------------------- */

/* In this tag, the test mode flag and the start/end flag that are used in a control message will be set. This tag will be edited into a control message (communication control and health check control) for output. */
typedef ControlMessage {
  byte reserved_2[2];
  byte test_mode_flag;
  byte start_end_flag;
  byte time_c_6[6]
};

int control_message_at;

/* every byte of Control Message set to one value */
inline fill_control_message(control_message_record, control_message_value) {
  control_message_at = 0;
  do
  :: control_message_at < 2 -> control_message_record.reserved_2[control_message_at] = control_message_value; control_message_at = control_message_at + 1
  :: else -> break
  od;
  control_message_record.test_mode_flag = control_message_value;
  control_message_record.start_end_flag = control_message_value;
  control_message_at = 0;
  do
  :: control_message_at < 6 -> control_message_record.time_c_6[control_message_at] = control_message_value; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Control Message set to where it lies, so a field read out of place says so */
inline ramp_control_message(control_message_record, control_message_base) {
  control_message_at = 0;
  do
  :: control_message_at < 2 -> control_message_record.reserved_2[control_message_at] = (control_message_base + 0 + control_message_at + 1) % 256; control_message_at = control_message_at + 1
  :: else -> break
  od;
  control_message_record.test_mode_flag = (control_message_base + 2 + 1) % 256;
  control_message_record.start_end_flag = (control_message_base + 3 + 1) % 256;
  control_message_at = 0;
  do
  :: control_message_at < 6 -> control_message_record.time_c_6[control_message_at] = (control_message_base + 4 + control_message_at + 1) % 256; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* Control Message to the wire, 10 bytes from where the cursor stands */
inline encode_control_message(control_message_record) {
  control_message_at = 0;
  do
  :: control_message_at < 2 -> wire[at] = control_message_record.reserved_2[control_message_at]; at = at + 1; control_message_at = control_message_at + 1
  :: else -> break
  od;
  wire[at] = control_message_record.test_mode_flag; at = at + 1;
  wire[at] = control_message_record.start_end_flag; at = at + 1;
  control_message_at = 0;
  do
  :: control_message_at < 6 -> wire[at] = control_message_record.time_c_6[control_message_at]; at = at + 1; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* Control Message off the wire, 10 bytes from where the cursor stands */
inline decode_control_message(control_message_record) {
  control_message_at = 0;
  do
  :: control_message_at < 2 -> control_message_record.reserved_2[control_message_at] = wire[at]; at = at + 1; control_message_at = control_message_at + 1
  :: else -> break
  od;
  control_message_record.test_mode_flag = wire[at]; at = at + 1;
  control_message_record.start_end_flag = wire[at]; at = at + 1;
  control_message_at = 0;
  do
  :: control_message_at < 6 -> control_message_record.time_c_6[control_message_at] = wire[at]; at = at + 1; control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Control Message is what was written, byte for byte */
inline equal_control_message(control_message_read, control_message_written) {
  control_message_at = 0;
  do
  :: control_message_at < 2 -> assert(control_message_read.reserved_2[control_message_at] == control_message_written.reserved_2[control_message_at]); control_message_at = control_message_at + 1
  :: else -> break
  od;
  assert(control_message_read.test_mode_flag == control_message_written.test_mode_flag);
  assert(control_message_read.start_end_flag == control_message_written.start_end_flag);
  control_message_at = 0;
  do
  :: control_message_at < 6 -> assert(control_message_read.time_c_6[control_message_at] == control_message_written.time_c_6[control_message_at]); control_message_at = control_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Message Serial No: encoded, read back, and compared */
proctype check_message_serial_no() {
  MessageSerialNo message_serial_no_sent;
  MessageSerialNo message_serial_no_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_serial_no(message_serial_no_sent, 0)
  :: pattern == 1 -> fill_message_serial_no(message_serial_no_sent, 32)
  :: pattern == 2 -> fill_message_serial_no(message_serial_no_sent, 255)
  :: else -> ramp_message_serial_no(message_serial_no_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_serial_no(message_serial_no_sent);
    assert(at == 11);
    at = 0;
    decode_message_serial_no(message_serial_no_got);
    assert(at == 11);
    equal_message_serial_no(message_serial_no_got, message_serial_no_sent)
  }
}

/* Issue Classification: encoded, read back, and compared */
proctype check_issue_classification() {
  IssueClassification issue_classification_sent;
  IssueClassification issue_classification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_issue_classification(issue_classification_sent, 0)
  :: pattern == 1 -> fill_issue_classification(issue_classification_sent, 32)
  :: pattern == 2 -> fill_issue_classification(issue_classification_sent, 255)
  :: else -> ramp_issue_classification(issue_classification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_issue_classification(issue_classification_sent);
    assert(at == 4);
    at = 0;
    decode_issue_classification(issue_classification_got);
    assert(at == 4);
    equal_issue_classification(issue_classification_got, issue_classification_sent)
  }
}

/* Stock Issue Code: encoded, read back, and compared */
proctype check_stock_issue_code() {
  StockIssueCode stock_issue_code_sent;
  StockIssueCode stock_issue_code_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_issue_code(stock_issue_code_sent, 0)
  :: pattern == 1 -> fill_stock_issue_code(stock_issue_code_sent, 32)
  :: pattern == 2 -> fill_stock_issue_code(stock_issue_code_sent, 255)
  :: else -> ramp_stock_issue_code(stock_issue_code_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_issue_code(stock_issue_code_sent);
    assert(at == 12);
    at = 0;
    decode_stock_issue_code(stock_issue_code_got);
    assert(at == 12);
    equal_stock_issue_code(stock_issue_code_got, stock_issue_code_sent)
  }
}

/* CB Issue Code: encoded, read back, and compared */
proctype check_c_b_issue_code() {
  CBIssueCode c_b_issue_code_sent;
  CBIssueCode c_b_issue_code_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_c_b_issue_code(c_b_issue_code_sent, 0)
  :: pattern == 1 -> fill_c_b_issue_code(c_b_issue_code_sent, 32)
  :: pattern == 2 -> fill_c_b_issue_code(c_b_issue_code_sent, 255)
  :: else -> ramp_c_b_issue_code(c_b_issue_code_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_c_b_issue_code(c_b_issue_code_sent);
    assert(at == 12);
    at = 0;
    decode_c_b_issue_code(c_b_issue_code_got);
    assert(at == 12);
    equal_c_b_issue_code(c_b_issue_code_got, c_b_issue_code_sent)
  }
}

/* Trading Halt: encoded, read back, and compared */
proctype check_trading_halt() {
  TradingHalt trading_halt_sent;
  TradingHalt trading_halt_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_halt(trading_halt_sent, 0)
  :: pattern == 1 -> fill_trading_halt(trading_halt_sent, 32)
  :: pattern == 2 -> fill_trading_halt(trading_halt_sent, 255)
  :: else -> ramp_trading_halt(trading_halt_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_halt(trading_halt_sent);
    assert(at == 8);
    at = 0;
    decode_trading_halt(trading_halt_got);
    assert(at == 8);
    equal_trading_halt(trading_halt_got, trading_halt_sent)
  }
}

/* Price: encoded, read back, and compared */
proctype check_price() {
  Price price_sent;
  Price price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price(price_sent, 0)
  :: pattern == 1 -> fill_price(price_sent, 32)
  :: pattern == 2 -> fill_price(price_sent, 255)
  :: else -> ramp_price(price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price(price_sent);
    assert(at == 30);
    at = 0;
    decode_price(price_got);
    assert(at == 30);
    equal_price(price_got, price_sent)
  }
}

/* Trading Volume: encoded, read back, and compared */
proctype check_trading_volume() {
  TradingVolume trading_volume_sent;
  TradingVolume trading_volume_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_volume(trading_volume_sent, 0)
  :: pattern == 1 -> fill_trading_volume(trading_volume_sent, 32)
  :: pattern == 2 -> fill_trading_volume(trading_volume_sent, 255)
  :: else -> ramp_trading_volume(trading_volume_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_volume(trading_volume_sent);
    assert(at == 15);
    at = 0;
    decode_trading_volume(trading_volume_got);
    assert(at == 15);
    equal_trading_volume(trading_volume_got, trading_volume_sent)
  }
}

/* Turnover: encoded, read back, and compared */
proctype check_turnover() {
  Turnover turnover_sent;
  Turnover turnover_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_turnover(turnover_sent, 0)
  :: pattern == 1 -> fill_turnover(turnover_sent, 32)
  :: pattern == 2 -> fill_turnover(turnover_sent, 255)
  :: else -> ramp_turnover(turnover_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_turnover(turnover_sent);
    assert(at == 15);
    at = 0;
    decode_turnover(turnover_got);
    assert(at == 15);
    equal_turnover(turnover_got, turnover_sent)
  }
}

/* ToSTNeT By-Issue Information Message: encoded, read back, and compared */
proctype check_to_s_t_ne_t_by_issue_information_message() {
  ToSTNeTBy_IssueInformationMessage to_s_t_ne_t_by_issue_information_message_sent;
  ToSTNeTBy_IssueInformationMessage to_s_t_ne_t_by_issue_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_sent, 0)
  :: pattern == 1 -> fill_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_sent, 32)
  :: pattern == 2 -> fill_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_sent, 255)
  :: else -> ramp_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_sent);
    assert(at == 72);
    at = 0;
    decode_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_got);
    assert(at == 72);
    equal_to_s_t_ne_t_by_issue_information_message(to_s_t_ne_t_by_issue_information_message_got, to_s_t_ne_t_by_issue_information_message_sent)
  }
}

/* State: encoded, read back, and compared */
proctype check_state() {
  State_ state_sent;
  State_ state_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_state(state_sent, 0)
  :: pattern == 1 -> fill_state(state_sent, 32)
  :: pattern == 2 -> fill_state(state_sent, 255)
  :: else -> ramp_state(state_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_state(state_sent);
    assert(at == 8);
    at = 0;
    decode_state(state_got);
    assert(at == 8);
    equal_state(state_got, state_sent)
  }
}

/* ToSTNeT Market Information Message: encoded, read back, and compared */
proctype check_to_s_t_ne_t_market_information_message() {
  ToSTNeTMarketInformationMessage to_s_t_ne_t_market_information_message_sent;
  ToSTNeTMarketInformationMessage to_s_t_ne_t_market_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_sent, 0)
  :: pattern == 1 -> fill_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_sent, 32)
  :: pattern == 2 -> fill_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_sent, 255)
  :: else -> ramp_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_sent);
    assert(at == 11);
    at = 0;
    decode_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_got);
    assert(at == 11);
    equal_to_s_t_ne_t_market_information_message(to_s_t_ne_t_market_information_message_got, to_s_t_ne_t_market_information_message_sent)
  }
}

/* Control Message: encoded, read back, and compared */
proctype check_control_message() {
  ControlMessage control_message_sent;
  ControlMessage control_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_control_message(control_message_sent, 0)
  :: pattern == 1 -> fill_control_message(control_message_sent, 32)
  :: pattern == 2 -> fill_control_message(control_message_sent, 255)
  :: else -> ramp_control_message(control_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_control_message(control_message_sent);
    assert(at == 10);
    at = 0;
    decode_control_message(control_message_got);
    assert(at == 10);
    equal_control_message(control_message_got, control_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_serial_no()
  :: run check_issue_classification()
  :: run check_stock_issue_code()
  :: run check_c_b_issue_code()
  :: run check_trading_halt()
  :: run check_price()
  :: run check_trading_volume()
  :: run check_turnover()
  :: run check_to_s_t_ne_t_by_issue_information_message()
  :: run check_state()
  :: run check_to_s_t_ne_t_market_information_message()
  :: run check_control_message()
  fi
}
