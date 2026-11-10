/*
 * Japan Exchange Group IndexStatistics
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
 *   - a run of a stated number of entries
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 208

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

/* ---- Total Market Value: 15 bytes -------------------------------------------- */

/* Total market value */
typedef TotalMarketValue {
  byte trading_volume_turnover_unit_flag;
  byte total_market_value_c_14[14]
};

int total_market_value_at;

/* every byte of Total Market Value set to one value */
inline fill_total_market_value(total_market_value_record, total_market_value_value) {
  total_market_value_record.trading_volume_turnover_unit_flag = total_market_value_value;
  total_market_value_at = 0;
  do
  :: total_market_value_at < 14 -> total_market_value_record.total_market_value_c_14[total_market_value_at] = total_market_value_value; total_market_value_at = total_market_value_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Total Market Value set to where it lies, so a field read out of place says so */
inline ramp_total_market_value(total_market_value_record, total_market_value_base) {
  total_market_value_record.trading_volume_turnover_unit_flag = (total_market_value_base + 0 + 1) % 256;
  total_market_value_at = 0;
  do
  :: total_market_value_at < 14 -> total_market_value_record.total_market_value_c_14[total_market_value_at] = (total_market_value_base + 1 + total_market_value_at + 1) % 256; total_market_value_at = total_market_value_at + 1
  :: else -> break
  od;
  skip
}

/* Total Market Value to the wire, 15 bytes from where the cursor stands */
inline encode_total_market_value(total_market_value_record) {
  wire[at] = total_market_value_record.trading_volume_turnover_unit_flag; at = at + 1;
  total_market_value_at = 0;
  do
  :: total_market_value_at < 14 -> wire[at] = total_market_value_record.total_market_value_c_14[total_market_value_at]; at = at + 1; total_market_value_at = total_market_value_at + 1
  :: else -> break
  od;
  skip
}

/* Total Market Value off the wire, 15 bytes from where the cursor stands */
inline decode_total_market_value(total_market_value_record) {
  total_market_value_record.trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  total_market_value_at = 0;
  do
  :: total_market_value_at < 14 -> total_market_value_record.total_market_value_c_14[total_market_value_at] = wire[at]; at = at + 1; total_market_value_at = total_market_value_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Total Market Value is what was written, byte for byte */
inline equal_total_market_value(total_market_value_read, total_market_value_written) {
  assert(total_market_value_read.trading_volume_turnover_unit_flag == total_market_value_written.trading_volume_turnover_unit_flag);
  total_market_value_at = 0;
  do
  :: total_market_value_at < 14 -> assert(total_market_value_read.total_market_value_c_14[total_market_value_at] == total_market_value_written.total_market_value_c_14[total_market_value_at]); total_market_value_at = total_market_value_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Value Day On Day Comparison: 16 bytes ---------------------------- */

/* Market value Day-on-day comparison */
typedef MarketValueDayOnDayComparison {
  byte trading_volume_turnover_unit_flag;
  byte day_on_day_comparison_c_14[14];
  byte sign
};

int market_value_day_on_day_comparison_at;

/* every byte of Market Value Day On Day Comparison set to one value */
inline fill_market_value_day_on_day_comparison(market_value_day_on_day_comparison_record, market_value_day_on_day_comparison_value) {
  market_value_day_on_day_comparison_record.trading_volume_turnover_unit_flag = market_value_day_on_day_comparison_value;
  market_value_day_on_day_comparison_at = 0;
  do
  :: market_value_day_on_day_comparison_at < 14 -> market_value_day_on_day_comparison_record.day_on_day_comparison_c_14[market_value_day_on_day_comparison_at] = market_value_day_on_day_comparison_value; market_value_day_on_day_comparison_at = market_value_day_on_day_comparison_at + 1
  :: else -> break
  od;
  market_value_day_on_day_comparison_record.sign = market_value_day_on_day_comparison_value;
  skip
}

/* each byte of Market Value Day On Day Comparison set to where it lies, so a field read out of place says so */
inline ramp_market_value_day_on_day_comparison(market_value_day_on_day_comparison_record, market_value_day_on_day_comparison_base) {
  market_value_day_on_day_comparison_record.trading_volume_turnover_unit_flag = (market_value_day_on_day_comparison_base + 0 + 1) % 256;
  market_value_day_on_day_comparison_at = 0;
  do
  :: market_value_day_on_day_comparison_at < 14 -> market_value_day_on_day_comparison_record.day_on_day_comparison_c_14[market_value_day_on_day_comparison_at] = (market_value_day_on_day_comparison_base + 1 + market_value_day_on_day_comparison_at + 1) % 256; market_value_day_on_day_comparison_at = market_value_day_on_day_comparison_at + 1
  :: else -> break
  od;
  market_value_day_on_day_comparison_record.sign = (market_value_day_on_day_comparison_base + 15 + 1) % 256;
  skip
}

/* Market Value Day On Day Comparison to the wire, 16 bytes from where the cursor stands */
inline encode_market_value_day_on_day_comparison(market_value_day_on_day_comparison_record) {
  wire[at] = market_value_day_on_day_comparison_record.trading_volume_turnover_unit_flag; at = at + 1;
  market_value_day_on_day_comparison_at = 0;
  do
  :: market_value_day_on_day_comparison_at < 14 -> wire[at] = market_value_day_on_day_comparison_record.day_on_day_comparison_c_14[market_value_day_on_day_comparison_at]; at = at + 1; market_value_day_on_day_comparison_at = market_value_day_on_day_comparison_at + 1
  :: else -> break
  od;
  wire[at] = market_value_day_on_day_comparison_record.sign; at = at + 1;
  skip
}

/* Market Value Day On Day Comparison off the wire, 16 bytes from where the cursor stands */
inline decode_market_value_day_on_day_comparison(market_value_day_on_day_comparison_record) {
  market_value_day_on_day_comparison_record.trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  market_value_day_on_day_comparison_at = 0;
  do
  :: market_value_day_on_day_comparison_at < 14 -> market_value_day_on_day_comparison_record.day_on_day_comparison_c_14[market_value_day_on_day_comparison_at] = wire[at]; at = at + 1; market_value_day_on_day_comparison_at = market_value_day_on_day_comparison_at + 1
  :: else -> break
  od;
  market_value_day_on_day_comparison_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Value Day On Day Comparison is what was written, byte for byte */
inline equal_market_value_day_on_day_comparison(market_value_day_on_day_comparison_read, market_value_day_on_day_comparison_written) {
  assert(market_value_day_on_day_comparison_read.trading_volume_turnover_unit_flag == market_value_day_on_day_comparison_written.trading_volume_turnover_unit_flag);
  market_value_day_on_day_comparison_at = 0;
  do
  :: market_value_day_on_day_comparison_at < 14 -> assert(market_value_day_on_day_comparison_read.day_on_day_comparison_c_14[market_value_day_on_day_comparison_at] == market_value_day_on_day_comparison_written.day_on_day_comparison_c_14[market_value_day_on_day_comparison_at]); market_value_day_on_day_comparison_at = market_value_day_on_day_comparison_at + 1
  :: else -> break
  od;
  assert(market_value_day_on_day_comparison_read.sign == market_value_day_on_day_comparison_written.sign);
  skip
}

/* ---- Market Value Message: 43 bytes ------------------------------------------ */

/* In this tag, total market value information for each market (issue classification) will be set. This data appears as part of a statistics message. */
typedef MarketValueMessage {
  byte reserved_2[2];
  byte time_c_6_hhmm[6];
  byte issue_classification_code[4];
  TotalMarketValue total_market_value;
  MarketValueDayOnDayComparison market_value_day_on_day_comparison
};

int market_value_message_at;

/* every byte of Market Value Message set to one value */
inline fill_market_value_message(market_value_message_record, market_value_message_value) {
  market_value_message_at = 0;
  do
  :: market_value_message_at < 2 -> market_value_message_record.reserved_2[market_value_message_at] = market_value_message_value; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  market_value_message_at = 0;
  do
  :: market_value_message_at < 6 -> market_value_message_record.time_c_6_hhmm[market_value_message_at] = market_value_message_value; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  market_value_message_at = 0;
  do
  :: market_value_message_at < 4 -> market_value_message_record.issue_classification_code[market_value_message_at] = market_value_message_value; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  fill_total_market_value(market_value_message_record.total_market_value, market_value_message_value);
  fill_market_value_day_on_day_comparison(market_value_message_record.market_value_day_on_day_comparison, market_value_message_value);
  skip
}

/* each byte of Market Value Message set to where it lies, so a field read out of place says so */
inline ramp_market_value_message(market_value_message_record, market_value_message_base) {
  market_value_message_at = 0;
  do
  :: market_value_message_at < 2 -> market_value_message_record.reserved_2[market_value_message_at] = (market_value_message_base + 0 + market_value_message_at + 1) % 256; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  market_value_message_at = 0;
  do
  :: market_value_message_at < 6 -> market_value_message_record.time_c_6_hhmm[market_value_message_at] = (market_value_message_base + 2 + market_value_message_at + 1) % 256; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  market_value_message_at = 0;
  do
  :: market_value_message_at < 4 -> market_value_message_record.issue_classification_code[market_value_message_at] = (market_value_message_base + 8 + market_value_message_at + 1) % 256; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  ramp_total_market_value(market_value_message_record.total_market_value, market_value_message_base + 12);
  ramp_market_value_day_on_day_comparison(market_value_message_record.market_value_day_on_day_comparison, market_value_message_base + 27);
  skip
}

/* Market Value Message to the wire, 43 bytes from where the cursor stands */
inline encode_market_value_message(market_value_message_record) {
  market_value_message_at = 0;
  do
  :: market_value_message_at < 2 -> wire[at] = market_value_message_record.reserved_2[market_value_message_at]; at = at + 1; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  market_value_message_at = 0;
  do
  :: market_value_message_at < 6 -> wire[at] = market_value_message_record.time_c_6_hhmm[market_value_message_at]; at = at + 1; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  market_value_message_at = 0;
  do
  :: market_value_message_at < 4 -> wire[at] = market_value_message_record.issue_classification_code[market_value_message_at]; at = at + 1; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  encode_total_market_value(market_value_message_record.total_market_value);
  encode_market_value_day_on_day_comparison(market_value_message_record.market_value_day_on_day_comparison);
  skip
}

/* Market Value Message off the wire, 43 bytes from where the cursor stands */
inline decode_market_value_message(market_value_message_record) {
  market_value_message_at = 0;
  do
  :: market_value_message_at < 2 -> market_value_message_record.reserved_2[market_value_message_at] = wire[at]; at = at + 1; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  market_value_message_at = 0;
  do
  :: market_value_message_at < 6 -> market_value_message_record.time_c_6_hhmm[market_value_message_at] = wire[at]; at = at + 1; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  market_value_message_at = 0;
  do
  :: market_value_message_at < 4 -> market_value_message_record.issue_classification_code[market_value_message_at] = wire[at]; at = at + 1; market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  decode_total_market_value(market_value_message_record.total_market_value);
  decode_market_value_day_on_day_comparison(market_value_message_record.market_value_day_on_day_comparison);
  skip
}

/* what was read of Market Value Message is what was written, byte for byte */
inline equal_market_value_message(market_value_message_read, market_value_message_written) {
  market_value_message_at = 0;
  do
  :: market_value_message_at < 2 -> assert(market_value_message_read.reserved_2[market_value_message_at] == market_value_message_written.reserved_2[market_value_message_at]); market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  market_value_message_at = 0;
  do
  :: market_value_message_at < 6 -> assert(market_value_message_read.time_c_6_hhmm[market_value_message_at] == market_value_message_written.time_c_6_hhmm[market_value_message_at]); market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  market_value_message_at = 0;
  do
  :: market_value_message_at < 4 -> assert(market_value_message_read.issue_classification_code[market_value_message_at] == market_value_message_written.issue_classification_code[market_value_message_at]); market_value_message_at = market_value_message_at + 1
  :: else -> break
  od;
  equal_total_market_value(market_value_message_read.total_market_value, market_value_message_written.total_market_value);
  equal_market_value_day_on_day_comparison(market_value_message_read.market_value_day_on_day_comparison, market_value_message_written.market_value_day_on_day_comparison);
  skip
}

/* ---- Simple Yield: 9 bytes --------------------------------------------------- */

/* Simple yield */
typedef SimpleYield {
  byte simple_yield_c_8[8];
  byte sign
};

int simple_yield_at;

/* every byte of Simple Yield set to one value */
inline fill_simple_yield(simple_yield_record, simple_yield_value) {
  simple_yield_at = 0;
  do
  :: simple_yield_at < 8 -> simple_yield_record.simple_yield_c_8[simple_yield_at] = simple_yield_value; simple_yield_at = simple_yield_at + 1
  :: else -> break
  od;
  simple_yield_record.sign = simple_yield_value;
  skip
}

/* each byte of Simple Yield set to where it lies, so a field read out of place says so */
inline ramp_simple_yield(simple_yield_record, simple_yield_base) {
  simple_yield_at = 0;
  do
  :: simple_yield_at < 8 -> simple_yield_record.simple_yield_c_8[simple_yield_at] = (simple_yield_base + 0 + simple_yield_at + 1) % 256; simple_yield_at = simple_yield_at + 1
  :: else -> break
  od;
  simple_yield_record.sign = (simple_yield_base + 8 + 1) % 256;
  skip
}

/* Simple Yield to the wire, 9 bytes from where the cursor stands */
inline encode_simple_yield(simple_yield_record) {
  simple_yield_at = 0;
  do
  :: simple_yield_at < 8 -> wire[at] = simple_yield_record.simple_yield_c_8[simple_yield_at]; at = at + 1; simple_yield_at = simple_yield_at + 1
  :: else -> break
  od;
  wire[at] = simple_yield_record.sign; at = at + 1;
  skip
}

/* Simple Yield off the wire, 9 bytes from where the cursor stands */
inline decode_simple_yield(simple_yield_record) {
  simple_yield_at = 0;
  do
  :: simple_yield_at < 8 -> simple_yield_record.simple_yield_c_8[simple_yield_at] = wire[at]; at = at + 1; simple_yield_at = simple_yield_at + 1
  :: else -> break
  od;
  simple_yield_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Yield is what was written, byte for byte */
inline equal_simple_yield(simple_yield_read, simple_yield_written) {
  simple_yield_at = 0;
  do
  :: simple_yield_at < 8 -> assert(simple_yield_read.simple_yield_c_8[simple_yield_at] == simple_yield_written.simple_yield_c_8[simple_yield_at]); simple_yield_at = simple_yield_at + 1
  :: else -> break
  od;
  assert(simple_yield_read.sign == simple_yield_written.sign);
  skip
}

/* ---- Yield Day On Day Comparison: 9 bytes ------------------------------------ */

/* Yield Day-on-day comparison */
typedef YieldDayOnDayComparison {
  byte day_on_day_comparison_c_8[8];
  byte sign
};

int yield_day_on_day_comparison_at;

/* every byte of Yield Day On Day Comparison set to one value */
inline fill_yield_day_on_day_comparison(yield_day_on_day_comparison_record, yield_day_on_day_comparison_value) {
  yield_day_on_day_comparison_at = 0;
  do
  :: yield_day_on_day_comparison_at < 8 -> yield_day_on_day_comparison_record.day_on_day_comparison_c_8[yield_day_on_day_comparison_at] = yield_day_on_day_comparison_value; yield_day_on_day_comparison_at = yield_day_on_day_comparison_at + 1
  :: else -> break
  od;
  yield_day_on_day_comparison_record.sign = yield_day_on_day_comparison_value;
  skip
}

/* each byte of Yield Day On Day Comparison set to where it lies, so a field read out of place says so */
inline ramp_yield_day_on_day_comparison(yield_day_on_day_comparison_record, yield_day_on_day_comparison_base) {
  yield_day_on_day_comparison_at = 0;
  do
  :: yield_day_on_day_comparison_at < 8 -> yield_day_on_day_comparison_record.day_on_day_comparison_c_8[yield_day_on_day_comparison_at] = (yield_day_on_day_comparison_base + 0 + yield_day_on_day_comparison_at + 1) % 256; yield_day_on_day_comparison_at = yield_day_on_day_comparison_at + 1
  :: else -> break
  od;
  yield_day_on_day_comparison_record.sign = (yield_day_on_day_comparison_base + 8 + 1) % 256;
  skip
}

/* Yield Day On Day Comparison to the wire, 9 bytes from where the cursor stands */
inline encode_yield_day_on_day_comparison(yield_day_on_day_comparison_record) {
  yield_day_on_day_comparison_at = 0;
  do
  :: yield_day_on_day_comparison_at < 8 -> wire[at] = yield_day_on_day_comparison_record.day_on_day_comparison_c_8[yield_day_on_day_comparison_at]; at = at + 1; yield_day_on_day_comparison_at = yield_day_on_day_comparison_at + 1
  :: else -> break
  od;
  wire[at] = yield_day_on_day_comparison_record.sign; at = at + 1;
  skip
}

/* Yield Day On Day Comparison off the wire, 9 bytes from where the cursor stands */
inline decode_yield_day_on_day_comparison(yield_day_on_day_comparison_record) {
  yield_day_on_day_comparison_at = 0;
  do
  :: yield_day_on_day_comparison_at < 8 -> yield_day_on_day_comparison_record.day_on_day_comparison_c_8[yield_day_on_day_comparison_at] = wire[at]; at = at + 1; yield_day_on_day_comparison_at = yield_day_on_day_comparison_at + 1
  :: else -> break
  od;
  yield_day_on_day_comparison_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Yield Day On Day Comparison is what was written, byte for byte */
inline equal_yield_day_on_day_comparison(yield_day_on_day_comparison_read, yield_day_on_day_comparison_written) {
  yield_day_on_day_comparison_at = 0;
  do
  :: yield_day_on_day_comparison_at < 8 -> assert(yield_day_on_day_comparison_read.day_on_day_comparison_c_8[yield_day_on_day_comparison_at] == yield_day_on_day_comparison_written.day_on_day_comparison_c_8[yield_day_on_day_comparison_at]); yield_day_on_day_comparison_at = yield_day_on_day_comparison_at + 1
  :: else -> break
  od;
  assert(yield_day_on_day_comparison_read.sign == yield_day_on_day_comparison_written.sign);
  skip
}

/* ---- Simple Yield Message: 30 bytes ------------------------------------------ */

/* In this tag, simple yield information for each market (issue classification) will be set. This data appears as part of a statistics message. */
typedef SimpleYieldMessage {
  byte reserved_2[2];
  byte time_c_6_hhmm[6];
  byte issue_classification_code[4];
  SimpleYield simple_yield;
  YieldDayOnDayComparison yield_day_on_day_comparison
};

int simple_yield_message_at;

/* every byte of Simple Yield Message set to one value */
inline fill_simple_yield_message(simple_yield_message_record, simple_yield_message_value) {
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 2 -> simple_yield_message_record.reserved_2[simple_yield_message_at] = simple_yield_message_value; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 6 -> simple_yield_message_record.time_c_6_hhmm[simple_yield_message_at] = simple_yield_message_value; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 4 -> simple_yield_message_record.issue_classification_code[simple_yield_message_at] = simple_yield_message_value; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  fill_simple_yield(simple_yield_message_record.simple_yield, simple_yield_message_value);
  fill_yield_day_on_day_comparison(simple_yield_message_record.yield_day_on_day_comparison, simple_yield_message_value);
  skip
}

/* each byte of Simple Yield Message set to where it lies, so a field read out of place says so */
inline ramp_simple_yield_message(simple_yield_message_record, simple_yield_message_base) {
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 2 -> simple_yield_message_record.reserved_2[simple_yield_message_at] = (simple_yield_message_base + 0 + simple_yield_message_at + 1) % 256; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 6 -> simple_yield_message_record.time_c_6_hhmm[simple_yield_message_at] = (simple_yield_message_base + 2 + simple_yield_message_at + 1) % 256; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 4 -> simple_yield_message_record.issue_classification_code[simple_yield_message_at] = (simple_yield_message_base + 8 + simple_yield_message_at + 1) % 256; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  ramp_simple_yield(simple_yield_message_record.simple_yield, simple_yield_message_base + 12);
  ramp_yield_day_on_day_comparison(simple_yield_message_record.yield_day_on_day_comparison, simple_yield_message_base + 21);
  skip
}

/* Simple Yield Message to the wire, 30 bytes from where the cursor stands */
inline encode_simple_yield_message(simple_yield_message_record) {
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 2 -> wire[at] = simple_yield_message_record.reserved_2[simple_yield_message_at]; at = at + 1; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 6 -> wire[at] = simple_yield_message_record.time_c_6_hhmm[simple_yield_message_at]; at = at + 1; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 4 -> wire[at] = simple_yield_message_record.issue_classification_code[simple_yield_message_at]; at = at + 1; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  encode_simple_yield(simple_yield_message_record.simple_yield);
  encode_yield_day_on_day_comparison(simple_yield_message_record.yield_day_on_day_comparison);
  skip
}

/* Simple Yield Message off the wire, 30 bytes from where the cursor stands */
inline decode_simple_yield_message(simple_yield_message_record) {
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 2 -> simple_yield_message_record.reserved_2[simple_yield_message_at] = wire[at]; at = at + 1; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 6 -> simple_yield_message_record.time_c_6_hhmm[simple_yield_message_at] = wire[at]; at = at + 1; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 4 -> simple_yield_message_record.issue_classification_code[simple_yield_message_at] = wire[at]; at = at + 1; simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  decode_simple_yield(simple_yield_message_record.simple_yield);
  decode_yield_day_on_day_comparison(simple_yield_message_record.yield_day_on_day_comparison);
  skip
}

/* what was read of Simple Yield Message is what was written, byte for byte */
inline equal_simple_yield_message(simple_yield_message_read, simple_yield_message_written) {
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 2 -> assert(simple_yield_message_read.reserved_2[simple_yield_message_at] == simple_yield_message_written.reserved_2[simple_yield_message_at]); simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 6 -> assert(simple_yield_message_read.time_c_6_hhmm[simple_yield_message_at] == simple_yield_message_written.time_c_6_hhmm[simple_yield_message_at]); simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  simple_yield_message_at = 0;
  do
  :: simple_yield_message_at < 4 -> assert(simple_yield_message_read.issue_classification_code[simple_yield_message_at] == simple_yield_message_written.issue_classification_code[simple_yield_message_at]); simple_yield_message_at = simple_yield_message_at + 1
  :: else -> break
  od;
  equal_simple_yield(simple_yield_message_read.simple_yield, simple_yield_message_written.simple_yield);
  equal_yield_day_on_day_comparison(simple_yield_message_read.yield_day_on_day_comparison, simple_yield_message_written.yield_day_on_day_comparison);
  skip
}

/* ---- Weighted Yield: 9 bytes ------------------------------------------------- */

/* Weighted yield */
typedef WeightedYield {
  byte weighted_yield_c_8[8];
  byte sign
};

int weighted_yield_at;

/* every byte of Weighted Yield set to one value */
inline fill_weighted_yield(weighted_yield_record, weighted_yield_value) {
  weighted_yield_at = 0;
  do
  :: weighted_yield_at < 8 -> weighted_yield_record.weighted_yield_c_8[weighted_yield_at] = weighted_yield_value; weighted_yield_at = weighted_yield_at + 1
  :: else -> break
  od;
  weighted_yield_record.sign = weighted_yield_value;
  skip
}

/* each byte of Weighted Yield set to where it lies, so a field read out of place says so */
inline ramp_weighted_yield(weighted_yield_record, weighted_yield_base) {
  weighted_yield_at = 0;
  do
  :: weighted_yield_at < 8 -> weighted_yield_record.weighted_yield_c_8[weighted_yield_at] = (weighted_yield_base + 0 + weighted_yield_at + 1) % 256; weighted_yield_at = weighted_yield_at + 1
  :: else -> break
  od;
  weighted_yield_record.sign = (weighted_yield_base + 8 + 1) % 256;
  skip
}

/* Weighted Yield to the wire, 9 bytes from where the cursor stands */
inline encode_weighted_yield(weighted_yield_record) {
  weighted_yield_at = 0;
  do
  :: weighted_yield_at < 8 -> wire[at] = weighted_yield_record.weighted_yield_c_8[weighted_yield_at]; at = at + 1; weighted_yield_at = weighted_yield_at + 1
  :: else -> break
  od;
  wire[at] = weighted_yield_record.sign; at = at + 1;
  skip
}

/* Weighted Yield off the wire, 9 bytes from where the cursor stands */
inline decode_weighted_yield(weighted_yield_record) {
  weighted_yield_at = 0;
  do
  :: weighted_yield_at < 8 -> weighted_yield_record.weighted_yield_c_8[weighted_yield_at] = wire[at]; at = at + 1; weighted_yield_at = weighted_yield_at + 1
  :: else -> break
  od;
  weighted_yield_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Weighted Yield is what was written, byte for byte */
inline equal_weighted_yield(weighted_yield_read, weighted_yield_written) {
  weighted_yield_at = 0;
  do
  :: weighted_yield_at < 8 -> assert(weighted_yield_read.weighted_yield_c_8[weighted_yield_at] == weighted_yield_written.weighted_yield_c_8[weighted_yield_at]); weighted_yield_at = weighted_yield_at + 1
  :: else -> break
  od;
  assert(weighted_yield_read.sign == weighted_yield_written.sign);
  skip
}

/* ---- Weighted Yield Message: 30 bytes ---------------------------------------- */

/* In this tag, weighted yield information for each market (issue classification) will be set. This data appears as part of a statistics message. */
typedef WeightedYieldMessage {
  byte reserved_2[2];
  byte time_c_6_hhmm[6];
  byte issue_classification_code[4];
  WeightedYield weighted_yield;
  YieldDayOnDayComparison yield_day_on_day_comparison
};

int weighted_yield_message_at;

/* every byte of Weighted Yield Message set to one value */
inline fill_weighted_yield_message(weighted_yield_message_record, weighted_yield_message_value) {
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 2 -> weighted_yield_message_record.reserved_2[weighted_yield_message_at] = weighted_yield_message_value; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 6 -> weighted_yield_message_record.time_c_6_hhmm[weighted_yield_message_at] = weighted_yield_message_value; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 4 -> weighted_yield_message_record.issue_classification_code[weighted_yield_message_at] = weighted_yield_message_value; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  fill_weighted_yield(weighted_yield_message_record.weighted_yield, weighted_yield_message_value);
  fill_yield_day_on_day_comparison(weighted_yield_message_record.yield_day_on_day_comparison, weighted_yield_message_value);
  skip
}

/* each byte of Weighted Yield Message set to where it lies, so a field read out of place says so */
inline ramp_weighted_yield_message(weighted_yield_message_record, weighted_yield_message_base) {
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 2 -> weighted_yield_message_record.reserved_2[weighted_yield_message_at] = (weighted_yield_message_base + 0 + weighted_yield_message_at + 1) % 256; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 6 -> weighted_yield_message_record.time_c_6_hhmm[weighted_yield_message_at] = (weighted_yield_message_base + 2 + weighted_yield_message_at + 1) % 256; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 4 -> weighted_yield_message_record.issue_classification_code[weighted_yield_message_at] = (weighted_yield_message_base + 8 + weighted_yield_message_at + 1) % 256; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  ramp_weighted_yield(weighted_yield_message_record.weighted_yield, weighted_yield_message_base + 12);
  ramp_yield_day_on_day_comparison(weighted_yield_message_record.yield_day_on_day_comparison, weighted_yield_message_base + 21);
  skip
}

/* Weighted Yield Message to the wire, 30 bytes from where the cursor stands */
inline encode_weighted_yield_message(weighted_yield_message_record) {
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 2 -> wire[at] = weighted_yield_message_record.reserved_2[weighted_yield_message_at]; at = at + 1; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 6 -> wire[at] = weighted_yield_message_record.time_c_6_hhmm[weighted_yield_message_at]; at = at + 1; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 4 -> wire[at] = weighted_yield_message_record.issue_classification_code[weighted_yield_message_at]; at = at + 1; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  encode_weighted_yield(weighted_yield_message_record.weighted_yield);
  encode_yield_day_on_day_comparison(weighted_yield_message_record.yield_day_on_day_comparison);
  skip
}

/* Weighted Yield Message off the wire, 30 bytes from where the cursor stands */
inline decode_weighted_yield_message(weighted_yield_message_record) {
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 2 -> weighted_yield_message_record.reserved_2[weighted_yield_message_at] = wire[at]; at = at + 1; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 6 -> weighted_yield_message_record.time_c_6_hhmm[weighted_yield_message_at] = wire[at]; at = at + 1; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 4 -> weighted_yield_message_record.issue_classification_code[weighted_yield_message_at] = wire[at]; at = at + 1; weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  decode_weighted_yield(weighted_yield_message_record.weighted_yield);
  decode_yield_day_on_day_comparison(weighted_yield_message_record.yield_day_on_day_comparison);
  skip
}

/* what was read of Weighted Yield Message is what was written, byte for byte */
inline equal_weighted_yield_message(weighted_yield_message_read, weighted_yield_message_written) {
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 2 -> assert(weighted_yield_message_read.reserved_2[weighted_yield_message_at] == weighted_yield_message_written.reserved_2[weighted_yield_message_at]); weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 6 -> assert(weighted_yield_message_read.time_c_6_hhmm[weighted_yield_message_at] == weighted_yield_message_written.time_c_6_hhmm[weighted_yield_message_at]); weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  weighted_yield_message_at = 0;
  do
  :: weighted_yield_message_at < 4 -> assert(weighted_yield_message_read.issue_classification_code[weighted_yield_message_at] == weighted_yield_message_written.issue_classification_code[weighted_yield_message_at]); weighted_yield_message_at = weighted_yield_message_at + 1
  :: else -> break
  od;
  equal_weighted_yield(weighted_yield_message_read.weighted_yield, weighted_yield_message_written.weighted_yield);
  equal_yield_day_on_day_comparison(weighted_yield_message_read.yield_day_on_day_comparison, weighted_yield_message_written.yield_day_on_day_comparison);
  skip
}

/* ---- Simple Stock Price Average: 16 bytes ------------------------------------ */

/* Simple stock price average */
typedef SimpleStockPriceAverage {
  byte unit_flag;
  byte simple_stock_price_average_c_14[14];
  byte sign
};

int simple_stock_price_average_at;

/* every byte of Simple Stock Price Average set to one value */
inline fill_simple_stock_price_average(simple_stock_price_average_record, simple_stock_price_average_value) {
  simple_stock_price_average_record.unit_flag = simple_stock_price_average_value;
  simple_stock_price_average_at = 0;
  do
  :: simple_stock_price_average_at < 14 -> simple_stock_price_average_record.simple_stock_price_average_c_14[simple_stock_price_average_at] = simple_stock_price_average_value; simple_stock_price_average_at = simple_stock_price_average_at + 1
  :: else -> break
  od;
  simple_stock_price_average_record.sign = simple_stock_price_average_value;
  skip
}

/* each byte of Simple Stock Price Average set to where it lies, so a field read out of place says so */
inline ramp_simple_stock_price_average(simple_stock_price_average_record, simple_stock_price_average_base) {
  simple_stock_price_average_record.unit_flag = (simple_stock_price_average_base + 0 + 1) % 256;
  simple_stock_price_average_at = 0;
  do
  :: simple_stock_price_average_at < 14 -> simple_stock_price_average_record.simple_stock_price_average_c_14[simple_stock_price_average_at] = (simple_stock_price_average_base + 1 + simple_stock_price_average_at + 1) % 256; simple_stock_price_average_at = simple_stock_price_average_at + 1
  :: else -> break
  od;
  simple_stock_price_average_record.sign = (simple_stock_price_average_base + 15 + 1) % 256;
  skip
}

/* Simple Stock Price Average to the wire, 16 bytes from where the cursor stands */
inline encode_simple_stock_price_average(simple_stock_price_average_record) {
  wire[at] = simple_stock_price_average_record.unit_flag; at = at + 1;
  simple_stock_price_average_at = 0;
  do
  :: simple_stock_price_average_at < 14 -> wire[at] = simple_stock_price_average_record.simple_stock_price_average_c_14[simple_stock_price_average_at]; at = at + 1; simple_stock_price_average_at = simple_stock_price_average_at + 1
  :: else -> break
  od;
  wire[at] = simple_stock_price_average_record.sign; at = at + 1;
  skip
}

/* Simple Stock Price Average off the wire, 16 bytes from where the cursor stands */
inline decode_simple_stock_price_average(simple_stock_price_average_record) {
  simple_stock_price_average_record.unit_flag = wire[at]; at = at + 1;
  simple_stock_price_average_at = 0;
  do
  :: simple_stock_price_average_at < 14 -> simple_stock_price_average_record.simple_stock_price_average_c_14[simple_stock_price_average_at] = wire[at]; at = at + 1; simple_stock_price_average_at = simple_stock_price_average_at + 1
  :: else -> break
  od;
  simple_stock_price_average_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Stock Price Average is what was written, byte for byte */
inline equal_simple_stock_price_average(simple_stock_price_average_read, simple_stock_price_average_written) {
  assert(simple_stock_price_average_read.unit_flag == simple_stock_price_average_written.unit_flag);
  simple_stock_price_average_at = 0;
  do
  :: simple_stock_price_average_at < 14 -> assert(simple_stock_price_average_read.simple_stock_price_average_c_14[simple_stock_price_average_at] == simple_stock_price_average_written.simple_stock_price_average_c_14[simple_stock_price_average_at]); simple_stock_price_average_at = simple_stock_price_average_at + 1
  :: else -> break
  od;
  assert(simple_stock_price_average_read.sign == simple_stock_price_average_written.sign);
  skip
}

/* ---- Stock Price Average Day On Day Comparison: 16 bytes --------------------- */

/* Stock price average Day-on-day comparison */
typedef StockPriceAverageDayOnDayComparison {
  byte unit_flag;
  byte day_on_day_comparison_c_14[14];
  byte sign
};

int stock_price_average_day_on_day_comparison_at;

/* every byte of Stock Price Average Day On Day Comparison set to one value */
inline fill_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_record, stock_price_average_day_on_day_comparison_value) {
  stock_price_average_day_on_day_comparison_record.unit_flag = stock_price_average_day_on_day_comparison_value;
  stock_price_average_day_on_day_comparison_at = 0;
  do
  :: stock_price_average_day_on_day_comparison_at < 14 -> stock_price_average_day_on_day_comparison_record.day_on_day_comparison_c_14[stock_price_average_day_on_day_comparison_at] = stock_price_average_day_on_day_comparison_value; stock_price_average_day_on_day_comparison_at = stock_price_average_day_on_day_comparison_at + 1
  :: else -> break
  od;
  stock_price_average_day_on_day_comparison_record.sign = stock_price_average_day_on_day_comparison_value;
  skip
}

/* each byte of Stock Price Average Day On Day Comparison set to where it lies, so a field read out of place says so */
inline ramp_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_record, stock_price_average_day_on_day_comparison_base) {
  stock_price_average_day_on_day_comparison_record.unit_flag = (stock_price_average_day_on_day_comparison_base + 0 + 1) % 256;
  stock_price_average_day_on_day_comparison_at = 0;
  do
  :: stock_price_average_day_on_day_comparison_at < 14 -> stock_price_average_day_on_day_comparison_record.day_on_day_comparison_c_14[stock_price_average_day_on_day_comparison_at] = (stock_price_average_day_on_day_comparison_base + 1 + stock_price_average_day_on_day_comparison_at + 1) % 256; stock_price_average_day_on_day_comparison_at = stock_price_average_day_on_day_comparison_at + 1
  :: else -> break
  od;
  stock_price_average_day_on_day_comparison_record.sign = (stock_price_average_day_on_day_comparison_base + 15 + 1) % 256;
  skip
}

/* Stock Price Average Day On Day Comparison to the wire, 16 bytes from where the cursor stands */
inline encode_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_record) {
  wire[at] = stock_price_average_day_on_day_comparison_record.unit_flag; at = at + 1;
  stock_price_average_day_on_day_comparison_at = 0;
  do
  :: stock_price_average_day_on_day_comparison_at < 14 -> wire[at] = stock_price_average_day_on_day_comparison_record.day_on_day_comparison_c_14[stock_price_average_day_on_day_comparison_at]; at = at + 1; stock_price_average_day_on_day_comparison_at = stock_price_average_day_on_day_comparison_at + 1
  :: else -> break
  od;
  wire[at] = stock_price_average_day_on_day_comparison_record.sign; at = at + 1;
  skip
}

/* Stock Price Average Day On Day Comparison off the wire, 16 bytes from where the cursor stands */
inline decode_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_record) {
  stock_price_average_day_on_day_comparison_record.unit_flag = wire[at]; at = at + 1;
  stock_price_average_day_on_day_comparison_at = 0;
  do
  :: stock_price_average_day_on_day_comparison_at < 14 -> stock_price_average_day_on_day_comparison_record.day_on_day_comparison_c_14[stock_price_average_day_on_day_comparison_at] = wire[at]; at = at + 1; stock_price_average_day_on_day_comparison_at = stock_price_average_day_on_day_comparison_at + 1
  :: else -> break
  od;
  stock_price_average_day_on_day_comparison_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Price Average Day On Day Comparison is what was written, byte for byte */
inline equal_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_read, stock_price_average_day_on_day_comparison_written) {
  assert(stock_price_average_day_on_day_comparison_read.unit_flag == stock_price_average_day_on_day_comparison_written.unit_flag);
  stock_price_average_day_on_day_comparison_at = 0;
  do
  :: stock_price_average_day_on_day_comparison_at < 14 -> assert(stock_price_average_day_on_day_comparison_read.day_on_day_comparison_c_14[stock_price_average_day_on_day_comparison_at] == stock_price_average_day_on_day_comparison_written.day_on_day_comparison_c_14[stock_price_average_day_on_day_comparison_at]); stock_price_average_day_on_day_comparison_at = stock_price_average_day_on_day_comparison_at + 1
  :: else -> break
  od;
  assert(stock_price_average_day_on_day_comparison_read.sign == stock_price_average_day_on_day_comparison_written.sign);
  skip
}

/* ---- Simple Stock Price Average Message: 44 bytes ---------------------------- */

/* In this tag, simple stock price average information for each market (issue classification) will be set. This data appears as part of a statistics message. */
typedef SimpleStockPriceAverageMessage {
  byte reserved_2[2];
  byte output_time[6];
  byte issue_classification_code[4];
  SimpleStockPriceAverage simple_stock_price_average;
  StockPriceAverageDayOnDayComparison stock_price_average_day_on_day_comparison
};

int simple_stock_price_average_message_at;

/* every byte of Simple Stock Price Average Message set to one value */
inline fill_simple_stock_price_average_message(simple_stock_price_average_message_record, simple_stock_price_average_message_value) {
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 2 -> simple_stock_price_average_message_record.reserved_2[simple_stock_price_average_message_at] = simple_stock_price_average_message_value; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 6 -> simple_stock_price_average_message_record.output_time[simple_stock_price_average_message_at] = simple_stock_price_average_message_value; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 4 -> simple_stock_price_average_message_record.issue_classification_code[simple_stock_price_average_message_at] = simple_stock_price_average_message_value; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  fill_simple_stock_price_average(simple_stock_price_average_message_record.simple_stock_price_average, simple_stock_price_average_message_value);
  fill_stock_price_average_day_on_day_comparison(simple_stock_price_average_message_record.stock_price_average_day_on_day_comparison, simple_stock_price_average_message_value);
  skip
}

/* each byte of Simple Stock Price Average Message set to where it lies, so a field read out of place says so */
inline ramp_simple_stock_price_average_message(simple_stock_price_average_message_record, simple_stock_price_average_message_base) {
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 2 -> simple_stock_price_average_message_record.reserved_2[simple_stock_price_average_message_at] = (simple_stock_price_average_message_base + 0 + simple_stock_price_average_message_at + 1) % 256; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 6 -> simple_stock_price_average_message_record.output_time[simple_stock_price_average_message_at] = (simple_stock_price_average_message_base + 2 + simple_stock_price_average_message_at + 1) % 256; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 4 -> simple_stock_price_average_message_record.issue_classification_code[simple_stock_price_average_message_at] = (simple_stock_price_average_message_base + 8 + simple_stock_price_average_message_at + 1) % 256; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  ramp_simple_stock_price_average(simple_stock_price_average_message_record.simple_stock_price_average, simple_stock_price_average_message_base + 12);
  ramp_stock_price_average_day_on_day_comparison(simple_stock_price_average_message_record.stock_price_average_day_on_day_comparison, simple_stock_price_average_message_base + 28);
  skip
}

/* Simple Stock Price Average Message to the wire, 44 bytes from where the cursor stands */
inline encode_simple_stock_price_average_message(simple_stock_price_average_message_record) {
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 2 -> wire[at] = simple_stock_price_average_message_record.reserved_2[simple_stock_price_average_message_at]; at = at + 1; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 6 -> wire[at] = simple_stock_price_average_message_record.output_time[simple_stock_price_average_message_at]; at = at + 1; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 4 -> wire[at] = simple_stock_price_average_message_record.issue_classification_code[simple_stock_price_average_message_at]; at = at + 1; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  encode_simple_stock_price_average(simple_stock_price_average_message_record.simple_stock_price_average);
  encode_stock_price_average_day_on_day_comparison(simple_stock_price_average_message_record.stock_price_average_day_on_day_comparison);
  skip
}

/* Simple Stock Price Average Message off the wire, 44 bytes from where the cursor stands */
inline decode_simple_stock_price_average_message(simple_stock_price_average_message_record) {
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 2 -> simple_stock_price_average_message_record.reserved_2[simple_stock_price_average_message_at] = wire[at]; at = at + 1; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 6 -> simple_stock_price_average_message_record.output_time[simple_stock_price_average_message_at] = wire[at]; at = at + 1; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 4 -> simple_stock_price_average_message_record.issue_classification_code[simple_stock_price_average_message_at] = wire[at]; at = at + 1; simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  decode_simple_stock_price_average(simple_stock_price_average_message_record.simple_stock_price_average);
  decode_stock_price_average_day_on_day_comparison(simple_stock_price_average_message_record.stock_price_average_day_on_day_comparison);
  skip
}

/* what was read of Simple Stock Price Average Message is what was written, byte for byte */
inline equal_simple_stock_price_average_message(simple_stock_price_average_message_read, simple_stock_price_average_message_written) {
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 2 -> assert(simple_stock_price_average_message_read.reserved_2[simple_stock_price_average_message_at] == simple_stock_price_average_message_written.reserved_2[simple_stock_price_average_message_at]); simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 6 -> assert(simple_stock_price_average_message_read.output_time[simple_stock_price_average_message_at] == simple_stock_price_average_message_written.output_time[simple_stock_price_average_message_at]); simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_message_at = 0;
  do
  :: simple_stock_price_average_message_at < 4 -> assert(simple_stock_price_average_message_read.issue_classification_code[simple_stock_price_average_message_at] == simple_stock_price_average_message_written.issue_classification_code[simple_stock_price_average_message_at]); simple_stock_price_average_message_at = simple_stock_price_average_message_at + 1
  :: else -> break
  od;
  equal_simple_stock_price_average(simple_stock_price_average_message_read.simple_stock_price_average, simple_stock_price_average_message_written.simple_stock_price_average);
  equal_stock_price_average_day_on_day_comparison(simple_stock_price_average_message_read.stock_price_average_day_on_day_comparison, simple_stock_price_average_message_written.stock_price_average_day_on_day_comparison);
  skip
}

/* ---- Weighted Stock Price Average: 16 bytes ---------------------------------- */

/* Weighted stock price average */
typedef WeightedStockPriceAverage {
  byte unit_flag;
  byte weighted_stock_price_average_c_14[14];
  byte sign
};

int weighted_stock_price_average_at;

/* every byte of Weighted Stock Price Average set to one value */
inline fill_weighted_stock_price_average(weighted_stock_price_average_record, weighted_stock_price_average_value) {
  weighted_stock_price_average_record.unit_flag = weighted_stock_price_average_value;
  weighted_stock_price_average_at = 0;
  do
  :: weighted_stock_price_average_at < 14 -> weighted_stock_price_average_record.weighted_stock_price_average_c_14[weighted_stock_price_average_at] = weighted_stock_price_average_value; weighted_stock_price_average_at = weighted_stock_price_average_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_record.sign = weighted_stock_price_average_value;
  skip
}

/* each byte of Weighted Stock Price Average set to where it lies, so a field read out of place says so */
inline ramp_weighted_stock_price_average(weighted_stock_price_average_record, weighted_stock_price_average_base) {
  weighted_stock_price_average_record.unit_flag = (weighted_stock_price_average_base + 0 + 1) % 256;
  weighted_stock_price_average_at = 0;
  do
  :: weighted_stock_price_average_at < 14 -> weighted_stock_price_average_record.weighted_stock_price_average_c_14[weighted_stock_price_average_at] = (weighted_stock_price_average_base + 1 + weighted_stock_price_average_at + 1) % 256; weighted_stock_price_average_at = weighted_stock_price_average_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_record.sign = (weighted_stock_price_average_base + 15 + 1) % 256;
  skip
}

/* Weighted Stock Price Average to the wire, 16 bytes from where the cursor stands */
inline encode_weighted_stock_price_average(weighted_stock_price_average_record) {
  wire[at] = weighted_stock_price_average_record.unit_flag; at = at + 1;
  weighted_stock_price_average_at = 0;
  do
  :: weighted_stock_price_average_at < 14 -> wire[at] = weighted_stock_price_average_record.weighted_stock_price_average_c_14[weighted_stock_price_average_at]; at = at + 1; weighted_stock_price_average_at = weighted_stock_price_average_at + 1
  :: else -> break
  od;
  wire[at] = weighted_stock_price_average_record.sign; at = at + 1;
  skip
}

/* Weighted Stock Price Average off the wire, 16 bytes from where the cursor stands */
inline decode_weighted_stock_price_average(weighted_stock_price_average_record) {
  weighted_stock_price_average_record.unit_flag = wire[at]; at = at + 1;
  weighted_stock_price_average_at = 0;
  do
  :: weighted_stock_price_average_at < 14 -> weighted_stock_price_average_record.weighted_stock_price_average_c_14[weighted_stock_price_average_at] = wire[at]; at = at + 1; weighted_stock_price_average_at = weighted_stock_price_average_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Weighted Stock Price Average is what was written, byte for byte */
inline equal_weighted_stock_price_average(weighted_stock_price_average_read, weighted_stock_price_average_written) {
  assert(weighted_stock_price_average_read.unit_flag == weighted_stock_price_average_written.unit_flag);
  weighted_stock_price_average_at = 0;
  do
  :: weighted_stock_price_average_at < 14 -> assert(weighted_stock_price_average_read.weighted_stock_price_average_c_14[weighted_stock_price_average_at] == weighted_stock_price_average_written.weighted_stock_price_average_c_14[weighted_stock_price_average_at]); weighted_stock_price_average_at = weighted_stock_price_average_at + 1
  :: else -> break
  od;
  assert(weighted_stock_price_average_read.sign == weighted_stock_price_average_written.sign);
  skip
}

/* ---- Weighted Stock Price Average Message: 44 bytes -------------------------- */

/* In this tag, weighted stock price average information for each market (issue classification) will be set. This data appears as part of a statistics message. */
typedef WeightedStockPriceAverageMessage {
  byte reserved_2[2];
  byte output_time[6];
  byte issue_classification_code[4];
  WeightedStockPriceAverage weighted_stock_price_average;
  StockPriceAverageDayOnDayComparison stock_price_average_day_on_day_comparison
};

int weighted_stock_price_average_message_at;

/* every byte of Weighted Stock Price Average Message set to one value */
inline fill_weighted_stock_price_average_message(weighted_stock_price_average_message_record, weighted_stock_price_average_message_value) {
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 2 -> weighted_stock_price_average_message_record.reserved_2[weighted_stock_price_average_message_at] = weighted_stock_price_average_message_value; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 6 -> weighted_stock_price_average_message_record.output_time[weighted_stock_price_average_message_at] = weighted_stock_price_average_message_value; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 4 -> weighted_stock_price_average_message_record.issue_classification_code[weighted_stock_price_average_message_at] = weighted_stock_price_average_message_value; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  fill_weighted_stock_price_average(weighted_stock_price_average_message_record.weighted_stock_price_average, weighted_stock_price_average_message_value);
  fill_stock_price_average_day_on_day_comparison(weighted_stock_price_average_message_record.stock_price_average_day_on_day_comparison, weighted_stock_price_average_message_value);
  skip
}

/* each byte of Weighted Stock Price Average Message set to where it lies, so a field read out of place says so */
inline ramp_weighted_stock_price_average_message(weighted_stock_price_average_message_record, weighted_stock_price_average_message_base) {
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 2 -> weighted_stock_price_average_message_record.reserved_2[weighted_stock_price_average_message_at] = (weighted_stock_price_average_message_base + 0 + weighted_stock_price_average_message_at + 1) % 256; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 6 -> weighted_stock_price_average_message_record.output_time[weighted_stock_price_average_message_at] = (weighted_stock_price_average_message_base + 2 + weighted_stock_price_average_message_at + 1) % 256; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 4 -> weighted_stock_price_average_message_record.issue_classification_code[weighted_stock_price_average_message_at] = (weighted_stock_price_average_message_base + 8 + weighted_stock_price_average_message_at + 1) % 256; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  ramp_weighted_stock_price_average(weighted_stock_price_average_message_record.weighted_stock_price_average, weighted_stock_price_average_message_base + 12);
  ramp_stock_price_average_day_on_day_comparison(weighted_stock_price_average_message_record.stock_price_average_day_on_day_comparison, weighted_stock_price_average_message_base + 28);
  skip
}

/* Weighted Stock Price Average Message to the wire, 44 bytes from where the cursor stands */
inline encode_weighted_stock_price_average_message(weighted_stock_price_average_message_record) {
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 2 -> wire[at] = weighted_stock_price_average_message_record.reserved_2[weighted_stock_price_average_message_at]; at = at + 1; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 6 -> wire[at] = weighted_stock_price_average_message_record.output_time[weighted_stock_price_average_message_at]; at = at + 1; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 4 -> wire[at] = weighted_stock_price_average_message_record.issue_classification_code[weighted_stock_price_average_message_at]; at = at + 1; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  encode_weighted_stock_price_average(weighted_stock_price_average_message_record.weighted_stock_price_average);
  encode_stock_price_average_day_on_day_comparison(weighted_stock_price_average_message_record.stock_price_average_day_on_day_comparison);
  skip
}

/* Weighted Stock Price Average Message off the wire, 44 bytes from where the cursor stands */
inline decode_weighted_stock_price_average_message(weighted_stock_price_average_message_record) {
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 2 -> weighted_stock_price_average_message_record.reserved_2[weighted_stock_price_average_message_at] = wire[at]; at = at + 1; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 6 -> weighted_stock_price_average_message_record.output_time[weighted_stock_price_average_message_at] = wire[at]; at = at + 1; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 4 -> weighted_stock_price_average_message_record.issue_classification_code[weighted_stock_price_average_message_at] = wire[at]; at = at + 1; weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  decode_weighted_stock_price_average(weighted_stock_price_average_message_record.weighted_stock_price_average);
  decode_stock_price_average_day_on_day_comparison(weighted_stock_price_average_message_record.stock_price_average_day_on_day_comparison);
  skip
}

/* what was read of Weighted Stock Price Average Message is what was written, byte for byte */
inline equal_weighted_stock_price_average_message(weighted_stock_price_average_message_read, weighted_stock_price_average_message_written) {
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 2 -> assert(weighted_stock_price_average_message_read.reserved_2[weighted_stock_price_average_message_at] == weighted_stock_price_average_message_written.reserved_2[weighted_stock_price_average_message_at]); weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 6 -> assert(weighted_stock_price_average_message_read.output_time[weighted_stock_price_average_message_at] == weighted_stock_price_average_message_written.output_time[weighted_stock_price_average_message_at]); weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  weighted_stock_price_average_message_at = 0;
  do
  :: weighted_stock_price_average_message_at < 4 -> assert(weighted_stock_price_average_message_read.issue_classification_code[weighted_stock_price_average_message_at] == weighted_stock_price_average_message_written.issue_classification_code[weighted_stock_price_average_message_at]); weighted_stock_price_average_message_at = weighted_stock_price_average_message_at + 1
  :: else -> break
  od;
  equal_weighted_stock_price_average(weighted_stock_price_average_message_read.weighted_stock_price_average, weighted_stock_price_average_message_written.weighted_stock_price_average);
  equal_stock_price_average_day_on_day_comparison(weighted_stock_price_average_message_read.stock_price_average_day_on_day_comparison, weighted_stock_price_average_message_written.stock_price_average_day_on_day_comparison);
  skip
}

/* ---- Simple Stock Price Average By Industry Message: 44 bytes ---------------- */

/* In this tag, simple stock price average information by industry classification will be set. This data appears as part of a statistics message. */
typedef SimpleStockPriceAverageByIndustryMessage {
  byte reserved_2[2];
  byte output_time[6];
  byte industry_code[4];
  SimpleStockPriceAverage simple_stock_price_average;
  StockPriceAverageDayOnDayComparison stock_price_average_day_on_day_comparison
};

int simple_stock_price_average_by_industry_message_at;

/* every byte of Simple Stock Price Average By Industry Message set to one value */
inline fill_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_record, simple_stock_price_average_by_industry_message_value) {
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 2 -> simple_stock_price_average_by_industry_message_record.reserved_2[simple_stock_price_average_by_industry_message_at] = simple_stock_price_average_by_industry_message_value; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 6 -> simple_stock_price_average_by_industry_message_record.output_time[simple_stock_price_average_by_industry_message_at] = simple_stock_price_average_by_industry_message_value; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 4 -> simple_stock_price_average_by_industry_message_record.industry_code[simple_stock_price_average_by_industry_message_at] = simple_stock_price_average_by_industry_message_value; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  fill_simple_stock_price_average(simple_stock_price_average_by_industry_message_record.simple_stock_price_average, simple_stock_price_average_by_industry_message_value);
  fill_stock_price_average_day_on_day_comparison(simple_stock_price_average_by_industry_message_record.stock_price_average_day_on_day_comparison, simple_stock_price_average_by_industry_message_value);
  skip
}

/* each byte of Simple Stock Price Average By Industry Message set to where it lies, so a field read out of place says so */
inline ramp_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_record, simple_stock_price_average_by_industry_message_base) {
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 2 -> simple_stock_price_average_by_industry_message_record.reserved_2[simple_stock_price_average_by_industry_message_at] = (simple_stock_price_average_by_industry_message_base + 0 + simple_stock_price_average_by_industry_message_at + 1) % 256; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 6 -> simple_stock_price_average_by_industry_message_record.output_time[simple_stock_price_average_by_industry_message_at] = (simple_stock_price_average_by_industry_message_base + 2 + simple_stock_price_average_by_industry_message_at + 1) % 256; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 4 -> simple_stock_price_average_by_industry_message_record.industry_code[simple_stock_price_average_by_industry_message_at] = (simple_stock_price_average_by_industry_message_base + 8 + simple_stock_price_average_by_industry_message_at + 1) % 256; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  ramp_simple_stock_price_average(simple_stock_price_average_by_industry_message_record.simple_stock_price_average, simple_stock_price_average_by_industry_message_base + 12);
  ramp_stock_price_average_day_on_day_comparison(simple_stock_price_average_by_industry_message_record.stock_price_average_day_on_day_comparison, simple_stock_price_average_by_industry_message_base + 28);
  skip
}

/* Simple Stock Price Average By Industry Message to the wire, 44 bytes from where the cursor stands */
inline encode_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_record) {
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 2 -> wire[at] = simple_stock_price_average_by_industry_message_record.reserved_2[simple_stock_price_average_by_industry_message_at]; at = at + 1; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 6 -> wire[at] = simple_stock_price_average_by_industry_message_record.output_time[simple_stock_price_average_by_industry_message_at]; at = at + 1; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 4 -> wire[at] = simple_stock_price_average_by_industry_message_record.industry_code[simple_stock_price_average_by_industry_message_at]; at = at + 1; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  encode_simple_stock_price_average(simple_stock_price_average_by_industry_message_record.simple_stock_price_average);
  encode_stock_price_average_day_on_day_comparison(simple_stock_price_average_by_industry_message_record.stock_price_average_day_on_day_comparison);
  skip
}

/* Simple Stock Price Average By Industry Message off the wire, 44 bytes from where the cursor stands */
inline decode_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_record) {
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 2 -> simple_stock_price_average_by_industry_message_record.reserved_2[simple_stock_price_average_by_industry_message_at] = wire[at]; at = at + 1; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 6 -> simple_stock_price_average_by_industry_message_record.output_time[simple_stock_price_average_by_industry_message_at] = wire[at]; at = at + 1; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 4 -> simple_stock_price_average_by_industry_message_record.industry_code[simple_stock_price_average_by_industry_message_at] = wire[at]; at = at + 1; simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  decode_simple_stock_price_average(simple_stock_price_average_by_industry_message_record.simple_stock_price_average);
  decode_stock_price_average_day_on_day_comparison(simple_stock_price_average_by_industry_message_record.stock_price_average_day_on_day_comparison);
  skip
}

/* what was read of Simple Stock Price Average By Industry Message is what was written, byte for byte */
inline equal_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_read, simple_stock_price_average_by_industry_message_written) {
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 2 -> assert(simple_stock_price_average_by_industry_message_read.reserved_2[simple_stock_price_average_by_industry_message_at] == simple_stock_price_average_by_industry_message_written.reserved_2[simple_stock_price_average_by_industry_message_at]); simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 6 -> assert(simple_stock_price_average_by_industry_message_read.output_time[simple_stock_price_average_by_industry_message_at] == simple_stock_price_average_by_industry_message_written.output_time[simple_stock_price_average_by_industry_message_at]); simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  simple_stock_price_average_by_industry_message_at = 0;
  do
  :: simple_stock_price_average_by_industry_message_at < 4 -> assert(simple_stock_price_average_by_industry_message_read.industry_code[simple_stock_price_average_by_industry_message_at] == simple_stock_price_average_by_industry_message_written.industry_code[simple_stock_price_average_by_industry_message_at]); simple_stock_price_average_by_industry_message_at = simple_stock_price_average_by_industry_message_at + 1
  :: else -> break
  od;
  equal_simple_stock_price_average(simple_stock_price_average_by_industry_message_read.simple_stock_price_average, simple_stock_price_average_by_industry_message_written.simple_stock_price_average);
  equal_stock_price_average_day_on_day_comparison(simple_stock_price_average_by_industry_message_read.stock_price_average_day_on_day_comparison, simple_stock_price_average_by_industry_message_written.stock_price_average_day_on_day_comparison);
  skip
}

/* ---- Overall Simple Average: 32 bytes ---------------------------------------- */

/* Overall Simple average */
typedef OverallSimpleAverage {
  byte unit_flag;
  byte simple_average_c_14[14];
  byte sign;
  byte second_unit_flag;
  byte day_on_day_comparison_c_14[14];
  byte second_sign
};

int overall_simple_average_at;

/* every byte of Overall Simple Average set to one value */
inline fill_overall_simple_average(overall_simple_average_record, overall_simple_average_value) {
  overall_simple_average_record.unit_flag = overall_simple_average_value;
  overall_simple_average_at = 0;
  do
  :: overall_simple_average_at < 14 -> overall_simple_average_record.simple_average_c_14[overall_simple_average_at] = overall_simple_average_value; overall_simple_average_at = overall_simple_average_at + 1
  :: else -> break
  od;
  overall_simple_average_record.sign = overall_simple_average_value;
  overall_simple_average_record.second_unit_flag = overall_simple_average_value;
  overall_simple_average_at = 0;
  do
  :: overall_simple_average_at < 14 -> overall_simple_average_record.day_on_day_comparison_c_14[overall_simple_average_at] = overall_simple_average_value; overall_simple_average_at = overall_simple_average_at + 1
  :: else -> break
  od;
  overall_simple_average_record.second_sign = overall_simple_average_value;
  skip
}

/* each byte of Overall Simple Average set to where it lies, so a field read out of place says so */
inline ramp_overall_simple_average(overall_simple_average_record, overall_simple_average_base) {
  overall_simple_average_record.unit_flag = (overall_simple_average_base + 0 + 1) % 256;
  overall_simple_average_at = 0;
  do
  :: overall_simple_average_at < 14 -> overall_simple_average_record.simple_average_c_14[overall_simple_average_at] = (overall_simple_average_base + 1 + overall_simple_average_at + 1) % 256; overall_simple_average_at = overall_simple_average_at + 1
  :: else -> break
  od;
  overall_simple_average_record.sign = (overall_simple_average_base + 15 + 1) % 256;
  overall_simple_average_record.second_unit_flag = (overall_simple_average_base + 16 + 1) % 256;
  overall_simple_average_at = 0;
  do
  :: overall_simple_average_at < 14 -> overall_simple_average_record.day_on_day_comparison_c_14[overall_simple_average_at] = (overall_simple_average_base + 17 + overall_simple_average_at + 1) % 256; overall_simple_average_at = overall_simple_average_at + 1
  :: else -> break
  od;
  overall_simple_average_record.second_sign = (overall_simple_average_base + 31 + 1) % 256;
  skip
}

/* Overall Simple Average to the wire, 32 bytes from where the cursor stands */
inline encode_overall_simple_average(overall_simple_average_record) {
  wire[at] = overall_simple_average_record.unit_flag; at = at + 1;
  overall_simple_average_at = 0;
  do
  :: overall_simple_average_at < 14 -> wire[at] = overall_simple_average_record.simple_average_c_14[overall_simple_average_at]; at = at + 1; overall_simple_average_at = overall_simple_average_at + 1
  :: else -> break
  od;
  wire[at] = overall_simple_average_record.sign; at = at + 1;
  wire[at] = overall_simple_average_record.second_unit_flag; at = at + 1;
  overall_simple_average_at = 0;
  do
  :: overall_simple_average_at < 14 -> wire[at] = overall_simple_average_record.day_on_day_comparison_c_14[overall_simple_average_at]; at = at + 1; overall_simple_average_at = overall_simple_average_at + 1
  :: else -> break
  od;
  wire[at] = overall_simple_average_record.second_sign; at = at + 1;
  skip
}

/* Overall Simple Average off the wire, 32 bytes from where the cursor stands */
inline decode_overall_simple_average(overall_simple_average_record) {
  overall_simple_average_record.unit_flag = wire[at]; at = at + 1;
  overall_simple_average_at = 0;
  do
  :: overall_simple_average_at < 14 -> overall_simple_average_record.simple_average_c_14[overall_simple_average_at] = wire[at]; at = at + 1; overall_simple_average_at = overall_simple_average_at + 1
  :: else -> break
  od;
  overall_simple_average_record.sign = wire[at]; at = at + 1;
  overall_simple_average_record.second_unit_flag = wire[at]; at = at + 1;
  overall_simple_average_at = 0;
  do
  :: overall_simple_average_at < 14 -> overall_simple_average_record.day_on_day_comparison_c_14[overall_simple_average_at] = wire[at]; at = at + 1; overall_simple_average_at = overall_simple_average_at + 1
  :: else -> break
  od;
  overall_simple_average_record.second_sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Overall Simple Average is what was written, byte for byte */
inline equal_overall_simple_average(overall_simple_average_read, overall_simple_average_written) {
  assert(overall_simple_average_read.unit_flag == overall_simple_average_written.unit_flag);
  overall_simple_average_at = 0;
  do
  :: overall_simple_average_at < 14 -> assert(overall_simple_average_read.simple_average_c_14[overall_simple_average_at] == overall_simple_average_written.simple_average_c_14[overall_simple_average_at]); overall_simple_average_at = overall_simple_average_at + 1
  :: else -> break
  od;
  assert(overall_simple_average_read.sign == overall_simple_average_written.sign);
  assert(overall_simple_average_read.second_unit_flag == overall_simple_average_written.second_unit_flag);
  overall_simple_average_at = 0;
  do
  :: overall_simple_average_at < 14 -> assert(overall_simple_average_read.day_on_day_comparison_c_14[overall_simple_average_at] == overall_simple_average_written.day_on_day_comparison_c_14[overall_simple_average_at]); overall_simple_average_at = overall_simple_average_at + 1
  :: else -> break
  od;
  assert(overall_simple_average_read.second_sign == overall_simple_average_written.second_sign);
  skip
}

/* ---- Overall Divergence Average: 18 bytes ------------------------------------ */

/* Overall Divergence average */
typedef OverallDivergenceAverage {
  byte divergence_average_c_8[8];
  byte sign;
  byte day_on_day_comparison_c_8[8];
  byte second_sign
};

int overall_divergence_average_at;

/* every byte of Overall Divergence Average set to one value */
inline fill_overall_divergence_average(overall_divergence_average_record, overall_divergence_average_value) {
  overall_divergence_average_at = 0;
  do
  :: overall_divergence_average_at < 8 -> overall_divergence_average_record.divergence_average_c_8[overall_divergence_average_at] = overall_divergence_average_value; overall_divergence_average_at = overall_divergence_average_at + 1
  :: else -> break
  od;
  overall_divergence_average_record.sign = overall_divergence_average_value;
  overall_divergence_average_at = 0;
  do
  :: overall_divergence_average_at < 8 -> overall_divergence_average_record.day_on_day_comparison_c_8[overall_divergence_average_at] = overall_divergence_average_value; overall_divergence_average_at = overall_divergence_average_at + 1
  :: else -> break
  od;
  overall_divergence_average_record.second_sign = overall_divergence_average_value;
  skip
}

/* each byte of Overall Divergence Average set to where it lies, so a field read out of place says so */
inline ramp_overall_divergence_average(overall_divergence_average_record, overall_divergence_average_base) {
  overall_divergence_average_at = 0;
  do
  :: overall_divergence_average_at < 8 -> overall_divergence_average_record.divergence_average_c_8[overall_divergence_average_at] = (overall_divergence_average_base + 0 + overall_divergence_average_at + 1) % 256; overall_divergence_average_at = overall_divergence_average_at + 1
  :: else -> break
  od;
  overall_divergence_average_record.sign = (overall_divergence_average_base + 8 + 1) % 256;
  overall_divergence_average_at = 0;
  do
  :: overall_divergence_average_at < 8 -> overall_divergence_average_record.day_on_day_comparison_c_8[overall_divergence_average_at] = (overall_divergence_average_base + 9 + overall_divergence_average_at + 1) % 256; overall_divergence_average_at = overall_divergence_average_at + 1
  :: else -> break
  od;
  overall_divergence_average_record.second_sign = (overall_divergence_average_base + 17 + 1) % 256;
  skip
}

/* Overall Divergence Average to the wire, 18 bytes from where the cursor stands */
inline encode_overall_divergence_average(overall_divergence_average_record) {
  overall_divergence_average_at = 0;
  do
  :: overall_divergence_average_at < 8 -> wire[at] = overall_divergence_average_record.divergence_average_c_8[overall_divergence_average_at]; at = at + 1; overall_divergence_average_at = overall_divergence_average_at + 1
  :: else -> break
  od;
  wire[at] = overall_divergence_average_record.sign; at = at + 1;
  overall_divergence_average_at = 0;
  do
  :: overall_divergence_average_at < 8 -> wire[at] = overall_divergence_average_record.day_on_day_comparison_c_8[overall_divergence_average_at]; at = at + 1; overall_divergence_average_at = overall_divergence_average_at + 1
  :: else -> break
  od;
  wire[at] = overall_divergence_average_record.second_sign; at = at + 1;
  skip
}

/* Overall Divergence Average off the wire, 18 bytes from where the cursor stands */
inline decode_overall_divergence_average(overall_divergence_average_record) {
  overall_divergence_average_at = 0;
  do
  :: overall_divergence_average_at < 8 -> overall_divergence_average_record.divergence_average_c_8[overall_divergence_average_at] = wire[at]; at = at + 1; overall_divergence_average_at = overall_divergence_average_at + 1
  :: else -> break
  od;
  overall_divergence_average_record.sign = wire[at]; at = at + 1;
  overall_divergence_average_at = 0;
  do
  :: overall_divergence_average_at < 8 -> overall_divergence_average_record.day_on_day_comparison_c_8[overall_divergence_average_at] = wire[at]; at = at + 1; overall_divergence_average_at = overall_divergence_average_at + 1
  :: else -> break
  od;
  overall_divergence_average_record.second_sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Overall Divergence Average is what was written, byte for byte */
inline equal_overall_divergence_average(overall_divergence_average_read, overall_divergence_average_written) {
  overall_divergence_average_at = 0;
  do
  :: overall_divergence_average_at < 8 -> assert(overall_divergence_average_read.divergence_average_c_8[overall_divergence_average_at] == overall_divergence_average_written.divergence_average_c_8[overall_divergence_average_at]); overall_divergence_average_at = overall_divergence_average_at + 1
  :: else -> break
  od;
  assert(overall_divergence_average_read.sign == overall_divergence_average_written.sign);
  overall_divergence_average_at = 0;
  do
  :: overall_divergence_average_at < 8 -> assert(overall_divergence_average_read.day_on_day_comparison_c_8[overall_divergence_average_at] == overall_divergence_average_written.day_on_day_comparison_c_8[overall_divergence_average_at]); overall_divergence_average_at = overall_divergence_average_at + 1
  :: else -> break
  od;
  assert(overall_divergence_average_read.second_sign == overall_divergence_average_written.second_sign);
  skip
}

/* ---- Overall Parity Average: 32 bytes ---------------------------------------- */

/* Overall Parity average */
typedef OverallParityAverage {
  byte unit_flag;
  byte parity_average_c_14[14];
  byte sign;
  byte second_unit_flag;
  byte day_on_day_comparison_c_14[14];
  byte second_sign
};

int overall_parity_average_at;

/* every byte of Overall Parity Average set to one value */
inline fill_overall_parity_average(overall_parity_average_record, overall_parity_average_value) {
  overall_parity_average_record.unit_flag = overall_parity_average_value;
  overall_parity_average_at = 0;
  do
  :: overall_parity_average_at < 14 -> overall_parity_average_record.parity_average_c_14[overall_parity_average_at] = overall_parity_average_value; overall_parity_average_at = overall_parity_average_at + 1
  :: else -> break
  od;
  overall_parity_average_record.sign = overall_parity_average_value;
  overall_parity_average_record.second_unit_flag = overall_parity_average_value;
  overall_parity_average_at = 0;
  do
  :: overall_parity_average_at < 14 -> overall_parity_average_record.day_on_day_comparison_c_14[overall_parity_average_at] = overall_parity_average_value; overall_parity_average_at = overall_parity_average_at + 1
  :: else -> break
  od;
  overall_parity_average_record.second_sign = overall_parity_average_value;
  skip
}

/* each byte of Overall Parity Average set to where it lies, so a field read out of place says so */
inline ramp_overall_parity_average(overall_parity_average_record, overall_parity_average_base) {
  overall_parity_average_record.unit_flag = (overall_parity_average_base + 0 + 1) % 256;
  overall_parity_average_at = 0;
  do
  :: overall_parity_average_at < 14 -> overall_parity_average_record.parity_average_c_14[overall_parity_average_at] = (overall_parity_average_base + 1 + overall_parity_average_at + 1) % 256; overall_parity_average_at = overall_parity_average_at + 1
  :: else -> break
  od;
  overall_parity_average_record.sign = (overall_parity_average_base + 15 + 1) % 256;
  overall_parity_average_record.second_unit_flag = (overall_parity_average_base + 16 + 1) % 256;
  overall_parity_average_at = 0;
  do
  :: overall_parity_average_at < 14 -> overall_parity_average_record.day_on_day_comparison_c_14[overall_parity_average_at] = (overall_parity_average_base + 17 + overall_parity_average_at + 1) % 256; overall_parity_average_at = overall_parity_average_at + 1
  :: else -> break
  od;
  overall_parity_average_record.second_sign = (overall_parity_average_base + 31 + 1) % 256;
  skip
}

/* Overall Parity Average to the wire, 32 bytes from where the cursor stands */
inline encode_overall_parity_average(overall_parity_average_record) {
  wire[at] = overall_parity_average_record.unit_flag; at = at + 1;
  overall_parity_average_at = 0;
  do
  :: overall_parity_average_at < 14 -> wire[at] = overall_parity_average_record.parity_average_c_14[overall_parity_average_at]; at = at + 1; overall_parity_average_at = overall_parity_average_at + 1
  :: else -> break
  od;
  wire[at] = overall_parity_average_record.sign; at = at + 1;
  wire[at] = overall_parity_average_record.second_unit_flag; at = at + 1;
  overall_parity_average_at = 0;
  do
  :: overall_parity_average_at < 14 -> wire[at] = overall_parity_average_record.day_on_day_comparison_c_14[overall_parity_average_at]; at = at + 1; overall_parity_average_at = overall_parity_average_at + 1
  :: else -> break
  od;
  wire[at] = overall_parity_average_record.second_sign; at = at + 1;
  skip
}

/* Overall Parity Average off the wire, 32 bytes from where the cursor stands */
inline decode_overall_parity_average(overall_parity_average_record) {
  overall_parity_average_record.unit_flag = wire[at]; at = at + 1;
  overall_parity_average_at = 0;
  do
  :: overall_parity_average_at < 14 -> overall_parity_average_record.parity_average_c_14[overall_parity_average_at] = wire[at]; at = at + 1; overall_parity_average_at = overall_parity_average_at + 1
  :: else -> break
  od;
  overall_parity_average_record.sign = wire[at]; at = at + 1;
  overall_parity_average_record.second_unit_flag = wire[at]; at = at + 1;
  overall_parity_average_at = 0;
  do
  :: overall_parity_average_at < 14 -> overall_parity_average_record.day_on_day_comparison_c_14[overall_parity_average_at] = wire[at]; at = at + 1; overall_parity_average_at = overall_parity_average_at + 1
  :: else -> break
  od;
  overall_parity_average_record.second_sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Overall Parity Average is what was written, byte for byte */
inline equal_overall_parity_average(overall_parity_average_read, overall_parity_average_written) {
  assert(overall_parity_average_read.unit_flag == overall_parity_average_written.unit_flag);
  overall_parity_average_at = 0;
  do
  :: overall_parity_average_at < 14 -> assert(overall_parity_average_read.parity_average_c_14[overall_parity_average_at] == overall_parity_average_written.parity_average_c_14[overall_parity_average_at]); overall_parity_average_at = overall_parity_average_at + 1
  :: else -> break
  od;
  assert(overall_parity_average_read.sign == overall_parity_average_written.sign);
  assert(overall_parity_average_read.second_unit_flag == overall_parity_average_written.second_unit_flag);
  overall_parity_average_at = 0;
  do
  :: overall_parity_average_at < 14 -> assert(overall_parity_average_read.day_on_day_comparison_c_14[overall_parity_average_at] == overall_parity_average_written.day_on_day_comparison_c_14[overall_parity_average_at]); overall_parity_average_at = overall_parity_average_at + 1
  :: else -> break
  od;
  assert(overall_parity_average_read.second_sign == overall_parity_average_written.second_sign);
  skip
}

/* ---- Overall Direct Yield Average: 18 bytes ---------------------------------- */

/* Overall Direct yield average */
typedef OverallDirectYieldAverage {
  byte direct_yield_average_c_8[8];
  byte sign;
  byte day_on_day_comparison_c_8[8];
  byte second_sign
};

int overall_direct_yield_average_at;

/* every byte of Overall Direct Yield Average set to one value */
inline fill_overall_direct_yield_average(overall_direct_yield_average_record, overall_direct_yield_average_value) {
  overall_direct_yield_average_at = 0;
  do
  :: overall_direct_yield_average_at < 8 -> overall_direct_yield_average_record.direct_yield_average_c_8[overall_direct_yield_average_at] = overall_direct_yield_average_value; overall_direct_yield_average_at = overall_direct_yield_average_at + 1
  :: else -> break
  od;
  overall_direct_yield_average_record.sign = overall_direct_yield_average_value;
  overall_direct_yield_average_at = 0;
  do
  :: overall_direct_yield_average_at < 8 -> overall_direct_yield_average_record.day_on_day_comparison_c_8[overall_direct_yield_average_at] = overall_direct_yield_average_value; overall_direct_yield_average_at = overall_direct_yield_average_at + 1
  :: else -> break
  od;
  overall_direct_yield_average_record.second_sign = overall_direct_yield_average_value;
  skip
}

/* each byte of Overall Direct Yield Average set to where it lies, so a field read out of place says so */
inline ramp_overall_direct_yield_average(overall_direct_yield_average_record, overall_direct_yield_average_base) {
  overall_direct_yield_average_at = 0;
  do
  :: overall_direct_yield_average_at < 8 -> overall_direct_yield_average_record.direct_yield_average_c_8[overall_direct_yield_average_at] = (overall_direct_yield_average_base + 0 + overall_direct_yield_average_at + 1) % 256; overall_direct_yield_average_at = overall_direct_yield_average_at + 1
  :: else -> break
  od;
  overall_direct_yield_average_record.sign = (overall_direct_yield_average_base + 8 + 1) % 256;
  overall_direct_yield_average_at = 0;
  do
  :: overall_direct_yield_average_at < 8 -> overall_direct_yield_average_record.day_on_day_comparison_c_8[overall_direct_yield_average_at] = (overall_direct_yield_average_base + 9 + overall_direct_yield_average_at + 1) % 256; overall_direct_yield_average_at = overall_direct_yield_average_at + 1
  :: else -> break
  od;
  overall_direct_yield_average_record.second_sign = (overall_direct_yield_average_base + 17 + 1) % 256;
  skip
}

/* Overall Direct Yield Average to the wire, 18 bytes from where the cursor stands */
inline encode_overall_direct_yield_average(overall_direct_yield_average_record) {
  overall_direct_yield_average_at = 0;
  do
  :: overall_direct_yield_average_at < 8 -> wire[at] = overall_direct_yield_average_record.direct_yield_average_c_8[overall_direct_yield_average_at]; at = at + 1; overall_direct_yield_average_at = overall_direct_yield_average_at + 1
  :: else -> break
  od;
  wire[at] = overall_direct_yield_average_record.sign; at = at + 1;
  overall_direct_yield_average_at = 0;
  do
  :: overall_direct_yield_average_at < 8 -> wire[at] = overall_direct_yield_average_record.day_on_day_comparison_c_8[overall_direct_yield_average_at]; at = at + 1; overall_direct_yield_average_at = overall_direct_yield_average_at + 1
  :: else -> break
  od;
  wire[at] = overall_direct_yield_average_record.second_sign; at = at + 1;
  skip
}

/* Overall Direct Yield Average off the wire, 18 bytes from where the cursor stands */
inline decode_overall_direct_yield_average(overall_direct_yield_average_record) {
  overall_direct_yield_average_at = 0;
  do
  :: overall_direct_yield_average_at < 8 -> overall_direct_yield_average_record.direct_yield_average_c_8[overall_direct_yield_average_at] = wire[at]; at = at + 1; overall_direct_yield_average_at = overall_direct_yield_average_at + 1
  :: else -> break
  od;
  overall_direct_yield_average_record.sign = wire[at]; at = at + 1;
  overall_direct_yield_average_at = 0;
  do
  :: overall_direct_yield_average_at < 8 -> overall_direct_yield_average_record.day_on_day_comparison_c_8[overall_direct_yield_average_at] = wire[at]; at = at + 1; overall_direct_yield_average_at = overall_direct_yield_average_at + 1
  :: else -> break
  od;
  overall_direct_yield_average_record.second_sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Overall Direct Yield Average is what was written, byte for byte */
inline equal_overall_direct_yield_average(overall_direct_yield_average_read, overall_direct_yield_average_written) {
  overall_direct_yield_average_at = 0;
  do
  :: overall_direct_yield_average_at < 8 -> assert(overall_direct_yield_average_read.direct_yield_average_c_8[overall_direct_yield_average_at] == overall_direct_yield_average_written.direct_yield_average_c_8[overall_direct_yield_average_at]); overall_direct_yield_average_at = overall_direct_yield_average_at + 1
  :: else -> break
  od;
  assert(overall_direct_yield_average_read.sign == overall_direct_yield_average_written.sign);
  overall_direct_yield_average_at = 0;
  do
  :: overall_direct_yield_average_at < 8 -> assert(overall_direct_yield_average_read.day_on_day_comparison_c_8[overall_direct_yield_average_at] == overall_direct_yield_average_written.day_on_day_comparison_c_8[overall_direct_yield_average_at]); overall_direct_yield_average_at = overall_direct_yield_average_at + 1
  :: else -> break
  od;
  assert(overall_direct_yield_average_read.second_sign == overall_direct_yield_average_written.second_sign);
  skip
}

/* ---- Overall: 100 bytes ------------------------------------------------------ */

/* Overall */
typedef Overall {
  OverallSimpleAverage overall_simple_average;
  OverallDivergenceAverage overall_divergence_average;
  OverallParityAverage overall_parity_average;
  OverallDirectYieldAverage overall_direct_yield_average
};

/* every byte of Overall set to one value */
inline fill_overall(overall_record, overall_value) {
  fill_overall_simple_average(overall_record.overall_simple_average, overall_value);
  fill_overall_divergence_average(overall_record.overall_divergence_average, overall_value);
  fill_overall_parity_average(overall_record.overall_parity_average, overall_value);
  fill_overall_direct_yield_average(overall_record.overall_direct_yield_average, overall_value);
  skip
}

/* each byte of Overall set to where it lies, so a field read out of place says so */
inline ramp_overall(overall_record, overall_base) {
  ramp_overall_simple_average(overall_record.overall_simple_average, overall_base + 0);
  ramp_overall_divergence_average(overall_record.overall_divergence_average, overall_base + 32);
  ramp_overall_parity_average(overall_record.overall_parity_average, overall_base + 50);
  ramp_overall_direct_yield_average(overall_record.overall_direct_yield_average, overall_base + 82);
  skip
}

/* Overall to the wire, 100 bytes from where the cursor stands */
inline encode_overall(overall_record) {
  encode_overall_simple_average(overall_record.overall_simple_average);
  encode_overall_divergence_average(overall_record.overall_divergence_average);
  encode_overall_parity_average(overall_record.overall_parity_average);
  encode_overall_direct_yield_average(overall_record.overall_direct_yield_average);
  skip
}

/* Overall off the wire, 100 bytes from where the cursor stands */
inline decode_overall(overall_record) {
  decode_overall_simple_average(overall_record.overall_simple_average);
  decode_overall_divergence_average(overall_record.overall_divergence_average);
  decode_overall_parity_average(overall_record.overall_parity_average);
  decode_overall_direct_yield_average(overall_record.overall_direct_yield_average);
  skip
}

/* what was read of Overall is what was written, byte for byte */
inline equal_overall(overall_read, overall_written) {
  equal_overall_simple_average(overall_read.overall_simple_average, overall_written.overall_simple_average);
  equal_overall_divergence_average(overall_read.overall_divergence_average, overall_written.overall_divergence_average);
  equal_overall_parity_average(overall_read.overall_parity_average, overall_written.overall_parity_average);
  equal_overall_direct_yield_average(overall_read.overall_direct_yield_average, overall_written.overall_direct_yield_average);
  skip
}

/* ---- Simple Average: 16 bytes ------------------------------------------------ */

/* Simple average */
typedef SimpleAverage {
  byte unit_flag;
  byte simple_average_c_14[14];
  byte sign
};

int simple_average_at;

/* every byte of Simple Average set to one value */
inline fill_simple_average(simple_average_record, simple_average_value) {
  simple_average_record.unit_flag = simple_average_value;
  simple_average_at = 0;
  do
  :: simple_average_at < 14 -> simple_average_record.simple_average_c_14[simple_average_at] = simple_average_value; simple_average_at = simple_average_at + 1
  :: else -> break
  od;
  simple_average_record.sign = simple_average_value;
  skip
}

/* each byte of Simple Average set to where it lies, so a field read out of place says so */
inline ramp_simple_average(simple_average_record, simple_average_base) {
  simple_average_record.unit_flag = (simple_average_base + 0 + 1) % 256;
  simple_average_at = 0;
  do
  :: simple_average_at < 14 -> simple_average_record.simple_average_c_14[simple_average_at] = (simple_average_base + 1 + simple_average_at + 1) % 256; simple_average_at = simple_average_at + 1
  :: else -> break
  od;
  simple_average_record.sign = (simple_average_base + 15 + 1) % 256;
  skip
}

/* Simple Average to the wire, 16 bytes from where the cursor stands */
inline encode_simple_average(simple_average_record) {
  wire[at] = simple_average_record.unit_flag; at = at + 1;
  simple_average_at = 0;
  do
  :: simple_average_at < 14 -> wire[at] = simple_average_record.simple_average_c_14[simple_average_at]; at = at + 1; simple_average_at = simple_average_at + 1
  :: else -> break
  od;
  wire[at] = simple_average_record.sign; at = at + 1;
  skip
}

/* Simple Average off the wire, 16 bytes from where the cursor stands */
inline decode_simple_average(simple_average_record) {
  simple_average_record.unit_flag = wire[at]; at = at + 1;
  simple_average_at = 0;
  do
  :: simple_average_at < 14 -> simple_average_record.simple_average_c_14[simple_average_at] = wire[at]; at = at + 1; simple_average_at = simple_average_at + 1
  :: else -> break
  od;
  simple_average_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Simple Average is what was written, byte for byte */
inline equal_simple_average(simple_average_read, simple_average_written) {
  assert(simple_average_read.unit_flag == simple_average_written.unit_flag);
  simple_average_at = 0;
  do
  :: simple_average_at < 14 -> assert(simple_average_read.simple_average_c_14[simple_average_at] == simple_average_written.simple_average_c_14[simple_average_at]); simple_average_at = simple_average_at + 1
  :: else -> break
  od;
  assert(simple_average_read.sign == simple_average_written.sign);
  skip
}

/* ---- Divergence Average: 9 bytes --------------------------------------------- */

/* Divergence average */
typedef DivergenceAverage {
  byte divergence_average_c_8[8];
  byte sign
};

int divergence_average_at;

/* every byte of Divergence Average set to one value */
inline fill_divergence_average(divergence_average_record, divergence_average_value) {
  divergence_average_at = 0;
  do
  :: divergence_average_at < 8 -> divergence_average_record.divergence_average_c_8[divergence_average_at] = divergence_average_value; divergence_average_at = divergence_average_at + 1
  :: else -> break
  od;
  divergence_average_record.sign = divergence_average_value;
  skip
}

/* each byte of Divergence Average set to where it lies, so a field read out of place says so */
inline ramp_divergence_average(divergence_average_record, divergence_average_base) {
  divergence_average_at = 0;
  do
  :: divergence_average_at < 8 -> divergence_average_record.divergence_average_c_8[divergence_average_at] = (divergence_average_base + 0 + divergence_average_at + 1) % 256; divergence_average_at = divergence_average_at + 1
  :: else -> break
  od;
  divergence_average_record.sign = (divergence_average_base + 8 + 1) % 256;
  skip
}

/* Divergence Average to the wire, 9 bytes from where the cursor stands */
inline encode_divergence_average(divergence_average_record) {
  divergence_average_at = 0;
  do
  :: divergence_average_at < 8 -> wire[at] = divergence_average_record.divergence_average_c_8[divergence_average_at]; at = at + 1; divergence_average_at = divergence_average_at + 1
  :: else -> break
  od;
  wire[at] = divergence_average_record.sign; at = at + 1;
  skip
}

/* Divergence Average off the wire, 9 bytes from where the cursor stands */
inline decode_divergence_average(divergence_average_record) {
  divergence_average_at = 0;
  do
  :: divergence_average_at < 8 -> divergence_average_record.divergence_average_c_8[divergence_average_at] = wire[at]; at = at + 1; divergence_average_at = divergence_average_at + 1
  :: else -> break
  od;
  divergence_average_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Divergence Average is what was written, byte for byte */
inline equal_divergence_average(divergence_average_read, divergence_average_written) {
  divergence_average_at = 0;
  do
  :: divergence_average_at < 8 -> assert(divergence_average_read.divergence_average_c_8[divergence_average_at] == divergence_average_written.divergence_average_c_8[divergence_average_at]); divergence_average_at = divergence_average_at + 1
  :: else -> break
  od;
  assert(divergence_average_read.sign == divergence_average_written.sign);
  skip
}

/* ---- Parity Average: 16 bytes ------------------------------------------------ */

/* Parity average */
typedef ParityAverage {
  byte unit_flag;
  byte parity_average_c_14[14];
  byte sign
};

int parity_average_at;

/* every byte of Parity Average set to one value */
inline fill_parity_average(parity_average_record, parity_average_value) {
  parity_average_record.unit_flag = parity_average_value;
  parity_average_at = 0;
  do
  :: parity_average_at < 14 -> parity_average_record.parity_average_c_14[parity_average_at] = parity_average_value; parity_average_at = parity_average_at + 1
  :: else -> break
  od;
  parity_average_record.sign = parity_average_value;
  skip
}

/* each byte of Parity Average set to where it lies, so a field read out of place says so */
inline ramp_parity_average(parity_average_record, parity_average_base) {
  parity_average_record.unit_flag = (parity_average_base + 0 + 1) % 256;
  parity_average_at = 0;
  do
  :: parity_average_at < 14 -> parity_average_record.parity_average_c_14[parity_average_at] = (parity_average_base + 1 + parity_average_at + 1) % 256; parity_average_at = parity_average_at + 1
  :: else -> break
  od;
  parity_average_record.sign = (parity_average_base + 15 + 1) % 256;
  skip
}

/* Parity Average to the wire, 16 bytes from where the cursor stands */
inline encode_parity_average(parity_average_record) {
  wire[at] = parity_average_record.unit_flag; at = at + 1;
  parity_average_at = 0;
  do
  :: parity_average_at < 14 -> wire[at] = parity_average_record.parity_average_c_14[parity_average_at]; at = at + 1; parity_average_at = parity_average_at + 1
  :: else -> break
  od;
  wire[at] = parity_average_record.sign; at = at + 1;
  skip
}

/* Parity Average off the wire, 16 bytes from where the cursor stands */
inline decode_parity_average(parity_average_record) {
  parity_average_record.unit_flag = wire[at]; at = at + 1;
  parity_average_at = 0;
  do
  :: parity_average_at < 14 -> parity_average_record.parity_average_c_14[parity_average_at] = wire[at]; at = at + 1; parity_average_at = parity_average_at + 1
  :: else -> break
  od;
  parity_average_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Parity Average is what was written, byte for byte */
inline equal_parity_average(parity_average_read, parity_average_written) {
  assert(parity_average_read.unit_flag == parity_average_written.unit_flag);
  parity_average_at = 0;
  do
  :: parity_average_at < 14 -> assert(parity_average_read.parity_average_c_14[parity_average_at] == parity_average_written.parity_average_c_14[parity_average_at]); parity_average_at = parity_average_at + 1
  :: else -> break
  od;
  assert(parity_average_read.sign == parity_average_written.sign);
  skip
}

/* ---- Direct Yield Average: 9 bytes ------------------------------------------- */

/* Direct yield average */
typedef DirectYieldAverage {
  byte direct_yield_average_c_8[8];
  byte sign
};

int direct_yield_average_at;

/* every byte of Direct Yield Average set to one value */
inline fill_direct_yield_average(direct_yield_average_record, direct_yield_average_value) {
  direct_yield_average_at = 0;
  do
  :: direct_yield_average_at < 8 -> direct_yield_average_record.direct_yield_average_c_8[direct_yield_average_at] = direct_yield_average_value; direct_yield_average_at = direct_yield_average_at + 1
  :: else -> break
  od;
  direct_yield_average_record.sign = direct_yield_average_value;
  skip
}

/* each byte of Direct Yield Average set to where it lies, so a field read out of place says so */
inline ramp_direct_yield_average(direct_yield_average_record, direct_yield_average_base) {
  direct_yield_average_at = 0;
  do
  :: direct_yield_average_at < 8 -> direct_yield_average_record.direct_yield_average_c_8[direct_yield_average_at] = (direct_yield_average_base + 0 + direct_yield_average_at + 1) % 256; direct_yield_average_at = direct_yield_average_at + 1
  :: else -> break
  od;
  direct_yield_average_record.sign = (direct_yield_average_base + 8 + 1) % 256;
  skip
}

/* Direct Yield Average to the wire, 9 bytes from where the cursor stands */
inline encode_direct_yield_average(direct_yield_average_record) {
  direct_yield_average_at = 0;
  do
  :: direct_yield_average_at < 8 -> wire[at] = direct_yield_average_record.direct_yield_average_c_8[direct_yield_average_at]; at = at + 1; direct_yield_average_at = direct_yield_average_at + 1
  :: else -> break
  od;
  wire[at] = direct_yield_average_record.sign; at = at + 1;
  skip
}

/* Direct Yield Average off the wire, 9 bytes from where the cursor stands */
inline decode_direct_yield_average(direct_yield_average_record) {
  direct_yield_average_at = 0;
  do
  :: direct_yield_average_at < 8 -> direct_yield_average_record.direct_yield_average_c_8[direct_yield_average_at] = wire[at]; at = at + 1; direct_yield_average_at = direct_yield_average_at + 1
  :: else -> break
  od;
  direct_yield_average_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Direct Yield Average is what was written, byte for byte */
inline equal_direct_yield_average(direct_yield_average_read, direct_yield_average_written) {
  direct_yield_average_at = 0;
  do
  :: direct_yield_average_at < 8 -> assert(direct_yield_average_read.direct_yield_average_c_8[direct_yield_average_at] == direct_yield_average_written.direct_yield_average_c_8[direct_yield_average_at]); direct_yield_average_at = direct_yield_average_at + 1
  :: else -> break
  od;
  assert(direct_yield_average_read.sign == direct_yield_average_written.sign);
  skip
}

/* ---- Parity 100 Or Higher: 50 bytes ------------------------------------------ */

/* Parity 100 or higher */
typedef Parity100OrHigher {
  SimpleAverage simple_average;
  DivergenceAverage divergence_average;
  ParityAverage parity_average;
  DirectYieldAverage direct_yield_average
};

/* every byte of Parity 100 Or Higher set to one value */
inline fill_parity100_or_higher(parity100_or_higher_record, parity100_or_higher_value) {
  fill_simple_average(parity100_or_higher_record.simple_average, parity100_or_higher_value);
  fill_divergence_average(parity100_or_higher_record.divergence_average, parity100_or_higher_value);
  fill_parity_average(parity100_or_higher_record.parity_average, parity100_or_higher_value);
  fill_direct_yield_average(parity100_or_higher_record.direct_yield_average, parity100_or_higher_value);
  skip
}

/* each byte of Parity 100 Or Higher set to where it lies, so a field read out of place says so */
inline ramp_parity100_or_higher(parity100_or_higher_record, parity100_or_higher_base) {
  ramp_simple_average(parity100_or_higher_record.simple_average, parity100_or_higher_base + 0);
  ramp_divergence_average(parity100_or_higher_record.divergence_average, parity100_or_higher_base + 16);
  ramp_parity_average(parity100_or_higher_record.parity_average, parity100_or_higher_base + 25);
  ramp_direct_yield_average(parity100_or_higher_record.direct_yield_average, parity100_or_higher_base + 41);
  skip
}

/* Parity 100 Or Higher to the wire, 50 bytes from where the cursor stands */
inline encode_parity100_or_higher(parity100_or_higher_record) {
  encode_simple_average(parity100_or_higher_record.simple_average);
  encode_divergence_average(parity100_or_higher_record.divergence_average);
  encode_parity_average(parity100_or_higher_record.parity_average);
  encode_direct_yield_average(parity100_or_higher_record.direct_yield_average);
  skip
}

/* Parity 100 Or Higher off the wire, 50 bytes from where the cursor stands */
inline decode_parity100_or_higher(parity100_or_higher_record) {
  decode_simple_average(parity100_or_higher_record.simple_average);
  decode_divergence_average(parity100_or_higher_record.divergence_average);
  decode_parity_average(parity100_or_higher_record.parity_average);
  decode_direct_yield_average(parity100_or_higher_record.direct_yield_average);
  skip
}

/* what was read of Parity 100 Or Higher is what was written, byte for byte */
inline equal_parity100_or_higher(parity100_or_higher_read, parity100_or_higher_written) {
  equal_simple_average(parity100_or_higher_read.simple_average, parity100_or_higher_written.simple_average);
  equal_divergence_average(parity100_or_higher_read.divergence_average, parity100_or_higher_written.divergence_average);
  equal_parity_average(parity100_or_higher_read.parity_average, parity100_or_higher_written.parity_average);
  equal_direct_yield_average(parity100_or_higher_read.direct_yield_average, parity100_or_higher_written.direct_yield_average);
  skip
}

/* ---- Parity Less Than 100: 50 bytes ------------------------------------------ */

/* Parity less than 100 */
typedef ParityLessThan100 {
  SimpleAverage simple_average;
  DivergenceAverage divergence_average;
  ParityAverage parity_average;
  DirectYieldAverage direct_yield_average
};

/* every byte of Parity Less Than 100 set to one value */
inline fill_parity_less_than100(parity_less_than100_record, parity_less_than100_value) {
  fill_simple_average(parity_less_than100_record.simple_average, parity_less_than100_value);
  fill_divergence_average(parity_less_than100_record.divergence_average, parity_less_than100_value);
  fill_parity_average(parity_less_than100_record.parity_average, parity_less_than100_value);
  fill_direct_yield_average(parity_less_than100_record.direct_yield_average, parity_less_than100_value);
  skip
}

/* each byte of Parity Less Than 100 set to where it lies, so a field read out of place says so */
inline ramp_parity_less_than100(parity_less_than100_record, parity_less_than100_base) {
  ramp_simple_average(parity_less_than100_record.simple_average, parity_less_than100_base + 0);
  ramp_divergence_average(parity_less_than100_record.divergence_average, parity_less_than100_base + 16);
  ramp_parity_average(parity_less_than100_record.parity_average, parity_less_than100_base + 25);
  ramp_direct_yield_average(parity_less_than100_record.direct_yield_average, parity_less_than100_base + 41);
  skip
}

/* Parity Less Than 100 to the wire, 50 bytes from where the cursor stands */
inline encode_parity_less_than100(parity_less_than100_record) {
  encode_simple_average(parity_less_than100_record.simple_average);
  encode_divergence_average(parity_less_than100_record.divergence_average);
  encode_parity_average(parity_less_than100_record.parity_average);
  encode_direct_yield_average(parity_less_than100_record.direct_yield_average);
  skip
}

/* Parity Less Than 100 off the wire, 50 bytes from where the cursor stands */
inline decode_parity_less_than100(parity_less_than100_record) {
  decode_simple_average(parity_less_than100_record.simple_average);
  decode_divergence_average(parity_less_than100_record.divergence_average);
  decode_parity_average(parity_less_than100_record.parity_average);
  decode_direct_yield_average(parity_less_than100_record.direct_yield_average);
  skip
}

/* what was read of Parity Less Than 100 is what was written, byte for byte */
inline equal_parity_less_than100(parity_less_than100_read, parity_less_than100_written) {
  equal_simple_average(parity_less_than100_read.simple_average, parity_less_than100_written.simple_average);
  equal_divergence_average(parity_less_than100_read.divergence_average, parity_less_than100_written.divergence_average);
  equal_parity_average(parity_less_than100_read.parity_average, parity_less_than100_written.parity_average);
  equal_direct_yield_average(parity_less_than100_read.direct_yield_average, parity_less_than100_written.direct_yield_average);
  skip
}

/* ---- Japanese Yen Cb Indicator Message: 208 bytes ---------------------------- */

/* In this tag, CB indicator (overall, parity 100 or higher, and parity less than 100) information will be set. This data appears as part of a statistics message. */
typedef JapaneseYenCbIndicatorMessage {
  byte reserved_2[2];
  byte output_time[6];
  Overall overall;
  Parity100OrHigher parity_100_or_higher;
  ParityLessThan100 parity_less_than_100
};

int japanese_yen_cb_indicator_message_at;

/* every byte of Japanese Yen Cb Indicator Message set to one value */
inline fill_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_record, japanese_yen_cb_indicator_message_value) {
  japanese_yen_cb_indicator_message_at = 0;
  do
  :: japanese_yen_cb_indicator_message_at < 2 -> japanese_yen_cb_indicator_message_record.reserved_2[japanese_yen_cb_indicator_message_at] = japanese_yen_cb_indicator_message_value; japanese_yen_cb_indicator_message_at = japanese_yen_cb_indicator_message_at + 1
  :: else -> break
  od;
  japanese_yen_cb_indicator_message_at = 0;
  do
  :: japanese_yen_cb_indicator_message_at < 6 -> japanese_yen_cb_indicator_message_record.output_time[japanese_yen_cb_indicator_message_at] = japanese_yen_cb_indicator_message_value; japanese_yen_cb_indicator_message_at = japanese_yen_cb_indicator_message_at + 1
  :: else -> break
  od;
  fill_overall(japanese_yen_cb_indicator_message_record.overall, japanese_yen_cb_indicator_message_value);
  fill_parity100_or_higher(japanese_yen_cb_indicator_message_record.parity_100_or_higher, japanese_yen_cb_indicator_message_value);
  fill_parity_less_than100(japanese_yen_cb_indicator_message_record.parity_less_than_100, japanese_yen_cb_indicator_message_value);
  skip
}

/* each byte of Japanese Yen Cb Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_record, japanese_yen_cb_indicator_message_base) {
  japanese_yen_cb_indicator_message_at = 0;
  do
  :: japanese_yen_cb_indicator_message_at < 2 -> japanese_yen_cb_indicator_message_record.reserved_2[japanese_yen_cb_indicator_message_at] = (japanese_yen_cb_indicator_message_base + 0 + japanese_yen_cb_indicator_message_at + 1) % 256; japanese_yen_cb_indicator_message_at = japanese_yen_cb_indicator_message_at + 1
  :: else -> break
  od;
  japanese_yen_cb_indicator_message_at = 0;
  do
  :: japanese_yen_cb_indicator_message_at < 6 -> japanese_yen_cb_indicator_message_record.output_time[japanese_yen_cb_indicator_message_at] = (japanese_yen_cb_indicator_message_base + 2 + japanese_yen_cb_indicator_message_at + 1) % 256; japanese_yen_cb_indicator_message_at = japanese_yen_cb_indicator_message_at + 1
  :: else -> break
  od;
  ramp_overall(japanese_yen_cb_indicator_message_record.overall, japanese_yen_cb_indicator_message_base + 8);
  ramp_parity100_or_higher(japanese_yen_cb_indicator_message_record.parity_100_or_higher, japanese_yen_cb_indicator_message_base + 108);
  ramp_parity_less_than100(japanese_yen_cb_indicator_message_record.parity_less_than_100, japanese_yen_cb_indicator_message_base + 158);
  skip
}

/* Japanese Yen Cb Indicator Message to the wire, 208 bytes from where the cursor stands */
inline encode_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_record) {
  japanese_yen_cb_indicator_message_at = 0;
  do
  :: japanese_yen_cb_indicator_message_at < 2 -> wire[at] = japanese_yen_cb_indicator_message_record.reserved_2[japanese_yen_cb_indicator_message_at]; at = at + 1; japanese_yen_cb_indicator_message_at = japanese_yen_cb_indicator_message_at + 1
  :: else -> break
  od;
  japanese_yen_cb_indicator_message_at = 0;
  do
  :: japanese_yen_cb_indicator_message_at < 6 -> wire[at] = japanese_yen_cb_indicator_message_record.output_time[japanese_yen_cb_indicator_message_at]; at = at + 1; japanese_yen_cb_indicator_message_at = japanese_yen_cb_indicator_message_at + 1
  :: else -> break
  od;
  encode_overall(japanese_yen_cb_indicator_message_record.overall);
  encode_parity100_or_higher(japanese_yen_cb_indicator_message_record.parity_100_or_higher);
  encode_parity_less_than100(japanese_yen_cb_indicator_message_record.parity_less_than_100);
  skip
}

/* Japanese Yen Cb Indicator Message off the wire, 208 bytes from where the cursor stands */
inline decode_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_record) {
  japanese_yen_cb_indicator_message_at = 0;
  do
  :: japanese_yen_cb_indicator_message_at < 2 -> japanese_yen_cb_indicator_message_record.reserved_2[japanese_yen_cb_indicator_message_at] = wire[at]; at = at + 1; japanese_yen_cb_indicator_message_at = japanese_yen_cb_indicator_message_at + 1
  :: else -> break
  od;
  japanese_yen_cb_indicator_message_at = 0;
  do
  :: japanese_yen_cb_indicator_message_at < 6 -> japanese_yen_cb_indicator_message_record.output_time[japanese_yen_cb_indicator_message_at] = wire[at]; at = at + 1; japanese_yen_cb_indicator_message_at = japanese_yen_cb_indicator_message_at + 1
  :: else -> break
  od;
  decode_overall(japanese_yen_cb_indicator_message_record.overall);
  decode_parity100_or_higher(japanese_yen_cb_indicator_message_record.parity_100_or_higher);
  decode_parity_less_than100(japanese_yen_cb_indicator_message_record.parity_less_than_100);
  skip
}

/* what was read of Japanese Yen Cb Indicator Message is what was written, byte for byte */
inline equal_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_read, japanese_yen_cb_indicator_message_written) {
  japanese_yen_cb_indicator_message_at = 0;
  do
  :: japanese_yen_cb_indicator_message_at < 2 -> assert(japanese_yen_cb_indicator_message_read.reserved_2[japanese_yen_cb_indicator_message_at] == japanese_yen_cb_indicator_message_written.reserved_2[japanese_yen_cb_indicator_message_at]); japanese_yen_cb_indicator_message_at = japanese_yen_cb_indicator_message_at + 1
  :: else -> break
  od;
  japanese_yen_cb_indicator_message_at = 0;
  do
  :: japanese_yen_cb_indicator_message_at < 6 -> assert(japanese_yen_cb_indicator_message_read.output_time[japanese_yen_cb_indicator_message_at] == japanese_yen_cb_indicator_message_written.output_time[japanese_yen_cb_indicator_message_at]); japanese_yen_cb_indicator_message_at = japanese_yen_cb_indicator_message_at + 1
  :: else -> break
  od;
  equal_overall(japanese_yen_cb_indicator_message_read.overall, japanese_yen_cb_indicator_message_written.overall);
  equal_parity100_or_higher(japanese_yen_cb_indicator_message_read.parity_100_or_higher, japanese_yen_cb_indicator_message_written.parity_100_or_higher);
  equal_parity_less_than100(japanese_yen_cb_indicator_message_read.parity_less_than_100, japanese_yen_cb_indicator_message_written.parity_less_than_100);
  skip
}

/* ---- Number Of Active Issues: 10 bytes --------------------------------------- */

/* Number of active issues */
typedef NumberOfActiveIssues {
  byte number_of_issues[5];
  byte ratio[5]
};

int number_of_active_issues_at;

/* every byte of Number Of Active Issues set to one value */
inline fill_number_of_active_issues(number_of_active_issues_record, number_of_active_issues_value) {
  number_of_active_issues_at = 0;
  do
  :: number_of_active_issues_at < 5 -> number_of_active_issues_record.number_of_issues[number_of_active_issues_at] = number_of_active_issues_value; number_of_active_issues_at = number_of_active_issues_at + 1
  :: else -> break
  od;
  number_of_active_issues_at = 0;
  do
  :: number_of_active_issues_at < 5 -> number_of_active_issues_record.ratio[number_of_active_issues_at] = number_of_active_issues_value; number_of_active_issues_at = number_of_active_issues_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Number Of Active Issues set to where it lies, so a field read out of place says so */
inline ramp_number_of_active_issues(number_of_active_issues_record, number_of_active_issues_base) {
  number_of_active_issues_at = 0;
  do
  :: number_of_active_issues_at < 5 -> number_of_active_issues_record.number_of_issues[number_of_active_issues_at] = (number_of_active_issues_base + 0 + number_of_active_issues_at + 1) % 256; number_of_active_issues_at = number_of_active_issues_at + 1
  :: else -> break
  od;
  number_of_active_issues_at = 0;
  do
  :: number_of_active_issues_at < 5 -> number_of_active_issues_record.ratio[number_of_active_issues_at] = (number_of_active_issues_base + 5 + number_of_active_issues_at + 1) % 256; number_of_active_issues_at = number_of_active_issues_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Active Issues to the wire, 10 bytes from where the cursor stands */
inline encode_number_of_active_issues(number_of_active_issues_record) {
  number_of_active_issues_at = 0;
  do
  :: number_of_active_issues_at < 5 -> wire[at] = number_of_active_issues_record.number_of_issues[number_of_active_issues_at]; at = at + 1; number_of_active_issues_at = number_of_active_issues_at + 1
  :: else -> break
  od;
  number_of_active_issues_at = 0;
  do
  :: number_of_active_issues_at < 5 -> wire[at] = number_of_active_issues_record.ratio[number_of_active_issues_at]; at = at + 1; number_of_active_issues_at = number_of_active_issues_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Active Issues off the wire, 10 bytes from where the cursor stands */
inline decode_number_of_active_issues(number_of_active_issues_record) {
  number_of_active_issues_at = 0;
  do
  :: number_of_active_issues_at < 5 -> number_of_active_issues_record.number_of_issues[number_of_active_issues_at] = wire[at]; at = at + 1; number_of_active_issues_at = number_of_active_issues_at + 1
  :: else -> break
  od;
  number_of_active_issues_at = 0;
  do
  :: number_of_active_issues_at < 5 -> number_of_active_issues_record.ratio[number_of_active_issues_at] = wire[at]; at = at + 1; number_of_active_issues_at = number_of_active_issues_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Number Of Active Issues is what was written, byte for byte */
inline equal_number_of_active_issues(number_of_active_issues_read, number_of_active_issues_written) {
  number_of_active_issues_at = 0;
  do
  :: number_of_active_issues_at < 5 -> assert(number_of_active_issues_read.number_of_issues[number_of_active_issues_at] == number_of_active_issues_written.number_of_issues[number_of_active_issues_at]); number_of_active_issues_at = number_of_active_issues_at + 1
  :: else -> break
  od;
  number_of_active_issues_at = 0;
  do
  :: number_of_active_issues_at < 5 -> assert(number_of_active_issues_read.ratio[number_of_active_issues_at] == number_of_active_issues_written.ratio[number_of_active_issues_at]); number_of_active_issues_at = number_of_active_issues_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Number Of Gainers: 10 bytes --------------------------------------------- */

/* Number of gainers */
typedef NumberOfGainers {
  byte number_of_issues[5];
  byte ratio[5]
};

int number_of_gainers_at;

/* every byte of Number Of Gainers set to one value */
inline fill_number_of_gainers(number_of_gainers_record, number_of_gainers_value) {
  number_of_gainers_at = 0;
  do
  :: number_of_gainers_at < 5 -> number_of_gainers_record.number_of_issues[number_of_gainers_at] = number_of_gainers_value; number_of_gainers_at = number_of_gainers_at + 1
  :: else -> break
  od;
  number_of_gainers_at = 0;
  do
  :: number_of_gainers_at < 5 -> number_of_gainers_record.ratio[number_of_gainers_at] = number_of_gainers_value; number_of_gainers_at = number_of_gainers_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Number Of Gainers set to where it lies, so a field read out of place says so */
inline ramp_number_of_gainers(number_of_gainers_record, number_of_gainers_base) {
  number_of_gainers_at = 0;
  do
  :: number_of_gainers_at < 5 -> number_of_gainers_record.number_of_issues[number_of_gainers_at] = (number_of_gainers_base + 0 + number_of_gainers_at + 1) % 256; number_of_gainers_at = number_of_gainers_at + 1
  :: else -> break
  od;
  number_of_gainers_at = 0;
  do
  :: number_of_gainers_at < 5 -> number_of_gainers_record.ratio[number_of_gainers_at] = (number_of_gainers_base + 5 + number_of_gainers_at + 1) % 256; number_of_gainers_at = number_of_gainers_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Gainers to the wire, 10 bytes from where the cursor stands */
inline encode_number_of_gainers(number_of_gainers_record) {
  number_of_gainers_at = 0;
  do
  :: number_of_gainers_at < 5 -> wire[at] = number_of_gainers_record.number_of_issues[number_of_gainers_at]; at = at + 1; number_of_gainers_at = number_of_gainers_at + 1
  :: else -> break
  od;
  number_of_gainers_at = 0;
  do
  :: number_of_gainers_at < 5 -> wire[at] = number_of_gainers_record.ratio[number_of_gainers_at]; at = at + 1; number_of_gainers_at = number_of_gainers_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Gainers off the wire, 10 bytes from where the cursor stands */
inline decode_number_of_gainers(number_of_gainers_record) {
  number_of_gainers_at = 0;
  do
  :: number_of_gainers_at < 5 -> number_of_gainers_record.number_of_issues[number_of_gainers_at] = wire[at]; at = at + 1; number_of_gainers_at = number_of_gainers_at + 1
  :: else -> break
  od;
  number_of_gainers_at = 0;
  do
  :: number_of_gainers_at < 5 -> number_of_gainers_record.ratio[number_of_gainers_at] = wire[at]; at = at + 1; number_of_gainers_at = number_of_gainers_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Number Of Gainers is what was written, byte for byte */
inline equal_number_of_gainers(number_of_gainers_read, number_of_gainers_written) {
  number_of_gainers_at = 0;
  do
  :: number_of_gainers_at < 5 -> assert(number_of_gainers_read.number_of_issues[number_of_gainers_at] == number_of_gainers_written.number_of_issues[number_of_gainers_at]); number_of_gainers_at = number_of_gainers_at + 1
  :: else -> break
  od;
  number_of_gainers_at = 0;
  do
  :: number_of_gainers_at < 5 -> assert(number_of_gainers_read.ratio[number_of_gainers_at] == number_of_gainers_written.ratio[number_of_gainers_at]); number_of_gainers_at = number_of_gainers_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Number Of Decliners: 10 bytes ------------------------------------------- */

/* Number of decliners */
typedef NumberOfDecliners {
  byte number_of_issues[5];
  byte ratio[5]
};

int number_of_decliners_at;

/* every byte of Number Of Decliners set to one value */
inline fill_number_of_decliners(number_of_decliners_record, number_of_decliners_value) {
  number_of_decliners_at = 0;
  do
  :: number_of_decliners_at < 5 -> number_of_decliners_record.number_of_issues[number_of_decliners_at] = number_of_decliners_value; number_of_decliners_at = number_of_decliners_at + 1
  :: else -> break
  od;
  number_of_decliners_at = 0;
  do
  :: number_of_decliners_at < 5 -> number_of_decliners_record.ratio[number_of_decliners_at] = number_of_decliners_value; number_of_decliners_at = number_of_decliners_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Number Of Decliners set to where it lies, so a field read out of place says so */
inline ramp_number_of_decliners(number_of_decliners_record, number_of_decliners_base) {
  number_of_decliners_at = 0;
  do
  :: number_of_decliners_at < 5 -> number_of_decliners_record.number_of_issues[number_of_decliners_at] = (number_of_decliners_base + 0 + number_of_decliners_at + 1) % 256; number_of_decliners_at = number_of_decliners_at + 1
  :: else -> break
  od;
  number_of_decliners_at = 0;
  do
  :: number_of_decliners_at < 5 -> number_of_decliners_record.ratio[number_of_decliners_at] = (number_of_decliners_base + 5 + number_of_decliners_at + 1) % 256; number_of_decliners_at = number_of_decliners_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Decliners to the wire, 10 bytes from where the cursor stands */
inline encode_number_of_decliners(number_of_decliners_record) {
  number_of_decliners_at = 0;
  do
  :: number_of_decliners_at < 5 -> wire[at] = number_of_decliners_record.number_of_issues[number_of_decliners_at]; at = at + 1; number_of_decliners_at = number_of_decliners_at + 1
  :: else -> break
  od;
  number_of_decliners_at = 0;
  do
  :: number_of_decliners_at < 5 -> wire[at] = number_of_decliners_record.ratio[number_of_decliners_at]; at = at + 1; number_of_decliners_at = number_of_decliners_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Decliners off the wire, 10 bytes from where the cursor stands */
inline decode_number_of_decliners(number_of_decliners_record) {
  number_of_decliners_at = 0;
  do
  :: number_of_decliners_at < 5 -> number_of_decliners_record.number_of_issues[number_of_decliners_at] = wire[at]; at = at + 1; number_of_decliners_at = number_of_decliners_at + 1
  :: else -> break
  od;
  number_of_decliners_at = 0;
  do
  :: number_of_decliners_at < 5 -> number_of_decliners_record.ratio[number_of_decliners_at] = wire[at]; at = at + 1; number_of_decliners_at = number_of_decliners_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Number Of Decliners is what was written, byte for byte */
inline equal_number_of_decliners(number_of_decliners_read, number_of_decliners_written) {
  number_of_decliners_at = 0;
  do
  :: number_of_decliners_at < 5 -> assert(number_of_decliners_read.number_of_issues[number_of_decliners_at] == number_of_decliners_written.number_of_issues[number_of_decliners_at]); number_of_decliners_at = number_of_decliners_at + 1
  :: else -> break
  od;
  number_of_decliners_at = 0;
  do
  :: number_of_decliners_at < 5 -> assert(number_of_decliners_read.ratio[number_of_decliners_at] == number_of_decliners_written.ratio[number_of_decliners_at]); number_of_decliners_at = number_of_decliners_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Number Of Issues With No Change: 10 bytes ------------------------------- */

/* Number of issues with no change */
typedef NumberOfIssuesWithNoChange {
  byte number_of_issues[5];
  byte ratio[5]
};

int number_of_issues_with_no_change_at;

/* every byte of Number Of Issues With No Change set to one value */
inline fill_number_of_issues_with_no_change(number_of_issues_with_no_change_record, number_of_issues_with_no_change_value) {
  number_of_issues_with_no_change_at = 0;
  do
  :: number_of_issues_with_no_change_at < 5 -> number_of_issues_with_no_change_record.number_of_issues[number_of_issues_with_no_change_at] = number_of_issues_with_no_change_value; number_of_issues_with_no_change_at = number_of_issues_with_no_change_at + 1
  :: else -> break
  od;
  number_of_issues_with_no_change_at = 0;
  do
  :: number_of_issues_with_no_change_at < 5 -> number_of_issues_with_no_change_record.ratio[number_of_issues_with_no_change_at] = number_of_issues_with_no_change_value; number_of_issues_with_no_change_at = number_of_issues_with_no_change_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Number Of Issues With No Change set to where it lies, so a field read out of place says so */
inline ramp_number_of_issues_with_no_change(number_of_issues_with_no_change_record, number_of_issues_with_no_change_base) {
  number_of_issues_with_no_change_at = 0;
  do
  :: number_of_issues_with_no_change_at < 5 -> number_of_issues_with_no_change_record.number_of_issues[number_of_issues_with_no_change_at] = (number_of_issues_with_no_change_base + 0 + number_of_issues_with_no_change_at + 1) % 256; number_of_issues_with_no_change_at = number_of_issues_with_no_change_at + 1
  :: else -> break
  od;
  number_of_issues_with_no_change_at = 0;
  do
  :: number_of_issues_with_no_change_at < 5 -> number_of_issues_with_no_change_record.ratio[number_of_issues_with_no_change_at] = (number_of_issues_with_no_change_base + 5 + number_of_issues_with_no_change_at + 1) % 256; number_of_issues_with_no_change_at = number_of_issues_with_no_change_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Issues With No Change to the wire, 10 bytes from where the cursor stands */
inline encode_number_of_issues_with_no_change(number_of_issues_with_no_change_record) {
  number_of_issues_with_no_change_at = 0;
  do
  :: number_of_issues_with_no_change_at < 5 -> wire[at] = number_of_issues_with_no_change_record.number_of_issues[number_of_issues_with_no_change_at]; at = at + 1; number_of_issues_with_no_change_at = number_of_issues_with_no_change_at + 1
  :: else -> break
  od;
  number_of_issues_with_no_change_at = 0;
  do
  :: number_of_issues_with_no_change_at < 5 -> wire[at] = number_of_issues_with_no_change_record.ratio[number_of_issues_with_no_change_at]; at = at + 1; number_of_issues_with_no_change_at = number_of_issues_with_no_change_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Issues With No Change off the wire, 10 bytes from where the cursor stands */
inline decode_number_of_issues_with_no_change(number_of_issues_with_no_change_record) {
  number_of_issues_with_no_change_at = 0;
  do
  :: number_of_issues_with_no_change_at < 5 -> number_of_issues_with_no_change_record.number_of_issues[number_of_issues_with_no_change_at] = wire[at]; at = at + 1; number_of_issues_with_no_change_at = number_of_issues_with_no_change_at + 1
  :: else -> break
  od;
  number_of_issues_with_no_change_at = 0;
  do
  :: number_of_issues_with_no_change_at < 5 -> number_of_issues_with_no_change_record.ratio[number_of_issues_with_no_change_at] = wire[at]; at = at + 1; number_of_issues_with_no_change_at = number_of_issues_with_no_change_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Number Of Issues With No Change is what was written, byte for byte */
inline equal_number_of_issues_with_no_change(number_of_issues_with_no_change_read, number_of_issues_with_no_change_written) {
  number_of_issues_with_no_change_at = 0;
  do
  :: number_of_issues_with_no_change_at < 5 -> assert(number_of_issues_with_no_change_read.number_of_issues[number_of_issues_with_no_change_at] == number_of_issues_with_no_change_written.number_of_issues[number_of_issues_with_no_change_at]); number_of_issues_with_no_change_at = number_of_issues_with_no_change_at + 1
  :: else -> break
  od;
  number_of_issues_with_no_change_at = 0;
  do
  :: number_of_issues_with_no_change_at < 5 -> assert(number_of_issues_with_no_change_read.ratio[number_of_issues_with_no_change_at] == number_of_issues_with_no_change_written.ratio[number_of_issues_with_no_change_at]); number_of_issues_with_no_change_at = number_of_issues_with_no_change_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Number Of Issues With No Comparison: 10 bytes --------------------------- */

/* Number of issues with no comparison */
typedef NumberOfIssuesWithNoComparison {
  byte number_of_issues[5];
  byte ratio[5]
};

int number_of_issues_with_no_comparison_at;

/* every byte of Number Of Issues With No Comparison set to one value */
inline fill_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_record, number_of_issues_with_no_comparison_value) {
  number_of_issues_with_no_comparison_at = 0;
  do
  :: number_of_issues_with_no_comparison_at < 5 -> number_of_issues_with_no_comparison_record.number_of_issues[number_of_issues_with_no_comparison_at] = number_of_issues_with_no_comparison_value; number_of_issues_with_no_comparison_at = number_of_issues_with_no_comparison_at + 1
  :: else -> break
  od;
  number_of_issues_with_no_comparison_at = 0;
  do
  :: number_of_issues_with_no_comparison_at < 5 -> number_of_issues_with_no_comparison_record.ratio[number_of_issues_with_no_comparison_at] = number_of_issues_with_no_comparison_value; number_of_issues_with_no_comparison_at = number_of_issues_with_no_comparison_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Number Of Issues With No Comparison set to where it lies, so a field read out of place says so */
inline ramp_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_record, number_of_issues_with_no_comparison_base) {
  number_of_issues_with_no_comparison_at = 0;
  do
  :: number_of_issues_with_no_comparison_at < 5 -> number_of_issues_with_no_comparison_record.number_of_issues[number_of_issues_with_no_comparison_at] = (number_of_issues_with_no_comparison_base + 0 + number_of_issues_with_no_comparison_at + 1) % 256; number_of_issues_with_no_comparison_at = number_of_issues_with_no_comparison_at + 1
  :: else -> break
  od;
  number_of_issues_with_no_comparison_at = 0;
  do
  :: number_of_issues_with_no_comparison_at < 5 -> number_of_issues_with_no_comparison_record.ratio[number_of_issues_with_no_comparison_at] = (number_of_issues_with_no_comparison_base + 5 + number_of_issues_with_no_comparison_at + 1) % 256; number_of_issues_with_no_comparison_at = number_of_issues_with_no_comparison_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Issues With No Comparison to the wire, 10 bytes from where the cursor stands */
inline encode_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_record) {
  number_of_issues_with_no_comparison_at = 0;
  do
  :: number_of_issues_with_no_comparison_at < 5 -> wire[at] = number_of_issues_with_no_comparison_record.number_of_issues[number_of_issues_with_no_comparison_at]; at = at + 1; number_of_issues_with_no_comparison_at = number_of_issues_with_no_comparison_at + 1
  :: else -> break
  od;
  number_of_issues_with_no_comparison_at = 0;
  do
  :: number_of_issues_with_no_comparison_at < 5 -> wire[at] = number_of_issues_with_no_comparison_record.ratio[number_of_issues_with_no_comparison_at]; at = at + 1; number_of_issues_with_no_comparison_at = number_of_issues_with_no_comparison_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Issues With No Comparison off the wire, 10 bytes from where the cursor stands */
inline decode_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_record) {
  number_of_issues_with_no_comparison_at = 0;
  do
  :: number_of_issues_with_no_comparison_at < 5 -> number_of_issues_with_no_comparison_record.number_of_issues[number_of_issues_with_no_comparison_at] = wire[at]; at = at + 1; number_of_issues_with_no_comparison_at = number_of_issues_with_no_comparison_at + 1
  :: else -> break
  od;
  number_of_issues_with_no_comparison_at = 0;
  do
  :: number_of_issues_with_no_comparison_at < 5 -> number_of_issues_with_no_comparison_record.ratio[number_of_issues_with_no_comparison_at] = wire[at]; at = at + 1; number_of_issues_with_no_comparison_at = number_of_issues_with_no_comparison_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Number Of Issues With No Comparison is what was written, byte for byte */
inline equal_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_read, number_of_issues_with_no_comparison_written) {
  number_of_issues_with_no_comparison_at = 0;
  do
  :: number_of_issues_with_no_comparison_at < 5 -> assert(number_of_issues_with_no_comparison_read.number_of_issues[number_of_issues_with_no_comparison_at] == number_of_issues_with_no_comparison_written.number_of_issues[number_of_issues_with_no_comparison_at]); number_of_issues_with_no_comparison_at = number_of_issues_with_no_comparison_at + 1
  :: else -> break
  od;
  number_of_issues_with_no_comparison_at = 0;
  do
  :: number_of_issues_with_no_comparison_at < 5 -> assert(number_of_issues_with_no_comparison_read.ratio[number_of_issues_with_no_comparison_at] == number_of_issues_with_no_comparison_written.ratio[number_of_issues_with_no_comparison_at]); number_of_issues_with_no_comparison_at = number_of_issues_with_no_comparison_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Number Of Inactive Issues: 10 bytes ------------------------------------- */

/* Number of inactive issues */
typedef NumberOfInactiveIssues {
  byte number_of_issues[5];
  byte ratio[5]
};

int number_of_inactive_issues_at;

/* every byte of Number Of Inactive Issues set to one value */
inline fill_number_of_inactive_issues(number_of_inactive_issues_record, number_of_inactive_issues_value) {
  number_of_inactive_issues_at = 0;
  do
  :: number_of_inactive_issues_at < 5 -> number_of_inactive_issues_record.number_of_issues[number_of_inactive_issues_at] = number_of_inactive_issues_value; number_of_inactive_issues_at = number_of_inactive_issues_at + 1
  :: else -> break
  od;
  number_of_inactive_issues_at = 0;
  do
  :: number_of_inactive_issues_at < 5 -> number_of_inactive_issues_record.ratio[number_of_inactive_issues_at] = number_of_inactive_issues_value; number_of_inactive_issues_at = number_of_inactive_issues_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Number Of Inactive Issues set to where it lies, so a field read out of place says so */
inline ramp_number_of_inactive_issues(number_of_inactive_issues_record, number_of_inactive_issues_base) {
  number_of_inactive_issues_at = 0;
  do
  :: number_of_inactive_issues_at < 5 -> number_of_inactive_issues_record.number_of_issues[number_of_inactive_issues_at] = (number_of_inactive_issues_base + 0 + number_of_inactive_issues_at + 1) % 256; number_of_inactive_issues_at = number_of_inactive_issues_at + 1
  :: else -> break
  od;
  number_of_inactive_issues_at = 0;
  do
  :: number_of_inactive_issues_at < 5 -> number_of_inactive_issues_record.ratio[number_of_inactive_issues_at] = (number_of_inactive_issues_base + 5 + number_of_inactive_issues_at + 1) % 256; number_of_inactive_issues_at = number_of_inactive_issues_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Inactive Issues to the wire, 10 bytes from where the cursor stands */
inline encode_number_of_inactive_issues(number_of_inactive_issues_record) {
  number_of_inactive_issues_at = 0;
  do
  :: number_of_inactive_issues_at < 5 -> wire[at] = number_of_inactive_issues_record.number_of_issues[number_of_inactive_issues_at]; at = at + 1; number_of_inactive_issues_at = number_of_inactive_issues_at + 1
  :: else -> break
  od;
  number_of_inactive_issues_at = 0;
  do
  :: number_of_inactive_issues_at < 5 -> wire[at] = number_of_inactive_issues_record.ratio[number_of_inactive_issues_at]; at = at + 1; number_of_inactive_issues_at = number_of_inactive_issues_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Inactive Issues off the wire, 10 bytes from where the cursor stands */
inline decode_number_of_inactive_issues(number_of_inactive_issues_record) {
  number_of_inactive_issues_at = 0;
  do
  :: number_of_inactive_issues_at < 5 -> number_of_inactive_issues_record.number_of_issues[number_of_inactive_issues_at] = wire[at]; at = at + 1; number_of_inactive_issues_at = number_of_inactive_issues_at + 1
  :: else -> break
  od;
  number_of_inactive_issues_at = 0;
  do
  :: number_of_inactive_issues_at < 5 -> number_of_inactive_issues_record.ratio[number_of_inactive_issues_at] = wire[at]; at = at + 1; number_of_inactive_issues_at = number_of_inactive_issues_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Number Of Inactive Issues is what was written, byte for byte */
inline equal_number_of_inactive_issues(number_of_inactive_issues_read, number_of_inactive_issues_written) {
  number_of_inactive_issues_at = 0;
  do
  :: number_of_inactive_issues_at < 5 -> assert(number_of_inactive_issues_read.number_of_issues[number_of_inactive_issues_at] == number_of_inactive_issues_written.number_of_issues[number_of_inactive_issues_at]); number_of_inactive_issues_at = number_of_inactive_issues_at + 1
  :: else -> break
  od;
  number_of_inactive_issues_at = 0;
  do
  :: number_of_inactive_issues_at < 5 -> assert(number_of_inactive_issues_read.ratio[number_of_inactive_issues_at] == number_of_inactive_issues_written.ratio[number_of_inactive_issues_at]); number_of_inactive_issues_at = number_of_inactive_issues_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Number Of Gainers Decliners Message: 82 bytes --------------------------- */

/* In this tag, number of listed issues and number of gainers/decliners information by market (issue classification) will be set. This data appears as part of a statistics message. */
typedef NumberOfGainersDeclinersMessage {
  byte reserved_2[2];
  byte output_time[6];
  byte issue_classification_code[4];
  byte number_of_listed_companies[5];
  byte number_of_listed_issues[5];
  NumberOfActiveIssues number_of_active_issues;
  NumberOfGainers number_of_gainers;
  NumberOfDecliners number_of_decliners;
  NumberOfIssuesWithNoChange number_of_issues_with_no_change;
  NumberOfIssuesWithNoComparison number_of_issues_with_no_comparison;
  NumberOfInactiveIssues number_of_inactive_issues
};

int number_of_gainers_decliners_message_at;

/* every byte of Number Of Gainers Decliners Message set to one value */
inline fill_number_of_gainers_decliners_message(number_of_gainers_decliners_message_record, number_of_gainers_decliners_message_value) {
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 2 -> number_of_gainers_decliners_message_record.reserved_2[number_of_gainers_decliners_message_at] = number_of_gainers_decliners_message_value; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 6 -> number_of_gainers_decliners_message_record.output_time[number_of_gainers_decliners_message_at] = number_of_gainers_decliners_message_value; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 4 -> number_of_gainers_decliners_message_record.issue_classification_code[number_of_gainers_decliners_message_at] = number_of_gainers_decliners_message_value; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 5 -> number_of_gainers_decliners_message_record.number_of_listed_companies[number_of_gainers_decliners_message_at] = number_of_gainers_decliners_message_value; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 5 -> number_of_gainers_decliners_message_record.number_of_listed_issues[number_of_gainers_decliners_message_at] = number_of_gainers_decliners_message_value; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  fill_number_of_active_issues(number_of_gainers_decliners_message_record.number_of_active_issues, number_of_gainers_decliners_message_value);
  fill_number_of_gainers(number_of_gainers_decliners_message_record.number_of_gainers, number_of_gainers_decliners_message_value);
  fill_number_of_decliners(number_of_gainers_decliners_message_record.number_of_decliners, number_of_gainers_decliners_message_value);
  fill_number_of_issues_with_no_change(number_of_gainers_decliners_message_record.number_of_issues_with_no_change, number_of_gainers_decliners_message_value);
  fill_number_of_issues_with_no_comparison(number_of_gainers_decliners_message_record.number_of_issues_with_no_comparison, number_of_gainers_decliners_message_value);
  fill_number_of_inactive_issues(number_of_gainers_decliners_message_record.number_of_inactive_issues, number_of_gainers_decliners_message_value);
  skip
}

/* each byte of Number Of Gainers Decliners Message set to where it lies, so a field read out of place says so */
inline ramp_number_of_gainers_decliners_message(number_of_gainers_decliners_message_record, number_of_gainers_decliners_message_base) {
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 2 -> number_of_gainers_decliners_message_record.reserved_2[number_of_gainers_decliners_message_at] = (number_of_gainers_decliners_message_base + 0 + number_of_gainers_decliners_message_at + 1) % 256; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 6 -> number_of_gainers_decliners_message_record.output_time[number_of_gainers_decliners_message_at] = (number_of_gainers_decliners_message_base + 2 + number_of_gainers_decliners_message_at + 1) % 256; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 4 -> number_of_gainers_decliners_message_record.issue_classification_code[number_of_gainers_decliners_message_at] = (number_of_gainers_decliners_message_base + 8 + number_of_gainers_decliners_message_at + 1) % 256; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 5 -> number_of_gainers_decliners_message_record.number_of_listed_companies[number_of_gainers_decliners_message_at] = (number_of_gainers_decliners_message_base + 12 + number_of_gainers_decliners_message_at + 1) % 256; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 5 -> number_of_gainers_decliners_message_record.number_of_listed_issues[number_of_gainers_decliners_message_at] = (number_of_gainers_decliners_message_base + 17 + number_of_gainers_decliners_message_at + 1) % 256; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  ramp_number_of_active_issues(number_of_gainers_decliners_message_record.number_of_active_issues, number_of_gainers_decliners_message_base + 22);
  ramp_number_of_gainers(number_of_gainers_decliners_message_record.number_of_gainers, number_of_gainers_decliners_message_base + 32);
  ramp_number_of_decliners(number_of_gainers_decliners_message_record.number_of_decliners, number_of_gainers_decliners_message_base + 42);
  ramp_number_of_issues_with_no_change(number_of_gainers_decliners_message_record.number_of_issues_with_no_change, number_of_gainers_decliners_message_base + 52);
  ramp_number_of_issues_with_no_comparison(number_of_gainers_decliners_message_record.number_of_issues_with_no_comparison, number_of_gainers_decliners_message_base + 62);
  ramp_number_of_inactive_issues(number_of_gainers_decliners_message_record.number_of_inactive_issues, number_of_gainers_decliners_message_base + 72);
  skip
}

/* Number Of Gainers Decliners Message to the wire, 82 bytes from where the cursor stands */
inline encode_number_of_gainers_decliners_message(number_of_gainers_decliners_message_record) {
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 2 -> wire[at] = number_of_gainers_decliners_message_record.reserved_2[number_of_gainers_decliners_message_at]; at = at + 1; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 6 -> wire[at] = number_of_gainers_decliners_message_record.output_time[number_of_gainers_decliners_message_at]; at = at + 1; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 4 -> wire[at] = number_of_gainers_decliners_message_record.issue_classification_code[number_of_gainers_decliners_message_at]; at = at + 1; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 5 -> wire[at] = number_of_gainers_decliners_message_record.number_of_listed_companies[number_of_gainers_decliners_message_at]; at = at + 1; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 5 -> wire[at] = number_of_gainers_decliners_message_record.number_of_listed_issues[number_of_gainers_decliners_message_at]; at = at + 1; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  encode_number_of_active_issues(number_of_gainers_decliners_message_record.number_of_active_issues);
  encode_number_of_gainers(number_of_gainers_decliners_message_record.number_of_gainers);
  encode_number_of_decliners(number_of_gainers_decliners_message_record.number_of_decliners);
  encode_number_of_issues_with_no_change(number_of_gainers_decliners_message_record.number_of_issues_with_no_change);
  encode_number_of_issues_with_no_comparison(number_of_gainers_decliners_message_record.number_of_issues_with_no_comparison);
  encode_number_of_inactive_issues(number_of_gainers_decliners_message_record.number_of_inactive_issues);
  skip
}

/* Number Of Gainers Decliners Message off the wire, 82 bytes from where the cursor stands */
inline decode_number_of_gainers_decliners_message(number_of_gainers_decliners_message_record) {
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 2 -> number_of_gainers_decliners_message_record.reserved_2[number_of_gainers_decliners_message_at] = wire[at]; at = at + 1; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 6 -> number_of_gainers_decliners_message_record.output_time[number_of_gainers_decliners_message_at] = wire[at]; at = at + 1; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 4 -> number_of_gainers_decliners_message_record.issue_classification_code[number_of_gainers_decliners_message_at] = wire[at]; at = at + 1; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 5 -> number_of_gainers_decliners_message_record.number_of_listed_companies[number_of_gainers_decliners_message_at] = wire[at]; at = at + 1; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 5 -> number_of_gainers_decliners_message_record.number_of_listed_issues[number_of_gainers_decliners_message_at] = wire[at]; at = at + 1; number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  decode_number_of_active_issues(number_of_gainers_decliners_message_record.number_of_active_issues);
  decode_number_of_gainers(number_of_gainers_decliners_message_record.number_of_gainers);
  decode_number_of_decliners(number_of_gainers_decliners_message_record.number_of_decliners);
  decode_number_of_issues_with_no_change(number_of_gainers_decliners_message_record.number_of_issues_with_no_change);
  decode_number_of_issues_with_no_comparison(number_of_gainers_decliners_message_record.number_of_issues_with_no_comparison);
  decode_number_of_inactive_issues(number_of_gainers_decliners_message_record.number_of_inactive_issues);
  skip
}

/* what was read of Number Of Gainers Decliners Message is what was written, byte for byte */
inline equal_number_of_gainers_decliners_message(number_of_gainers_decliners_message_read, number_of_gainers_decliners_message_written) {
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 2 -> assert(number_of_gainers_decliners_message_read.reserved_2[number_of_gainers_decliners_message_at] == number_of_gainers_decliners_message_written.reserved_2[number_of_gainers_decliners_message_at]); number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 6 -> assert(number_of_gainers_decliners_message_read.output_time[number_of_gainers_decliners_message_at] == number_of_gainers_decliners_message_written.output_time[number_of_gainers_decliners_message_at]); number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 4 -> assert(number_of_gainers_decliners_message_read.issue_classification_code[number_of_gainers_decliners_message_at] == number_of_gainers_decliners_message_written.issue_classification_code[number_of_gainers_decliners_message_at]); number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 5 -> assert(number_of_gainers_decliners_message_read.number_of_listed_companies[number_of_gainers_decliners_message_at] == number_of_gainers_decliners_message_written.number_of_listed_companies[number_of_gainers_decliners_message_at]); number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  number_of_gainers_decliners_message_at = 0;
  do
  :: number_of_gainers_decliners_message_at < 5 -> assert(number_of_gainers_decliners_message_read.number_of_listed_issues[number_of_gainers_decliners_message_at] == number_of_gainers_decliners_message_written.number_of_listed_issues[number_of_gainers_decliners_message_at]); number_of_gainers_decliners_message_at = number_of_gainers_decliners_message_at + 1
  :: else -> break
  od;
  equal_number_of_active_issues(number_of_gainers_decliners_message_read.number_of_active_issues, number_of_gainers_decliners_message_written.number_of_active_issues);
  equal_number_of_gainers(number_of_gainers_decliners_message_read.number_of_gainers, number_of_gainers_decliners_message_written.number_of_gainers);
  equal_number_of_decliners(number_of_gainers_decliners_message_read.number_of_decliners, number_of_gainers_decliners_message_written.number_of_decliners);
  equal_number_of_issues_with_no_change(number_of_gainers_decliners_message_read.number_of_issues_with_no_change, number_of_gainers_decliners_message_written.number_of_issues_with_no_change);
  equal_number_of_issues_with_no_comparison(number_of_gainers_decliners_message_read.number_of_issues_with_no_comparison, number_of_gainers_decliners_message_written.number_of_issues_with_no_comparison);
  equal_number_of_inactive_issues(number_of_gainers_decliners_message_read.number_of_inactive_issues, number_of_gainers_decliners_message_written.number_of_inactive_issues);
  skip
}

/* ---- Estimated Total Trading Volume: 15 bytes -------------------------------- */

/* Estimated total trading volume */
typedef EstimatedTotalTradingVolume {
  byte trading_volume_turnover_unit_flag;
  byte estimated_total_trading_volume_c_14[14]
};

int estimated_total_trading_volume_at;

/* every byte of Estimated Total Trading Volume set to one value */
inline fill_estimated_total_trading_volume(estimated_total_trading_volume_record, estimated_total_trading_volume_value) {
  estimated_total_trading_volume_record.trading_volume_turnover_unit_flag = estimated_total_trading_volume_value;
  estimated_total_trading_volume_at = 0;
  do
  :: estimated_total_trading_volume_at < 14 -> estimated_total_trading_volume_record.estimated_total_trading_volume_c_14[estimated_total_trading_volume_at] = estimated_total_trading_volume_value; estimated_total_trading_volume_at = estimated_total_trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Estimated Total Trading Volume set to where it lies, so a field read out of place says so */
inline ramp_estimated_total_trading_volume(estimated_total_trading_volume_record, estimated_total_trading_volume_base) {
  estimated_total_trading_volume_record.trading_volume_turnover_unit_flag = (estimated_total_trading_volume_base + 0 + 1) % 256;
  estimated_total_trading_volume_at = 0;
  do
  :: estimated_total_trading_volume_at < 14 -> estimated_total_trading_volume_record.estimated_total_trading_volume_c_14[estimated_total_trading_volume_at] = (estimated_total_trading_volume_base + 1 + estimated_total_trading_volume_at + 1) % 256; estimated_total_trading_volume_at = estimated_total_trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* Estimated Total Trading Volume to the wire, 15 bytes from where the cursor stands */
inline encode_estimated_total_trading_volume(estimated_total_trading_volume_record) {
  wire[at] = estimated_total_trading_volume_record.trading_volume_turnover_unit_flag; at = at + 1;
  estimated_total_trading_volume_at = 0;
  do
  :: estimated_total_trading_volume_at < 14 -> wire[at] = estimated_total_trading_volume_record.estimated_total_trading_volume_c_14[estimated_total_trading_volume_at]; at = at + 1; estimated_total_trading_volume_at = estimated_total_trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* Estimated Total Trading Volume off the wire, 15 bytes from where the cursor stands */
inline decode_estimated_total_trading_volume(estimated_total_trading_volume_record) {
  estimated_total_trading_volume_record.trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  estimated_total_trading_volume_at = 0;
  do
  :: estimated_total_trading_volume_at < 14 -> estimated_total_trading_volume_record.estimated_total_trading_volume_c_14[estimated_total_trading_volume_at] = wire[at]; at = at + 1; estimated_total_trading_volume_at = estimated_total_trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Estimated Total Trading Volume is what was written, byte for byte */
inline equal_estimated_total_trading_volume(estimated_total_trading_volume_read, estimated_total_trading_volume_written) {
  assert(estimated_total_trading_volume_read.trading_volume_turnover_unit_flag == estimated_total_trading_volume_written.trading_volume_turnover_unit_flag);
  estimated_total_trading_volume_at = 0;
  do
  :: estimated_total_trading_volume_at < 14 -> assert(estimated_total_trading_volume_read.estimated_total_trading_volume_c_14[estimated_total_trading_volume_at] == estimated_total_trading_volume_written.estimated_total_trading_volume_c_14[estimated_total_trading_volume_at]); estimated_total_trading_volume_at = estimated_total_trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Estimated Total Trading Volume Message: 29 bytes ------------------------ */

/* In this tag, estimated total trading volume information for each market (issue classification) will be set. This data appears as part of a statistics message. */
typedef EstimatedTotalTradingVolumeMessage {
  byte reserved_2[2];
  byte output_time[6];
  byte issue_classification_code[4];
  byte other_classification_code[2];
  EstimatedTotalTradingVolume estimated_total_trading_volume
};

int estimated_total_trading_volume_message_at;

/* every byte of Estimated Total Trading Volume Message set to one value */
inline fill_estimated_total_trading_volume_message(estimated_total_trading_volume_message_record, estimated_total_trading_volume_message_value) {
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 2 -> estimated_total_trading_volume_message_record.reserved_2[estimated_total_trading_volume_message_at] = estimated_total_trading_volume_message_value; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 6 -> estimated_total_trading_volume_message_record.output_time[estimated_total_trading_volume_message_at] = estimated_total_trading_volume_message_value; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 4 -> estimated_total_trading_volume_message_record.issue_classification_code[estimated_total_trading_volume_message_at] = estimated_total_trading_volume_message_value; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 2 -> estimated_total_trading_volume_message_record.other_classification_code[estimated_total_trading_volume_message_at] = estimated_total_trading_volume_message_value; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  fill_estimated_total_trading_volume(estimated_total_trading_volume_message_record.estimated_total_trading_volume, estimated_total_trading_volume_message_value);
  skip
}

/* each byte of Estimated Total Trading Volume Message set to where it lies, so a field read out of place says so */
inline ramp_estimated_total_trading_volume_message(estimated_total_trading_volume_message_record, estimated_total_trading_volume_message_base) {
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 2 -> estimated_total_trading_volume_message_record.reserved_2[estimated_total_trading_volume_message_at] = (estimated_total_trading_volume_message_base + 0 + estimated_total_trading_volume_message_at + 1) % 256; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 6 -> estimated_total_trading_volume_message_record.output_time[estimated_total_trading_volume_message_at] = (estimated_total_trading_volume_message_base + 2 + estimated_total_trading_volume_message_at + 1) % 256; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 4 -> estimated_total_trading_volume_message_record.issue_classification_code[estimated_total_trading_volume_message_at] = (estimated_total_trading_volume_message_base + 8 + estimated_total_trading_volume_message_at + 1) % 256; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 2 -> estimated_total_trading_volume_message_record.other_classification_code[estimated_total_trading_volume_message_at] = (estimated_total_trading_volume_message_base + 12 + estimated_total_trading_volume_message_at + 1) % 256; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  ramp_estimated_total_trading_volume(estimated_total_trading_volume_message_record.estimated_total_trading_volume, estimated_total_trading_volume_message_base + 14);
  skip
}

/* Estimated Total Trading Volume Message to the wire, 29 bytes from where the cursor stands */
inline encode_estimated_total_trading_volume_message(estimated_total_trading_volume_message_record) {
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 2 -> wire[at] = estimated_total_trading_volume_message_record.reserved_2[estimated_total_trading_volume_message_at]; at = at + 1; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 6 -> wire[at] = estimated_total_trading_volume_message_record.output_time[estimated_total_trading_volume_message_at]; at = at + 1; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 4 -> wire[at] = estimated_total_trading_volume_message_record.issue_classification_code[estimated_total_trading_volume_message_at]; at = at + 1; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 2 -> wire[at] = estimated_total_trading_volume_message_record.other_classification_code[estimated_total_trading_volume_message_at]; at = at + 1; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  encode_estimated_total_trading_volume(estimated_total_trading_volume_message_record.estimated_total_trading_volume);
  skip
}

/* Estimated Total Trading Volume Message off the wire, 29 bytes from where the cursor stands */
inline decode_estimated_total_trading_volume_message(estimated_total_trading_volume_message_record) {
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 2 -> estimated_total_trading_volume_message_record.reserved_2[estimated_total_trading_volume_message_at] = wire[at]; at = at + 1; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 6 -> estimated_total_trading_volume_message_record.output_time[estimated_total_trading_volume_message_at] = wire[at]; at = at + 1; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 4 -> estimated_total_trading_volume_message_record.issue_classification_code[estimated_total_trading_volume_message_at] = wire[at]; at = at + 1; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 2 -> estimated_total_trading_volume_message_record.other_classification_code[estimated_total_trading_volume_message_at] = wire[at]; at = at + 1; estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  decode_estimated_total_trading_volume(estimated_total_trading_volume_message_record.estimated_total_trading_volume);
  skip
}

/* what was read of Estimated Total Trading Volume Message is what was written, byte for byte */
inline equal_estimated_total_trading_volume_message(estimated_total_trading_volume_message_read, estimated_total_trading_volume_message_written) {
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 2 -> assert(estimated_total_trading_volume_message_read.reserved_2[estimated_total_trading_volume_message_at] == estimated_total_trading_volume_message_written.reserved_2[estimated_total_trading_volume_message_at]); estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 6 -> assert(estimated_total_trading_volume_message_read.output_time[estimated_total_trading_volume_message_at] == estimated_total_trading_volume_message_written.output_time[estimated_total_trading_volume_message_at]); estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 4 -> assert(estimated_total_trading_volume_message_read.issue_classification_code[estimated_total_trading_volume_message_at] == estimated_total_trading_volume_message_written.issue_classification_code[estimated_total_trading_volume_message_at]); estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  estimated_total_trading_volume_message_at = 0;
  do
  :: estimated_total_trading_volume_message_at < 2 -> assert(estimated_total_trading_volume_message_read.other_classification_code[estimated_total_trading_volume_message_at] == estimated_total_trading_volume_message_written.other_classification_code[estimated_total_trading_volume_message_at]); estimated_total_trading_volume_message_at = estimated_total_trading_volume_message_at + 1
  :: else -> break
  od;
  equal_estimated_total_trading_volume(estimated_total_trading_volume_message_read.estimated_total_trading_volume, estimated_total_trading_volume_message_written.estimated_total_trading_volume);
  skip
}

/* ---- Estimated Total Turnover: 16 bytes -------------------------------------- */

/* Estimated total turnover */
typedef EstimatedTotalTurnover {
  byte trading_volume_turnover_unit_flag;
  byte estimated_total_turnover_c_14[14];
  byte reserved_1
};

int estimated_total_turnover_at;

/* every byte of Estimated Total Turnover set to one value */
inline fill_estimated_total_turnover(estimated_total_turnover_record, estimated_total_turnover_value) {
  estimated_total_turnover_record.trading_volume_turnover_unit_flag = estimated_total_turnover_value;
  estimated_total_turnover_at = 0;
  do
  :: estimated_total_turnover_at < 14 -> estimated_total_turnover_record.estimated_total_turnover_c_14[estimated_total_turnover_at] = estimated_total_turnover_value; estimated_total_turnover_at = estimated_total_turnover_at + 1
  :: else -> break
  od;
  estimated_total_turnover_record.reserved_1 = estimated_total_turnover_value;
  skip
}

/* each byte of Estimated Total Turnover set to where it lies, so a field read out of place says so */
inline ramp_estimated_total_turnover(estimated_total_turnover_record, estimated_total_turnover_base) {
  estimated_total_turnover_record.trading_volume_turnover_unit_flag = (estimated_total_turnover_base + 0 + 1) % 256;
  estimated_total_turnover_at = 0;
  do
  :: estimated_total_turnover_at < 14 -> estimated_total_turnover_record.estimated_total_turnover_c_14[estimated_total_turnover_at] = (estimated_total_turnover_base + 1 + estimated_total_turnover_at + 1) % 256; estimated_total_turnover_at = estimated_total_turnover_at + 1
  :: else -> break
  od;
  estimated_total_turnover_record.reserved_1 = (estimated_total_turnover_base + 15 + 1) % 256;
  skip
}

/* Estimated Total Turnover to the wire, 16 bytes from where the cursor stands */
inline encode_estimated_total_turnover(estimated_total_turnover_record) {
  wire[at] = estimated_total_turnover_record.trading_volume_turnover_unit_flag; at = at + 1;
  estimated_total_turnover_at = 0;
  do
  :: estimated_total_turnover_at < 14 -> wire[at] = estimated_total_turnover_record.estimated_total_turnover_c_14[estimated_total_turnover_at]; at = at + 1; estimated_total_turnover_at = estimated_total_turnover_at + 1
  :: else -> break
  od;
  wire[at] = estimated_total_turnover_record.reserved_1; at = at + 1;
  skip
}

/* Estimated Total Turnover off the wire, 16 bytes from where the cursor stands */
inline decode_estimated_total_turnover(estimated_total_turnover_record) {
  estimated_total_turnover_record.trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  estimated_total_turnover_at = 0;
  do
  :: estimated_total_turnover_at < 14 -> estimated_total_turnover_record.estimated_total_turnover_c_14[estimated_total_turnover_at] = wire[at]; at = at + 1; estimated_total_turnover_at = estimated_total_turnover_at + 1
  :: else -> break
  od;
  estimated_total_turnover_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Estimated Total Turnover is what was written, byte for byte */
inline equal_estimated_total_turnover(estimated_total_turnover_read, estimated_total_turnover_written) {
  assert(estimated_total_turnover_read.trading_volume_turnover_unit_flag == estimated_total_turnover_written.trading_volume_turnover_unit_flag);
  estimated_total_turnover_at = 0;
  do
  :: estimated_total_turnover_at < 14 -> assert(estimated_total_turnover_read.estimated_total_turnover_c_14[estimated_total_turnover_at] == estimated_total_turnover_written.estimated_total_turnover_c_14[estimated_total_turnover_at]); estimated_total_turnover_at = estimated_total_turnover_at + 1
  :: else -> break
  od;
  assert(estimated_total_turnover_read.reserved_1 == estimated_total_turnover_written.reserved_1);
  skip
}

/* ---- Estimated Total Turnover Message: 30 bytes ------------------------------ */

/* In this tag, estimated total turnover information for each market (issue classification) will be set. This data appears as part of a statistics message. */
typedef EstimatedTotalTurnoverMessage {
  byte reserved_2[2];
  byte output_time[6];
  byte issue_classification_code[4];
  byte other_classification_flag[2];
  EstimatedTotalTurnover estimated_total_turnover
};

int estimated_total_turnover_message_at;

/* every byte of Estimated Total Turnover Message set to one value */
inline fill_estimated_total_turnover_message(estimated_total_turnover_message_record, estimated_total_turnover_message_value) {
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 2 -> estimated_total_turnover_message_record.reserved_2[estimated_total_turnover_message_at] = estimated_total_turnover_message_value; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 6 -> estimated_total_turnover_message_record.output_time[estimated_total_turnover_message_at] = estimated_total_turnover_message_value; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 4 -> estimated_total_turnover_message_record.issue_classification_code[estimated_total_turnover_message_at] = estimated_total_turnover_message_value; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 2 -> estimated_total_turnover_message_record.other_classification_flag[estimated_total_turnover_message_at] = estimated_total_turnover_message_value; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  fill_estimated_total_turnover(estimated_total_turnover_message_record.estimated_total_turnover, estimated_total_turnover_message_value);
  skip
}

/* each byte of Estimated Total Turnover Message set to where it lies, so a field read out of place says so */
inline ramp_estimated_total_turnover_message(estimated_total_turnover_message_record, estimated_total_turnover_message_base) {
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 2 -> estimated_total_turnover_message_record.reserved_2[estimated_total_turnover_message_at] = (estimated_total_turnover_message_base + 0 + estimated_total_turnover_message_at + 1) % 256; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 6 -> estimated_total_turnover_message_record.output_time[estimated_total_turnover_message_at] = (estimated_total_turnover_message_base + 2 + estimated_total_turnover_message_at + 1) % 256; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 4 -> estimated_total_turnover_message_record.issue_classification_code[estimated_total_turnover_message_at] = (estimated_total_turnover_message_base + 8 + estimated_total_turnover_message_at + 1) % 256; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 2 -> estimated_total_turnover_message_record.other_classification_flag[estimated_total_turnover_message_at] = (estimated_total_turnover_message_base + 12 + estimated_total_turnover_message_at + 1) % 256; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  ramp_estimated_total_turnover(estimated_total_turnover_message_record.estimated_total_turnover, estimated_total_turnover_message_base + 14);
  skip
}

/* Estimated Total Turnover Message to the wire, 30 bytes from where the cursor stands */
inline encode_estimated_total_turnover_message(estimated_total_turnover_message_record) {
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 2 -> wire[at] = estimated_total_turnover_message_record.reserved_2[estimated_total_turnover_message_at]; at = at + 1; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 6 -> wire[at] = estimated_total_turnover_message_record.output_time[estimated_total_turnover_message_at]; at = at + 1; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 4 -> wire[at] = estimated_total_turnover_message_record.issue_classification_code[estimated_total_turnover_message_at]; at = at + 1; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 2 -> wire[at] = estimated_total_turnover_message_record.other_classification_flag[estimated_total_turnover_message_at]; at = at + 1; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  encode_estimated_total_turnover(estimated_total_turnover_message_record.estimated_total_turnover);
  skip
}

/* Estimated Total Turnover Message off the wire, 30 bytes from where the cursor stands */
inline decode_estimated_total_turnover_message(estimated_total_turnover_message_record) {
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 2 -> estimated_total_turnover_message_record.reserved_2[estimated_total_turnover_message_at] = wire[at]; at = at + 1; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 6 -> estimated_total_turnover_message_record.output_time[estimated_total_turnover_message_at] = wire[at]; at = at + 1; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 4 -> estimated_total_turnover_message_record.issue_classification_code[estimated_total_turnover_message_at] = wire[at]; at = at + 1; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 2 -> estimated_total_turnover_message_record.other_classification_flag[estimated_total_turnover_message_at] = wire[at]; at = at + 1; estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  decode_estimated_total_turnover(estimated_total_turnover_message_record.estimated_total_turnover);
  skip
}

/* what was read of Estimated Total Turnover Message is what was written, byte for byte */
inline equal_estimated_total_turnover_message(estimated_total_turnover_message_read, estimated_total_turnover_message_written) {
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 2 -> assert(estimated_total_turnover_message_read.reserved_2[estimated_total_turnover_message_at] == estimated_total_turnover_message_written.reserved_2[estimated_total_turnover_message_at]); estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 6 -> assert(estimated_total_turnover_message_read.output_time[estimated_total_turnover_message_at] == estimated_total_turnover_message_written.output_time[estimated_total_turnover_message_at]); estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 4 -> assert(estimated_total_turnover_message_read.issue_classification_code[estimated_total_turnover_message_at] == estimated_total_turnover_message_written.issue_classification_code[estimated_total_turnover_message_at]); estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  estimated_total_turnover_message_at = 0;
  do
  :: estimated_total_turnover_message_at < 2 -> assert(estimated_total_turnover_message_read.other_classification_flag[estimated_total_turnover_message_at] == estimated_total_turnover_message_written.other_classification_flag[estimated_total_turnover_message_at]); estimated_total_turnover_message_at = estimated_total_turnover_message_at + 1
  :: else -> break
  od;
  equal_estimated_total_turnover(estimated_total_turnover_message_read.estimated_total_turnover, estimated_total_turnover_message_written.estimated_total_turnover);
  skip
}

/* ---- Vwap By Market: 33 bytes ------------------------------------------------ */

/* VWAP by market */
typedef VwapByMarket {
  byte unit_flag;
  byte vwap_by_market_c_14[14];
  byte sign;
  byte reserved_1;
  byte second_unit_flag;
  byte day_on_day_comparison_c_14[14];
  byte second_sign
};

int vwap_by_market_at;

/* every byte of Vwap By Market set to one value */
inline fill_vwap_by_market(vwap_by_market_record, vwap_by_market_value) {
  vwap_by_market_record.unit_flag = vwap_by_market_value;
  vwap_by_market_at = 0;
  do
  :: vwap_by_market_at < 14 -> vwap_by_market_record.vwap_by_market_c_14[vwap_by_market_at] = vwap_by_market_value; vwap_by_market_at = vwap_by_market_at + 1
  :: else -> break
  od;
  vwap_by_market_record.sign = vwap_by_market_value;
  vwap_by_market_record.reserved_1 = vwap_by_market_value;
  vwap_by_market_record.second_unit_flag = vwap_by_market_value;
  vwap_by_market_at = 0;
  do
  :: vwap_by_market_at < 14 -> vwap_by_market_record.day_on_day_comparison_c_14[vwap_by_market_at] = vwap_by_market_value; vwap_by_market_at = vwap_by_market_at + 1
  :: else -> break
  od;
  vwap_by_market_record.second_sign = vwap_by_market_value;
  skip
}

/* each byte of Vwap By Market set to where it lies, so a field read out of place says so */
inline ramp_vwap_by_market(vwap_by_market_record, vwap_by_market_base) {
  vwap_by_market_record.unit_flag = (vwap_by_market_base + 0 + 1) % 256;
  vwap_by_market_at = 0;
  do
  :: vwap_by_market_at < 14 -> vwap_by_market_record.vwap_by_market_c_14[vwap_by_market_at] = (vwap_by_market_base + 1 + vwap_by_market_at + 1) % 256; vwap_by_market_at = vwap_by_market_at + 1
  :: else -> break
  od;
  vwap_by_market_record.sign = (vwap_by_market_base + 15 + 1) % 256;
  vwap_by_market_record.reserved_1 = (vwap_by_market_base + 16 + 1) % 256;
  vwap_by_market_record.second_unit_flag = (vwap_by_market_base + 17 + 1) % 256;
  vwap_by_market_at = 0;
  do
  :: vwap_by_market_at < 14 -> vwap_by_market_record.day_on_day_comparison_c_14[vwap_by_market_at] = (vwap_by_market_base + 18 + vwap_by_market_at + 1) % 256; vwap_by_market_at = vwap_by_market_at + 1
  :: else -> break
  od;
  vwap_by_market_record.second_sign = (vwap_by_market_base + 32 + 1) % 256;
  skip
}

/* Vwap By Market to the wire, 33 bytes from where the cursor stands */
inline encode_vwap_by_market(vwap_by_market_record) {
  wire[at] = vwap_by_market_record.unit_flag; at = at + 1;
  vwap_by_market_at = 0;
  do
  :: vwap_by_market_at < 14 -> wire[at] = vwap_by_market_record.vwap_by_market_c_14[vwap_by_market_at]; at = at + 1; vwap_by_market_at = vwap_by_market_at + 1
  :: else -> break
  od;
  wire[at] = vwap_by_market_record.sign; at = at + 1;
  wire[at] = vwap_by_market_record.reserved_1; at = at + 1;
  wire[at] = vwap_by_market_record.second_unit_flag; at = at + 1;
  vwap_by_market_at = 0;
  do
  :: vwap_by_market_at < 14 -> wire[at] = vwap_by_market_record.day_on_day_comparison_c_14[vwap_by_market_at]; at = at + 1; vwap_by_market_at = vwap_by_market_at + 1
  :: else -> break
  od;
  wire[at] = vwap_by_market_record.second_sign; at = at + 1;
  skip
}

/* Vwap By Market off the wire, 33 bytes from where the cursor stands */
inline decode_vwap_by_market(vwap_by_market_record) {
  vwap_by_market_record.unit_flag = wire[at]; at = at + 1;
  vwap_by_market_at = 0;
  do
  :: vwap_by_market_at < 14 -> vwap_by_market_record.vwap_by_market_c_14[vwap_by_market_at] = wire[at]; at = at + 1; vwap_by_market_at = vwap_by_market_at + 1
  :: else -> break
  od;
  vwap_by_market_record.sign = wire[at]; at = at + 1;
  vwap_by_market_record.reserved_1 = wire[at]; at = at + 1;
  vwap_by_market_record.second_unit_flag = wire[at]; at = at + 1;
  vwap_by_market_at = 0;
  do
  :: vwap_by_market_at < 14 -> vwap_by_market_record.day_on_day_comparison_c_14[vwap_by_market_at] = wire[at]; at = at + 1; vwap_by_market_at = vwap_by_market_at + 1
  :: else -> break
  od;
  vwap_by_market_record.second_sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Vwap By Market is what was written, byte for byte */
inline equal_vwap_by_market(vwap_by_market_read, vwap_by_market_written) {
  assert(vwap_by_market_read.unit_flag == vwap_by_market_written.unit_flag);
  vwap_by_market_at = 0;
  do
  :: vwap_by_market_at < 14 -> assert(vwap_by_market_read.vwap_by_market_c_14[vwap_by_market_at] == vwap_by_market_written.vwap_by_market_c_14[vwap_by_market_at]); vwap_by_market_at = vwap_by_market_at + 1
  :: else -> break
  od;
  assert(vwap_by_market_read.sign == vwap_by_market_written.sign);
  assert(vwap_by_market_read.reserved_1 == vwap_by_market_written.reserved_1);
  assert(vwap_by_market_read.second_unit_flag == vwap_by_market_written.second_unit_flag);
  vwap_by_market_at = 0;
  do
  :: vwap_by_market_at < 14 -> assert(vwap_by_market_read.day_on_day_comparison_c_14[vwap_by_market_at] == vwap_by_market_written.day_on_day_comparison_c_14[vwap_by_market_at]); vwap_by_market_at = vwap_by_market_at + 1
  :: else -> break
  od;
  assert(vwap_by_market_read.second_sign == vwap_by_market_written.second_sign);
  skip
}

/* ---- Vwap By Market Message: 45 bytes ---------------------------------------- */

/* In this tag, volume weighted average price (VWAP) information for each market (issue classification) will be set. This data appears as part of a statistics message. */
typedef VwapByMarketMessage {
  byte reserved_2[2];
  byte output_time[6];
  byte issue_classification_code[4];
  VwapByMarket vwap_by_market
};

int vwap_by_market_message_at;

/* every byte of Vwap By Market Message set to one value */
inline fill_vwap_by_market_message(vwap_by_market_message_record, vwap_by_market_message_value) {
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 2 -> vwap_by_market_message_record.reserved_2[vwap_by_market_message_at] = vwap_by_market_message_value; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 6 -> vwap_by_market_message_record.output_time[vwap_by_market_message_at] = vwap_by_market_message_value; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 4 -> vwap_by_market_message_record.issue_classification_code[vwap_by_market_message_at] = vwap_by_market_message_value; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  fill_vwap_by_market(vwap_by_market_message_record.vwap_by_market, vwap_by_market_message_value);
  skip
}

/* each byte of Vwap By Market Message set to where it lies, so a field read out of place says so */
inline ramp_vwap_by_market_message(vwap_by_market_message_record, vwap_by_market_message_base) {
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 2 -> vwap_by_market_message_record.reserved_2[vwap_by_market_message_at] = (vwap_by_market_message_base + 0 + vwap_by_market_message_at + 1) % 256; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 6 -> vwap_by_market_message_record.output_time[vwap_by_market_message_at] = (vwap_by_market_message_base + 2 + vwap_by_market_message_at + 1) % 256; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 4 -> vwap_by_market_message_record.issue_classification_code[vwap_by_market_message_at] = (vwap_by_market_message_base + 8 + vwap_by_market_message_at + 1) % 256; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  ramp_vwap_by_market(vwap_by_market_message_record.vwap_by_market, vwap_by_market_message_base + 12);
  skip
}

/* Vwap By Market Message to the wire, 45 bytes from where the cursor stands */
inline encode_vwap_by_market_message(vwap_by_market_message_record) {
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 2 -> wire[at] = vwap_by_market_message_record.reserved_2[vwap_by_market_message_at]; at = at + 1; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 6 -> wire[at] = vwap_by_market_message_record.output_time[vwap_by_market_message_at]; at = at + 1; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 4 -> wire[at] = vwap_by_market_message_record.issue_classification_code[vwap_by_market_message_at]; at = at + 1; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  encode_vwap_by_market(vwap_by_market_message_record.vwap_by_market);
  skip
}

/* Vwap By Market Message off the wire, 45 bytes from where the cursor stands */
inline decode_vwap_by_market_message(vwap_by_market_message_record) {
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 2 -> vwap_by_market_message_record.reserved_2[vwap_by_market_message_at] = wire[at]; at = at + 1; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 6 -> vwap_by_market_message_record.output_time[vwap_by_market_message_at] = wire[at]; at = at + 1; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 4 -> vwap_by_market_message_record.issue_classification_code[vwap_by_market_message_at] = wire[at]; at = at + 1; vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  decode_vwap_by_market(vwap_by_market_message_record.vwap_by_market);
  skip
}

/* what was read of Vwap By Market Message is what was written, byte for byte */
inline equal_vwap_by_market_message(vwap_by_market_message_read, vwap_by_market_message_written) {
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 2 -> assert(vwap_by_market_message_read.reserved_2[vwap_by_market_message_at] == vwap_by_market_message_written.reserved_2[vwap_by_market_message_at]); vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 6 -> assert(vwap_by_market_message_read.output_time[vwap_by_market_message_at] == vwap_by_market_message_written.output_time[vwap_by_market_message_at]); vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  vwap_by_market_message_at = 0;
  do
  :: vwap_by_market_message_at < 4 -> assert(vwap_by_market_message_read.issue_classification_code[vwap_by_market_message_at] == vwap_by_market_message_written.issue_classification_code[vwap_by_market_message_at]); vwap_by_market_message_at = vwap_by_market_message_at + 1
  :: else -> break
  od;
  equal_vwap_by_market(vwap_by_market_message_read.vwap_by_market, vwap_by_market_message_written.vwap_by_market);
  skip
}

/* ---- Trading Volume: 60 bytes ------------------------------------------------ */

/* Trading volume */
typedef TradingVolume {
  byte trading_volume_turnover_unit_flag;
  byte single_issue_transaction_c_14[14];
  byte second_trading_volume_turnover_unit_flag;
  byte closing_price_transaction[14];
  byte third_trading_volume_turnover_unit_flag;
  byte basket_transaction_c_14[14];
  byte fourth_trading_volume_turnover_unit_flag;
  byte aggregate_trading_volume[14]
};

int trading_volume_at;

/* every byte of Trading Volume set to one value */
inline fill_trading_volume(trading_volume_record, trading_volume_value) {
  trading_volume_record.trading_volume_turnover_unit_flag = trading_volume_value;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.single_issue_transaction_c_14[trading_volume_at] = trading_volume_value; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.second_trading_volume_turnover_unit_flag = trading_volume_value;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.closing_price_transaction[trading_volume_at] = trading_volume_value; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.third_trading_volume_turnover_unit_flag = trading_volume_value;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.basket_transaction_c_14[trading_volume_at] = trading_volume_value; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.fourth_trading_volume_turnover_unit_flag = trading_volume_value;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.aggregate_trading_volume[trading_volume_at] = trading_volume_value; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Volume set to where it lies, so a field read out of place says so */
inline ramp_trading_volume(trading_volume_record, trading_volume_base) {
  trading_volume_record.trading_volume_turnover_unit_flag = (trading_volume_base + 0 + 1) % 256;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.single_issue_transaction_c_14[trading_volume_at] = (trading_volume_base + 1 + trading_volume_at + 1) % 256; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.second_trading_volume_turnover_unit_flag = (trading_volume_base + 15 + 1) % 256;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.closing_price_transaction[trading_volume_at] = (trading_volume_base + 16 + trading_volume_at + 1) % 256; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.third_trading_volume_turnover_unit_flag = (trading_volume_base + 30 + 1) % 256;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.basket_transaction_c_14[trading_volume_at] = (trading_volume_base + 31 + trading_volume_at + 1) % 256; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.fourth_trading_volume_turnover_unit_flag = (trading_volume_base + 45 + 1) % 256;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.aggregate_trading_volume[trading_volume_at] = (trading_volume_base + 46 + trading_volume_at + 1) % 256; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Volume to the wire, 60 bytes from where the cursor stands */
inline encode_trading_volume(trading_volume_record) {
  wire[at] = trading_volume_record.trading_volume_turnover_unit_flag; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> wire[at] = trading_volume_record.single_issue_transaction_c_14[trading_volume_at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  wire[at] = trading_volume_record.second_trading_volume_turnover_unit_flag; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> wire[at] = trading_volume_record.closing_price_transaction[trading_volume_at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  wire[at] = trading_volume_record.third_trading_volume_turnover_unit_flag; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> wire[at] = trading_volume_record.basket_transaction_c_14[trading_volume_at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  wire[at] = trading_volume_record.fourth_trading_volume_turnover_unit_flag; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> wire[at] = trading_volume_record.aggregate_trading_volume[trading_volume_at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Volume off the wire, 60 bytes from where the cursor stands */
inline decode_trading_volume(trading_volume_record) {
  trading_volume_record.trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.single_issue_transaction_c_14[trading_volume_at] = wire[at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.second_trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.closing_price_transaction[trading_volume_at] = wire[at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.third_trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.basket_transaction_c_14[trading_volume_at] = wire[at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.fourth_trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.aggregate_trading_volume[trading_volume_at] = wire[at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Volume is what was written, byte for byte */
inline equal_trading_volume(trading_volume_read, trading_volume_written) {
  assert(trading_volume_read.trading_volume_turnover_unit_flag == trading_volume_written.trading_volume_turnover_unit_flag);
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> assert(trading_volume_read.single_issue_transaction_c_14[trading_volume_at] == trading_volume_written.single_issue_transaction_c_14[trading_volume_at]); trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  assert(trading_volume_read.second_trading_volume_turnover_unit_flag == trading_volume_written.second_trading_volume_turnover_unit_flag);
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> assert(trading_volume_read.closing_price_transaction[trading_volume_at] == trading_volume_written.closing_price_transaction[trading_volume_at]); trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  assert(trading_volume_read.third_trading_volume_turnover_unit_flag == trading_volume_written.third_trading_volume_turnover_unit_flag);
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> assert(trading_volume_read.basket_transaction_c_14[trading_volume_at] == trading_volume_written.basket_transaction_c_14[trading_volume_at]); trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  assert(trading_volume_read.fourth_trading_volume_turnover_unit_flag == trading_volume_written.fourth_trading_volume_turnover_unit_flag);
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> assert(trading_volume_read.aggregate_trading_volume[trading_volume_at] == trading_volume_written.aggregate_trading_volume[trading_volume_at]); trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Turnover: 60 bytes ------------------------------------------------------ */

/* Turnover */
typedef Turnover {
  byte trading_volume_turnover_unit_flag;
  byte single_issue_transaction_c_14[14];
  byte second_trading_volume_turnover_unit_flag;
  byte closing_price_transaction[14];
  byte third_trading_volume_turnover_unit_flag;
  byte basket_transaction_c_14[14];
  byte fourth_trading_volume_turnover_unit_flag;
  byte aggregate_turnover[14]
};

int turnover_at;

/* every byte of Turnover set to one value */
inline fill_turnover(turnover_record, turnover_value) {
  turnover_record.trading_volume_turnover_unit_flag = turnover_value;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.single_issue_transaction_c_14[turnover_at] = turnover_value; turnover_at = turnover_at + 1
  :: else -> break
  od;
  turnover_record.second_trading_volume_turnover_unit_flag = turnover_value;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.closing_price_transaction[turnover_at] = turnover_value; turnover_at = turnover_at + 1
  :: else -> break
  od;
  turnover_record.third_trading_volume_turnover_unit_flag = turnover_value;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.basket_transaction_c_14[turnover_at] = turnover_value; turnover_at = turnover_at + 1
  :: else -> break
  od;
  turnover_record.fourth_trading_volume_turnover_unit_flag = turnover_value;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.aggregate_turnover[turnover_at] = turnover_value; turnover_at = turnover_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Turnover set to where it lies, so a field read out of place says so */
inline ramp_turnover(turnover_record, turnover_base) {
  turnover_record.trading_volume_turnover_unit_flag = (turnover_base + 0 + 1) % 256;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.single_issue_transaction_c_14[turnover_at] = (turnover_base + 1 + turnover_at + 1) % 256; turnover_at = turnover_at + 1
  :: else -> break
  od;
  turnover_record.second_trading_volume_turnover_unit_flag = (turnover_base + 15 + 1) % 256;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.closing_price_transaction[turnover_at] = (turnover_base + 16 + turnover_at + 1) % 256; turnover_at = turnover_at + 1
  :: else -> break
  od;
  turnover_record.third_trading_volume_turnover_unit_flag = (turnover_base + 30 + 1) % 256;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.basket_transaction_c_14[turnover_at] = (turnover_base + 31 + turnover_at + 1) % 256; turnover_at = turnover_at + 1
  :: else -> break
  od;
  turnover_record.fourth_trading_volume_turnover_unit_flag = (turnover_base + 45 + 1) % 256;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.aggregate_turnover[turnover_at] = (turnover_base + 46 + turnover_at + 1) % 256; turnover_at = turnover_at + 1
  :: else -> break
  od;
  skip
}

/* Turnover to the wire, 60 bytes from where the cursor stands */
inline encode_turnover(turnover_record) {
  wire[at] = turnover_record.trading_volume_turnover_unit_flag; at = at + 1;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> wire[at] = turnover_record.single_issue_transaction_c_14[turnover_at]; at = at + 1; turnover_at = turnover_at + 1
  :: else -> break
  od;
  wire[at] = turnover_record.second_trading_volume_turnover_unit_flag; at = at + 1;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> wire[at] = turnover_record.closing_price_transaction[turnover_at]; at = at + 1; turnover_at = turnover_at + 1
  :: else -> break
  od;
  wire[at] = turnover_record.third_trading_volume_turnover_unit_flag; at = at + 1;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> wire[at] = turnover_record.basket_transaction_c_14[turnover_at]; at = at + 1; turnover_at = turnover_at + 1
  :: else -> break
  od;
  wire[at] = turnover_record.fourth_trading_volume_turnover_unit_flag; at = at + 1;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> wire[at] = turnover_record.aggregate_turnover[turnover_at]; at = at + 1; turnover_at = turnover_at + 1
  :: else -> break
  od;
  skip
}

/* Turnover off the wire, 60 bytes from where the cursor stands */
inline decode_turnover(turnover_record) {
  turnover_record.trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.single_issue_transaction_c_14[turnover_at] = wire[at]; at = at + 1; turnover_at = turnover_at + 1
  :: else -> break
  od;
  turnover_record.second_trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.closing_price_transaction[turnover_at] = wire[at]; at = at + 1; turnover_at = turnover_at + 1
  :: else -> break
  od;
  turnover_record.third_trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.basket_transaction_c_14[turnover_at] = wire[at]; at = at + 1; turnover_at = turnover_at + 1
  :: else -> break
  od;
  turnover_record.fourth_trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  turnover_at = 0;
  do
  :: turnover_at < 14 -> turnover_record.aggregate_turnover[turnover_at] = wire[at]; at = at + 1; turnover_at = turnover_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Turnover is what was written, byte for byte */
inline equal_turnover(turnover_read, turnover_written) {
  assert(turnover_read.trading_volume_turnover_unit_flag == turnover_written.trading_volume_turnover_unit_flag);
  turnover_at = 0;
  do
  :: turnover_at < 14 -> assert(turnover_read.single_issue_transaction_c_14[turnover_at] == turnover_written.single_issue_transaction_c_14[turnover_at]); turnover_at = turnover_at + 1
  :: else -> break
  od;
  assert(turnover_read.second_trading_volume_turnover_unit_flag == turnover_written.second_trading_volume_turnover_unit_flag);
  turnover_at = 0;
  do
  :: turnover_at < 14 -> assert(turnover_read.closing_price_transaction[turnover_at] == turnover_written.closing_price_transaction[turnover_at]); turnover_at = turnover_at + 1
  :: else -> break
  od;
  assert(turnover_read.third_trading_volume_turnover_unit_flag == turnover_written.third_trading_volume_turnover_unit_flag);
  turnover_at = 0;
  do
  :: turnover_at < 14 -> assert(turnover_read.basket_transaction_c_14[turnover_at] == turnover_written.basket_transaction_c_14[turnover_at]); turnover_at = turnover_at + 1
  :: else -> break
  od;
  assert(turnover_read.fourth_trading_volume_turnover_unit_flag == turnover_written.fourth_trading_volume_turnover_unit_flag);
  turnover_at = 0;
  do
  :: turnover_at < 14 -> assert(turnover_read.aggregate_turnover[turnover_at] == turnover_written.aggregate_turnover[turnover_at]); turnover_at = turnover_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Number Of Transactions: 16 bytes ---------------------------------------- */

/* Number of transactions */
typedef NumberOfTransactions {
  byte single_issue_transaction_c_8[8];
  byte basket_transaction_c_8[8]
};

int number_of_transactions_at;

/* every byte of Number Of Transactions set to one value */
inline fill_number_of_transactions(number_of_transactions_record, number_of_transactions_value) {
  number_of_transactions_at = 0;
  do
  :: number_of_transactions_at < 8 -> number_of_transactions_record.single_issue_transaction_c_8[number_of_transactions_at] = number_of_transactions_value; number_of_transactions_at = number_of_transactions_at + 1
  :: else -> break
  od;
  number_of_transactions_at = 0;
  do
  :: number_of_transactions_at < 8 -> number_of_transactions_record.basket_transaction_c_8[number_of_transactions_at] = number_of_transactions_value; number_of_transactions_at = number_of_transactions_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Number Of Transactions set to where it lies, so a field read out of place says so */
inline ramp_number_of_transactions(number_of_transactions_record, number_of_transactions_base) {
  number_of_transactions_at = 0;
  do
  :: number_of_transactions_at < 8 -> number_of_transactions_record.single_issue_transaction_c_8[number_of_transactions_at] = (number_of_transactions_base + 0 + number_of_transactions_at + 1) % 256; number_of_transactions_at = number_of_transactions_at + 1
  :: else -> break
  od;
  number_of_transactions_at = 0;
  do
  :: number_of_transactions_at < 8 -> number_of_transactions_record.basket_transaction_c_8[number_of_transactions_at] = (number_of_transactions_base + 8 + number_of_transactions_at + 1) % 256; number_of_transactions_at = number_of_transactions_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Transactions to the wire, 16 bytes from where the cursor stands */
inline encode_number_of_transactions(number_of_transactions_record) {
  number_of_transactions_at = 0;
  do
  :: number_of_transactions_at < 8 -> wire[at] = number_of_transactions_record.single_issue_transaction_c_8[number_of_transactions_at]; at = at + 1; number_of_transactions_at = number_of_transactions_at + 1
  :: else -> break
  od;
  number_of_transactions_at = 0;
  do
  :: number_of_transactions_at < 8 -> wire[at] = number_of_transactions_record.basket_transaction_c_8[number_of_transactions_at]; at = at + 1; number_of_transactions_at = number_of_transactions_at + 1
  :: else -> break
  od;
  skip
}

/* Number Of Transactions off the wire, 16 bytes from where the cursor stands */
inline decode_number_of_transactions(number_of_transactions_record) {
  number_of_transactions_at = 0;
  do
  :: number_of_transactions_at < 8 -> number_of_transactions_record.single_issue_transaction_c_8[number_of_transactions_at] = wire[at]; at = at + 1; number_of_transactions_at = number_of_transactions_at + 1
  :: else -> break
  od;
  number_of_transactions_at = 0;
  do
  :: number_of_transactions_at < 8 -> number_of_transactions_record.basket_transaction_c_8[number_of_transactions_at] = wire[at]; at = at + 1; number_of_transactions_at = number_of_transactions_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Number Of Transactions is what was written, byte for byte */
inline equal_number_of_transactions(number_of_transactions_read, number_of_transactions_written) {
  number_of_transactions_at = 0;
  do
  :: number_of_transactions_at < 8 -> assert(number_of_transactions_read.single_issue_transaction_c_8[number_of_transactions_at] == number_of_transactions_written.single_issue_transaction_c_8[number_of_transactions_at]); number_of_transactions_at = number_of_transactions_at + 1
  :: else -> break
  od;
  number_of_transactions_at = 0;
  do
  :: number_of_transactions_at < 8 -> assert(number_of_transactions_read.basket_transaction_c_8[number_of_transactions_at] == number_of_transactions_written.basket_transaction_c_8[number_of_transactions_at]); number_of_transactions_at = number_of_transactions_at + 1
  :: else -> break
  od;
  skip
}

/* ---- ToSTNeT Statistics Message: 146 bytes ----------------------------------- */

/* In this tag, the quantities traded on the ToSTNeT and other information will be set. This data appears as part of a statistics message. */
typedef ToSTNeTStatisticsMessage {
  byte reserved_2[2];
  byte output_time[6];
  byte other_classification_flag[2];
  TradingVolume trading_volume;
  Turnover turnover;
  NumberOfTransactions number_of_transactions
};

int to_s_t_ne_t_statistics_message_at;

/* every byte of ToSTNeT Statistics Message set to one value */
inline fill_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_record, to_s_t_ne_t_statistics_message_value) {
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 2 -> to_s_t_ne_t_statistics_message_record.reserved_2[to_s_t_ne_t_statistics_message_at] = to_s_t_ne_t_statistics_message_value; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 6 -> to_s_t_ne_t_statistics_message_record.output_time[to_s_t_ne_t_statistics_message_at] = to_s_t_ne_t_statistics_message_value; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 2 -> to_s_t_ne_t_statistics_message_record.other_classification_flag[to_s_t_ne_t_statistics_message_at] = to_s_t_ne_t_statistics_message_value; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  fill_trading_volume(to_s_t_ne_t_statistics_message_record.trading_volume, to_s_t_ne_t_statistics_message_value);
  fill_turnover(to_s_t_ne_t_statistics_message_record.turnover, to_s_t_ne_t_statistics_message_value);
  fill_number_of_transactions(to_s_t_ne_t_statistics_message_record.number_of_transactions, to_s_t_ne_t_statistics_message_value);
  skip
}

/* each byte of ToSTNeT Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_record, to_s_t_ne_t_statistics_message_base) {
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 2 -> to_s_t_ne_t_statistics_message_record.reserved_2[to_s_t_ne_t_statistics_message_at] = (to_s_t_ne_t_statistics_message_base + 0 + to_s_t_ne_t_statistics_message_at + 1) % 256; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 6 -> to_s_t_ne_t_statistics_message_record.output_time[to_s_t_ne_t_statistics_message_at] = (to_s_t_ne_t_statistics_message_base + 2 + to_s_t_ne_t_statistics_message_at + 1) % 256; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 2 -> to_s_t_ne_t_statistics_message_record.other_classification_flag[to_s_t_ne_t_statistics_message_at] = (to_s_t_ne_t_statistics_message_base + 8 + to_s_t_ne_t_statistics_message_at + 1) % 256; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  ramp_trading_volume(to_s_t_ne_t_statistics_message_record.trading_volume, to_s_t_ne_t_statistics_message_base + 10);
  ramp_turnover(to_s_t_ne_t_statistics_message_record.turnover, to_s_t_ne_t_statistics_message_base + 70);
  ramp_number_of_transactions(to_s_t_ne_t_statistics_message_record.number_of_transactions, to_s_t_ne_t_statistics_message_base + 130);
  skip
}

/* ToSTNeT Statistics Message to the wire, 146 bytes from where the cursor stands */
inline encode_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_record) {
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 2 -> wire[at] = to_s_t_ne_t_statistics_message_record.reserved_2[to_s_t_ne_t_statistics_message_at]; at = at + 1; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 6 -> wire[at] = to_s_t_ne_t_statistics_message_record.output_time[to_s_t_ne_t_statistics_message_at]; at = at + 1; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 2 -> wire[at] = to_s_t_ne_t_statistics_message_record.other_classification_flag[to_s_t_ne_t_statistics_message_at]; at = at + 1; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  encode_trading_volume(to_s_t_ne_t_statistics_message_record.trading_volume);
  encode_turnover(to_s_t_ne_t_statistics_message_record.turnover);
  encode_number_of_transactions(to_s_t_ne_t_statistics_message_record.number_of_transactions);
  skip
}

/* ToSTNeT Statistics Message off the wire, 146 bytes from where the cursor stands */
inline decode_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_record) {
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 2 -> to_s_t_ne_t_statistics_message_record.reserved_2[to_s_t_ne_t_statistics_message_at] = wire[at]; at = at + 1; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 6 -> to_s_t_ne_t_statistics_message_record.output_time[to_s_t_ne_t_statistics_message_at] = wire[at]; at = at + 1; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 2 -> to_s_t_ne_t_statistics_message_record.other_classification_flag[to_s_t_ne_t_statistics_message_at] = wire[at]; at = at + 1; to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  decode_trading_volume(to_s_t_ne_t_statistics_message_record.trading_volume);
  decode_turnover(to_s_t_ne_t_statistics_message_record.turnover);
  decode_number_of_transactions(to_s_t_ne_t_statistics_message_record.number_of_transactions);
  skip
}

/* what was read of ToSTNeT Statistics Message is what was written, byte for byte */
inline equal_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_read, to_s_t_ne_t_statistics_message_written) {
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 2 -> assert(to_s_t_ne_t_statistics_message_read.reserved_2[to_s_t_ne_t_statistics_message_at] == to_s_t_ne_t_statistics_message_written.reserved_2[to_s_t_ne_t_statistics_message_at]); to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 6 -> assert(to_s_t_ne_t_statistics_message_read.output_time[to_s_t_ne_t_statistics_message_at] == to_s_t_ne_t_statistics_message_written.output_time[to_s_t_ne_t_statistics_message_at]); to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  to_s_t_ne_t_statistics_message_at = 0;
  do
  :: to_s_t_ne_t_statistics_message_at < 2 -> assert(to_s_t_ne_t_statistics_message_read.other_classification_flag[to_s_t_ne_t_statistics_message_at] == to_s_t_ne_t_statistics_message_written.other_classification_flag[to_s_t_ne_t_statistics_message_at]); to_s_t_ne_t_statistics_message_at = to_s_t_ne_t_statistics_message_at + 1
  :: else -> break
  od;
  equal_trading_volume(to_s_t_ne_t_statistics_message_read.trading_volume, to_s_t_ne_t_statistics_message_written.trading_volume);
  equal_turnover(to_s_t_ne_t_statistics_message_read.turnover, to_s_t_ne_t_statistics_message_written.turnover);
  equal_number_of_transactions(to_s_t_ne_t_statistics_message_read.number_of_transactions, to_s_t_ne_t_statistics_message_written.number_of_transactions);
  skip
}

/* ---- Open: 23 bytes ---------------------------------------------------------- */

/* Open */
typedef Open {
  byte unit_flag;
  byte index_value[14];
  byte sign;
  byte time_c_6_hhmmss[6];
  byte flag
};

int open_at;

/* every byte of Open set to one value */
inline fill_open(open_record, open_value) {
  open_record.unit_flag = open_value;
  open_at = 0;
  do
  :: open_at < 14 -> open_record.index_value[open_at] = open_value; open_at = open_at + 1
  :: else -> break
  od;
  open_record.sign = open_value;
  open_at = 0;
  do
  :: open_at < 6 -> open_record.time_c_6_hhmmss[open_at] = open_value; open_at = open_at + 1
  :: else -> break
  od;
  open_record.flag = open_value;
  skip
}

/* each byte of Open set to where it lies, so a field read out of place says so */
inline ramp_open(open_record, open_base) {
  open_record.unit_flag = (open_base + 0 + 1) % 256;
  open_at = 0;
  do
  :: open_at < 14 -> open_record.index_value[open_at] = (open_base + 1 + open_at + 1) % 256; open_at = open_at + 1
  :: else -> break
  od;
  open_record.sign = (open_base + 15 + 1) % 256;
  open_at = 0;
  do
  :: open_at < 6 -> open_record.time_c_6_hhmmss[open_at] = (open_base + 16 + open_at + 1) % 256; open_at = open_at + 1
  :: else -> break
  od;
  open_record.flag = (open_base + 22 + 1) % 256;
  skip
}

/* Open to the wire, 23 bytes from where the cursor stands */
inline encode_open(open_record) {
  wire[at] = open_record.unit_flag; at = at + 1;
  open_at = 0;
  do
  :: open_at < 14 -> wire[at] = open_record.index_value[open_at]; at = at + 1; open_at = open_at + 1
  :: else -> break
  od;
  wire[at] = open_record.sign; at = at + 1;
  open_at = 0;
  do
  :: open_at < 6 -> wire[at] = open_record.time_c_6_hhmmss[open_at]; at = at + 1; open_at = open_at + 1
  :: else -> break
  od;
  wire[at] = open_record.flag; at = at + 1;
  skip
}

/* Open off the wire, 23 bytes from where the cursor stands */
inline decode_open(open_record) {
  open_record.unit_flag = wire[at]; at = at + 1;
  open_at = 0;
  do
  :: open_at < 14 -> open_record.index_value[open_at] = wire[at]; at = at + 1; open_at = open_at + 1
  :: else -> break
  od;
  open_record.sign = wire[at]; at = at + 1;
  open_at = 0;
  do
  :: open_at < 6 -> open_record.time_c_6_hhmmss[open_at] = wire[at]; at = at + 1; open_at = open_at + 1
  :: else -> break
  od;
  open_record.flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Open is what was written, byte for byte */
inline equal_open(open_read, open_written) {
  assert(open_read.unit_flag == open_written.unit_flag);
  open_at = 0;
  do
  :: open_at < 14 -> assert(open_read.index_value[open_at] == open_written.index_value[open_at]); open_at = open_at + 1
  :: else -> break
  od;
  assert(open_read.sign == open_written.sign);
  open_at = 0;
  do
  :: open_at < 6 -> assert(open_read.time_c_6_hhmmss[open_at] == open_written.time_c_6_hhmmss[open_at]); open_at = open_at + 1
  :: else -> break
  od;
  assert(open_read.flag == open_written.flag);
  skip
}

/* ---- Highest: 23 bytes ------------------------------------------------------- */

/* Highest */
typedef Highest {
  byte unit_flag;
  byte index_value[14];
  byte sign;
  byte time_c_6_hhmmss[6];
  byte flag
};

int highest_at;

/* every byte of Highest set to one value */
inline fill_highest(highest_record, highest_value) {
  highest_record.unit_flag = highest_value;
  highest_at = 0;
  do
  :: highest_at < 14 -> highest_record.index_value[highest_at] = highest_value; highest_at = highest_at + 1
  :: else -> break
  od;
  highest_record.sign = highest_value;
  highest_at = 0;
  do
  :: highest_at < 6 -> highest_record.time_c_6_hhmmss[highest_at] = highest_value; highest_at = highest_at + 1
  :: else -> break
  od;
  highest_record.flag = highest_value;
  skip
}

/* each byte of Highest set to where it lies, so a field read out of place says so */
inline ramp_highest(highest_record, highest_base) {
  highest_record.unit_flag = (highest_base + 0 + 1) % 256;
  highest_at = 0;
  do
  :: highest_at < 14 -> highest_record.index_value[highest_at] = (highest_base + 1 + highest_at + 1) % 256; highest_at = highest_at + 1
  :: else -> break
  od;
  highest_record.sign = (highest_base + 15 + 1) % 256;
  highest_at = 0;
  do
  :: highest_at < 6 -> highest_record.time_c_6_hhmmss[highest_at] = (highest_base + 16 + highest_at + 1) % 256; highest_at = highest_at + 1
  :: else -> break
  od;
  highest_record.flag = (highest_base + 22 + 1) % 256;
  skip
}

/* Highest to the wire, 23 bytes from where the cursor stands */
inline encode_highest(highest_record) {
  wire[at] = highest_record.unit_flag; at = at + 1;
  highest_at = 0;
  do
  :: highest_at < 14 -> wire[at] = highest_record.index_value[highest_at]; at = at + 1; highest_at = highest_at + 1
  :: else -> break
  od;
  wire[at] = highest_record.sign; at = at + 1;
  highest_at = 0;
  do
  :: highest_at < 6 -> wire[at] = highest_record.time_c_6_hhmmss[highest_at]; at = at + 1; highest_at = highest_at + 1
  :: else -> break
  od;
  wire[at] = highest_record.flag; at = at + 1;
  skip
}

/* Highest off the wire, 23 bytes from where the cursor stands */
inline decode_highest(highest_record) {
  highest_record.unit_flag = wire[at]; at = at + 1;
  highest_at = 0;
  do
  :: highest_at < 14 -> highest_record.index_value[highest_at] = wire[at]; at = at + 1; highest_at = highest_at + 1
  :: else -> break
  od;
  highest_record.sign = wire[at]; at = at + 1;
  highest_at = 0;
  do
  :: highest_at < 6 -> highest_record.time_c_6_hhmmss[highest_at] = wire[at]; at = at + 1; highest_at = highest_at + 1
  :: else -> break
  od;
  highest_record.flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Highest is what was written, byte for byte */
inline equal_highest(highest_read, highest_written) {
  assert(highest_read.unit_flag == highest_written.unit_flag);
  highest_at = 0;
  do
  :: highest_at < 14 -> assert(highest_read.index_value[highest_at] == highest_written.index_value[highest_at]); highest_at = highest_at + 1
  :: else -> break
  od;
  assert(highest_read.sign == highest_written.sign);
  highest_at = 0;
  do
  :: highest_at < 6 -> assert(highest_read.time_c_6_hhmmss[highest_at] == highest_written.time_c_6_hhmmss[highest_at]); highest_at = highest_at + 1
  :: else -> break
  od;
  assert(highest_read.flag == highest_written.flag);
  skip
}

/* ---- Lowest: 23 bytes -------------------------------------------------------- */

/* Lowest */
typedef Lowest {
  byte unit_flag;
  byte index_value[14];
  byte sign;
  byte time_c_6_hhmmss[6];
  byte flag
};

int lowest_at;

/* every byte of Lowest set to one value */
inline fill_lowest(lowest_record, lowest_value) {
  lowest_record.unit_flag = lowest_value;
  lowest_at = 0;
  do
  :: lowest_at < 14 -> lowest_record.index_value[lowest_at] = lowest_value; lowest_at = lowest_at + 1
  :: else -> break
  od;
  lowest_record.sign = lowest_value;
  lowest_at = 0;
  do
  :: lowest_at < 6 -> lowest_record.time_c_6_hhmmss[lowest_at] = lowest_value; lowest_at = lowest_at + 1
  :: else -> break
  od;
  lowest_record.flag = lowest_value;
  skip
}

/* each byte of Lowest set to where it lies, so a field read out of place says so */
inline ramp_lowest(lowest_record, lowest_base) {
  lowest_record.unit_flag = (lowest_base + 0 + 1) % 256;
  lowest_at = 0;
  do
  :: lowest_at < 14 -> lowest_record.index_value[lowest_at] = (lowest_base + 1 + lowest_at + 1) % 256; lowest_at = lowest_at + 1
  :: else -> break
  od;
  lowest_record.sign = (lowest_base + 15 + 1) % 256;
  lowest_at = 0;
  do
  :: lowest_at < 6 -> lowest_record.time_c_6_hhmmss[lowest_at] = (lowest_base + 16 + lowest_at + 1) % 256; lowest_at = lowest_at + 1
  :: else -> break
  od;
  lowest_record.flag = (lowest_base + 22 + 1) % 256;
  skip
}

/* Lowest to the wire, 23 bytes from where the cursor stands */
inline encode_lowest(lowest_record) {
  wire[at] = lowest_record.unit_flag; at = at + 1;
  lowest_at = 0;
  do
  :: lowest_at < 14 -> wire[at] = lowest_record.index_value[lowest_at]; at = at + 1; lowest_at = lowest_at + 1
  :: else -> break
  od;
  wire[at] = lowest_record.sign; at = at + 1;
  lowest_at = 0;
  do
  :: lowest_at < 6 -> wire[at] = lowest_record.time_c_6_hhmmss[lowest_at]; at = at + 1; lowest_at = lowest_at + 1
  :: else -> break
  od;
  wire[at] = lowest_record.flag; at = at + 1;
  skip
}

/* Lowest off the wire, 23 bytes from where the cursor stands */
inline decode_lowest(lowest_record) {
  lowest_record.unit_flag = wire[at]; at = at + 1;
  lowest_at = 0;
  do
  :: lowest_at < 14 -> lowest_record.index_value[lowest_at] = wire[at]; at = at + 1; lowest_at = lowest_at + 1
  :: else -> break
  od;
  lowest_record.sign = wire[at]; at = at + 1;
  lowest_at = 0;
  do
  :: lowest_at < 6 -> lowest_record.time_c_6_hhmmss[lowest_at] = wire[at]; at = at + 1; lowest_at = lowest_at + 1
  :: else -> break
  od;
  lowest_record.flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Lowest is what was written, byte for byte */
inline equal_lowest(lowest_read, lowest_written) {
  assert(lowest_read.unit_flag == lowest_written.unit_flag);
  lowest_at = 0;
  do
  :: lowest_at < 14 -> assert(lowest_read.index_value[lowest_at] == lowest_written.index_value[lowest_at]); lowest_at = lowest_at + 1
  :: else -> break
  od;
  assert(lowest_read.sign == lowest_written.sign);
  lowest_at = 0;
  do
  :: lowest_at < 6 -> assert(lowest_read.time_c_6_hhmmss[lowest_at] == lowest_written.time_c_6_hhmmss[lowest_at]); lowest_at = lowest_at + 1
  :: else -> break
  od;
  assert(lowest_read.flag == lowest_written.flag);
  skip
}

/* ---- Current Price: 23 bytes ------------------------------------------------- */

/* Current price */
typedef CurrentPrice {
  byte unit_flag;
  byte index_value[14];
  byte sign;
  byte time_c_6_hhmmss[6];
  byte flag
};

int current_price_at;

/* every byte of Current Price set to one value */
inline fill_current_price(current_price_record, current_price_value) {
  current_price_record.unit_flag = current_price_value;
  current_price_at = 0;
  do
  :: current_price_at < 14 -> current_price_record.index_value[current_price_at] = current_price_value; current_price_at = current_price_at + 1
  :: else -> break
  od;
  current_price_record.sign = current_price_value;
  current_price_at = 0;
  do
  :: current_price_at < 6 -> current_price_record.time_c_6_hhmmss[current_price_at] = current_price_value; current_price_at = current_price_at + 1
  :: else -> break
  od;
  current_price_record.flag = current_price_value;
  skip
}

/* each byte of Current Price set to where it lies, so a field read out of place says so */
inline ramp_current_price(current_price_record, current_price_base) {
  current_price_record.unit_flag = (current_price_base + 0 + 1) % 256;
  current_price_at = 0;
  do
  :: current_price_at < 14 -> current_price_record.index_value[current_price_at] = (current_price_base + 1 + current_price_at + 1) % 256; current_price_at = current_price_at + 1
  :: else -> break
  od;
  current_price_record.sign = (current_price_base + 15 + 1) % 256;
  current_price_at = 0;
  do
  :: current_price_at < 6 -> current_price_record.time_c_6_hhmmss[current_price_at] = (current_price_base + 16 + current_price_at + 1) % 256; current_price_at = current_price_at + 1
  :: else -> break
  od;
  current_price_record.flag = (current_price_base + 22 + 1) % 256;
  skip
}

/* Current Price to the wire, 23 bytes from where the cursor stands */
inline encode_current_price(current_price_record) {
  wire[at] = current_price_record.unit_flag; at = at + 1;
  current_price_at = 0;
  do
  :: current_price_at < 14 -> wire[at] = current_price_record.index_value[current_price_at]; at = at + 1; current_price_at = current_price_at + 1
  :: else -> break
  od;
  wire[at] = current_price_record.sign; at = at + 1;
  current_price_at = 0;
  do
  :: current_price_at < 6 -> wire[at] = current_price_record.time_c_6_hhmmss[current_price_at]; at = at + 1; current_price_at = current_price_at + 1
  :: else -> break
  od;
  wire[at] = current_price_record.flag; at = at + 1;
  skip
}

/* Current Price off the wire, 23 bytes from where the cursor stands */
inline decode_current_price(current_price_record) {
  current_price_record.unit_flag = wire[at]; at = at + 1;
  current_price_at = 0;
  do
  :: current_price_at < 14 -> current_price_record.index_value[current_price_at] = wire[at]; at = at + 1; current_price_at = current_price_at + 1
  :: else -> break
  od;
  current_price_record.sign = wire[at]; at = at + 1;
  current_price_at = 0;
  do
  :: current_price_at < 6 -> current_price_record.time_c_6_hhmmss[current_price_at] = wire[at]; at = at + 1; current_price_at = current_price_at + 1
  :: else -> break
  od;
  current_price_record.flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Current Price is what was written, byte for byte */
inline equal_current_price(current_price_read, current_price_written) {
  assert(current_price_read.unit_flag == current_price_written.unit_flag);
  current_price_at = 0;
  do
  :: current_price_at < 14 -> assert(current_price_read.index_value[current_price_at] == current_price_written.index_value[current_price_at]); current_price_at = current_price_at + 1
  :: else -> break
  od;
  assert(current_price_read.sign == current_price_written.sign);
  current_price_at = 0;
  do
  :: current_price_at < 6 -> assert(current_price_read.time_c_6_hhmmss[current_price_at] == current_price_written.time_c_6_hhmmss[current_price_at]); current_price_at = current_price_at + 1
  :: else -> break
  od;
  assert(current_price_read.flag == current_price_written.flag);
  skip
}

/* ---- Index Day On Day Comparison: 25 bytes ----------------------------------- */

/* Index Day-on-day comparison */
typedef IndexDayOnDayComparison {
  byte net_change_rate[8];
  byte sign;
  byte unit_flag;
  byte net_change[14];
  byte second_sign
};

int index_day_on_day_comparison_at;

/* every byte of Index Day On Day Comparison set to one value */
inline fill_index_day_on_day_comparison(index_day_on_day_comparison_record, index_day_on_day_comparison_value) {
  index_day_on_day_comparison_at = 0;
  do
  :: index_day_on_day_comparison_at < 8 -> index_day_on_day_comparison_record.net_change_rate[index_day_on_day_comparison_at] = index_day_on_day_comparison_value; index_day_on_day_comparison_at = index_day_on_day_comparison_at + 1
  :: else -> break
  od;
  index_day_on_day_comparison_record.sign = index_day_on_day_comparison_value;
  index_day_on_day_comparison_record.unit_flag = index_day_on_day_comparison_value;
  index_day_on_day_comparison_at = 0;
  do
  :: index_day_on_day_comparison_at < 14 -> index_day_on_day_comparison_record.net_change[index_day_on_day_comparison_at] = index_day_on_day_comparison_value; index_day_on_day_comparison_at = index_day_on_day_comparison_at + 1
  :: else -> break
  od;
  index_day_on_day_comparison_record.second_sign = index_day_on_day_comparison_value;
  skip
}

/* each byte of Index Day On Day Comparison set to where it lies, so a field read out of place says so */
inline ramp_index_day_on_day_comparison(index_day_on_day_comparison_record, index_day_on_day_comparison_base) {
  index_day_on_day_comparison_at = 0;
  do
  :: index_day_on_day_comparison_at < 8 -> index_day_on_day_comparison_record.net_change_rate[index_day_on_day_comparison_at] = (index_day_on_day_comparison_base + 0 + index_day_on_day_comparison_at + 1) % 256; index_day_on_day_comparison_at = index_day_on_day_comparison_at + 1
  :: else -> break
  od;
  index_day_on_day_comparison_record.sign = (index_day_on_day_comparison_base + 8 + 1) % 256;
  index_day_on_day_comparison_record.unit_flag = (index_day_on_day_comparison_base + 9 + 1) % 256;
  index_day_on_day_comparison_at = 0;
  do
  :: index_day_on_day_comparison_at < 14 -> index_day_on_day_comparison_record.net_change[index_day_on_day_comparison_at] = (index_day_on_day_comparison_base + 10 + index_day_on_day_comparison_at + 1) % 256; index_day_on_day_comparison_at = index_day_on_day_comparison_at + 1
  :: else -> break
  od;
  index_day_on_day_comparison_record.second_sign = (index_day_on_day_comparison_base + 24 + 1) % 256;
  skip
}

/* Index Day On Day Comparison to the wire, 25 bytes from where the cursor stands */
inline encode_index_day_on_day_comparison(index_day_on_day_comparison_record) {
  index_day_on_day_comparison_at = 0;
  do
  :: index_day_on_day_comparison_at < 8 -> wire[at] = index_day_on_day_comparison_record.net_change_rate[index_day_on_day_comparison_at]; at = at + 1; index_day_on_day_comparison_at = index_day_on_day_comparison_at + 1
  :: else -> break
  od;
  wire[at] = index_day_on_day_comparison_record.sign; at = at + 1;
  wire[at] = index_day_on_day_comparison_record.unit_flag; at = at + 1;
  index_day_on_day_comparison_at = 0;
  do
  :: index_day_on_day_comparison_at < 14 -> wire[at] = index_day_on_day_comparison_record.net_change[index_day_on_day_comparison_at]; at = at + 1; index_day_on_day_comparison_at = index_day_on_day_comparison_at + 1
  :: else -> break
  od;
  wire[at] = index_day_on_day_comparison_record.second_sign; at = at + 1;
  skip
}

/* Index Day On Day Comparison off the wire, 25 bytes from where the cursor stands */
inline decode_index_day_on_day_comparison(index_day_on_day_comparison_record) {
  index_day_on_day_comparison_at = 0;
  do
  :: index_day_on_day_comparison_at < 8 -> index_day_on_day_comparison_record.net_change_rate[index_day_on_day_comparison_at] = wire[at]; at = at + 1; index_day_on_day_comparison_at = index_day_on_day_comparison_at + 1
  :: else -> break
  od;
  index_day_on_day_comparison_record.sign = wire[at]; at = at + 1;
  index_day_on_day_comparison_record.unit_flag = wire[at]; at = at + 1;
  index_day_on_day_comparison_at = 0;
  do
  :: index_day_on_day_comparison_at < 14 -> index_day_on_day_comparison_record.net_change[index_day_on_day_comparison_at] = wire[at]; at = at + 1; index_day_on_day_comparison_at = index_day_on_day_comparison_at + 1
  :: else -> break
  od;
  index_day_on_day_comparison_record.second_sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Index Day On Day Comparison is what was written, byte for byte */
inline equal_index_day_on_day_comparison(index_day_on_day_comparison_read, index_day_on_day_comparison_written) {
  index_day_on_day_comparison_at = 0;
  do
  :: index_day_on_day_comparison_at < 8 -> assert(index_day_on_day_comparison_read.net_change_rate[index_day_on_day_comparison_at] == index_day_on_day_comparison_written.net_change_rate[index_day_on_day_comparison_at]); index_day_on_day_comparison_at = index_day_on_day_comparison_at + 1
  :: else -> break
  od;
  assert(index_day_on_day_comparison_read.sign == index_day_on_day_comparison_written.sign);
  assert(index_day_on_day_comparison_read.unit_flag == index_day_on_day_comparison_written.unit_flag);
  index_day_on_day_comparison_at = 0;
  do
  :: index_day_on_day_comparison_at < 14 -> assert(index_day_on_day_comparison_read.net_change[index_day_on_day_comparison_at] == index_day_on_day_comparison_written.net_change[index_day_on_day_comparison_at]); index_day_on_day_comparison_at = index_day_on_day_comparison_at + 1
  :: else -> break
  od;
  assert(index_day_on_day_comparison_read.second_sign == index_day_on_day_comparison_written.second_sign);
  skip
}

/* ---- Index Open High Low And Closing Prices Message: 123 bytes --------------- */

/* In this tag, index information will be set. This data is appeared as one of index data. */
typedef IndexOpenHighLowAndClosingPricesMessage {
  byte reserved_2[2];
  byte index_type[4];
  Open open;
  Highest highest;
  Lowest lowest;
  CurrentPrice current_price;
  IndexDayOnDayComparison index_day_on_day_comparison
};

int index_open_high_low_and_closing_prices_message_at;

/* every byte of Index Open High Low And Closing Prices Message set to one value */
inline fill_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_record, index_open_high_low_and_closing_prices_message_value) {
  index_open_high_low_and_closing_prices_message_at = 0;
  do
  :: index_open_high_low_and_closing_prices_message_at < 2 -> index_open_high_low_and_closing_prices_message_record.reserved_2[index_open_high_low_and_closing_prices_message_at] = index_open_high_low_and_closing_prices_message_value; index_open_high_low_and_closing_prices_message_at = index_open_high_low_and_closing_prices_message_at + 1
  :: else -> break
  od;
  index_open_high_low_and_closing_prices_message_at = 0;
  do
  :: index_open_high_low_and_closing_prices_message_at < 4 -> index_open_high_low_and_closing_prices_message_record.index_type[index_open_high_low_and_closing_prices_message_at] = index_open_high_low_and_closing_prices_message_value; index_open_high_low_and_closing_prices_message_at = index_open_high_low_and_closing_prices_message_at + 1
  :: else -> break
  od;
  fill_open(index_open_high_low_and_closing_prices_message_record.open, index_open_high_low_and_closing_prices_message_value);
  fill_highest(index_open_high_low_and_closing_prices_message_record.highest, index_open_high_low_and_closing_prices_message_value);
  fill_lowest(index_open_high_low_and_closing_prices_message_record.lowest, index_open_high_low_and_closing_prices_message_value);
  fill_current_price(index_open_high_low_and_closing_prices_message_record.current_price, index_open_high_low_and_closing_prices_message_value);
  fill_index_day_on_day_comparison(index_open_high_low_and_closing_prices_message_record.index_day_on_day_comparison, index_open_high_low_and_closing_prices_message_value);
  skip
}

/* each byte of Index Open High Low And Closing Prices Message set to where it lies, so a field read out of place says so */
inline ramp_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_record, index_open_high_low_and_closing_prices_message_base) {
  index_open_high_low_and_closing_prices_message_at = 0;
  do
  :: index_open_high_low_and_closing_prices_message_at < 2 -> index_open_high_low_and_closing_prices_message_record.reserved_2[index_open_high_low_and_closing_prices_message_at] = (index_open_high_low_and_closing_prices_message_base + 0 + index_open_high_low_and_closing_prices_message_at + 1) % 256; index_open_high_low_and_closing_prices_message_at = index_open_high_low_and_closing_prices_message_at + 1
  :: else -> break
  od;
  index_open_high_low_and_closing_prices_message_at = 0;
  do
  :: index_open_high_low_and_closing_prices_message_at < 4 -> index_open_high_low_and_closing_prices_message_record.index_type[index_open_high_low_and_closing_prices_message_at] = (index_open_high_low_and_closing_prices_message_base + 2 + index_open_high_low_and_closing_prices_message_at + 1) % 256; index_open_high_low_and_closing_prices_message_at = index_open_high_low_and_closing_prices_message_at + 1
  :: else -> break
  od;
  ramp_open(index_open_high_low_and_closing_prices_message_record.open, index_open_high_low_and_closing_prices_message_base + 6);
  ramp_highest(index_open_high_low_and_closing_prices_message_record.highest, index_open_high_low_and_closing_prices_message_base + 29);
  ramp_lowest(index_open_high_low_and_closing_prices_message_record.lowest, index_open_high_low_and_closing_prices_message_base + 52);
  ramp_current_price(index_open_high_low_and_closing_prices_message_record.current_price, index_open_high_low_and_closing_prices_message_base + 75);
  ramp_index_day_on_day_comparison(index_open_high_low_and_closing_prices_message_record.index_day_on_day_comparison, index_open_high_low_and_closing_prices_message_base + 98);
  skip
}

/* Index Open High Low And Closing Prices Message to the wire, 123 bytes from where the cursor stands */
inline encode_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_record) {
  index_open_high_low_and_closing_prices_message_at = 0;
  do
  :: index_open_high_low_and_closing_prices_message_at < 2 -> wire[at] = index_open_high_low_and_closing_prices_message_record.reserved_2[index_open_high_low_and_closing_prices_message_at]; at = at + 1; index_open_high_low_and_closing_prices_message_at = index_open_high_low_and_closing_prices_message_at + 1
  :: else -> break
  od;
  index_open_high_low_and_closing_prices_message_at = 0;
  do
  :: index_open_high_low_and_closing_prices_message_at < 4 -> wire[at] = index_open_high_low_and_closing_prices_message_record.index_type[index_open_high_low_and_closing_prices_message_at]; at = at + 1; index_open_high_low_and_closing_prices_message_at = index_open_high_low_and_closing_prices_message_at + 1
  :: else -> break
  od;
  encode_open(index_open_high_low_and_closing_prices_message_record.open);
  encode_highest(index_open_high_low_and_closing_prices_message_record.highest);
  encode_lowest(index_open_high_low_and_closing_prices_message_record.lowest);
  encode_current_price(index_open_high_low_and_closing_prices_message_record.current_price);
  encode_index_day_on_day_comparison(index_open_high_low_and_closing_prices_message_record.index_day_on_day_comparison);
  skip
}

/* Index Open High Low And Closing Prices Message off the wire, 123 bytes from where the cursor stands */
inline decode_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_record) {
  index_open_high_low_and_closing_prices_message_at = 0;
  do
  :: index_open_high_low_and_closing_prices_message_at < 2 -> index_open_high_low_and_closing_prices_message_record.reserved_2[index_open_high_low_and_closing_prices_message_at] = wire[at]; at = at + 1; index_open_high_low_and_closing_prices_message_at = index_open_high_low_and_closing_prices_message_at + 1
  :: else -> break
  od;
  index_open_high_low_and_closing_prices_message_at = 0;
  do
  :: index_open_high_low_and_closing_prices_message_at < 4 -> index_open_high_low_and_closing_prices_message_record.index_type[index_open_high_low_and_closing_prices_message_at] = wire[at]; at = at + 1; index_open_high_low_and_closing_prices_message_at = index_open_high_low_and_closing_prices_message_at + 1
  :: else -> break
  od;
  decode_open(index_open_high_low_and_closing_prices_message_record.open);
  decode_highest(index_open_high_low_and_closing_prices_message_record.highest);
  decode_lowest(index_open_high_low_and_closing_prices_message_record.lowest);
  decode_current_price(index_open_high_low_and_closing_prices_message_record.current_price);
  decode_index_day_on_day_comparison(index_open_high_low_and_closing_prices_message_record.index_day_on_day_comparison);
  skip
}

/* what was read of Index Open High Low And Closing Prices Message is what was written, byte for byte */
inline equal_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_read, index_open_high_low_and_closing_prices_message_written) {
  index_open_high_low_and_closing_prices_message_at = 0;
  do
  :: index_open_high_low_and_closing_prices_message_at < 2 -> assert(index_open_high_low_and_closing_prices_message_read.reserved_2[index_open_high_low_and_closing_prices_message_at] == index_open_high_low_and_closing_prices_message_written.reserved_2[index_open_high_low_and_closing_prices_message_at]); index_open_high_low_and_closing_prices_message_at = index_open_high_low_and_closing_prices_message_at + 1
  :: else -> break
  od;
  index_open_high_low_and_closing_prices_message_at = 0;
  do
  :: index_open_high_low_and_closing_prices_message_at < 4 -> assert(index_open_high_low_and_closing_prices_message_read.index_type[index_open_high_low_and_closing_prices_message_at] == index_open_high_low_and_closing_prices_message_written.index_type[index_open_high_low_and_closing_prices_message_at]); index_open_high_low_and_closing_prices_message_at = index_open_high_low_and_closing_prices_message_at + 1
  :: else -> break
  od;
  equal_open(index_open_high_low_and_closing_prices_message_read.open, index_open_high_low_and_closing_prices_message_written.open);
  equal_highest(index_open_high_low_and_closing_prices_message_read.highest, index_open_high_low_and_closing_prices_message_written.highest);
  equal_lowest(index_open_high_low_and_closing_prices_message_read.lowest, index_open_high_low_and_closing_prices_message_written.lowest);
  equal_current_price(index_open_high_low_and_closing_prices_message_read.current_price, index_open_high_low_and_closing_prices_message_written.current_price);
  equal_index_day_on_day_comparison(index_open_high_low_and_closing_prices_message_read.index_day_on_day_comparison, index_open_high_low_and_closing_prices_message_written.index_day_on_day_comparison);
  skip
}

/* ---- Index: 22 bytes --------------------------------------------------------- */

/* Index */
typedef Index {
  byte unit_flag;
  byte index_value[14];
  byte sign;
  byte time_c_6_hhmmss[6]
};

int index_at;

/* every byte of Index set to one value */
inline fill_index(index_record, index_value_) {
  index_record.unit_flag = index_value_;
  index_at = 0;
  do
  :: index_at < 14 -> index_record.index_value[index_at] = index_value_; index_at = index_at + 1
  :: else -> break
  od;
  index_record.sign = index_value_;
  index_at = 0;
  do
  :: index_at < 6 -> index_record.time_c_6_hhmmss[index_at] = index_value_; index_at = index_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index set to where it lies, so a field read out of place says so */
inline ramp_index(index_record, index_base) {
  index_record.unit_flag = (index_base + 0 + 1) % 256;
  index_at = 0;
  do
  :: index_at < 14 -> index_record.index_value[index_at] = (index_base + 1 + index_at + 1) % 256; index_at = index_at + 1
  :: else -> break
  od;
  index_record.sign = (index_base + 15 + 1) % 256;
  index_at = 0;
  do
  :: index_at < 6 -> index_record.time_c_6_hhmmss[index_at] = (index_base + 16 + index_at + 1) % 256; index_at = index_at + 1
  :: else -> break
  od;
  skip
}

/* Index to the wire, 22 bytes from where the cursor stands */
inline encode_index(index_record) {
  wire[at] = index_record.unit_flag; at = at + 1;
  index_at = 0;
  do
  :: index_at < 14 -> wire[at] = index_record.index_value[index_at]; at = at + 1; index_at = index_at + 1
  :: else -> break
  od;
  wire[at] = index_record.sign; at = at + 1;
  index_at = 0;
  do
  :: index_at < 6 -> wire[at] = index_record.time_c_6_hhmmss[index_at]; at = at + 1; index_at = index_at + 1
  :: else -> break
  od;
  skip
}

/* Index off the wire, 22 bytes from where the cursor stands */
inline decode_index(index_record) {
  index_record.unit_flag = wire[at]; at = at + 1;
  index_at = 0;
  do
  :: index_at < 14 -> index_record.index_value[index_at] = wire[at]; at = at + 1; index_at = index_at + 1
  :: else -> break
  od;
  index_record.sign = wire[at]; at = at + 1;
  index_at = 0;
  do
  :: index_at < 6 -> index_record.time_c_6_hhmmss[index_at] = wire[at]; at = at + 1; index_at = index_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index is what was written, byte for byte */
inline equal_index(index_read, index_written) {
  assert(index_read.unit_flag == index_written.unit_flag);
  index_at = 0;
  do
  :: index_at < 14 -> assert(index_read.index_value[index_at] == index_written.index_value[index_at]); index_at = index_at + 1
  :: else -> break
  od;
  assert(index_read.sign == index_written.sign);
  index_at = 0;
  do
  :: index_at < 6 -> assert(index_read.time_c_6_hhmmss[index_at] == index_written.time_c_6_hhmmss[index_at]); index_at = index_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Special Quotation Message: 29 bytes ------------------------------------- */

/* In this tag, special quotation (S.Q.) information will be set. This data appears as part of index data. */
typedef SpecialQuotationMessage {
  byte reserved_2[2];
  byte sq_type[4];
  Index index;
  byte reserved_1
};

int special_quotation_message_at;

/* every byte of Special Quotation Message set to one value */
inline fill_special_quotation_message(special_quotation_message_record, special_quotation_message_value) {
  special_quotation_message_at = 0;
  do
  :: special_quotation_message_at < 2 -> special_quotation_message_record.reserved_2[special_quotation_message_at] = special_quotation_message_value; special_quotation_message_at = special_quotation_message_at + 1
  :: else -> break
  od;
  special_quotation_message_at = 0;
  do
  :: special_quotation_message_at < 4 -> special_quotation_message_record.sq_type[special_quotation_message_at] = special_quotation_message_value; special_quotation_message_at = special_quotation_message_at + 1
  :: else -> break
  od;
  fill_index(special_quotation_message_record.index, special_quotation_message_value);
  special_quotation_message_record.reserved_1 = special_quotation_message_value;
  skip
}

/* each byte of Special Quotation Message set to where it lies, so a field read out of place says so */
inline ramp_special_quotation_message(special_quotation_message_record, special_quotation_message_base) {
  special_quotation_message_at = 0;
  do
  :: special_quotation_message_at < 2 -> special_quotation_message_record.reserved_2[special_quotation_message_at] = (special_quotation_message_base + 0 + special_quotation_message_at + 1) % 256; special_quotation_message_at = special_quotation_message_at + 1
  :: else -> break
  od;
  special_quotation_message_at = 0;
  do
  :: special_quotation_message_at < 4 -> special_quotation_message_record.sq_type[special_quotation_message_at] = (special_quotation_message_base + 2 + special_quotation_message_at + 1) % 256; special_quotation_message_at = special_quotation_message_at + 1
  :: else -> break
  od;
  ramp_index(special_quotation_message_record.index, special_quotation_message_base + 6);
  special_quotation_message_record.reserved_1 = (special_quotation_message_base + 28 + 1) % 256;
  skip
}

/* Special Quotation Message to the wire, 29 bytes from where the cursor stands */
inline encode_special_quotation_message(special_quotation_message_record) {
  special_quotation_message_at = 0;
  do
  :: special_quotation_message_at < 2 -> wire[at] = special_quotation_message_record.reserved_2[special_quotation_message_at]; at = at + 1; special_quotation_message_at = special_quotation_message_at + 1
  :: else -> break
  od;
  special_quotation_message_at = 0;
  do
  :: special_quotation_message_at < 4 -> wire[at] = special_quotation_message_record.sq_type[special_quotation_message_at]; at = at + 1; special_quotation_message_at = special_quotation_message_at + 1
  :: else -> break
  od;
  encode_index(special_quotation_message_record.index);
  wire[at] = special_quotation_message_record.reserved_1; at = at + 1;
  skip
}

/* Special Quotation Message off the wire, 29 bytes from where the cursor stands */
inline decode_special_quotation_message(special_quotation_message_record) {
  special_quotation_message_at = 0;
  do
  :: special_quotation_message_at < 2 -> special_quotation_message_record.reserved_2[special_quotation_message_at] = wire[at]; at = at + 1; special_quotation_message_at = special_quotation_message_at + 1
  :: else -> break
  od;
  special_quotation_message_at = 0;
  do
  :: special_quotation_message_at < 4 -> special_quotation_message_record.sq_type[special_quotation_message_at] = wire[at]; at = at + 1; special_quotation_message_at = special_quotation_message_at + 1
  :: else -> break
  od;
  decode_index(special_quotation_message_record.index);
  special_quotation_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Special Quotation Message is what was written, byte for byte */
inline equal_special_quotation_message(special_quotation_message_read, special_quotation_message_written) {
  special_quotation_message_at = 0;
  do
  :: special_quotation_message_at < 2 -> assert(special_quotation_message_read.reserved_2[special_quotation_message_at] == special_quotation_message_written.reserved_2[special_quotation_message_at]); special_quotation_message_at = special_quotation_message_at + 1
  :: else -> break
  od;
  special_quotation_message_at = 0;
  do
  :: special_quotation_message_at < 4 -> assert(special_quotation_message_read.sq_type[special_quotation_message_at] == special_quotation_message_written.sq_type[special_quotation_message_at]); special_quotation_message_at = special_quotation_message_at + 1
  :: else -> break
  od;
  equal_index(special_quotation_message_read.index, special_quotation_message_written.index);
  assert(special_quotation_message_read.reserved_1 == special_quotation_message_written.reserved_1);
  skip
}

/* ---- Control Message: 10 bytes ----------------------------------------------- */

/* In this tag, the test mode flag and the start/end flag that are used in a control message will be set. This tag will be edited into a control message (communication control and health check control) for output. */
typedef ControlMessage {
  byte reserved_2[2];
  byte test_mode_flag;
  byte startend_flag;
  byte time_c_6_hhmm[6]
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
  control_message_record.startend_flag = control_message_value;
  control_message_at = 0;
  do
  :: control_message_at < 6 -> control_message_record.time_c_6_hhmm[control_message_at] = control_message_value; control_message_at = control_message_at + 1
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
  control_message_record.startend_flag = (control_message_base + 3 + 1) % 256;
  control_message_at = 0;
  do
  :: control_message_at < 6 -> control_message_record.time_c_6_hhmm[control_message_at] = (control_message_base + 4 + control_message_at + 1) % 256; control_message_at = control_message_at + 1
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
  wire[at] = control_message_record.startend_flag; at = at + 1;
  control_message_at = 0;
  do
  :: control_message_at < 6 -> wire[at] = control_message_record.time_c_6_hhmm[control_message_at]; at = at + 1; control_message_at = control_message_at + 1
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
  control_message_record.startend_flag = wire[at]; at = at + 1;
  control_message_at = 0;
  do
  :: control_message_at < 6 -> control_message_record.time_c_6_hhmm[control_message_at] = wire[at]; at = at + 1; control_message_at = control_message_at + 1
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
  assert(control_message_read.startend_flag == control_message_written.startend_flag);
  control_message_at = 0;
  do
  :: control_message_at < 6 -> assert(control_message_read.time_c_6_hhmm[control_message_at] == control_message_written.time_c_6_hhmm[control_message_at]); control_message_at = control_message_at + 1
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

/* Total Market Value: encoded, read back, and compared */
proctype check_total_market_value() {
  TotalMarketValue total_market_value_sent;
  TotalMarketValue total_market_value_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_total_market_value(total_market_value_sent, 0)
  :: pattern == 1 -> fill_total_market_value(total_market_value_sent, 32)
  :: pattern == 2 -> fill_total_market_value(total_market_value_sent, 255)
  :: else -> ramp_total_market_value(total_market_value_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_total_market_value(total_market_value_sent);
    assert(at == 15);
    at = 0;
    decode_total_market_value(total_market_value_got);
    assert(at == 15);
    equal_total_market_value(total_market_value_got, total_market_value_sent)
  }
}

/* Market Value Day On Day Comparison: encoded, read back, and compared */
proctype check_market_value_day_on_day_comparison() {
  MarketValueDayOnDayComparison market_value_day_on_day_comparison_sent;
  MarketValueDayOnDayComparison market_value_day_on_day_comparison_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_value_day_on_day_comparison(market_value_day_on_day_comparison_sent, 0)
  :: pattern == 1 -> fill_market_value_day_on_day_comparison(market_value_day_on_day_comparison_sent, 32)
  :: pattern == 2 -> fill_market_value_day_on_day_comparison(market_value_day_on_day_comparison_sent, 255)
  :: else -> ramp_market_value_day_on_day_comparison(market_value_day_on_day_comparison_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_value_day_on_day_comparison(market_value_day_on_day_comparison_sent);
    assert(at == 16);
    at = 0;
    decode_market_value_day_on_day_comparison(market_value_day_on_day_comparison_got);
    assert(at == 16);
    equal_market_value_day_on_day_comparison(market_value_day_on_day_comparison_got, market_value_day_on_day_comparison_sent)
  }
}

/* Market Value Message: encoded, read back, and compared */
proctype check_market_value_message() {
  MarketValueMessage market_value_message_sent;
  MarketValueMessage market_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_value_message(market_value_message_sent, 0)
  :: pattern == 1 -> fill_market_value_message(market_value_message_sent, 32)
  :: pattern == 2 -> fill_market_value_message(market_value_message_sent, 255)
  :: else -> ramp_market_value_message(market_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_value_message(market_value_message_sent);
    assert(at == 43);
    at = 0;
    decode_market_value_message(market_value_message_got);
    assert(at == 43);
    equal_market_value_message(market_value_message_got, market_value_message_sent)
  }
}

/* Simple Yield: encoded, read back, and compared */
proctype check_simple_yield() {
  SimpleYield simple_yield_sent;
  SimpleYield simple_yield_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_yield(simple_yield_sent, 0)
  :: pattern == 1 -> fill_simple_yield(simple_yield_sent, 32)
  :: pattern == 2 -> fill_simple_yield(simple_yield_sent, 255)
  :: else -> ramp_simple_yield(simple_yield_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_yield(simple_yield_sent);
    assert(at == 9);
    at = 0;
    decode_simple_yield(simple_yield_got);
    assert(at == 9);
    equal_simple_yield(simple_yield_got, simple_yield_sent)
  }
}

/* Yield Day On Day Comparison: encoded, read back, and compared */
proctype check_yield_day_on_day_comparison() {
  YieldDayOnDayComparison yield_day_on_day_comparison_sent;
  YieldDayOnDayComparison yield_day_on_day_comparison_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_yield_day_on_day_comparison(yield_day_on_day_comparison_sent, 0)
  :: pattern == 1 -> fill_yield_day_on_day_comparison(yield_day_on_day_comparison_sent, 32)
  :: pattern == 2 -> fill_yield_day_on_day_comparison(yield_day_on_day_comparison_sent, 255)
  :: else -> ramp_yield_day_on_day_comparison(yield_day_on_day_comparison_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_yield_day_on_day_comparison(yield_day_on_day_comparison_sent);
    assert(at == 9);
    at = 0;
    decode_yield_day_on_day_comparison(yield_day_on_day_comparison_got);
    assert(at == 9);
    equal_yield_day_on_day_comparison(yield_day_on_day_comparison_got, yield_day_on_day_comparison_sent)
  }
}

/* Simple Yield Message: encoded, read back, and compared */
proctype check_simple_yield_message() {
  SimpleYieldMessage simple_yield_message_sent;
  SimpleYieldMessage simple_yield_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_yield_message(simple_yield_message_sent, 0)
  :: pattern == 1 -> fill_simple_yield_message(simple_yield_message_sent, 32)
  :: pattern == 2 -> fill_simple_yield_message(simple_yield_message_sent, 255)
  :: else -> ramp_simple_yield_message(simple_yield_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_yield_message(simple_yield_message_sent);
    assert(at == 30);
    at = 0;
    decode_simple_yield_message(simple_yield_message_got);
    assert(at == 30);
    equal_simple_yield_message(simple_yield_message_got, simple_yield_message_sent)
  }
}

/* Weighted Yield: encoded, read back, and compared */
proctype check_weighted_yield() {
  WeightedYield weighted_yield_sent;
  WeightedYield weighted_yield_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_weighted_yield(weighted_yield_sent, 0)
  :: pattern == 1 -> fill_weighted_yield(weighted_yield_sent, 32)
  :: pattern == 2 -> fill_weighted_yield(weighted_yield_sent, 255)
  :: else -> ramp_weighted_yield(weighted_yield_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_weighted_yield(weighted_yield_sent);
    assert(at == 9);
    at = 0;
    decode_weighted_yield(weighted_yield_got);
    assert(at == 9);
    equal_weighted_yield(weighted_yield_got, weighted_yield_sent)
  }
}

/* Weighted Yield Message: encoded, read back, and compared */
proctype check_weighted_yield_message() {
  WeightedYieldMessage weighted_yield_message_sent;
  WeightedYieldMessage weighted_yield_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_weighted_yield_message(weighted_yield_message_sent, 0)
  :: pattern == 1 -> fill_weighted_yield_message(weighted_yield_message_sent, 32)
  :: pattern == 2 -> fill_weighted_yield_message(weighted_yield_message_sent, 255)
  :: else -> ramp_weighted_yield_message(weighted_yield_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_weighted_yield_message(weighted_yield_message_sent);
    assert(at == 30);
    at = 0;
    decode_weighted_yield_message(weighted_yield_message_got);
    assert(at == 30);
    equal_weighted_yield_message(weighted_yield_message_got, weighted_yield_message_sent)
  }
}

/* Simple Stock Price Average: encoded, read back, and compared */
proctype check_simple_stock_price_average() {
  SimpleStockPriceAverage simple_stock_price_average_sent;
  SimpleStockPriceAverage simple_stock_price_average_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_stock_price_average(simple_stock_price_average_sent, 0)
  :: pattern == 1 -> fill_simple_stock_price_average(simple_stock_price_average_sent, 32)
  :: pattern == 2 -> fill_simple_stock_price_average(simple_stock_price_average_sent, 255)
  :: else -> ramp_simple_stock_price_average(simple_stock_price_average_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_stock_price_average(simple_stock_price_average_sent);
    assert(at == 16);
    at = 0;
    decode_simple_stock_price_average(simple_stock_price_average_got);
    assert(at == 16);
    equal_simple_stock_price_average(simple_stock_price_average_got, simple_stock_price_average_sent)
  }
}

/* Stock Price Average Day On Day Comparison: encoded, read back, and compared */
proctype check_stock_price_average_day_on_day_comparison() {
  StockPriceAverageDayOnDayComparison stock_price_average_day_on_day_comparison_sent;
  StockPriceAverageDayOnDayComparison stock_price_average_day_on_day_comparison_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_sent, 0)
  :: pattern == 1 -> fill_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_sent, 32)
  :: pattern == 2 -> fill_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_sent, 255)
  :: else -> ramp_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_sent);
    assert(at == 16);
    at = 0;
    decode_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_got);
    assert(at == 16);
    equal_stock_price_average_day_on_day_comparison(stock_price_average_day_on_day_comparison_got, stock_price_average_day_on_day_comparison_sent)
  }
}

/* Simple Stock Price Average Message: encoded, read back, and compared */
proctype check_simple_stock_price_average_message() {
  SimpleStockPriceAverageMessage simple_stock_price_average_message_sent;
  SimpleStockPriceAverageMessage simple_stock_price_average_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_stock_price_average_message(simple_stock_price_average_message_sent, 0)
  :: pattern == 1 -> fill_simple_stock_price_average_message(simple_stock_price_average_message_sent, 32)
  :: pattern == 2 -> fill_simple_stock_price_average_message(simple_stock_price_average_message_sent, 255)
  :: else -> ramp_simple_stock_price_average_message(simple_stock_price_average_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_stock_price_average_message(simple_stock_price_average_message_sent);
    assert(at == 44);
    at = 0;
    decode_simple_stock_price_average_message(simple_stock_price_average_message_got);
    assert(at == 44);
    equal_simple_stock_price_average_message(simple_stock_price_average_message_got, simple_stock_price_average_message_sent)
  }
}

/* Weighted Stock Price Average: encoded, read back, and compared */
proctype check_weighted_stock_price_average() {
  WeightedStockPriceAverage weighted_stock_price_average_sent;
  WeightedStockPriceAverage weighted_stock_price_average_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_weighted_stock_price_average(weighted_stock_price_average_sent, 0)
  :: pattern == 1 -> fill_weighted_stock_price_average(weighted_stock_price_average_sent, 32)
  :: pattern == 2 -> fill_weighted_stock_price_average(weighted_stock_price_average_sent, 255)
  :: else -> ramp_weighted_stock_price_average(weighted_stock_price_average_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_weighted_stock_price_average(weighted_stock_price_average_sent);
    assert(at == 16);
    at = 0;
    decode_weighted_stock_price_average(weighted_stock_price_average_got);
    assert(at == 16);
    equal_weighted_stock_price_average(weighted_stock_price_average_got, weighted_stock_price_average_sent)
  }
}

/* Weighted Stock Price Average Message: encoded, read back, and compared */
proctype check_weighted_stock_price_average_message() {
  WeightedStockPriceAverageMessage weighted_stock_price_average_message_sent;
  WeightedStockPriceAverageMessage weighted_stock_price_average_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_weighted_stock_price_average_message(weighted_stock_price_average_message_sent, 0)
  :: pattern == 1 -> fill_weighted_stock_price_average_message(weighted_stock_price_average_message_sent, 32)
  :: pattern == 2 -> fill_weighted_stock_price_average_message(weighted_stock_price_average_message_sent, 255)
  :: else -> ramp_weighted_stock_price_average_message(weighted_stock_price_average_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_weighted_stock_price_average_message(weighted_stock_price_average_message_sent);
    assert(at == 44);
    at = 0;
    decode_weighted_stock_price_average_message(weighted_stock_price_average_message_got);
    assert(at == 44);
    equal_weighted_stock_price_average_message(weighted_stock_price_average_message_got, weighted_stock_price_average_message_sent)
  }
}

/* Simple Stock Price Average By Industry Message: encoded, read back, and compared */
proctype check_simple_stock_price_average_by_industry_message() {
  SimpleStockPriceAverageByIndustryMessage simple_stock_price_average_by_industry_message_sent;
  SimpleStockPriceAverageByIndustryMessage simple_stock_price_average_by_industry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_sent, 0)
  :: pattern == 1 -> fill_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_sent, 32)
  :: pattern == 2 -> fill_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_sent, 255)
  :: else -> ramp_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_sent);
    assert(at == 44);
    at = 0;
    decode_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_got);
    assert(at == 44);
    equal_simple_stock_price_average_by_industry_message(simple_stock_price_average_by_industry_message_got, simple_stock_price_average_by_industry_message_sent)
  }
}

/* Overall Simple Average: encoded, read back, and compared */
proctype check_overall_simple_average() {
  OverallSimpleAverage overall_simple_average_sent;
  OverallSimpleAverage overall_simple_average_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_overall_simple_average(overall_simple_average_sent, 0)
  :: pattern == 1 -> fill_overall_simple_average(overall_simple_average_sent, 32)
  :: pattern == 2 -> fill_overall_simple_average(overall_simple_average_sent, 255)
  :: else -> ramp_overall_simple_average(overall_simple_average_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_overall_simple_average(overall_simple_average_sent);
    assert(at == 32);
    at = 0;
    decode_overall_simple_average(overall_simple_average_got);
    assert(at == 32);
    equal_overall_simple_average(overall_simple_average_got, overall_simple_average_sent)
  }
}

/* Overall Divergence Average: encoded, read back, and compared */
proctype check_overall_divergence_average() {
  OverallDivergenceAverage overall_divergence_average_sent;
  OverallDivergenceAverage overall_divergence_average_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_overall_divergence_average(overall_divergence_average_sent, 0)
  :: pattern == 1 -> fill_overall_divergence_average(overall_divergence_average_sent, 32)
  :: pattern == 2 -> fill_overall_divergence_average(overall_divergence_average_sent, 255)
  :: else -> ramp_overall_divergence_average(overall_divergence_average_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_overall_divergence_average(overall_divergence_average_sent);
    assert(at == 18);
    at = 0;
    decode_overall_divergence_average(overall_divergence_average_got);
    assert(at == 18);
    equal_overall_divergence_average(overall_divergence_average_got, overall_divergence_average_sent)
  }
}

/* Overall Parity Average: encoded, read back, and compared */
proctype check_overall_parity_average() {
  OverallParityAverage overall_parity_average_sent;
  OverallParityAverage overall_parity_average_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_overall_parity_average(overall_parity_average_sent, 0)
  :: pattern == 1 -> fill_overall_parity_average(overall_parity_average_sent, 32)
  :: pattern == 2 -> fill_overall_parity_average(overall_parity_average_sent, 255)
  :: else -> ramp_overall_parity_average(overall_parity_average_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_overall_parity_average(overall_parity_average_sent);
    assert(at == 32);
    at = 0;
    decode_overall_parity_average(overall_parity_average_got);
    assert(at == 32);
    equal_overall_parity_average(overall_parity_average_got, overall_parity_average_sent)
  }
}

/* Overall Direct Yield Average: encoded, read back, and compared */
proctype check_overall_direct_yield_average() {
  OverallDirectYieldAverage overall_direct_yield_average_sent;
  OverallDirectYieldAverage overall_direct_yield_average_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_overall_direct_yield_average(overall_direct_yield_average_sent, 0)
  :: pattern == 1 -> fill_overall_direct_yield_average(overall_direct_yield_average_sent, 32)
  :: pattern == 2 -> fill_overall_direct_yield_average(overall_direct_yield_average_sent, 255)
  :: else -> ramp_overall_direct_yield_average(overall_direct_yield_average_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_overall_direct_yield_average(overall_direct_yield_average_sent);
    assert(at == 18);
    at = 0;
    decode_overall_direct_yield_average(overall_direct_yield_average_got);
    assert(at == 18);
    equal_overall_direct_yield_average(overall_direct_yield_average_got, overall_direct_yield_average_sent)
  }
}

/* Overall: encoded, read back, and compared */
proctype check_overall() {
  Overall overall_sent;
  Overall overall_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_overall(overall_sent, 0)
  :: pattern == 1 -> fill_overall(overall_sent, 32)
  :: pattern == 2 -> fill_overall(overall_sent, 255)
  :: else -> ramp_overall(overall_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_overall(overall_sent);
    assert(at == 100);
    at = 0;
    decode_overall(overall_got);
    assert(at == 100);
    equal_overall(overall_got, overall_sent)
  }
}

/* Simple Average: encoded, read back, and compared */
proctype check_simple_average() {
  SimpleAverage simple_average_sent;
  SimpleAverage simple_average_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_simple_average(simple_average_sent, 0)
  :: pattern == 1 -> fill_simple_average(simple_average_sent, 32)
  :: pattern == 2 -> fill_simple_average(simple_average_sent, 255)
  :: else -> ramp_simple_average(simple_average_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_simple_average(simple_average_sent);
    assert(at == 16);
    at = 0;
    decode_simple_average(simple_average_got);
    assert(at == 16);
    equal_simple_average(simple_average_got, simple_average_sent)
  }
}

/* Divergence Average: encoded, read back, and compared */
proctype check_divergence_average() {
  DivergenceAverage divergence_average_sent;
  DivergenceAverage divergence_average_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_divergence_average(divergence_average_sent, 0)
  :: pattern == 1 -> fill_divergence_average(divergence_average_sent, 32)
  :: pattern == 2 -> fill_divergence_average(divergence_average_sent, 255)
  :: else -> ramp_divergence_average(divergence_average_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_divergence_average(divergence_average_sent);
    assert(at == 9);
    at = 0;
    decode_divergence_average(divergence_average_got);
    assert(at == 9);
    equal_divergence_average(divergence_average_got, divergence_average_sent)
  }
}

/* Parity Average: encoded, read back, and compared */
proctype check_parity_average() {
  ParityAverage parity_average_sent;
  ParityAverage parity_average_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_parity_average(parity_average_sent, 0)
  :: pattern == 1 -> fill_parity_average(parity_average_sent, 32)
  :: pattern == 2 -> fill_parity_average(parity_average_sent, 255)
  :: else -> ramp_parity_average(parity_average_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_parity_average(parity_average_sent);
    assert(at == 16);
    at = 0;
    decode_parity_average(parity_average_got);
    assert(at == 16);
    equal_parity_average(parity_average_got, parity_average_sent)
  }
}

/* Direct Yield Average: encoded, read back, and compared */
proctype check_direct_yield_average() {
  DirectYieldAverage direct_yield_average_sent;
  DirectYieldAverage direct_yield_average_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_direct_yield_average(direct_yield_average_sent, 0)
  :: pattern == 1 -> fill_direct_yield_average(direct_yield_average_sent, 32)
  :: pattern == 2 -> fill_direct_yield_average(direct_yield_average_sent, 255)
  :: else -> ramp_direct_yield_average(direct_yield_average_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_direct_yield_average(direct_yield_average_sent);
    assert(at == 9);
    at = 0;
    decode_direct_yield_average(direct_yield_average_got);
    assert(at == 9);
    equal_direct_yield_average(direct_yield_average_got, direct_yield_average_sent)
  }
}

/* Parity 100 Or Higher: encoded, read back, and compared */
proctype check_parity100_or_higher() {
  Parity100OrHigher parity100_or_higher_sent;
  Parity100OrHigher parity100_or_higher_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_parity100_or_higher(parity100_or_higher_sent, 0)
  :: pattern == 1 -> fill_parity100_or_higher(parity100_or_higher_sent, 32)
  :: pattern == 2 -> fill_parity100_or_higher(parity100_or_higher_sent, 255)
  :: else -> ramp_parity100_or_higher(parity100_or_higher_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_parity100_or_higher(parity100_or_higher_sent);
    assert(at == 50);
    at = 0;
    decode_parity100_or_higher(parity100_or_higher_got);
    assert(at == 50);
    equal_parity100_or_higher(parity100_or_higher_got, parity100_or_higher_sent)
  }
}

/* Parity Less Than 100: encoded, read back, and compared */
proctype check_parity_less_than100() {
  ParityLessThan100 parity_less_than100_sent;
  ParityLessThan100 parity_less_than100_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_parity_less_than100(parity_less_than100_sent, 0)
  :: pattern == 1 -> fill_parity_less_than100(parity_less_than100_sent, 32)
  :: pattern == 2 -> fill_parity_less_than100(parity_less_than100_sent, 255)
  :: else -> ramp_parity_less_than100(parity_less_than100_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_parity_less_than100(parity_less_than100_sent);
    assert(at == 50);
    at = 0;
    decode_parity_less_than100(parity_less_than100_got);
    assert(at == 50);
    equal_parity_less_than100(parity_less_than100_got, parity_less_than100_sent)
  }
}

/* Japanese Yen Cb Indicator Message: encoded, read back, and compared */
proctype check_japanese_yen_cb_indicator_message() {
  JapaneseYenCbIndicatorMessage japanese_yen_cb_indicator_message_sent;
  JapaneseYenCbIndicatorMessage japanese_yen_cb_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_sent, 0)
  :: pattern == 1 -> fill_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_sent, 32)
  :: pattern == 2 -> fill_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_sent, 255)
  :: else -> ramp_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_sent);
    assert(at == 208);
    at = 0;
    decode_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_got);
    assert(at == 208);
    equal_japanese_yen_cb_indicator_message(japanese_yen_cb_indicator_message_got, japanese_yen_cb_indicator_message_sent)
  }
}

/* Number Of Active Issues: encoded, read back, and compared */
proctype check_number_of_active_issues() {
  NumberOfActiveIssues number_of_active_issues_sent;
  NumberOfActiveIssues number_of_active_issues_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_number_of_active_issues(number_of_active_issues_sent, 0)
  :: pattern == 1 -> fill_number_of_active_issues(number_of_active_issues_sent, 32)
  :: pattern == 2 -> fill_number_of_active_issues(number_of_active_issues_sent, 255)
  :: else -> ramp_number_of_active_issues(number_of_active_issues_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_number_of_active_issues(number_of_active_issues_sent);
    assert(at == 10);
    at = 0;
    decode_number_of_active_issues(number_of_active_issues_got);
    assert(at == 10);
    equal_number_of_active_issues(number_of_active_issues_got, number_of_active_issues_sent)
  }
}

/* Number Of Gainers: encoded, read back, and compared */
proctype check_number_of_gainers() {
  NumberOfGainers number_of_gainers_sent;
  NumberOfGainers number_of_gainers_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_number_of_gainers(number_of_gainers_sent, 0)
  :: pattern == 1 -> fill_number_of_gainers(number_of_gainers_sent, 32)
  :: pattern == 2 -> fill_number_of_gainers(number_of_gainers_sent, 255)
  :: else -> ramp_number_of_gainers(number_of_gainers_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_number_of_gainers(number_of_gainers_sent);
    assert(at == 10);
    at = 0;
    decode_number_of_gainers(number_of_gainers_got);
    assert(at == 10);
    equal_number_of_gainers(number_of_gainers_got, number_of_gainers_sent)
  }
}

/* Number Of Decliners: encoded, read back, and compared */
proctype check_number_of_decliners() {
  NumberOfDecliners number_of_decliners_sent;
  NumberOfDecliners number_of_decliners_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_number_of_decliners(number_of_decliners_sent, 0)
  :: pattern == 1 -> fill_number_of_decliners(number_of_decliners_sent, 32)
  :: pattern == 2 -> fill_number_of_decliners(number_of_decliners_sent, 255)
  :: else -> ramp_number_of_decliners(number_of_decliners_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_number_of_decliners(number_of_decliners_sent);
    assert(at == 10);
    at = 0;
    decode_number_of_decliners(number_of_decliners_got);
    assert(at == 10);
    equal_number_of_decliners(number_of_decliners_got, number_of_decliners_sent)
  }
}

/* Number Of Issues With No Change: encoded, read back, and compared */
proctype check_number_of_issues_with_no_change() {
  NumberOfIssuesWithNoChange number_of_issues_with_no_change_sent;
  NumberOfIssuesWithNoChange number_of_issues_with_no_change_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_number_of_issues_with_no_change(number_of_issues_with_no_change_sent, 0)
  :: pattern == 1 -> fill_number_of_issues_with_no_change(number_of_issues_with_no_change_sent, 32)
  :: pattern == 2 -> fill_number_of_issues_with_no_change(number_of_issues_with_no_change_sent, 255)
  :: else -> ramp_number_of_issues_with_no_change(number_of_issues_with_no_change_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_number_of_issues_with_no_change(number_of_issues_with_no_change_sent);
    assert(at == 10);
    at = 0;
    decode_number_of_issues_with_no_change(number_of_issues_with_no_change_got);
    assert(at == 10);
    equal_number_of_issues_with_no_change(number_of_issues_with_no_change_got, number_of_issues_with_no_change_sent)
  }
}

/* Number Of Issues With No Comparison: encoded, read back, and compared */
proctype check_number_of_issues_with_no_comparison() {
  NumberOfIssuesWithNoComparison number_of_issues_with_no_comparison_sent;
  NumberOfIssuesWithNoComparison number_of_issues_with_no_comparison_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_sent, 0)
  :: pattern == 1 -> fill_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_sent, 32)
  :: pattern == 2 -> fill_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_sent, 255)
  :: else -> ramp_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_sent);
    assert(at == 10);
    at = 0;
    decode_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_got);
    assert(at == 10);
    equal_number_of_issues_with_no_comparison(number_of_issues_with_no_comparison_got, number_of_issues_with_no_comparison_sent)
  }
}

/* Number Of Inactive Issues: encoded, read back, and compared */
proctype check_number_of_inactive_issues() {
  NumberOfInactiveIssues number_of_inactive_issues_sent;
  NumberOfInactiveIssues number_of_inactive_issues_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_number_of_inactive_issues(number_of_inactive_issues_sent, 0)
  :: pattern == 1 -> fill_number_of_inactive_issues(number_of_inactive_issues_sent, 32)
  :: pattern == 2 -> fill_number_of_inactive_issues(number_of_inactive_issues_sent, 255)
  :: else -> ramp_number_of_inactive_issues(number_of_inactive_issues_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_number_of_inactive_issues(number_of_inactive_issues_sent);
    assert(at == 10);
    at = 0;
    decode_number_of_inactive_issues(number_of_inactive_issues_got);
    assert(at == 10);
    equal_number_of_inactive_issues(number_of_inactive_issues_got, number_of_inactive_issues_sent)
  }
}

/* Number Of Gainers Decliners Message: encoded, read back, and compared */
proctype check_number_of_gainers_decliners_message() {
  NumberOfGainersDeclinersMessage number_of_gainers_decliners_message_sent;
  NumberOfGainersDeclinersMessage number_of_gainers_decliners_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_number_of_gainers_decliners_message(number_of_gainers_decliners_message_sent, 0)
  :: pattern == 1 -> fill_number_of_gainers_decliners_message(number_of_gainers_decliners_message_sent, 32)
  :: pattern == 2 -> fill_number_of_gainers_decliners_message(number_of_gainers_decliners_message_sent, 255)
  :: else -> ramp_number_of_gainers_decliners_message(number_of_gainers_decliners_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_number_of_gainers_decliners_message(number_of_gainers_decliners_message_sent);
    assert(at == 82);
    at = 0;
    decode_number_of_gainers_decliners_message(number_of_gainers_decliners_message_got);
    assert(at == 82);
    equal_number_of_gainers_decliners_message(number_of_gainers_decliners_message_got, number_of_gainers_decliners_message_sent)
  }
}

/* Estimated Total Trading Volume: encoded, read back, and compared */
proctype check_estimated_total_trading_volume() {
  EstimatedTotalTradingVolume estimated_total_trading_volume_sent;
  EstimatedTotalTradingVolume estimated_total_trading_volume_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_estimated_total_trading_volume(estimated_total_trading_volume_sent, 0)
  :: pattern == 1 -> fill_estimated_total_trading_volume(estimated_total_trading_volume_sent, 32)
  :: pattern == 2 -> fill_estimated_total_trading_volume(estimated_total_trading_volume_sent, 255)
  :: else -> ramp_estimated_total_trading_volume(estimated_total_trading_volume_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_estimated_total_trading_volume(estimated_total_trading_volume_sent);
    assert(at == 15);
    at = 0;
    decode_estimated_total_trading_volume(estimated_total_trading_volume_got);
    assert(at == 15);
    equal_estimated_total_trading_volume(estimated_total_trading_volume_got, estimated_total_trading_volume_sent)
  }
}

/* Estimated Total Trading Volume Message: encoded, read back, and compared */
proctype check_estimated_total_trading_volume_message() {
  EstimatedTotalTradingVolumeMessage estimated_total_trading_volume_message_sent;
  EstimatedTotalTradingVolumeMessage estimated_total_trading_volume_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_estimated_total_trading_volume_message(estimated_total_trading_volume_message_sent, 0)
  :: pattern == 1 -> fill_estimated_total_trading_volume_message(estimated_total_trading_volume_message_sent, 32)
  :: pattern == 2 -> fill_estimated_total_trading_volume_message(estimated_total_trading_volume_message_sent, 255)
  :: else -> ramp_estimated_total_trading_volume_message(estimated_total_trading_volume_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_estimated_total_trading_volume_message(estimated_total_trading_volume_message_sent);
    assert(at == 29);
    at = 0;
    decode_estimated_total_trading_volume_message(estimated_total_trading_volume_message_got);
    assert(at == 29);
    equal_estimated_total_trading_volume_message(estimated_total_trading_volume_message_got, estimated_total_trading_volume_message_sent)
  }
}

/* Estimated Total Turnover: encoded, read back, and compared */
proctype check_estimated_total_turnover() {
  EstimatedTotalTurnover estimated_total_turnover_sent;
  EstimatedTotalTurnover estimated_total_turnover_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_estimated_total_turnover(estimated_total_turnover_sent, 0)
  :: pattern == 1 -> fill_estimated_total_turnover(estimated_total_turnover_sent, 32)
  :: pattern == 2 -> fill_estimated_total_turnover(estimated_total_turnover_sent, 255)
  :: else -> ramp_estimated_total_turnover(estimated_total_turnover_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_estimated_total_turnover(estimated_total_turnover_sent);
    assert(at == 16);
    at = 0;
    decode_estimated_total_turnover(estimated_total_turnover_got);
    assert(at == 16);
    equal_estimated_total_turnover(estimated_total_turnover_got, estimated_total_turnover_sent)
  }
}

/* Estimated Total Turnover Message: encoded, read back, and compared */
proctype check_estimated_total_turnover_message() {
  EstimatedTotalTurnoverMessage estimated_total_turnover_message_sent;
  EstimatedTotalTurnoverMessage estimated_total_turnover_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_estimated_total_turnover_message(estimated_total_turnover_message_sent, 0)
  :: pattern == 1 -> fill_estimated_total_turnover_message(estimated_total_turnover_message_sent, 32)
  :: pattern == 2 -> fill_estimated_total_turnover_message(estimated_total_turnover_message_sent, 255)
  :: else -> ramp_estimated_total_turnover_message(estimated_total_turnover_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_estimated_total_turnover_message(estimated_total_turnover_message_sent);
    assert(at == 30);
    at = 0;
    decode_estimated_total_turnover_message(estimated_total_turnover_message_got);
    assert(at == 30);
    equal_estimated_total_turnover_message(estimated_total_turnover_message_got, estimated_total_turnover_message_sent)
  }
}

/* Vwap By Market: encoded, read back, and compared */
proctype check_vwap_by_market() {
  VwapByMarket vwap_by_market_sent;
  VwapByMarket vwap_by_market_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_vwap_by_market(vwap_by_market_sent, 0)
  :: pattern == 1 -> fill_vwap_by_market(vwap_by_market_sent, 32)
  :: pattern == 2 -> fill_vwap_by_market(vwap_by_market_sent, 255)
  :: else -> ramp_vwap_by_market(vwap_by_market_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_vwap_by_market(vwap_by_market_sent);
    assert(at == 33);
    at = 0;
    decode_vwap_by_market(vwap_by_market_got);
    assert(at == 33);
    equal_vwap_by_market(vwap_by_market_got, vwap_by_market_sent)
  }
}

/* Vwap By Market Message: encoded, read back, and compared */
proctype check_vwap_by_market_message() {
  VwapByMarketMessage vwap_by_market_message_sent;
  VwapByMarketMessage vwap_by_market_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_vwap_by_market_message(vwap_by_market_message_sent, 0)
  :: pattern == 1 -> fill_vwap_by_market_message(vwap_by_market_message_sent, 32)
  :: pattern == 2 -> fill_vwap_by_market_message(vwap_by_market_message_sent, 255)
  :: else -> ramp_vwap_by_market_message(vwap_by_market_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_vwap_by_market_message(vwap_by_market_message_sent);
    assert(at == 45);
    at = 0;
    decode_vwap_by_market_message(vwap_by_market_message_got);
    assert(at == 45);
    equal_vwap_by_market_message(vwap_by_market_message_got, vwap_by_market_message_sent)
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
    assert(at == 60);
    at = 0;
    decode_trading_volume(trading_volume_got);
    assert(at == 60);
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
    assert(at == 60);
    at = 0;
    decode_turnover(turnover_got);
    assert(at == 60);
    equal_turnover(turnover_got, turnover_sent)
  }
}

/* Number Of Transactions: encoded, read back, and compared */
proctype check_number_of_transactions() {
  NumberOfTransactions number_of_transactions_sent;
  NumberOfTransactions number_of_transactions_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_number_of_transactions(number_of_transactions_sent, 0)
  :: pattern == 1 -> fill_number_of_transactions(number_of_transactions_sent, 32)
  :: pattern == 2 -> fill_number_of_transactions(number_of_transactions_sent, 255)
  :: else -> ramp_number_of_transactions(number_of_transactions_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_number_of_transactions(number_of_transactions_sent);
    assert(at == 16);
    at = 0;
    decode_number_of_transactions(number_of_transactions_got);
    assert(at == 16);
    equal_number_of_transactions(number_of_transactions_got, number_of_transactions_sent)
  }
}

/* ToSTNeT Statistics Message: encoded, read back, and compared */
proctype check_to_s_t_ne_t_statistics_message() {
  ToSTNeTStatisticsMessage to_s_t_ne_t_statistics_message_sent;
  ToSTNeTStatisticsMessage to_s_t_ne_t_statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_sent, 0)
  :: pattern == 1 -> fill_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_sent, 32)
  :: pattern == 2 -> fill_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_sent, 255)
  :: else -> ramp_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_sent);
    assert(at == 146);
    at = 0;
    decode_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_got);
    assert(at == 146);
    equal_to_s_t_ne_t_statistics_message(to_s_t_ne_t_statistics_message_got, to_s_t_ne_t_statistics_message_sent)
  }
}

/* Open: encoded, read back, and compared */
proctype check_open() {
  Open open_sent;
  Open open_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open(open_sent, 0)
  :: pattern == 1 -> fill_open(open_sent, 32)
  :: pattern == 2 -> fill_open(open_sent, 255)
  :: else -> ramp_open(open_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open(open_sent);
    assert(at == 23);
    at = 0;
    decode_open(open_got);
    assert(at == 23);
    equal_open(open_got, open_sent)
  }
}

/* Highest: encoded, read back, and compared */
proctype check_highest() {
  Highest highest_sent;
  Highest highest_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_highest(highest_sent, 0)
  :: pattern == 1 -> fill_highest(highest_sent, 32)
  :: pattern == 2 -> fill_highest(highest_sent, 255)
  :: else -> ramp_highest(highest_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_highest(highest_sent);
    assert(at == 23);
    at = 0;
    decode_highest(highest_got);
    assert(at == 23);
    equal_highest(highest_got, highest_sent)
  }
}

/* Lowest: encoded, read back, and compared */
proctype check_lowest() {
  Lowest lowest_sent;
  Lowest lowest_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_lowest(lowest_sent, 0)
  :: pattern == 1 -> fill_lowest(lowest_sent, 32)
  :: pattern == 2 -> fill_lowest(lowest_sent, 255)
  :: else -> ramp_lowest(lowest_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_lowest(lowest_sent);
    assert(at == 23);
    at = 0;
    decode_lowest(lowest_got);
    assert(at == 23);
    equal_lowest(lowest_got, lowest_sent)
  }
}

/* Current Price: encoded, read back, and compared */
proctype check_current_price() {
  CurrentPrice current_price_sent;
  CurrentPrice current_price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_current_price(current_price_sent, 0)
  :: pattern == 1 -> fill_current_price(current_price_sent, 32)
  :: pattern == 2 -> fill_current_price(current_price_sent, 255)
  :: else -> ramp_current_price(current_price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_current_price(current_price_sent);
    assert(at == 23);
    at = 0;
    decode_current_price(current_price_got);
    assert(at == 23);
    equal_current_price(current_price_got, current_price_sent)
  }
}

/* Index Day On Day Comparison: encoded, read back, and compared */
proctype check_index_day_on_day_comparison() {
  IndexDayOnDayComparison index_day_on_day_comparison_sent;
  IndexDayOnDayComparison index_day_on_day_comparison_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_day_on_day_comparison(index_day_on_day_comparison_sent, 0)
  :: pattern == 1 -> fill_index_day_on_day_comparison(index_day_on_day_comparison_sent, 32)
  :: pattern == 2 -> fill_index_day_on_day_comparison(index_day_on_day_comparison_sent, 255)
  :: else -> ramp_index_day_on_day_comparison(index_day_on_day_comparison_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_day_on_day_comparison(index_day_on_day_comparison_sent);
    assert(at == 25);
    at = 0;
    decode_index_day_on_day_comparison(index_day_on_day_comparison_got);
    assert(at == 25);
    equal_index_day_on_day_comparison(index_day_on_day_comparison_got, index_day_on_day_comparison_sent)
  }
}

/* Index Open High Low And Closing Prices Message: encoded, read back, and compared */
proctype check_index_open_high_low_and_closing_prices_message() {
  IndexOpenHighLowAndClosingPricesMessage index_open_high_low_and_closing_prices_message_sent;
  IndexOpenHighLowAndClosingPricesMessage index_open_high_low_and_closing_prices_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_sent, 0)
  :: pattern == 1 -> fill_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_sent, 32)
  :: pattern == 2 -> fill_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_sent, 255)
  :: else -> ramp_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_sent);
    assert(at == 123);
    at = 0;
    decode_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_got);
    assert(at == 123);
    equal_index_open_high_low_and_closing_prices_message(index_open_high_low_and_closing_prices_message_got, index_open_high_low_and_closing_prices_message_sent)
  }
}

/* Index: encoded, read back, and compared */
proctype check_index() {
  Index index_sent;
  Index index_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index(index_sent, 0)
  :: pattern == 1 -> fill_index(index_sent, 32)
  :: pattern == 2 -> fill_index(index_sent, 255)
  :: else -> ramp_index(index_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index(index_sent);
    assert(at == 22);
    at = 0;
    decode_index(index_got);
    assert(at == 22);
    equal_index(index_got, index_sent)
  }
}

/* Special Quotation Message: encoded, read back, and compared */
proctype check_special_quotation_message() {
  SpecialQuotationMessage special_quotation_message_sent;
  SpecialQuotationMessage special_quotation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_special_quotation_message(special_quotation_message_sent, 0)
  :: pattern == 1 -> fill_special_quotation_message(special_quotation_message_sent, 32)
  :: pattern == 2 -> fill_special_quotation_message(special_quotation_message_sent, 255)
  :: else -> ramp_special_quotation_message(special_quotation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_special_quotation_message(special_quotation_message_sent);
    assert(at == 29);
    at = 0;
    decode_special_quotation_message(special_quotation_message_got);
    assert(at == 29);
    equal_special_quotation_message(special_quotation_message_got, special_quotation_message_sent)
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
  :: run check_total_market_value()
  :: run check_market_value_day_on_day_comparison()
  :: run check_market_value_message()
  :: run check_simple_yield()
  :: run check_yield_day_on_day_comparison()
  :: run check_simple_yield_message()
  :: run check_weighted_yield()
  :: run check_weighted_yield_message()
  :: run check_simple_stock_price_average()
  :: run check_stock_price_average_day_on_day_comparison()
  :: run check_simple_stock_price_average_message()
  :: run check_weighted_stock_price_average()
  :: run check_weighted_stock_price_average_message()
  :: run check_simple_stock_price_average_by_industry_message()
  :: run check_overall_simple_average()
  :: run check_overall_divergence_average()
  :: run check_overall_parity_average()
  :: run check_overall_direct_yield_average()
  :: run check_overall()
  :: run check_simple_average()
  :: run check_divergence_average()
  :: run check_parity_average()
  :: run check_direct_yield_average()
  :: run check_parity100_or_higher()
  :: run check_parity_less_than100()
  :: run check_japanese_yen_cb_indicator_message()
  :: run check_number_of_active_issues()
  :: run check_number_of_gainers()
  :: run check_number_of_decliners()
  :: run check_number_of_issues_with_no_change()
  :: run check_number_of_issues_with_no_comparison()
  :: run check_number_of_inactive_issues()
  :: run check_number_of_gainers_decliners_message()
  :: run check_estimated_total_trading_volume()
  :: run check_estimated_total_trading_volume_message()
  :: run check_estimated_total_turnover()
  :: run check_estimated_total_turnover_message()
  :: run check_vwap_by_market()
  :: run check_vwap_by_market_message()
  :: run check_trading_volume()
  :: run check_turnover()
  :: run check_number_of_transactions()
  :: run check_to_s_t_ne_t_statistics_message()
  :: run check_open()
  :: run check_highest()
  :: run check_lowest()
  :: run check_current_price()
  :: run check_index_day_on_day_comparison()
  :: run check_index_open_high_low_and_closing_prices_message()
  :: run check_index()
  :: run check_special_quotation_message()
  :: run check_control_message()
  fi
}
