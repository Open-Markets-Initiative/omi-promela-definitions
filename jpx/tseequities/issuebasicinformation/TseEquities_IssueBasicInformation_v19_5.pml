/*
 * Japan Exchange Group IssueBasicInformation
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
#define WIRE 123

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

/* ---- Index Constituent Issue: 20 bytes --------------------------------------- */

/* Index constituent issue */
typedef IndexConstituentIssue {
  byte arbitrary_1;
  byte arbitrary_2;
  byte arbitrary_3;
  byte arbitrary_4;
  byte arbitrary_5;
  byte arbitrary_6;
  byte arbitrary_7;
  byte arbitrary_8_to_10[3];
  byte arbitrary_11;
  byte arbitrary_12_to_15[4];
  byte arbitrary_16;
  byte arbitrary_17_to_19[3];
  byte arbitrary_20
};

int index_constituent_issue_at;

/* every byte of Index Constituent Issue set to one value */
inline fill_index_constituent_issue(index_constituent_issue_record, index_constituent_issue_value) {
  index_constituent_issue_record.arbitrary_1 = index_constituent_issue_value;
  index_constituent_issue_record.arbitrary_2 = index_constituent_issue_value;
  index_constituent_issue_record.arbitrary_3 = index_constituent_issue_value;
  index_constituent_issue_record.arbitrary_4 = index_constituent_issue_value;
  index_constituent_issue_record.arbitrary_5 = index_constituent_issue_value;
  index_constituent_issue_record.arbitrary_6 = index_constituent_issue_value;
  index_constituent_issue_record.arbitrary_7 = index_constituent_issue_value;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 3 -> index_constituent_issue_record.arbitrary_8_to_10[index_constituent_issue_at] = index_constituent_issue_value; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  index_constituent_issue_record.arbitrary_11 = index_constituent_issue_value;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 4 -> index_constituent_issue_record.arbitrary_12_to_15[index_constituent_issue_at] = index_constituent_issue_value; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  index_constituent_issue_record.arbitrary_16 = index_constituent_issue_value;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 3 -> index_constituent_issue_record.arbitrary_17_to_19[index_constituent_issue_at] = index_constituent_issue_value; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  index_constituent_issue_record.arbitrary_20 = index_constituent_issue_value;
  skip
}

/* each byte of Index Constituent Issue set to where it lies, so a field read out of place says so */
inline ramp_index_constituent_issue(index_constituent_issue_record, index_constituent_issue_base) {
  index_constituent_issue_record.arbitrary_1 = (index_constituent_issue_base + 0 + 1) % 256;
  index_constituent_issue_record.arbitrary_2 = (index_constituent_issue_base + 1 + 1) % 256;
  index_constituent_issue_record.arbitrary_3 = (index_constituent_issue_base + 2 + 1) % 256;
  index_constituent_issue_record.arbitrary_4 = (index_constituent_issue_base + 3 + 1) % 256;
  index_constituent_issue_record.arbitrary_5 = (index_constituent_issue_base + 4 + 1) % 256;
  index_constituent_issue_record.arbitrary_6 = (index_constituent_issue_base + 5 + 1) % 256;
  index_constituent_issue_record.arbitrary_7 = (index_constituent_issue_base + 6 + 1) % 256;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 3 -> index_constituent_issue_record.arbitrary_8_to_10[index_constituent_issue_at] = (index_constituent_issue_base + 7 + index_constituent_issue_at + 1) % 256; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  index_constituent_issue_record.arbitrary_11 = (index_constituent_issue_base + 10 + 1) % 256;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 4 -> index_constituent_issue_record.arbitrary_12_to_15[index_constituent_issue_at] = (index_constituent_issue_base + 11 + index_constituent_issue_at + 1) % 256; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  index_constituent_issue_record.arbitrary_16 = (index_constituent_issue_base + 15 + 1) % 256;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 3 -> index_constituent_issue_record.arbitrary_17_to_19[index_constituent_issue_at] = (index_constituent_issue_base + 16 + index_constituent_issue_at + 1) % 256; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  index_constituent_issue_record.arbitrary_20 = (index_constituent_issue_base + 19 + 1) % 256;
  skip
}

/* Index Constituent Issue to the wire, 20 bytes from where the cursor stands */
inline encode_index_constituent_issue(index_constituent_issue_record) {
  wire[at] = index_constituent_issue_record.arbitrary_1; at = at + 1;
  wire[at] = index_constituent_issue_record.arbitrary_2; at = at + 1;
  wire[at] = index_constituent_issue_record.arbitrary_3; at = at + 1;
  wire[at] = index_constituent_issue_record.arbitrary_4; at = at + 1;
  wire[at] = index_constituent_issue_record.arbitrary_5; at = at + 1;
  wire[at] = index_constituent_issue_record.arbitrary_6; at = at + 1;
  wire[at] = index_constituent_issue_record.arbitrary_7; at = at + 1;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 3 -> wire[at] = index_constituent_issue_record.arbitrary_8_to_10[index_constituent_issue_at]; at = at + 1; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  wire[at] = index_constituent_issue_record.arbitrary_11; at = at + 1;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 4 -> wire[at] = index_constituent_issue_record.arbitrary_12_to_15[index_constituent_issue_at]; at = at + 1; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  wire[at] = index_constituent_issue_record.arbitrary_16; at = at + 1;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 3 -> wire[at] = index_constituent_issue_record.arbitrary_17_to_19[index_constituent_issue_at]; at = at + 1; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  wire[at] = index_constituent_issue_record.arbitrary_20; at = at + 1;
  skip
}

/* Index Constituent Issue off the wire, 20 bytes from where the cursor stands */
inline decode_index_constituent_issue(index_constituent_issue_record) {
  index_constituent_issue_record.arbitrary_1 = wire[at]; at = at + 1;
  index_constituent_issue_record.arbitrary_2 = wire[at]; at = at + 1;
  index_constituent_issue_record.arbitrary_3 = wire[at]; at = at + 1;
  index_constituent_issue_record.arbitrary_4 = wire[at]; at = at + 1;
  index_constituent_issue_record.arbitrary_5 = wire[at]; at = at + 1;
  index_constituent_issue_record.arbitrary_6 = wire[at]; at = at + 1;
  index_constituent_issue_record.arbitrary_7 = wire[at]; at = at + 1;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 3 -> index_constituent_issue_record.arbitrary_8_to_10[index_constituent_issue_at] = wire[at]; at = at + 1; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  index_constituent_issue_record.arbitrary_11 = wire[at]; at = at + 1;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 4 -> index_constituent_issue_record.arbitrary_12_to_15[index_constituent_issue_at] = wire[at]; at = at + 1; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  index_constituent_issue_record.arbitrary_16 = wire[at]; at = at + 1;
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 3 -> index_constituent_issue_record.arbitrary_17_to_19[index_constituent_issue_at] = wire[at]; at = at + 1; index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  index_constituent_issue_record.arbitrary_20 = wire[at]; at = at + 1;
  skip
}

/* what was read of Index Constituent Issue is what was written, byte for byte */
inline equal_index_constituent_issue(index_constituent_issue_read, index_constituent_issue_written) {
  assert(index_constituent_issue_read.arbitrary_1 == index_constituent_issue_written.arbitrary_1);
  assert(index_constituent_issue_read.arbitrary_2 == index_constituent_issue_written.arbitrary_2);
  assert(index_constituent_issue_read.arbitrary_3 == index_constituent_issue_written.arbitrary_3);
  assert(index_constituent_issue_read.arbitrary_4 == index_constituent_issue_written.arbitrary_4);
  assert(index_constituent_issue_read.arbitrary_5 == index_constituent_issue_written.arbitrary_5);
  assert(index_constituent_issue_read.arbitrary_6 == index_constituent_issue_written.arbitrary_6);
  assert(index_constituent_issue_read.arbitrary_7 == index_constituent_issue_written.arbitrary_7);
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 3 -> assert(index_constituent_issue_read.arbitrary_8_to_10[index_constituent_issue_at] == index_constituent_issue_written.arbitrary_8_to_10[index_constituent_issue_at]); index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  assert(index_constituent_issue_read.arbitrary_11 == index_constituent_issue_written.arbitrary_11);
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 4 -> assert(index_constituent_issue_read.arbitrary_12_to_15[index_constituent_issue_at] == index_constituent_issue_written.arbitrary_12_to_15[index_constituent_issue_at]); index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  assert(index_constituent_issue_read.arbitrary_16 == index_constituent_issue_written.arbitrary_16);
  index_constituent_issue_at = 0;
  do
  :: index_constituent_issue_at < 3 -> assert(index_constituent_issue_read.arbitrary_17_to_19[index_constituent_issue_at] == index_constituent_issue_written.arbitrary_17_to_19[index_constituent_issue_at]); index_constituent_issue_at = index_constituent_issue_at + 1
  :: else -> break
  od;
  assert(index_constituent_issue_read.arbitrary_20 == index_constituent_issue_written.arbitrary_20);
  skip
}

/* ---- New Orders Prohibition: 4 bytes ----------------------------------------- */

/* New Orders Prohibition */
typedef NewOrdersProhibition {
  byte market_limit_orders;
  byte side;
  byte proprietary_brokerage;
  byte reserved_1
};

/* every byte of New Orders Prohibition set to one value */
inline fill_new_orders_prohibition(new_orders_prohibition_record, new_orders_prohibition_value) {
  new_orders_prohibition_record.market_limit_orders = new_orders_prohibition_value;
  new_orders_prohibition_record.side = new_orders_prohibition_value;
  new_orders_prohibition_record.proprietary_brokerage = new_orders_prohibition_value;
  new_orders_prohibition_record.reserved_1 = new_orders_prohibition_value;
  skip
}

/* each byte of New Orders Prohibition set to where it lies, so a field read out of place says so */
inline ramp_new_orders_prohibition(new_orders_prohibition_record, new_orders_prohibition_base) {
  new_orders_prohibition_record.market_limit_orders = (new_orders_prohibition_base + 0 + 1) % 256;
  new_orders_prohibition_record.side = (new_orders_prohibition_base + 1 + 1) % 256;
  new_orders_prohibition_record.proprietary_brokerage = (new_orders_prohibition_base + 2 + 1) % 256;
  new_orders_prohibition_record.reserved_1 = (new_orders_prohibition_base + 3 + 1) % 256;
  skip
}

/* New Orders Prohibition to the wire, 4 bytes from where the cursor stands */
inline encode_new_orders_prohibition(new_orders_prohibition_record) {
  wire[at] = new_orders_prohibition_record.market_limit_orders; at = at + 1;
  wire[at] = new_orders_prohibition_record.side; at = at + 1;
  wire[at] = new_orders_prohibition_record.proprietary_brokerage; at = at + 1;
  wire[at] = new_orders_prohibition_record.reserved_1; at = at + 1;
  skip
}

/* New Orders Prohibition off the wire, 4 bytes from where the cursor stands */
inline decode_new_orders_prohibition(new_orders_prohibition_record) {
  new_orders_prohibition_record.market_limit_orders = wire[at]; at = at + 1;
  new_orders_prohibition_record.side = wire[at]; at = at + 1;
  new_orders_prohibition_record.proprietary_brokerage = wire[at]; at = at + 1;
  new_orders_prohibition_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of New Orders Prohibition is what was written, byte for byte */
inline equal_new_orders_prohibition(new_orders_prohibition_read, new_orders_prohibition_written) {
  assert(new_orders_prohibition_read.market_limit_orders == new_orders_prohibition_written.market_limit_orders);
  assert(new_orders_prohibition_read.side == new_orders_prohibition_written.side);
  assert(new_orders_prohibition_read.proprietary_brokerage == new_orders_prohibition_written.proprietary_brokerage);
  assert(new_orders_prohibition_read.reserved_1 == new_orders_prohibition_written.reserved_1);
  skip
}

/* ---- Margin Transactions Prohibition: 3 bytes -------------------------------- */

/* Margin Transactions Prohibition */
typedef MarginTransactionsProhibition {
  byte side;
  byte proprietary_brokerage;
  byte reserved_1
};

/* every byte of Margin Transactions Prohibition set to one value */
inline fill_margin_transactions_prohibition(margin_transactions_prohibition_record, margin_transactions_prohibition_value) {
  margin_transactions_prohibition_record.side = margin_transactions_prohibition_value;
  margin_transactions_prohibition_record.proprietary_brokerage = margin_transactions_prohibition_value;
  margin_transactions_prohibition_record.reserved_1 = margin_transactions_prohibition_value;
  skip
}

/* each byte of Margin Transactions Prohibition set to where it lies, so a field read out of place says so */
inline ramp_margin_transactions_prohibition(margin_transactions_prohibition_record, margin_transactions_prohibition_base) {
  margin_transactions_prohibition_record.side = (margin_transactions_prohibition_base + 0 + 1) % 256;
  margin_transactions_prohibition_record.proprietary_brokerage = (margin_transactions_prohibition_base + 1 + 1) % 256;
  margin_transactions_prohibition_record.reserved_1 = (margin_transactions_prohibition_base + 2 + 1) % 256;
  skip
}

/* Margin Transactions Prohibition to the wire, 3 bytes from where the cursor stands */
inline encode_margin_transactions_prohibition(margin_transactions_prohibition_record) {
  wire[at] = margin_transactions_prohibition_record.side; at = at + 1;
  wire[at] = margin_transactions_prohibition_record.proprietary_brokerage; at = at + 1;
  wire[at] = margin_transactions_prohibition_record.reserved_1; at = at + 1;
  skip
}

/* Margin Transactions Prohibition off the wire, 3 bytes from where the cursor stands */
inline decode_margin_transactions_prohibition(margin_transactions_prohibition_record) {
  margin_transactions_prohibition_record.side = wire[at]; at = at + 1;
  margin_transactions_prohibition_record.proprietary_brokerage = wire[at]; at = at + 1;
  margin_transactions_prohibition_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Margin Transactions Prohibition is what was written, byte for byte */
inline equal_margin_transactions_prohibition(margin_transactions_prohibition_read, margin_transactions_prohibition_written) {
  assert(margin_transactions_prohibition_read.side == margin_transactions_prohibition_written.side);
  assert(margin_transactions_prohibition_read.proprietary_brokerage == margin_transactions_prohibition_written.proprietary_brokerage);
  assert(margin_transactions_prohibition_read.reserved_1 == margin_transactions_prohibition_written.reserved_1);
  skip
}

/* ---- Short Selling Prohibition: 2 bytes -------------------------------------- */

/* Short Selling Prohibition */
typedef ShortSellingProhibition {
  byte proprietary_brokerage;
  byte reserved_1
};

/* every byte of Short Selling Prohibition set to one value */
inline fill_short_selling_prohibition(short_selling_prohibition_record, short_selling_prohibition_value) {
  short_selling_prohibition_record.proprietary_brokerage = short_selling_prohibition_value;
  short_selling_prohibition_record.reserved_1 = short_selling_prohibition_value;
  skip
}

/* each byte of Short Selling Prohibition set to where it lies, so a field read out of place says so */
inline ramp_short_selling_prohibition(short_selling_prohibition_record, short_selling_prohibition_base) {
  short_selling_prohibition_record.proprietary_brokerage = (short_selling_prohibition_base + 0 + 1) % 256;
  short_selling_prohibition_record.reserved_1 = (short_selling_prohibition_base + 1 + 1) % 256;
  skip
}

/* Short Selling Prohibition to the wire, 2 bytes from where the cursor stands */
inline encode_short_selling_prohibition(short_selling_prohibition_record) {
  wire[at] = short_selling_prohibition_record.proprietary_brokerage; at = at + 1;
  wire[at] = short_selling_prohibition_record.reserved_1; at = at + 1;
  skip
}

/* Short Selling Prohibition off the wire, 2 bytes from where the cursor stands */
inline decode_short_selling_prohibition(short_selling_prohibition_record) {
  short_selling_prohibition_record.proprietary_brokerage = wire[at]; at = at + 1;
  short_selling_prohibition_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Short Selling Prohibition is what was written, byte for byte */
inline equal_short_selling_prohibition(short_selling_prohibition_read, short_selling_prohibition_written) {
  assert(short_selling_prohibition_read.proprietary_brokerage == short_selling_prohibition_written.proprietary_brokerage);
  assert(short_selling_prohibition_read.reserved_1 == short_selling_prohibition_written.reserved_1);
  skip
}

/* ---- Order Prohibition Status At The Regular Distribution: 10 bytes ---------- */

/* Order Prohibition Status (at the regular distribution) */
typedef OrderProhibitionStatusAtTheRegularDistribution {
  NewOrdersProhibition new_orders_prohibition;
  MarginTransactionsProhibition margin_transactio_7m8zf1;
  ShortSellingProhibition short_selling_pro_45r7wy;
  byte all_orders_prohibition
};

/* every byte of Order Prohibition Status At The Regular Distribution set to one value */
inline fill_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_record, order_prohibition_status_at_the_regular_distribution_value) {
  fill_new_orders_prohibition(order_prohibition_status_at_the_regular_distribution_record.new_orders_prohibition, order_prohibition_status_at_the_regular_distribution_value);
  fill_margin_transactions_prohibition(order_prohibition_status_at_the_regular_distribution_record.margin_transactio_7m8zf1, order_prohibition_status_at_the_regular_distribution_value);
  fill_short_selling_prohibition(order_prohibition_status_at_the_regular_distribution_record.short_selling_pro_45r7wy, order_prohibition_status_at_the_regular_distribution_value);
  order_prohibition_status_at_the_regular_distribution_record.all_orders_prohibition = order_prohibition_status_at_the_regular_distribution_value;
  skip
}

/* each byte of Order Prohibition Status At The Regular Distribution set to where it lies, so a field read out of place says so */
inline ramp_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_record, order_prohibition_status_at_the_regular_distribution_base) {
  ramp_new_orders_prohibition(order_prohibition_status_at_the_regular_distribution_record.new_orders_prohibition, order_prohibition_status_at_the_regular_distribution_base + 0);
  ramp_margin_transactions_prohibition(order_prohibition_status_at_the_regular_distribution_record.margin_transactio_7m8zf1, order_prohibition_status_at_the_regular_distribution_base + 4);
  ramp_short_selling_prohibition(order_prohibition_status_at_the_regular_distribution_record.short_selling_pro_45r7wy, order_prohibition_status_at_the_regular_distribution_base + 7);
  order_prohibition_status_at_the_regular_distribution_record.all_orders_prohibition = (order_prohibition_status_at_the_regular_distribution_base + 9 + 1) % 256;
  skip
}

/* Order Prohibition Status At The Regular Distribution to the wire, 10 bytes from where the cursor stands */
inline encode_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_record) {
  encode_new_orders_prohibition(order_prohibition_status_at_the_regular_distribution_record.new_orders_prohibition);
  encode_margin_transactions_prohibition(order_prohibition_status_at_the_regular_distribution_record.margin_transactio_7m8zf1);
  encode_short_selling_prohibition(order_prohibition_status_at_the_regular_distribution_record.short_selling_pro_45r7wy);
  wire[at] = order_prohibition_status_at_the_regular_distribution_record.all_orders_prohibition; at = at + 1;
  skip
}

/* Order Prohibition Status At The Regular Distribution off the wire, 10 bytes from where the cursor stands */
inline decode_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_record) {
  decode_new_orders_prohibition(order_prohibition_status_at_the_regular_distribution_record.new_orders_prohibition);
  decode_margin_transactions_prohibition(order_prohibition_status_at_the_regular_distribution_record.margin_transactio_7m8zf1);
  decode_short_selling_prohibition(order_prohibition_status_at_the_regular_distribution_record.short_selling_pro_45r7wy);
  order_prohibition_status_at_the_regular_distribution_record.all_orders_prohibition = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Prohibition Status At The Regular Distribution is what was written, byte for byte */
inline equal_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_read, order_prohibition_status_at_the_regular_distribution_written) {
  equal_new_orders_prohibition(order_prohibition_status_at_the_regular_distribution_read.new_orders_prohibition, order_prohibition_status_at_the_regular_distribution_written.new_orders_prohibition);
  equal_margin_transactions_prohibition(order_prohibition_status_at_the_regular_distribution_read.margin_transactio_7m8zf1, order_prohibition_status_at_the_regular_distribution_written.margin_transactio_7m8zf1);
  equal_short_selling_prohibition(order_prohibition_status_at_the_regular_distribution_read.short_selling_pro_45r7wy, order_prohibition_status_at_the_regular_distribution_written.short_selling_pro_45r7wy);
  assert(order_prohibition_status_at_the_regular_distribution_read.all_orders_prohibition == order_prohibition_status_at_the_regular_distribution_written.all_orders_prohibition);
  skip
}

/* ---- Issue Information Message: 123 bytes ------------------------------------ */

/* In this tag, the new security code, etc., of each issue will be set. This tag appears as part of an issue basic message. */
typedef IssueInformationMessage {
  byte reserved_2[2];
  byte serial_no[6];
  byte applicable_business_day[8];
  byte reserved_1;
  byte issue_name[20];
  byte security_type_etc_identification_code[2];
  byte isin_flag;
  byte new_security_code[12];
  byte industry_code[4];
  byte new_listing_flag;
  byte when_issued_transaction_flag;
  byte short_selling_price_restriction_applied_flag_at_the_regular_distribution;
  byte loan_margin_flag;
  byte ex_dividend_ex_right_flag[2];
  byte securities_to_be_delisted_under_supervision_classification;
  byte reserved_5[5];
  byte unit_of_trading[14];
  IndexConstituentIssue index_constituent_issue;
  OrderProhibitionStatusAtTheRegularDistribution order_prohibition_wvshew;
  byte reserved_11[11]
};

int issue_information_message_at;

/* every byte of Issue Information Message set to one value */
inline fill_issue_information_message(issue_information_message_record, issue_information_message_value) {
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> issue_information_message_record.reserved_2[issue_information_message_at] = issue_information_message_value; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 6 -> issue_information_message_record.serial_no[issue_information_message_at] = issue_information_message_value; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 8 -> issue_information_message_record.applicable_business_day[issue_information_message_at] = issue_information_message_value; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.reserved_1 = issue_information_message_value;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 20 -> issue_information_message_record.issue_name[issue_information_message_at] = issue_information_message_value; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> issue_information_message_record.security_type_etc_identification_code[issue_information_message_at] = issue_information_message_value; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.isin_flag = issue_information_message_value;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 12 -> issue_information_message_record.new_security_code[issue_information_message_at] = issue_information_message_value; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 4 -> issue_information_message_record.industry_code[issue_information_message_at] = issue_information_message_value; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.new_listing_flag = issue_information_message_value;
  issue_information_message_record.when_issued_transaction_flag = issue_information_message_value;
  issue_information_message_record.short_selling_price_restriction_applied_flag_at_the_regular_distribution = issue_information_message_value;
  issue_information_message_record.loan_margin_flag = issue_information_message_value;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> issue_information_message_record.ex_dividend_ex_right_flag[issue_information_message_at] = issue_information_message_value; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.securities_to_be_delisted_under_supervision_classification = issue_information_message_value;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 5 -> issue_information_message_record.reserved_5[issue_information_message_at] = issue_information_message_value; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 14 -> issue_information_message_record.unit_of_trading[issue_information_message_at] = issue_information_message_value; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  fill_index_constituent_issue(issue_information_message_record.index_constituent_issue, issue_information_message_value);
  fill_order_prohibition_status_at_the_regular_distribution(issue_information_message_record.order_prohibition_wvshew, issue_information_message_value);
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 11 -> issue_information_message_record.reserved_11[issue_information_message_at] = issue_information_message_value; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Issue Information Message set to where it lies, so a field read out of place says so */
inline ramp_issue_information_message(issue_information_message_record, issue_information_message_base) {
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> issue_information_message_record.reserved_2[issue_information_message_at] = (issue_information_message_base + 0 + issue_information_message_at + 1) % 256; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 6 -> issue_information_message_record.serial_no[issue_information_message_at] = (issue_information_message_base + 2 + issue_information_message_at + 1) % 256; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 8 -> issue_information_message_record.applicable_business_day[issue_information_message_at] = (issue_information_message_base + 8 + issue_information_message_at + 1) % 256; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.reserved_1 = (issue_information_message_base + 16 + 1) % 256;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 20 -> issue_information_message_record.issue_name[issue_information_message_at] = (issue_information_message_base + 17 + issue_information_message_at + 1) % 256; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> issue_information_message_record.security_type_etc_identification_code[issue_information_message_at] = (issue_information_message_base + 37 + issue_information_message_at + 1) % 256; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.isin_flag = (issue_information_message_base + 39 + 1) % 256;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 12 -> issue_information_message_record.new_security_code[issue_information_message_at] = (issue_information_message_base + 40 + issue_information_message_at + 1) % 256; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 4 -> issue_information_message_record.industry_code[issue_information_message_at] = (issue_information_message_base + 52 + issue_information_message_at + 1) % 256; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.new_listing_flag = (issue_information_message_base + 56 + 1) % 256;
  issue_information_message_record.when_issued_transaction_flag = (issue_information_message_base + 57 + 1) % 256;
  issue_information_message_record.short_selling_price_restriction_applied_flag_at_the_regular_distribution = (issue_information_message_base + 58 + 1) % 256;
  issue_information_message_record.loan_margin_flag = (issue_information_message_base + 59 + 1) % 256;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> issue_information_message_record.ex_dividend_ex_right_flag[issue_information_message_at] = (issue_information_message_base + 60 + issue_information_message_at + 1) % 256; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.securities_to_be_delisted_under_supervision_classification = (issue_information_message_base + 62 + 1) % 256;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 5 -> issue_information_message_record.reserved_5[issue_information_message_at] = (issue_information_message_base + 63 + issue_information_message_at + 1) % 256; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 14 -> issue_information_message_record.unit_of_trading[issue_information_message_at] = (issue_information_message_base + 68 + issue_information_message_at + 1) % 256; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  ramp_index_constituent_issue(issue_information_message_record.index_constituent_issue, issue_information_message_base + 82);
  ramp_order_prohibition_status_at_the_regular_distribution(issue_information_message_record.order_prohibition_wvshew, issue_information_message_base + 102);
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 11 -> issue_information_message_record.reserved_11[issue_information_message_at] = (issue_information_message_base + 112 + issue_information_message_at + 1) % 256; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Issue Information Message to the wire, 123 bytes from where the cursor stands */
inline encode_issue_information_message(issue_information_message_record) {
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> wire[at] = issue_information_message_record.reserved_2[issue_information_message_at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 6 -> wire[at] = issue_information_message_record.serial_no[issue_information_message_at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 8 -> wire[at] = issue_information_message_record.applicable_business_day[issue_information_message_at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_information_message_record.reserved_1; at = at + 1;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 20 -> wire[at] = issue_information_message_record.issue_name[issue_information_message_at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> wire[at] = issue_information_message_record.security_type_etc_identification_code[issue_information_message_at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_information_message_record.isin_flag; at = at + 1;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 12 -> wire[at] = issue_information_message_record.new_security_code[issue_information_message_at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 4 -> wire[at] = issue_information_message_record.industry_code[issue_information_message_at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_information_message_record.new_listing_flag; at = at + 1;
  wire[at] = issue_information_message_record.when_issued_transaction_flag; at = at + 1;
  wire[at] = issue_information_message_record.short_selling_price_restriction_applied_flag_at_the_regular_distribution; at = at + 1;
  wire[at] = issue_information_message_record.loan_margin_flag; at = at + 1;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> wire[at] = issue_information_message_record.ex_dividend_ex_right_flag[issue_information_message_at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_information_message_record.securities_to_be_delisted_under_supervision_classification; at = at + 1;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 5 -> wire[at] = issue_information_message_record.reserved_5[issue_information_message_at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 14 -> wire[at] = issue_information_message_record.unit_of_trading[issue_information_message_at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  encode_index_constituent_issue(issue_information_message_record.index_constituent_issue);
  encode_order_prohibition_status_at_the_regular_distribution(issue_information_message_record.order_prohibition_wvshew);
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 11 -> wire[at] = issue_information_message_record.reserved_11[issue_information_message_at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Issue Information Message off the wire, 123 bytes from where the cursor stands */
inline decode_issue_information_message(issue_information_message_record) {
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> issue_information_message_record.reserved_2[issue_information_message_at] = wire[at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 6 -> issue_information_message_record.serial_no[issue_information_message_at] = wire[at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 8 -> issue_information_message_record.applicable_business_day[issue_information_message_at] = wire[at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.reserved_1 = wire[at]; at = at + 1;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 20 -> issue_information_message_record.issue_name[issue_information_message_at] = wire[at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> issue_information_message_record.security_type_etc_identification_code[issue_information_message_at] = wire[at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.isin_flag = wire[at]; at = at + 1;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 12 -> issue_information_message_record.new_security_code[issue_information_message_at] = wire[at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 4 -> issue_information_message_record.industry_code[issue_information_message_at] = wire[at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.new_listing_flag = wire[at]; at = at + 1;
  issue_information_message_record.when_issued_transaction_flag = wire[at]; at = at + 1;
  issue_information_message_record.short_selling_price_restriction_applied_flag_at_the_regular_distribution = wire[at]; at = at + 1;
  issue_information_message_record.loan_margin_flag = wire[at]; at = at + 1;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> issue_information_message_record.ex_dividend_ex_right_flag[issue_information_message_at] = wire[at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_record.securities_to_be_delisted_under_supervision_classification = wire[at]; at = at + 1;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 5 -> issue_information_message_record.reserved_5[issue_information_message_at] = wire[at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 14 -> issue_information_message_record.unit_of_trading[issue_information_message_at] = wire[at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  decode_index_constituent_issue(issue_information_message_record.index_constituent_issue);
  decode_order_prohibition_status_at_the_regular_distribution(issue_information_message_record.order_prohibition_wvshew);
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 11 -> issue_information_message_record.reserved_11[issue_information_message_at] = wire[at]; at = at + 1; issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Issue Information Message is what was written, byte for byte */
inline equal_issue_information_message(issue_information_message_read, issue_information_message_written) {
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> assert(issue_information_message_read.reserved_2[issue_information_message_at] == issue_information_message_written.reserved_2[issue_information_message_at]); issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 6 -> assert(issue_information_message_read.serial_no[issue_information_message_at] == issue_information_message_written.serial_no[issue_information_message_at]); issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 8 -> assert(issue_information_message_read.applicable_business_day[issue_information_message_at] == issue_information_message_written.applicable_business_day[issue_information_message_at]); issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  assert(issue_information_message_read.reserved_1 == issue_information_message_written.reserved_1);
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 20 -> assert(issue_information_message_read.issue_name[issue_information_message_at] == issue_information_message_written.issue_name[issue_information_message_at]); issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> assert(issue_information_message_read.security_type_etc_identification_code[issue_information_message_at] == issue_information_message_written.security_type_etc_identification_code[issue_information_message_at]); issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  assert(issue_information_message_read.isin_flag == issue_information_message_written.isin_flag);
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 12 -> assert(issue_information_message_read.new_security_code[issue_information_message_at] == issue_information_message_written.new_security_code[issue_information_message_at]); issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 4 -> assert(issue_information_message_read.industry_code[issue_information_message_at] == issue_information_message_written.industry_code[issue_information_message_at]); issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  assert(issue_information_message_read.new_listing_flag == issue_information_message_written.new_listing_flag);
  assert(issue_information_message_read.when_issued_transaction_flag == issue_information_message_written.when_issued_transaction_flag);
  assert(issue_information_message_read.short_selling_price_restriction_applied_flag_at_the_regular_distribution == issue_information_message_written.short_selling_price_restriction_applied_flag_at_the_regular_distribution);
  assert(issue_information_message_read.loan_margin_flag == issue_information_message_written.loan_margin_flag);
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 2 -> assert(issue_information_message_read.ex_dividend_ex_right_flag[issue_information_message_at] == issue_information_message_written.ex_dividend_ex_right_flag[issue_information_message_at]); issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  assert(issue_information_message_read.securities_to_be_delisted_under_supervision_classification == issue_information_message_written.securities_to_be_delisted_under_supervision_classification);
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 5 -> assert(issue_information_message_read.reserved_5[issue_information_message_at] == issue_information_message_written.reserved_5[issue_information_message_at]); issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 14 -> assert(issue_information_message_read.unit_of_trading[issue_information_message_at] == issue_information_message_written.unit_of_trading[issue_information_message_at]); issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  equal_index_constituent_issue(issue_information_message_read.index_constituent_issue, issue_information_message_written.index_constituent_issue);
  equal_order_prohibition_status_at_the_regular_distribution(issue_information_message_read.order_prohibition_wvshew, issue_information_message_written.order_prohibition_wvshew);
  issue_information_message_at = 0;
  do
  :: issue_information_message_at < 11 -> assert(issue_information_message_read.reserved_11[issue_information_message_at] == issue_information_message_written.reserved_11[issue_information_message_at]); issue_information_message_at = issue_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Base Price: 16 bytes ---------------------------------------------------- */

/* Base Price */
typedef BasePrice {
  byte unit_flag;
  byte price[14];
  byte sign
};

int base_price_at;

/* every byte of Base Price set to one value */
inline fill_base_price(base_price_record, base_price_value) {
  base_price_record.unit_flag = base_price_value;
  base_price_at = 0;
  do
  :: base_price_at < 14 -> base_price_record.price[base_price_at] = base_price_value; base_price_at = base_price_at + 1
  :: else -> break
  od;
  base_price_record.sign = base_price_value;
  skip
}

/* each byte of Base Price set to where it lies, so a field read out of place says so */
inline ramp_base_price(base_price_record, base_price_base) {
  base_price_record.unit_flag = (base_price_base + 0 + 1) % 256;
  base_price_at = 0;
  do
  :: base_price_at < 14 -> base_price_record.price[base_price_at] = (base_price_base + 1 + base_price_at + 1) % 256; base_price_at = base_price_at + 1
  :: else -> break
  od;
  base_price_record.sign = (base_price_base + 15 + 1) % 256;
  skip
}

/* Base Price to the wire, 16 bytes from where the cursor stands */
inline encode_base_price(base_price_record) {
  wire[at] = base_price_record.unit_flag; at = at + 1;
  base_price_at = 0;
  do
  :: base_price_at < 14 -> wire[at] = base_price_record.price[base_price_at]; at = at + 1; base_price_at = base_price_at + 1
  :: else -> break
  od;
  wire[at] = base_price_record.sign; at = at + 1;
  skip
}

/* Base Price off the wire, 16 bytes from where the cursor stands */
inline decode_base_price(base_price_record) {
  base_price_record.unit_flag = wire[at]; at = at + 1;
  base_price_at = 0;
  do
  :: base_price_at < 14 -> base_price_record.price[base_price_at] = wire[at]; at = at + 1; base_price_at = base_price_at + 1
  :: else -> break
  od;
  base_price_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Base Price is what was written, byte for byte */
inline equal_base_price(base_price_read, base_price_written) {
  assert(base_price_read.unit_flag == base_price_written.unit_flag);
  base_price_at = 0;
  do
  :: base_price_at < 14 -> assert(base_price_read.price[base_price_at] == base_price_written.price[base_price_at]); base_price_at = base_price_at + 1
  :: else -> break
  od;
  assert(base_price_read.sign == base_price_written.sign);
  skip
}

/* ---- Limit Price Maximum: 16 bytes ------------------------------------------- */

/* Limit Price (Maximum) */
typedef LimitPriceMaximum {
  byte unit_flag;
  byte price[14];
  byte sign
};

int limit_price_maximum_at;

/* every byte of Limit Price Maximum set to one value */
inline fill_limit_price_maximum(limit_price_maximum_record, limit_price_maximum_value) {
  limit_price_maximum_record.unit_flag = limit_price_maximum_value;
  limit_price_maximum_at = 0;
  do
  :: limit_price_maximum_at < 14 -> limit_price_maximum_record.price[limit_price_maximum_at] = limit_price_maximum_value; limit_price_maximum_at = limit_price_maximum_at + 1
  :: else -> break
  od;
  limit_price_maximum_record.sign = limit_price_maximum_value;
  skip
}

/* each byte of Limit Price Maximum set to where it lies, so a field read out of place says so */
inline ramp_limit_price_maximum(limit_price_maximum_record, limit_price_maximum_base) {
  limit_price_maximum_record.unit_flag = (limit_price_maximum_base + 0 + 1) % 256;
  limit_price_maximum_at = 0;
  do
  :: limit_price_maximum_at < 14 -> limit_price_maximum_record.price[limit_price_maximum_at] = (limit_price_maximum_base + 1 + limit_price_maximum_at + 1) % 256; limit_price_maximum_at = limit_price_maximum_at + 1
  :: else -> break
  od;
  limit_price_maximum_record.sign = (limit_price_maximum_base + 15 + 1) % 256;
  skip
}

/* Limit Price Maximum to the wire, 16 bytes from where the cursor stands */
inline encode_limit_price_maximum(limit_price_maximum_record) {
  wire[at] = limit_price_maximum_record.unit_flag; at = at + 1;
  limit_price_maximum_at = 0;
  do
  :: limit_price_maximum_at < 14 -> wire[at] = limit_price_maximum_record.price[limit_price_maximum_at]; at = at + 1; limit_price_maximum_at = limit_price_maximum_at + 1
  :: else -> break
  od;
  wire[at] = limit_price_maximum_record.sign; at = at + 1;
  skip
}

/* Limit Price Maximum off the wire, 16 bytes from where the cursor stands */
inline decode_limit_price_maximum(limit_price_maximum_record) {
  limit_price_maximum_record.unit_flag = wire[at]; at = at + 1;
  limit_price_maximum_at = 0;
  do
  :: limit_price_maximum_at < 14 -> limit_price_maximum_record.price[limit_price_maximum_at] = wire[at]; at = at + 1; limit_price_maximum_at = limit_price_maximum_at + 1
  :: else -> break
  od;
  limit_price_maximum_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Limit Price Maximum is what was written, byte for byte */
inline equal_limit_price_maximum(limit_price_maximum_read, limit_price_maximum_written) {
  assert(limit_price_maximum_read.unit_flag == limit_price_maximum_written.unit_flag);
  limit_price_maximum_at = 0;
  do
  :: limit_price_maximum_at < 14 -> assert(limit_price_maximum_read.price[limit_price_maximum_at] == limit_price_maximum_written.price[limit_price_maximum_at]); limit_price_maximum_at = limit_price_maximum_at + 1
  :: else -> break
  od;
  assert(limit_price_maximum_read.sign == limit_price_maximum_written.sign);
  skip
}

/* ---- Limit Price Minimum: 16 bytes ------------------------------------------- */

/* Limit Price (Minimum) */
typedef LimitPriceMinimum {
  byte unit_flag;
  byte price[14];
  byte sign
};

int limit_price_minimum_at;

/* every byte of Limit Price Minimum set to one value */
inline fill_limit_price_minimum(limit_price_minimum_record, limit_price_minimum_value) {
  limit_price_minimum_record.unit_flag = limit_price_minimum_value;
  limit_price_minimum_at = 0;
  do
  :: limit_price_minimum_at < 14 -> limit_price_minimum_record.price[limit_price_minimum_at] = limit_price_minimum_value; limit_price_minimum_at = limit_price_minimum_at + 1
  :: else -> break
  od;
  limit_price_minimum_record.sign = limit_price_minimum_value;
  skip
}

/* each byte of Limit Price Minimum set to where it lies, so a field read out of place says so */
inline ramp_limit_price_minimum(limit_price_minimum_record, limit_price_minimum_base) {
  limit_price_minimum_record.unit_flag = (limit_price_minimum_base + 0 + 1) % 256;
  limit_price_minimum_at = 0;
  do
  :: limit_price_minimum_at < 14 -> limit_price_minimum_record.price[limit_price_minimum_at] = (limit_price_minimum_base + 1 + limit_price_minimum_at + 1) % 256; limit_price_minimum_at = limit_price_minimum_at + 1
  :: else -> break
  od;
  limit_price_minimum_record.sign = (limit_price_minimum_base + 15 + 1) % 256;
  skip
}

/* Limit Price Minimum to the wire, 16 bytes from where the cursor stands */
inline encode_limit_price_minimum(limit_price_minimum_record) {
  wire[at] = limit_price_minimum_record.unit_flag; at = at + 1;
  limit_price_minimum_at = 0;
  do
  :: limit_price_minimum_at < 14 -> wire[at] = limit_price_minimum_record.price[limit_price_minimum_at]; at = at + 1; limit_price_minimum_at = limit_price_minimum_at + 1
  :: else -> break
  od;
  wire[at] = limit_price_minimum_record.sign; at = at + 1;
  skip
}

/* Limit Price Minimum off the wire, 16 bytes from where the cursor stands */
inline decode_limit_price_minimum(limit_price_minimum_record) {
  limit_price_minimum_record.unit_flag = wire[at]; at = at + 1;
  limit_price_minimum_at = 0;
  do
  :: limit_price_minimum_at < 14 -> limit_price_minimum_record.price[limit_price_minimum_at] = wire[at]; at = at + 1; limit_price_minimum_at = limit_price_minimum_at + 1
  :: else -> break
  od;
  limit_price_minimum_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Limit Price Minimum is what was written, byte for byte */
inline equal_limit_price_minimum(limit_price_minimum_read, limit_price_minimum_written) {
  assert(limit_price_minimum_read.unit_flag == limit_price_minimum_written.unit_flag);
  limit_price_minimum_at = 0;
  do
  :: limit_price_minimum_at < 14 -> assert(limit_price_minimum_read.price[limit_price_minimum_at] == limit_price_minimum_written.price[limit_price_minimum_at]); limit_price_minimum_at = limit_price_minimum_at + 1
  :: else -> break
  od;
  assert(limit_price_minimum_read.sign == limit_price_minimum_written.sign);
  skip
}

/* ---- Base Price Information Message: 66 bytes -------------------------------- */

/* In this Tag, the below items for the next business day or the day are set. This tag appears as part of an issue basic message. */
typedef BasePriceInformationMessage {
  byte reserved_2[2];
  byte based_business_day[8];
  BasePrice base_price;
  LimitPriceMaximum limit_price_maximum;
  LimitPriceMinimum limit_price_minimum;
  byte base_price_price_of_the_middle_of_the_book;
  byte number_of_tick_size_table[2];
  byte reserved_1;
  byte reserved_4[4]
};

int base_price_information_message_at;

/* every byte of Base Price Information Message set to one value */
inline fill_base_price_information_message(base_price_information_message_record, base_price_information_message_value) {
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 2 -> base_price_information_message_record.reserved_2[base_price_information_message_at] = base_price_information_message_value; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 8 -> base_price_information_message_record.based_business_day[base_price_information_message_at] = base_price_information_message_value; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  fill_base_price(base_price_information_message_record.base_price, base_price_information_message_value);
  fill_limit_price_maximum(base_price_information_message_record.limit_price_maximum, base_price_information_message_value);
  fill_limit_price_minimum(base_price_information_message_record.limit_price_minimum, base_price_information_message_value);
  base_price_information_message_record.base_price_price_of_the_middle_of_the_book = base_price_information_message_value;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 2 -> base_price_information_message_record.number_of_tick_size_table[base_price_information_message_at] = base_price_information_message_value; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  base_price_information_message_record.reserved_1 = base_price_information_message_value;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 4 -> base_price_information_message_record.reserved_4[base_price_information_message_at] = base_price_information_message_value; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Base Price Information Message set to where it lies, so a field read out of place says so */
inline ramp_base_price_information_message(base_price_information_message_record, base_price_information_message_base) {
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 2 -> base_price_information_message_record.reserved_2[base_price_information_message_at] = (base_price_information_message_base + 0 + base_price_information_message_at + 1) % 256; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 8 -> base_price_information_message_record.based_business_day[base_price_information_message_at] = (base_price_information_message_base + 2 + base_price_information_message_at + 1) % 256; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  ramp_base_price(base_price_information_message_record.base_price, base_price_information_message_base + 10);
  ramp_limit_price_maximum(base_price_information_message_record.limit_price_maximum, base_price_information_message_base + 26);
  ramp_limit_price_minimum(base_price_information_message_record.limit_price_minimum, base_price_information_message_base + 42);
  base_price_information_message_record.base_price_price_of_the_middle_of_the_book = (base_price_information_message_base + 58 + 1) % 256;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 2 -> base_price_information_message_record.number_of_tick_size_table[base_price_information_message_at] = (base_price_information_message_base + 59 + base_price_information_message_at + 1) % 256; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  base_price_information_message_record.reserved_1 = (base_price_information_message_base + 61 + 1) % 256;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 4 -> base_price_information_message_record.reserved_4[base_price_information_message_at] = (base_price_information_message_base + 62 + base_price_information_message_at + 1) % 256; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Base Price Information Message to the wire, 66 bytes from where the cursor stands */
inline encode_base_price_information_message(base_price_information_message_record) {
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 2 -> wire[at] = base_price_information_message_record.reserved_2[base_price_information_message_at]; at = at + 1; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 8 -> wire[at] = base_price_information_message_record.based_business_day[base_price_information_message_at]; at = at + 1; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  encode_base_price(base_price_information_message_record.base_price);
  encode_limit_price_maximum(base_price_information_message_record.limit_price_maximum);
  encode_limit_price_minimum(base_price_information_message_record.limit_price_minimum);
  wire[at] = base_price_information_message_record.base_price_price_of_the_middle_of_the_book; at = at + 1;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 2 -> wire[at] = base_price_information_message_record.number_of_tick_size_table[base_price_information_message_at]; at = at + 1; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  wire[at] = base_price_information_message_record.reserved_1; at = at + 1;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 4 -> wire[at] = base_price_information_message_record.reserved_4[base_price_information_message_at]; at = at + 1; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Base Price Information Message off the wire, 66 bytes from where the cursor stands */
inline decode_base_price_information_message(base_price_information_message_record) {
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 2 -> base_price_information_message_record.reserved_2[base_price_information_message_at] = wire[at]; at = at + 1; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 8 -> base_price_information_message_record.based_business_day[base_price_information_message_at] = wire[at]; at = at + 1; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  decode_base_price(base_price_information_message_record.base_price);
  decode_limit_price_maximum(base_price_information_message_record.limit_price_maximum);
  decode_limit_price_minimum(base_price_information_message_record.limit_price_minimum);
  base_price_information_message_record.base_price_price_of_the_middle_of_the_book = wire[at]; at = at + 1;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 2 -> base_price_information_message_record.number_of_tick_size_table[base_price_information_message_at] = wire[at]; at = at + 1; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  base_price_information_message_record.reserved_1 = wire[at]; at = at + 1;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 4 -> base_price_information_message_record.reserved_4[base_price_information_message_at] = wire[at]; at = at + 1; base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Base Price Information Message is what was written, byte for byte */
inline equal_base_price_information_message(base_price_information_message_read, base_price_information_message_written) {
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 2 -> assert(base_price_information_message_read.reserved_2[base_price_information_message_at] == base_price_information_message_written.reserved_2[base_price_information_message_at]); base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 8 -> assert(base_price_information_message_read.based_business_day[base_price_information_message_at] == base_price_information_message_written.based_business_day[base_price_information_message_at]); base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  equal_base_price(base_price_information_message_read.base_price, base_price_information_message_written.base_price);
  equal_limit_price_maximum(base_price_information_message_read.limit_price_maximum, base_price_information_message_written.limit_price_maximum);
  equal_limit_price_minimum(base_price_information_message_read.limit_price_minimum, base_price_information_message_written.limit_price_minimum);
  assert(base_price_information_message_read.base_price_price_of_the_middle_of_the_book == base_price_information_message_written.base_price_price_of_the_middle_of_the_book);
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 2 -> assert(base_price_information_message_read.number_of_tick_size_table[base_price_information_message_at] == base_price_information_message_written.number_of_tick_size_table[base_price_information_message_at]); base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  assert(base_price_information_message_read.reserved_1 == base_price_information_message_written.reserved_1);
  base_price_information_message_at = 0;
  do
  :: base_price_information_message_at < 4 -> assert(base_price_information_message_read.reserved_4[base_price_information_message_at] == base_price_information_message_written.reserved_4[base_price_information_message_at]); base_price_information_message_at = base_price_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Multicast Group Number Information Message: 14 bytes -------------------- */

/* In this tag, Multicast Group Number with which the issue is output is set. This tag appears as part of an Issue Realtime Message. */
typedef MulticastGroupNumberInformationMessage {
  byte reserved_2[2];
  byte applicable_business_day[8];
  byte issue_multicast_group_number[3];
  byte reserved_1
};

int multicast_group_number_information_message_at;

/* every byte of Multicast Group Number Information Message set to one value */
inline fill_multicast_group_number_information_message(multicast_group_number_information_message_record, multicast_group_number_information_message_value) {
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 2 -> multicast_group_number_information_message_record.reserved_2[multicast_group_number_information_message_at] = multicast_group_number_information_message_value; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 8 -> multicast_group_number_information_message_record.applicable_business_day[multicast_group_number_information_message_at] = multicast_group_number_information_message_value; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 3 -> multicast_group_number_information_message_record.issue_multicast_group_number[multicast_group_number_information_message_at] = multicast_group_number_information_message_value; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_record.reserved_1 = multicast_group_number_information_message_value;
  skip
}

/* each byte of Multicast Group Number Information Message set to where it lies, so a field read out of place says so */
inline ramp_multicast_group_number_information_message(multicast_group_number_information_message_record, multicast_group_number_information_message_base) {
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 2 -> multicast_group_number_information_message_record.reserved_2[multicast_group_number_information_message_at] = (multicast_group_number_information_message_base + 0 + multicast_group_number_information_message_at + 1) % 256; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 8 -> multicast_group_number_information_message_record.applicable_business_day[multicast_group_number_information_message_at] = (multicast_group_number_information_message_base + 2 + multicast_group_number_information_message_at + 1) % 256; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 3 -> multicast_group_number_information_message_record.issue_multicast_group_number[multicast_group_number_information_message_at] = (multicast_group_number_information_message_base + 10 + multicast_group_number_information_message_at + 1) % 256; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_record.reserved_1 = (multicast_group_number_information_message_base + 13 + 1) % 256;
  skip
}

/* Multicast Group Number Information Message to the wire, 14 bytes from where the cursor stands */
inline encode_multicast_group_number_information_message(multicast_group_number_information_message_record) {
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 2 -> wire[at] = multicast_group_number_information_message_record.reserved_2[multicast_group_number_information_message_at]; at = at + 1; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 8 -> wire[at] = multicast_group_number_information_message_record.applicable_business_day[multicast_group_number_information_message_at]; at = at + 1; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 3 -> wire[at] = multicast_group_number_information_message_record.issue_multicast_group_number[multicast_group_number_information_message_at]; at = at + 1; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  wire[at] = multicast_group_number_information_message_record.reserved_1; at = at + 1;
  skip
}

/* Multicast Group Number Information Message off the wire, 14 bytes from where the cursor stands */
inline decode_multicast_group_number_information_message(multicast_group_number_information_message_record) {
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 2 -> multicast_group_number_information_message_record.reserved_2[multicast_group_number_information_message_at] = wire[at]; at = at + 1; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 8 -> multicast_group_number_information_message_record.applicable_business_day[multicast_group_number_information_message_at] = wire[at]; at = at + 1; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 3 -> multicast_group_number_information_message_record.issue_multicast_group_number[multicast_group_number_information_message_at] = wire[at]; at = at + 1; multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Multicast Group Number Information Message is what was written, byte for byte */
inline equal_multicast_group_number_information_message(multicast_group_number_information_message_read, multicast_group_number_information_message_written) {
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 2 -> assert(multicast_group_number_information_message_read.reserved_2[multicast_group_number_information_message_at] == multicast_group_number_information_message_written.reserved_2[multicast_group_number_information_message_at]); multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 8 -> assert(multicast_group_number_information_message_read.applicable_business_day[multicast_group_number_information_message_at] == multicast_group_number_information_message_written.applicable_business_day[multicast_group_number_information_message_at]); multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  multicast_group_number_information_message_at = 0;
  do
  :: multicast_group_number_information_message_at < 3 -> assert(multicast_group_number_information_message_read.issue_multicast_group_number[multicast_group_number_information_message_at] == multicast_group_number_information_message_written.issue_multicast_group_number[multicast_group_number_information_message_at]); multicast_group_number_information_message_at = multicast_group_number_information_message_at + 1
  :: else -> break
  od;
  assert(multicast_group_number_information_message_read.reserved_1 == multicast_group_number_information_message_written.reserved_1);
  skip
}

/* ---- Control Message: 10 bytes ----------------------------------------------- */

/* In this tag, the Test Mode Flag and the Start/End Flag that are used in a Control Message will be set. This tag appears as part of a Control Message (Communication Control, Health Check Control, Stock Base Price Information Control, CB Base Price Information Control, Issue Information Control and Multicast Group Number Information Control). */
typedef ControlMessage {
  byte reserved_2[2];
  byte test_mode_flag;
  byte start_end_flag;
  byte time[6]
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
  :: control_message_at < 6 -> control_message_record.time[control_message_at] = control_message_value; control_message_at = control_message_at + 1
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
  :: control_message_at < 6 -> control_message_record.time[control_message_at] = (control_message_base + 4 + control_message_at + 1) % 256; control_message_at = control_message_at + 1
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
  :: control_message_at < 6 -> wire[at] = control_message_record.time[control_message_at]; at = at + 1; control_message_at = control_message_at + 1
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
  :: control_message_at < 6 -> control_message_record.time[control_message_at] = wire[at]; at = at + 1; control_message_at = control_message_at + 1
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
  :: control_message_at < 6 -> assert(control_message_read.time[control_message_at] == control_message_written.time[control_message_at]); control_message_at = control_message_at + 1
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

/* Index Constituent Issue: encoded, read back, and compared */
proctype check_index_constituent_issue() {
  IndexConstituentIssue index_constituent_issue_sent;
  IndexConstituentIssue index_constituent_issue_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_constituent_issue(index_constituent_issue_sent, 0)
  :: pattern == 1 -> fill_index_constituent_issue(index_constituent_issue_sent, 32)
  :: pattern == 2 -> fill_index_constituent_issue(index_constituent_issue_sent, 255)
  :: else -> ramp_index_constituent_issue(index_constituent_issue_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_constituent_issue(index_constituent_issue_sent);
    assert(at == 20);
    at = 0;
    decode_index_constituent_issue(index_constituent_issue_got);
    assert(at == 20);
    equal_index_constituent_issue(index_constituent_issue_got, index_constituent_issue_sent)
  }
}

/* New Orders Prohibition: encoded, read back, and compared */
proctype check_new_orders_prohibition() {
  NewOrdersProhibition new_orders_prohibition_sent;
  NewOrdersProhibition new_orders_prohibition_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_orders_prohibition(new_orders_prohibition_sent, 0)
  :: pattern == 1 -> fill_new_orders_prohibition(new_orders_prohibition_sent, 32)
  :: pattern == 2 -> fill_new_orders_prohibition(new_orders_prohibition_sent, 255)
  :: else -> ramp_new_orders_prohibition(new_orders_prohibition_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_orders_prohibition(new_orders_prohibition_sent);
    assert(at == 4);
    at = 0;
    decode_new_orders_prohibition(new_orders_prohibition_got);
    assert(at == 4);
    equal_new_orders_prohibition(new_orders_prohibition_got, new_orders_prohibition_sent)
  }
}

/* Margin Transactions Prohibition: encoded, read back, and compared */
proctype check_margin_transactions_prohibition() {
  MarginTransactionsProhibition margin_transactions_prohibition_sent;
  MarginTransactionsProhibition margin_transactions_prohibition_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_margin_transactions_prohibition(margin_transactions_prohibition_sent, 0)
  :: pattern == 1 -> fill_margin_transactions_prohibition(margin_transactions_prohibition_sent, 32)
  :: pattern == 2 -> fill_margin_transactions_prohibition(margin_transactions_prohibition_sent, 255)
  :: else -> ramp_margin_transactions_prohibition(margin_transactions_prohibition_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_margin_transactions_prohibition(margin_transactions_prohibition_sent);
    assert(at == 3);
    at = 0;
    decode_margin_transactions_prohibition(margin_transactions_prohibition_got);
    assert(at == 3);
    equal_margin_transactions_prohibition(margin_transactions_prohibition_got, margin_transactions_prohibition_sent)
  }
}

/* Short Selling Prohibition: encoded, read back, and compared */
proctype check_short_selling_prohibition() {
  ShortSellingProhibition short_selling_prohibition_sent;
  ShortSellingProhibition short_selling_prohibition_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_selling_prohibition(short_selling_prohibition_sent, 0)
  :: pattern == 1 -> fill_short_selling_prohibition(short_selling_prohibition_sent, 32)
  :: pattern == 2 -> fill_short_selling_prohibition(short_selling_prohibition_sent, 255)
  :: else -> ramp_short_selling_prohibition(short_selling_prohibition_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_selling_prohibition(short_selling_prohibition_sent);
    assert(at == 2);
    at = 0;
    decode_short_selling_prohibition(short_selling_prohibition_got);
    assert(at == 2);
    equal_short_selling_prohibition(short_selling_prohibition_got, short_selling_prohibition_sent)
  }
}

/* Order Prohibition Status At The Regular Distribution: encoded, read back, and compared */
proctype check_order_prohibition_status_at_the_regular_distribution() {
  OrderProhibitionStatusAtTheRegularDistribution order_prohibition_status_at_the_regular_distribution_sent;
  OrderProhibitionStatusAtTheRegularDistribution order_prohibition_status_at_the_regular_distribution_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_sent, 0)
  :: pattern == 1 -> fill_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_sent, 32)
  :: pattern == 2 -> fill_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_sent, 255)
  :: else -> ramp_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_sent);
    assert(at == 10);
    at = 0;
    decode_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_got);
    assert(at == 10);
    equal_order_prohibition_status_at_the_regular_distribution(order_prohibition_status_at_the_regular_distribution_got, order_prohibition_status_at_the_regular_distribution_sent)
  }
}

/* Issue Information Message: encoded, read back, and compared */
proctype check_issue_information_message() {
  IssueInformationMessage issue_information_message_sent;
  IssueInformationMessage issue_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_issue_information_message(issue_information_message_sent, 0)
  :: pattern == 1 -> fill_issue_information_message(issue_information_message_sent, 32)
  :: pattern == 2 -> fill_issue_information_message(issue_information_message_sent, 255)
  :: else -> ramp_issue_information_message(issue_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_issue_information_message(issue_information_message_sent);
    assert(at == 123);
    at = 0;
    decode_issue_information_message(issue_information_message_got);
    assert(at == 123);
    equal_issue_information_message(issue_information_message_got, issue_information_message_sent)
  }
}

/* Base Price: encoded, read back, and compared */
proctype check_base_price() {
  BasePrice base_price_sent;
  BasePrice base_price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_base_price(base_price_sent, 0)
  :: pattern == 1 -> fill_base_price(base_price_sent, 32)
  :: pattern == 2 -> fill_base_price(base_price_sent, 255)
  :: else -> ramp_base_price(base_price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_base_price(base_price_sent);
    assert(at == 16);
    at = 0;
    decode_base_price(base_price_got);
    assert(at == 16);
    equal_base_price(base_price_got, base_price_sent)
  }
}

/* Limit Price Maximum: encoded, read back, and compared */
proctype check_limit_price_maximum() {
  LimitPriceMaximum limit_price_maximum_sent;
  LimitPriceMaximum limit_price_maximum_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_limit_price_maximum(limit_price_maximum_sent, 0)
  :: pattern == 1 -> fill_limit_price_maximum(limit_price_maximum_sent, 32)
  :: pattern == 2 -> fill_limit_price_maximum(limit_price_maximum_sent, 255)
  :: else -> ramp_limit_price_maximum(limit_price_maximum_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_limit_price_maximum(limit_price_maximum_sent);
    assert(at == 16);
    at = 0;
    decode_limit_price_maximum(limit_price_maximum_got);
    assert(at == 16);
    equal_limit_price_maximum(limit_price_maximum_got, limit_price_maximum_sent)
  }
}

/* Limit Price Minimum: encoded, read back, and compared */
proctype check_limit_price_minimum() {
  LimitPriceMinimum limit_price_minimum_sent;
  LimitPriceMinimum limit_price_minimum_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_limit_price_minimum(limit_price_minimum_sent, 0)
  :: pattern == 1 -> fill_limit_price_minimum(limit_price_minimum_sent, 32)
  :: pattern == 2 -> fill_limit_price_minimum(limit_price_minimum_sent, 255)
  :: else -> ramp_limit_price_minimum(limit_price_minimum_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_limit_price_minimum(limit_price_minimum_sent);
    assert(at == 16);
    at = 0;
    decode_limit_price_minimum(limit_price_minimum_got);
    assert(at == 16);
    equal_limit_price_minimum(limit_price_minimum_got, limit_price_minimum_sent)
  }
}

/* Base Price Information Message: encoded, read back, and compared */
proctype check_base_price_information_message() {
  BasePriceInformationMessage base_price_information_message_sent;
  BasePriceInformationMessage base_price_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_base_price_information_message(base_price_information_message_sent, 0)
  :: pattern == 1 -> fill_base_price_information_message(base_price_information_message_sent, 32)
  :: pattern == 2 -> fill_base_price_information_message(base_price_information_message_sent, 255)
  :: else -> ramp_base_price_information_message(base_price_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_base_price_information_message(base_price_information_message_sent);
    assert(at == 66);
    at = 0;
    decode_base_price_information_message(base_price_information_message_got);
    assert(at == 66);
    equal_base_price_information_message(base_price_information_message_got, base_price_information_message_sent)
  }
}

/* Multicast Group Number Information Message: encoded, read back, and compared */
proctype check_multicast_group_number_information_message() {
  MulticastGroupNumberInformationMessage multicast_group_number_information_message_sent;
  MulticastGroupNumberInformationMessage multicast_group_number_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_multicast_group_number_information_message(multicast_group_number_information_message_sent, 0)
  :: pattern == 1 -> fill_multicast_group_number_information_message(multicast_group_number_information_message_sent, 32)
  :: pattern == 2 -> fill_multicast_group_number_information_message(multicast_group_number_information_message_sent, 255)
  :: else -> ramp_multicast_group_number_information_message(multicast_group_number_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_multicast_group_number_information_message(multicast_group_number_information_message_sent);
    assert(at == 14);
    at = 0;
    decode_multicast_group_number_information_message(multicast_group_number_information_message_got);
    assert(at == 14);
    equal_multicast_group_number_information_message(multicast_group_number_information_message_got, multicast_group_number_information_message_sent)
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
  :: run check_index_constituent_issue()
  :: run check_new_orders_prohibition()
  :: run check_margin_transactions_prohibition()
  :: run check_short_selling_prohibition()
  :: run check_order_prohibition_status_at_the_regular_distribution()
  :: run check_issue_information_message()
  :: run check_base_price()
  :: run check_limit_price_maximum()
  :: run check_limit_price_minimum()
  :: run check_base_price_information_message()
  :: run check_multicast_group_number_information_message()
  :: run check_control_message()
  fi
}
