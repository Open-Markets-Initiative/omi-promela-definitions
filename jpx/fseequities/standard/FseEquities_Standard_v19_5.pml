/*
 * Japan Exchange Group Standard
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
#define WIRE 105

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

/* ---- Update No Message: 8 bytes ---------------------------------------------- */

/* In this tag, Update Number for each issue is set. This tag appears as part of realtime data. */
typedef UpdateNoMessage {
  byte update_no[8]
};

int update_no_message_at;

/* every byte of Update No Message set to one value */
inline fill_update_no_message(update_no_message_record, update_no_message_value) {
  update_no_message_at = 0;
  do
  :: update_no_message_at < 8 -> update_no_message_record.update_no[update_no_message_at] = update_no_message_value; update_no_message_at = update_no_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Update No Message set to where it lies, so a field read out of place says so */
inline ramp_update_no_message(update_no_message_record, update_no_message_base) {
  update_no_message_at = 0;
  do
  :: update_no_message_at < 8 -> update_no_message_record.update_no[update_no_message_at] = (update_no_message_base + 0 + update_no_message_at + 1) % 256; update_no_message_at = update_no_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update No Message to the wire, 8 bytes from where the cursor stands */
inline encode_update_no_message(update_no_message_record) {
  update_no_message_at = 0;
  do
  :: update_no_message_at < 8 -> wire[at] = update_no_message_record.update_no[update_no_message_at]; at = at + 1; update_no_message_at = update_no_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update No Message off the wire, 8 bytes from where the cursor stands */
inline decode_update_no_message(update_no_message_record) {
  update_no_message_at = 0;
  do
  :: update_no_message_at < 8 -> update_no_message_record.update_no[update_no_message_at] = wire[at]; at = at + 1; update_no_message_at = update_no_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Update No Message is what was written, byte for byte */
inline equal_update_no_message(update_no_message_read, update_no_message_written) {
  update_no_message_at = 0;
  do
  :: update_no_message_at < 8 -> assert(update_no_message_read.update_no[update_no_message_at] == update_no_message_written.update_no[update_no_message_at]); update_no_message_at = update_no_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Status Information: 5 bytes --------------------------------------------- */

/* Status Information */
typedef StatusInformation {
  byte issue_status[2];
  byte status_flag[2];
  byte short_selling_regulation_flag
};

int status_information_at;

/* every byte of Status Information set to one value */
inline fill_status_information(status_information_record, status_information_value) {
  status_information_at = 0;
  do
  :: status_information_at < 2 -> status_information_record.issue_status[status_information_at] = status_information_value; status_information_at = status_information_at + 1
  :: else -> break
  od;
  status_information_at = 0;
  do
  :: status_information_at < 2 -> status_information_record.status_flag[status_information_at] = status_information_value; status_information_at = status_information_at + 1
  :: else -> break
  od;
  status_information_record.short_selling_regulation_flag = status_information_value;
  skip
}

/* each byte of Status Information set to where it lies, so a field read out of place says so */
inline ramp_status_information(status_information_record, status_information_base) {
  status_information_at = 0;
  do
  :: status_information_at < 2 -> status_information_record.issue_status[status_information_at] = (status_information_base + 0 + status_information_at + 1) % 256; status_information_at = status_information_at + 1
  :: else -> break
  od;
  status_information_at = 0;
  do
  :: status_information_at < 2 -> status_information_record.status_flag[status_information_at] = (status_information_base + 2 + status_information_at + 1) % 256; status_information_at = status_information_at + 1
  :: else -> break
  od;
  status_information_record.short_selling_regulation_flag = (status_information_base + 4 + 1) % 256;
  skip
}

/* Status Information to the wire, 5 bytes from where the cursor stands */
inline encode_status_information(status_information_record) {
  status_information_at = 0;
  do
  :: status_information_at < 2 -> wire[at] = status_information_record.issue_status[status_information_at]; at = at + 1; status_information_at = status_information_at + 1
  :: else -> break
  od;
  status_information_at = 0;
  do
  :: status_information_at < 2 -> wire[at] = status_information_record.status_flag[status_information_at]; at = at + 1; status_information_at = status_information_at + 1
  :: else -> break
  od;
  wire[at] = status_information_record.short_selling_regulation_flag; at = at + 1;
  skip
}

/* Status Information off the wire, 5 bytes from where the cursor stands */
inline decode_status_information(status_information_record) {
  status_information_at = 0;
  do
  :: status_information_at < 2 -> status_information_record.issue_status[status_information_at] = wire[at]; at = at + 1; status_information_at = status_information_at + 1
  :: else -> break
  od;
  status_information_at = 0;
  do
  :: status_information_at < 2 -> status_information_record.status_flag[status_information_at] = wire[at]; at = at + 1; status_information_at = status_information_at + 1
  :: else -> break
  od;
  status_information_record.short_selling_regulation_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Status Information is what was written, byte for byte */
inline equal_status_information(status_information_read, status_information_written) {
  status_information_at = 0;
  do
  :: status_information_at < 2 -> assert(status_information_read.issue_status[status_information_at] == status_information_written.issue_status[status_information_at]); status_information_at = status_information_at + 1
  :: else -> break
  od;
  status_information_at = 0;
  do
  :: status_information_at < 2 -> assert(status_information_read.status_flag[status_information_at] == status_information_written.status_flag[status_information_at]); status_information_at = status_information_at + 1
  :: else -> break
  od;
  assert(status_information_read.short_selling_regulation_flag == status_information_written.short_selling_regulation_flag);
  skip
}

/* ---- Status Information Message: 24 bytes ------------------------------------ */

/* In this tag, status information (Issue Status, Status Flag and Short Selling Regulation Flag) is set. This tag appears as part of realtime data. */
typedef StatusInformationMessage {
  byte reserved_2[2];
  byte change_flag;
  StatusInformation status_information;
  byte time_c_12[12];
  byte reserved_4[4]
};

int status_information_message_at;

/* every byte of Status Information Message set to one value */
inline fill_status_information_message(status_information_message_record, status_information_message_value) {
  status_information_message_at = 0;
  do
  :: status_information_message_at < 2 -> status_information_message_record.reserved_2[status_information_message_at] = status_information_message_value; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  status_information_message_record.change_flag = status_information_message_value;
  fill_status_information(status_information_message_record.status_information, status_information_message_value);
  status_information_message_at = 0;
  do
  :: status_information_message_at < 12 -> status_information_message_record.time_c_12[status_information_message_at] = status_information_message_value; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  status_information_message_at = 0;
  do
  :: status_information_message_at < 4 -> status_information_message_record.reserved_4[status_information_message_at] = status_information_message_value; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Status Information Message set to where it lies, so a field read out of place says so */
inline ramp_status_information_message(status_information_message_record, status_information_message_base) {
  status_information_message_at = 0;
  do
  :: status_information_message_at < 2 -> status_information_message_record.reserved_2[status_information_message_at] = (status_information_message_base + 0 + status_information_message_at + 1) % 256; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  status_information_message_record.change_flag = (status_information_message_base + 2 + 1) % 256;
  ramp_status_information(status_information_message_record.status_information, status_information_message_base + 3);
  status_information_message_at = 0;
  do
  :: status_information_message_at < 12 -> status_information_message_record.time_c_12[status_information_message_at] = (status_information_message_base + 8 + status_information_message_at + 1) % 256; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  status_information_message_at = 0;
  do
  :: status_information_message_at < 4 -> status_information_message_record.reserved_4[status_information_message_at] = (status_information_message_base + 20 + status_information_message_at + 1) % 256; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Status Information Message to the wire, 24 bytes from where the cursor stands */
inline encode_status_information_message(status_information_message_record) {
  status_information_message_at = 0;
  do
  :: status_information_message_at < 2 -> wire[at] = status_information_message_record.reserved_2[status_information_message_at]; at = at + 1; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  wire[at] = status_information_message_record.change_flag; at = at + 1;
  encode_status_information(status_information_message_record.status_information);
  status_information_message_at = 0;
  do
  :: status_information_message_at < 12 -> wire[at] = status_information_message_record.time_c_12[status_information_message_at]; at = at + 1; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  status_information_message_at = 0;
  do
  :: status_information_message_at < 4 -> wire[at] = status_information_message_record.reserved_4[status_information_message_at]; at = at + 1; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Status Information Message off the wire, 24 bytes from where the cursor stands */
inline decode_status_information_message(status_information_message_record) {
  status_information_message_at = 0;
  do
  :: status_information_message_at < 2 -> status_information_message_record.reserved_2[status_information_message_at] = wire[at]; at = at + 1; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  status_information_message_record.change_flag = wire[at]; at = at + 1;
  decode_status_information(status_information_message_record.status_information);
  status_information_message_at = 0;
  do
  :: status_information_message_at < 12 -> status_information_message_record.time_c_12[status_information_message_at] = wire[at]; at = at + 1; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  status_information_message_at = 0;
  do
  :: status_information_message_at < 4 -> status_information_message_record.reserved_4[status_information_message_at] = wire[at]; at = at + 1; status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Status Information Message is what was written, byte for byte */
inline equal_status_information_message(status_information_message_read, status_information_message_written) {
  status_information_message_at = 0;
  do
  :: status_information_message_at < 2 -> assert(status_information_message_read.reserved_2[status_information_message_at] == status_information_message_written.reserved_2[status_information_message_at]); status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  assert(status_information_message_read.change_flag == status_information_message_written.change_flag);
  equal_status_information(status_information_message_read.status_information, status_information_message_written.status_information);
  status_information_message_at = 0;
  do
  :: status_information_message_at < 12 -> assert(status_information_message_read.time_c_12[status_information_message_at] == status_information_message_written.time_c_12[status_information_message_at]); status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  status_information_message_at = 0;
  do
  :: status_information_message_at < 4 -> assert(status_information_message_read.reserved_4[status_information_message_at] == status_information_message_written.reserved_4[status_information_message_at]); status_information_message_at = status_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price: 16 bytes --------------------------------------------------------- */

/* Price */
typedef Price {
  byte unit_flag;
  byte price_c_14[14];
  byte sign
};

int price_at;

/* every byte of Price set to one value */
inline fill_price(price_record, price_value) {
  price_record.unit_flag = price_value;
  price_at = 0;
  do
  :: price_at < 14 -> price_record.price_c_14[price_at] = price_value; price_at = price_at + 1
  :: else -> break
  od;
  price_record.sign = price_value;
  skip
}

/* each byte of Price set to where it lies, so a field read out of place says so */
inline ramp_price(price_record, price_base) {
  price_record.unit_flag = (price_base + 0 + 1) % 256;
  price_at = 0;
  do
  :: price_at < 14 -> price_record.price_c_14[price_at] = (price_base + 1 + price_at + 1) % 256; price_at = price_at + 1
  :: else -> break
  od;
  price_record.sign = (price_base + 15 + 1) % 256;
  skip
}

/* Price to the wire, 16 bytes from where the cursor stands */
inline encode_price(price_record) {
  wire[at] = price_record.unit_flag; at = at + 1;
  price_at = 0;
  do
  :: price_at < 14 -> wire[at] = price_record.price_c_14[price_at]; at = at + 1; price_at = price_at + 1
  :: else -> break
  od;
  wire[at] = price_record.sign; at = at + 1;
  skip
}

/* Price off the wire, 16 bytes from where the cursor stands */
inline decode_price(price_record) {
  price_record.unit_flag = wire[at]; at = at + 1;
  price_at = 0;
  do
  :: price_at < 14 -> price_record.price_c_14[price_at] = wire[at]; at = at + 1; price_at = price_at + 1
  :: else -> break
  od;
  price_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Price is what was written, byte for byte */
inline equal_price(price_read, price_written) {
  assert(price_read.unit_flag == price_written.unit_flag);
  price_at = 0;
  do
  :: price_at < 14 -> assert(price_read.price_c_14[price_at] == price_written.price_c_14[price_at]); price_at = price_at + 1
  :: else -> break
  od;
  assert(price_read.sign == price_written.sign);
  skip
}

/* ---- Open: 23 bytes ---------------------------------------------------------- */

/* Open */
typedef Open {
  Price price;
  byte time_c_6[6];
  byte change_flag
};

int open_at;

/* every byte of Open set to one value */
inline fill_open(open_record, open_value) {
  fill_price(open_record.price, open_value);
  open_at = 0;
  do
  :: open_at < 6 -> open_record.time_c_6[open_at] = open_value; open_at = open_at + 1
  :: else -> break
  od;
  open_record.change_flag = open_value;
  skip
}

/* each byte of Open set to where it lies, so a field read out of place says so */
inline ramp_open(open_record, open_base) {
  ramp_price(open_record.price, open_base + 0);
  open_at = 0;
  do
  :: open_at < 6 -> open_record.time_c_6[open_at] = (open_base + 16 + open_at + 1) % 256; open_at = open_at + 1
  :: else -> break
  od;
  open_record.change_flag = (open_base + 22 + 1) % 256;
  skip
}

/* Open to the wire, 23 bytes from where the cursor stands */
inline encode_open(open_record) {
  encode_price(open_record.price);
  open_at = 0;
  do
  :: open_at < 6 -> wire[at] = open_record.time_c_6[open_at]; at = at + 1; open_at = open_at + 1
  :: else -> break
  od;
  wire[at] = open_record.change_flag; at = at + 1;
  skip
}

/* Open off the wire, 23 bytes from where the cursor stands */
inline decode_open(open_record) {
  decode_price(open_record.price);
  open_at = 0;
  do
  :: open_at < 6 -> open_record.time_c_6[open_at] = wire[at]; at = at + 1; open_at = open_at + 1
  :: else -> break
  od;
  open_record.change_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Open is what was written, byte for byte */
inline equal_open(open_read, open_written) {
  equal_price(open_read.price, open_written.price);
  open_at = 0;
  do
  :: open_at < 6 -> assert(open_read.time_c_6[open_at] == open_written.time_c_6[open_at]); open_at = open_at + 1
  :: else -> break
  od;
  assert(open_read.change_flag == open_written.change_flag);
  skip
}

/* ---- High: 24 bytes ---------------------------------------------------------- */

/* High */
typedef High {
  byte limit_up_flag;
  Price price;
  byte time_c_6[6];
  byte change_flag
};

int high_at;

/* every byte of High set to one value */
inline fill_high(high_record, high_value) {
  high_record.limit_up_flag = high_value;
  fill_price(high_record.price, high_value);
  high_at = 0;
  do
  :: high_at < 6 -> high_record.time_c_6[high_at] = high_value; high_at = high_at + 1
  :: else -> break
  od;
  high_record.change_flag = high_value;
  skip
}

/* each byte of High set to where it lies, so a field read out of place says so */
inline ramp_high(high_record, high_base) {
  high_record.limit_up_flag = (high_base + 0 + 1) % 256;
  ramp_price(high_record.price, high_base + 1);
  high_at = 0;
  do
  :: high_at < 6 -> high_record.time_c_6[high_at] = (high_base + 17 + high_at + 1) % 256; high_at = high_at + 1
  :: else -> break
  od;
  high_record.change_flag = (high_base + 23 + 1) % 256;
  skip
}

/* High to the wire, 24 bytes from where the cursor stands */
inline encode_high(high_record) {
  wire[at] = high_record.limit_up_flag; at = at + 1;
  encode_price(high_record.price);
  high_at = 0;
  do
  :: high_at < 6 -> wire[at] = high_record.time_c_6[high_at]; at = at + 1; high_at = high_at + 1
  :: else -> break
  od;
  wire[at] = high_record.change_flag; at = at + 1;
  skip
}

/* High off the wire, 24 bytes from where the cursor stands */
inline decode_high(high_record) {
  high_record.limit_up_flag = wire[at]; at = at + 1;
  decode_price(high_record.price);
  high_at = 0;
  do
  :: high_at < 6 -> high_record.time_c_6[high_at] = wire[at]; at = at + 1; high_at = high_at + 1
  :: else -> break
  od;
  high_record.change_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of High is what was written, byte for byte */
inline equal_high(high_read, high_written) {
  assert(high_read.limit_up_flag == high_written.limit_up_flag);
  equal_price(high_read.price, high_written.price);
  high_at = 0;
  do
  :: high_at < 6 -> assert(high_read.time_c_6[high_at] == high_written.time_c_6[high_at]); high_at = high_at + 1
  :: else -> break
  od;
  assert(high_read.change_flag == high_written.change_flag);
  skip
}

/* ---- Low: 24 bytes ----------------------------------------------------------- */

/* Low */
typedef Low {
  byte limit_down_flag;
  Price price;
  byte time_c_6[6];
  byte change_flag
};

int low_at;

/* every byte of Low set to one value */
inline fill_low(low_record, low_value) {
  low_record.limit_down_flag = low_value;
  fill_price(low_record.price, low_value);
  low_at = 0;
  do
  :: low_at < 6 -> low_record.time_c_6[low_at] = low_value; low_at = low_at + 1
  :: else -> break
  od;
  low_record.change_flag = low_value;
  skip
}

/* each byte of Low set to where it lies, so a field read out of place says so */
inline ramp_low(low_record, low_base) {
  low_record.limit_down_flag = (low_base + 0 + 1) % 256;
  ramp_price(low_record.price, low_base + 1);
  low_at = 0;
  do
  :: low_at < 6 -> low_record.time_c_6[low_at] = (low_base + 17 + low_at + 1) % 256; low_at = low_at + 1
  :: else -> break
  od;
  low_record.change_flag = (low_base + 23 + 1) % 256;
  skip
}

/* Low to the wire, 24 bytes from where the cursor stands */
inline encode_low(low_record) {
  wire[at] = low_record.limit_down_flag; at = at + 1;
  encode_price(low_record.price);
  low_at = 0;
  do
  :: low_at < 6 -> wire[at] = low_record.time_c_6[low_at]; at = at + 1; low_at = low_at + 1
  :: else -> break
  od;
  wire[at] = low_record.change_flag; at = at + 1;
  skip
}

/* Low off the wire, 24 bytes from where the cursor stands */
inline decode_low(low_record) {
  low_record.limit_down_flag = wire[at]; at = at + 1;
  decode_price(low_record.price);
  low_at = 0;
  do
  :: low_at < 6 -> low_record.time_c_6[low_at] = wire[at]; at = at + 1; low_at = low_at + 1
  :: else -> break
  od;
  low_record.change_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Low is what was written, byte for byte */
inline equal_low(low_read, low_written) {
  assert(low_read.limit_down_flag == low_written.limit_down_flag);
  equal_price(low_read.price, low_written.price);
  low_at = 0;
  do
  :: low_at < 6 -> assert(low_read.time_c_6[low_at] == low_written.time_c_6[low_at]); low_at = low_at + 1
  :: else -> break
  od;
  assert(low_read.change_flag == low_written.change_flag);
  skip
}

/* ---- Current: 32 bytes ------------------------------------------------------- */

/* Current */
typedef Current {
  Price price;
  byte time_c_12[12];
  byte current_change_flag;
  byte stq_reference_point_flag;
  byte reserved_1;
  byte closing_price_input_flag
};

int current_at;

/* every byte of Current set to one value */
inline fill_current(current_record, current_value) {
  fill_price(current_record.price, current_value);
  current_at = 0;
  do
  :: current_at < 12 -> current_record.time_c_12[current_at] = current_value; current_at = current_at + 1
  :: else -> break
  od;
  current_record.current_change_flag = current_value;
  current_record.stq_reference_point_flag = current_value;
  current_record.reserved_1 = current_value;
  current_record.closing_price_input_flag = current_value;
  skip
}

/* each byte of Current set to where it lies, so a field read out of place says so */
inline ramp_current(current_record, current_base) {
  ramp_price(current_record.price, current_base + 0);
  current_at = 0;
  do
  :: current_at < 12 -> current_record.time_c_12[current_at] = (current_base + 16 + current_at + 1) % 256; current_at = current_at + 1
  :: else -> break
  od;
  current_record.current_change_flag = (current_base + 28 + 1) % 256;
  current_record.stq_reference_point_flag = (current_base + 29 + 1) % 256;
  current_record.reserved_1 = (current_base + 30 + 1) % 256;
  current_record.closing_price_input_flag = (current_base + 31 + 1) % 256;
  skip
}

/* Current to the wire, 32 bytes from where the cursor stands */
inline encode_current(current_record) {
  encode_price(current_record.price);
  current_at = 0;
  do
  :: current_at < 12 -> wire[at] = current_record.time_c_12[current_at]; at = at + 1; current_at = current_at + 1
  :: else -> break
  od;
  wire[at] = current_record.current_change_flag; at = at + 1;
  wire[at] = current_record.stq_reference_point_flag; at = at + 1;
  wire[at] = current_record.reserved_1; at = at + 1;
  wire[at] = current_record.closing_price_input_flag; at = at + 1;
  skip
}

/* Current off the wire, 32 bytes from where the cursor stands */
inline decode_current(current_record) {
  decode_price(current_record.price);
  current_at = 0;
  do
  :: current_at < 12 -> current_record.time_c_12[current_at] = wire[at]; at = at + 1; current_at = current_at + 1
  :: else -> break
  od;
  current_record.current_change_flag = wire[at]; at = at + 1;
  current_record.stq_reference_point_flag = wire[at]; at = at + 1;
  current_record.reserved_1 = wire[at]; at = at + 1;
  current_record.closing_price_input_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Current is what was written, byte for byte */
inline equal_current(current_read, current_written) {
  equal_price(current_read.price, current_written.price);
  current_at = 0;
  do
  :: current_at < 12 -> assert(current_read.time_c_12[current_at] == current_written.time_c_12[current_at]); current_at = current_at + 1
  :: else -> break
  od;
  assert(current_read.current_change_flag == current_written.current_change_flag);
  assert(current_read.stq_reference_point_flag == current_written.stq_reference_point_flag);
  assert(current_read.reserved_1 == current_written.reserved_1);
  assert(current_read.closing_price_input_flag == current_written.closing_price_input_flag);
  skip
}

/* ---- Open High Low And Current Price Message: 105 bytes ---------------------- */

/* In this tag, Open, High, Low and Current Price and other information are set. This tag appears as part of realtime data. */
typedef OpenHighLowAndCurrentPriceMessage {
  byte reserved_2[2];
  Open open;
  High high;
  Low low;
  Current current
};

int open_high_low_and_current_price_message_at;

/* every byte of Open High Low And Current Price Message set to one value */
inline fill_open_high_low_and_current_price_message(open_high_low_and_current_price_message_record, open_high_low_and_current_price_message_value) {
  open_high_low_and_current_price_message_at = 0;
  do
  :: open_high_low_and_current_price_message_at < 2 -> open_high_low_and_current_price_message_record.reserved_2[open_high_low_and_current_price_message_at] = open_high_low_and_current_price_message_value; open_high_low_and_current_price_message_at = open_high_low_and_current_price_message_at + 1
  :: else -> break
  od;
  fill_open(open_high_low_and_current_price_message_record.open, open_high_low_and_current_price_message_value);
  fill_high(open_high_low_and_current_price_message_record.high, open_high_low_and_current_price_message_value);
  fill_low(open_high_low_and_current_price_message_record.low, open_high_low_and_current_price_message_value);
  fill_current(open_high_low_and_current_price_message_record.current, open_high_low_and_current_price_message_value);
  skip
}

/* each byte of Open High Low And Current Price Message set to where it lies, so a field read out of place says so */
inline ramp_open_high_low_and_current_price_message(open_high_low_and_current_price_message_record, open_high_low_and_current_price_message_base) {
  open_high_low_and_current_price_message_at = 0;
  do
  :: open_high_low_and_current_price_message_at < 2 -> open_high_low_and_current_price_message_record.reserved_2[open_high_low_and_current_price_message_at] = (open_high_low_and_current_price_message_base + 0 + open_high_low_and_current_price_message_at + 1) % 256; open_high_low_and_current_price_message_at = open_high_low_and_current_price_message_at + 1
  :: else -> break
  od;
  ramp_open(open_high_low_and_current_price_message_record.open, open_high_low_and_current_price_message_base + 2);
  ramp_high(open_high_low_and_current_price_message_record.high, open_high_low_and_current_price_message_base + 25);
  ramp_low(open_high_low_and_current_price_message_record.low, open_high_low_and_current_price_message_base + 49);
  ramp_current(open_high_low_and_current_price_message_record.current, open_high_low_and_current_price_message_base + 73);
  skip
}

/* Open High Low And Current Price Message to the wire, 105 bytes from where the cursor stands */
inline encode_open_high_low_and_current_price_message(open_high_low_and_current_price_message_record) {
  open_high_low_and_current_price_message_at = 0;
  do
  :: open_high_low_and_current_price_message_at < 2 -> wire[at] = open_high_low_and_current_price_message_record.reserved_2[open_high_low_and_current_price_message_at]; at = at + 1; open_high_low_and_current_price_message_at = open_high_low_and_current_price_message_at + 1
  :: else -> break
  od;
  encode_open(open_high_low_and_current_price_message_record.open);
  encode_high(open_high_low_and_current_price_message_record.high);
  encode_low(open_high_low_and_current_price_message_record.low);
  encode_current(open_high_low_and_current_price_message_record.current);
  skip
}

/* Open High Low And Current Price Message off the wire, 105 bytes from where the cursor stands */
inline decode_open_high_low_and_current_price_message(open_high_low_and_current_price_message_record) {
  open_high_low_and_current_price_message_at = 0;
  do
  :: open_high_low_and_current_price_message_at < 2 -> open_high_low_and_current_price_message_record.reserved_2[open_high_low_and_current_price_message_at] = wire[at]; at = at + 1; open_high_low_and_current_price_message_at = open_high_low_and_current_price_message_at + 1
  :: else -> break
  od;
  decode_open(open_high_low_and_current_price_message_record.open);
  decode_high(open_high_low_and_current_price_message_record.high);
  decode_low(open_high_low_and_current_price_message_record.low);
  decode_current(open_high_low_and_current_price_message_record.current);
  skip
}

/* what was read of Open High Low And Current Price Message is what was written, byte for byte */
inline equal_open_high_low_and_current_price_message(open_high_low_and_current_price_message_read, open_high_low_and_current_price_message_written) {
  open_high_low_and_current_price_message_at = 0;
  do
  :: open_high_low_and_current_price_message_at < 2 -> assert(open_high_low_and_current_price_message_read.reserved_2[open_high_low_and_current_price_message_at] == open_high_low_and_current_price_message_written.reserved_2[open_high_low_and_current_price_message_at]); open_high_low_and_current_price_message_at = open_high_low_and_current_price_message_at + 1
  :: else -> break
  od;
  equal_open(open_high_low_and_current_price_message_read.open, open_high_low_and_current_price_message_written.open);
  equal_high(open_high_low_and_current_price_message_read.high, open_high_low_and_current_price_message_written.high);
  equal_low(open_high_low_and_current_price_message_read.low, open_high_low_and_current_price_message_written.low);
  equal_current(open_high_low_and_current_price_message_read.current, open_high_low_and_current_price_message_written.current);
  skip
}

/* ---- Quote Quantity: 16 bytes ------------------------------------------------ */

/* Quote Quantity */
typedef QuoteQuantity {
  byte trading_volume_turnover_unit_flag;
  byte quantity[14];
  byte sign
};

int quote_quantity_at;

/* every byte of Quote Quantity set to one value */
inline fill_quote_quantity(quote_quantity_record, quote_quantity_value) {
  quote_quantity_record.trading_volume_turnover_unit_flag = quote_quantity_value;
  quote_quantity_at = 0;
  do
  :: quote_quantity_at < 14 -> quote_quantity_record.quantity[quote_quantity_at] = quote_quantity_value; quote_quantity_at = quote_quantity_at + 1
  :: else -> break
  od;
  quote_quantity_record.sign = quote_quantity_value;
  skip
}

/* each byte of Quote Quantity set to where it lies, so a field read out of place says so */
inline ramp_quote_quantity(quote_quantity_record, quote_quantity_base) {
  quote_quantity_record.trading_volume_turnover_unit_flag = (quote_quantity_base + 0 + 1) % 256;
  quote_quantity_at = 0;
  do
  :: quote_quantity_at < 14 -> quote_quantity_record.quantity[quote_quantity_at] = (quote_quantity_base + 1 + quote_quantity_at + 1) % 256; quote_quantity_at = quote_quantity_at + 1
  :: else -> break
  od;
  quote_quantity_record.sign = (quote_quantity_base + 15 + 1) % 256;
  skip
}

/* Quote Quantity to the wire, 16 bytes from where the cursor stands */
inline encode_quote_quantity(quote_quantity_record) {
  wire[at] = quote_quantity_record.trading_volume_turnover_unit_flag; at = at + 1;
  quote_quantity_at = 0;
  do
  :: quote_quantity_at < 14 -> wire[at] = quote_quantity_record.quantity[quote_quantity_at]; at = at + 1; quote_quantity_at = quote_quantity_at + 1
  :: else -> break
  od;
  wire[at] = quote_quantity_record.sign; at = at + 1;
  skip
}

/* Quote Quantity off the wire, 16 bytes from where the cursor stands */
inline decode_quote_quantity(quote_quantity_record) {
  quote_quantity_record.trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  quote_quantity_at = 0;
  do
  :: quote_quantity_at < 14 -> quote_quantity_record.quantity[quote_quantity_at] = wire[at]; at = at + 1; quote_quantity_at = quote_quantity_at + 1
  :: else -> break
  od;
  quote_quantity_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Quantity is what was written, byte for byte */
inline equal_quote_quantity(quote_quantity_read, quote_quantity_written) {
  assert(quote_quantity_read.trading_volume_turnover_unit_flag == quote_quantity_written.trading_volume_turnover_unit_flag);
  quote_quantity_at = 0;
  do
  :: quote_quantity_at < 14 -> assert(quote_quantity_read.quantity[quote_quantity_at] == quote_quantity_written.quantity[quote_quantity_at]); quote_quantity_at = quote_quantity_at + 1
  :: else -> break
  od;
  assert(quote_quantity_read.sign == quote_quantity_written.sign);
  skip
}

/* ---- Ask Quote: 46 bytes ----------------------------------------------------- */

/* Ask Quote */
typedef AskQuote {
  byte change_flag;
  Price price;
  byte time_c_12[12];
  byte quote_flag;
  QuoteQuantity quote_quantity
};

int ask_quote_at;

/* every byte of Ask Quote set to one value */
inline fill_ask_quote(ask_quote_record, ask_quote_value) {
  ask_quote_record.change_flag = ask_quote_value;
  fill_price(ask_quote_record.price, ask_quote_value);
  ask_quote_at = 0;
  do
  :: ask_quote_at < 12 -> ask_quote_record.time_c_12[ask_quote_at] = ask_quote_value; ask_quote_at = ask_quote_at + 1
  :: else -> break
  od;
  ask_quote_record.quote_flag = ask_quote_value;
  fill_quote_quantity(ask_quote_record.quote_quantity, ask_quote_value);
  skip
}

/* each byte of Ask Quote set to where it lies, so a field read out of place says so */
inline ramp_ask_quote(ask_quote_record, ask_quote_base) {
  ask_quote_record.change_flag = (ask_quote_base + 0 + 1) % 256;
  ramp_price(ask_quote_record.price, ask_quote_base + 1);
  ask_quote_at = 0;
  do
  :: ask_quote_at < 12 -> ask_quote_record.time_c_12[ask_quote_at] = (ask_quote_base + 17 + ask_quote_at + 1) % 256; ask_quote_at = ask_quote_at + 1
  :: else -> break
  od;
  ask_quote_record.quote_flag = (ask_quote_base + 29 + 1) % 256;
  ramp_quote_quantity(ask_quote_record.quote_quantity, ask_quote_base + 30);
  skip
}

/* Ask Quote to the wire, 46 bytes from where the cursor stands */
inline encode_ask_quote(ask_quote_record) {
  wire[at] = ask_quote_record.change_flag; at = at + 1;
  encode_price(ask_quote_record.price);
  ask_quote_at = 0;
  do
  :: ask_quote_at < 12 -> wire[at] = ask_quote_record.time_c_12[ask_quote_at]; at = at + 1; ask_quote_at = ask_quote_at + 1
  :: else -> break
  od;
  wire[at] = ask_quote_record.quote_flag; at = at + 1;
  encode_quote_quantity(ask_quote_record.quote_quantity);
  skip
}

/* Ask Quote off the wire, 46 bytes from where the cursor stands */
inline decode_ask_quote(ask_quote_record) {
  ask_quote_record.change_flag = wire[at]; at = at + 1;
  decode_price(ask_quote_record.price);
  ask_quote_at = 0;
  do
  :: ask_quote_at < 12 -> ask_quote_record.time_c_12[ask_quote_at] = wire[at]; at = at + 1; ask_quote_at = ask_quote_at + 1
  :: else -> break
  od;
  ask_quote_record.quote_flag = wire[at]; at = at + 1;
  decode_quote_quantity(ask_quote_record.quote_quantity);
  skip
}

/* what was read of Ask Quote is what was written, byte for byte */
inline equal_ask_quote(ask_quote_read, ask_quote_written) {
  assert(ask_quote_read.change_flag == ask_quote_written.change_flag);
  equal_price(ask_quote_read.price, ask_quote_written.price);
  ask_quote_at = 0;
  do
  :: ask_quote_at < 12 -> assert(ask_quote_read.time_c_12[ask_quote_at] == ask_quote_written.time_c_12[ask_quote_at]); ask_quote_at = ask_quote_at + 1
  :: else -> break
  od;
  assert(ask_quote_read.quote_flag == ask_quote_written.quote_flag);
  equal_quote_quantity(ask_quote_read.quote_quantity, ask_quote_written.quote_quantity);
  skip
}

/* ---- Bid Quote: 46 bytes ----------------------------------------------------- */

/* Bid Quote */
typedef BidQuote {
  byte change_flag;
  Price price;
  byte time_c_12[12];
  byte quote_flag;
  QuoteQuantity quote_quantity
};

int bid_quote_at;

/* every byte of Bid Quote set to one value */
inline fill_bid_quote(bid_quote_record, bid_quote_value) {
  bid_quote_record.change_flag = bid_quote_value;
  fill_price(bid_quote_record.price, bid_quote_value);
  bid_quote_at = 0;
  do
  :: bid_quote_at < 12 -> bid_quote_record.time_c_12[bid_quote_at] = bid_quote_value; bid_quote_at = bid_quote_at + 1
  :: else -> break
  od;
  bid_quote_record.quote_flag = bid_quote_value;
  fill_quote_quantity(bid_quote_record.quote_quantity, bid_quote_value);
  skip
}

/* each byte of Bid Quote set to where it lies, so a field read out of place says so */
inline ramp_bid_quote(bid_quote_record, bid_quote_base) {
  bid_quote_record.change_flag = (bid_quote_base + 0 + 1) % 256;
  ramp_price(bid_quote_record.price, bid_quote_base + 1);
  bid_quote_at = 0;
  do
  :: bid_quote_at < 12 -> bid_quote_record.time_c_12[bid_quote_at] = (bid_quote_base + 17 + bid_quote_at + 1) % 256; bid_quote_at = bid_quote_at + 1
  :: else -> break
  od;
  bid_quote_record.quote_flag = (bid_quote_base + 29 + 1) % 256;
  ramp_quote_quantity(bid_quote_record.quote_quantity, bid_quote_base + 30);
  skip
}

/* Bid Quote to the wire, 46 bytes from where the cursor stands */
inline encode_bid_quote(bid_quote_record) {
  wire[at] = bid_quote_record.change_flag; at = at + 1;
  encode_price(bid_quote_record.price);
  bid_quote_at = 0;
  do
  :: bid_quote_at < 12 -> wire[at] = bid_quote_record.time_c_12[bid_quote_at]; at = at + 1; bid_quote_at = bid_quote_at + 1
  :: else -> break
  od;
  wire[at] = bid_quote_record.quote_flag; at = at + 1;
  encode_quote_quantity(bid_quote_record.quote_quantity);
  skip
}

/* Bid Quote off the wire, 46 bytes from where the cursor stands */
inline decode_bid_quote(bid_quote_record) {
  bid_quote_record.change_flag = wire[at]; at = at + 1;
  decode_price(bid_quote_record.price);
  bid_quote_at = 0;
  do
  :: bid_quote_at < 12 -> bid_quote_record.time_c_12[bid_quote_at] = wire[at]; at = at + 1; bid_quote_at = bid_quote_at + 1
  :: else -> break
  od;
  bid_quote_record.quote_flag = wire[at]; at = at + 1;
  decode_quote_quantity(bid_quote_record.quote_quantity);
  skip
}

/* what was read of Bid Quote is what was written, byte for byte */
inline equal_bid_quote(bid_quote_read, bid_quote_written) {
  assert(bid_quote_read.change_flag == bid_quote_written.change_flag);
  equal_price(bid_quote_read.price, bid_quote_written.price);
  bid_quote_at = 0;
  do
  :: bid_quote_at < 12 -> assert(bid_quote_read.time_c_12[bid_quote_at] == bid_quote_written.time_c_12[bid_quote_at]); bid_quote_at = bid_quote_at + 1
  :: else -> break
  od;
  assert(bid_quote_read.quote_flag == bid_quote_written.quote_flag);
  equal_quote_quantity(bid_quote_read.quote_quantity, bid_quote_written.quote_quantity);
  skip
}

/* ---- Quote 1 Message: 94 bytes ----------------------------------------------- */

/* In this tag, Quote 1 (Ask and Bid Quotes with the Highest Priority) information is set. This tag appears as part of realtime data. */
typedef Quote1Message {
  byte reserved_2[2];
  AskQuote ask_quote;
  BidQuote bid_quote
};

int quote1_message_at;

/* every byte of Quote 1 Message set to one value */
inline fill_quote1_message(quote1_message_record, quote1_message_value) {
  quote1_message_at = 0;
  do
  :: quote1_message_at < 2 -> quote1_message_record.reserved_2[quote1_message_at] = quote1_message_value; quote1_message_at = quote1_message_at + 1
  :: else -> break
  od;
  fill_ask_quote(quote1_message_record.ask_quote, quote1_message_value);
  fill_bid_quote(quote1_message_record.bid_quote, quote1_message_value);
  skip
}

/* each byte of Quote 1 Message set to where it lies, so a field read out of place says so */
inline ramp_quote1_message(quote1_message_record, quote1_message_base) {
  quote1_message_at = 0;
  do
  :: quote1_message_at < 2 -> quote1_message_record.reserved_2[quote1_message_at] = (quote1_message_base + 0 + quote1_message_at + 1) % 256; quote1_message_at = quote1_message_at + 1
  :: else -> break
  od;
  ramp_ask_quote(quote1_message_record.ask_quote, quote1_message_base + 2);
  ramp_bid_quote(quote1_message_record.bid_quote, quote1_message_base + 48);
  skip
}

/* Quote 1 Message to the wire, 94 bytes from where the cursor stands */
inline encode_quote1_message(quote1_message_record) {
  quote1_message_at = 0;
  do
  :: quote1_message_at < 2 -> wire[at] = quote1_message_record.reserved_2[quote1_message_at]; at = at + 1; quote1_message_at = quote1_message_at + 1
  :: else -> break
  od;
  encode_ask_quote(quote1_message_record.ask_quote);
  encode_bid_quote(quote1_message_record.bid_quote);
  skip
}

/* Quote 1 Message off the wire, 94 bytes from where the cursor stands */
inline decode_quote1_message(quote1_message_record) {
  quote1_message_at = 0;
  do
  :: quote1_message_at < 2 -> quote1_message_record.reserved_2[quote1_message_at] = wire[at]; at = at + 1; quote1_message_at = quote1_message_at + 1
  :: else -> break
  od;
  decode_ask_quote(quote1_message_record.ask_quote);
  decode_bid_quote(quote1_message_record.bid_quote);
  skip
}

/* what was read of Quote 1 Message is what was written, byte for byte */
inline equal_quote1_message(quote1_message_read, quote1_message_written) {
  quote1_message_at = 0;
  do
  :: quote1_message_at < 2 -> assert(quote1_message_read.reserved_2[quote1_message_at] == quote1_message_written.reserved_2[quote1_message_at]); quote1_message_at = quote1_message_at + 1
  :: else -> break
  od;
  equal_ask_quote(quote1_message_read.ask_quote, quote1_message_written.ask_quote);
  equal_bid_quote(quote1_message_read.bid_quote, quote1_message_written.bid_quote);
  skip
}

/* ---- Quote 2 Message: 94 bytes ----------------------------------------------- */

/* In this tag, Quote 2 (ask and bid quotes with the 2nd Highest Priority) information is set. This tag appears as part of realtime data. */
typedef Quote2Message {
  byte reserved_2[2];
  AskQuote ask_quote;
  BidQuote bid_quote
};

int quote2_message_at;

/* every byte of Quote 2 Message set to one value */
inline fill_quote2_message(quote2_message_record, quote2_message_value) {
  quote2_message_at = 0;
  do
  :: quote2_message_at < 2 -> quote2_message_record.reserved_2[quote2_message_at] = quote2_message_value; quote2_message_at = quote2_message_at + 1
  :: else -> break
  od;
  fill_ask_quote(quote2_message_record.ask_quote, quote2_message_value);
  fill_bid_quote(quote2_message_record.bid_quote, quote2_message_value);
  skip
}

/* each byte of Quote 2 Message set to where it lies, so a field read out of place says so */
inline ramp_quote2_message(quote2_message_record, quote2_message_base) {
  quote2_message_at = 0;
  do
  :: quote2_message_at < 2 -> quote2_message_record.reserved_2[quote2_message_at] = (quote2_message_base + 0 + quote2_message_at + 1) % 256; quote2_message_at = quote2_message_at + 1
  :: else -> break
  od;
  ramp_ask_quote(quote2_message_record.ask_quote, quote2_message_base + 2);
  ramp_bid_quote(quote2_message_record.bid_quote, quote2_message_base + 48);
  skip
}

/* Quote 2 Message to the wire, 94 bytes from where the cursor stands */
inline encode_quote2_message(quote2_message_record) {
  quote2_message_at = 0;
  do
  :: quote2_message_at < 2 -> wire[at] = quote2_message_record.reserved_2[quote2_message_at]; at = at + 1; quote2_message_at = quote2_message_at + 1
  :: else -> break
  od;
  encode_ask_quote(quote2_message_record.ask_quote);
  encode_bid_quote(quote2_message_record.bid_quote);
  skip
}

/* Quote 2 Message off the wire, 94 bytes from where the cursor stands */
inline decode_quote2_message(quote2_message_record) {
  quote2_message_at = 0;
  do
  :: quote2_message_at < 2 -> quote2_message_record.reserved_2[quote2_message_at] = wire[at]; at = at + 1; quote2_message_at = quote2_message_at + 1
  :: else -> break
  od;
  decode_ask_quote(quote2_message_record.ask_quote);
  decode_bid_quote(quote2_message_record.bid_quote);
  skip
}

/* what was read of Quote 2 Message is what was written, byte for byte */
inline equal_quote2_message(quote2_message_read, quote2_message_written) {
  quote2_message_at = 0;
  do
  :: quote2_message_at < 2 -> assert(quote2_message_read.reserved_2[quote2_message_at] == quote2_message_written.reserved_2[quote2_message_at]); quote2_message_at = quote2_message_at + 1
  :: else -> break
  od;
  equal_ask_quote(quote2_message_read.ask_quote, quote2_message_written.ask_quote);
  equal_bid_quote(quote2_message_read.bid_quote, quote2_message_written.bid_quote);
  skip
}

/* ---- Quote 3 Message: 94 bytes ----------------------------------------------- */

/* In this tag, Quote 3 (ask and bid quotes with the 3rd Highest Priority) information is set. This tag appears as part of realtime data. */
typedef Quote3Message {
  byte reserved_2[2];
  AskQuote ask_quote;
  BidQuote bid_quote
};

int quote3_message_at;

/* every byte of Quote 3 Message set to one value */
inline fill_quote3_message(quote3_message_record, quote3_message_value) {
  quote3_message_at = 0;
  do
  :: quote3_message_at < 2 -> quote3_message_record.reserved_2[quote3_message_at] = quote3_message_value; quote3_message_at = quote3_message_at + 1
  :: else -> break
  od;
  fill_ask_quote(quote3_message_record.ask_quote, quote3_message_value);
  fill_bid_quote(quote3_message_record.bid_quote, quote3_message_value);
  skip
}

/* each byte of Quote 3 Message set to where it lies, so a field read out of place says so */
inline ramp_quote3_message(quote3_message_record, quote3_message_base) {
  quote3_message_at = 0;
  do
  :: quote3_message_at < 2 -> quote3_message_record.reserved_2[quote3_message_at] = (quote3_message_base + 0 + quote3_message_at + 1) % 256; quote3_message_at = quote3_message_at + 1
  :: else -> break
  od;
  ramp_ask_quote(quote3_message_record.ask_quote, quote3_message_base + 2);
  ramp_bid_quote(quote3_message_record.bid_quote, quote3_message_base + 48);
  skip
}

/* Quote 3 Message to the wire, 94 bytes from where the cursor stands */
inline encode_quote3_message(quote3_message_record) {
  quote3_message_at = 0;
  do
  :: quote3_message_at < 2 -> wire[at] = quote3_message_record.reserved_2[quote3_message_at]; at = at + 1; quote3_message_at = quote3_message_at + 1
  :: else -> break
  od;
  encode_ask_quote(quote3_message_record.ask_quote);
  encode_bid_quote(quote3_message_record.bid_quote);
  skip
}

/* Quote 3 Message off the wire, 94 bytes from where the cursor stands */
inline decode_quote3_message(quote3_message_record) {
  quote3_message_at = 0;
  do
  :: quote3_message_at < 2 -> quote3_message_record.reserved_2[quote3_message_at] = wire[at]; at = at + 1; quote3_message_at = quote3_message_at + 1
  :: else -> break
  od;
  decode_ask_quote(quote3_message_record.ask_quote);
  decode_bid_quote(quote3_message_record.bid_quote);
  skip
}

/* what was read of Quote 3 Message is what was written, byte for byte */
inline equal_quote3_message(quote3_message_read, quote3_message_written) {
  quote3_message_at = 0;
  do
  :: quote3_message_at < 2 -> assert(quote3_message_read.reserved_2[quote3_message_at] == quote3_message_written.reserved_2[quote3_message_at]); quote3_message_at = quote3_message_at + 1
  :: else -> break
  od;
  equal_ask_quote(quote3_message_read.ask_quote, quote3_message_written.ask_quote);
  equal_bid_quote(quote3_message_read.bid_quote, quote3_message_written.bid_quote);
  skip
}

/* ---- Quote 4 Message: 94 bytes ----------------------------------------------- */

/* In this tag, Quote 4 (ask and bid quotes with the 4th Highest Priority) information is set. This tag appears as part of realtime data. */
typedef Quote4Message {
  byte reserved_2[2];
  AskQuote ask_quote;
  BidQuote bid_quote
};

int quote4_message_at;

/* every byte of Quote 4 Message set to one value */
inline fill_quote4_message(quote4_message_record, quote4_message_value) {
  quote4_message_at = 0;
  do
  :: quote4_message_at < 2 -> quote4_message_record.reserved_2[quote4_message_at] = quote4_message_value; quote4_message_at = quote4_message_at + 1
  :: else -> break
  od;
  fill_ask_quote(quote4_message_record.ask_quote, quote4_message_value);
  fill_bid_quote(quote4_message_record.bid_quote, quote4_message_value);
  skip
}

/* each byte of Quote 4 Message set to where it lies, so a field read out of place says so */
inline ramp_quote4_message(quote4_message_record, quote4_message_base) {
  quote4_message_at = 0;
  do
  :: quote4_message_at < 2 -> quote4_message_record.reserved_2[quote4_message_at] = (quote4_message_base + 0 + quote4_message_at + 1) % 256; quote4_message_at = quote4_message_at + 1
  :: else -> break
  od;
  ramp_ask_quote(quote4_message_record.ask_quote, quote4_message_base + 2);
  ramp_bid_quote(quote4_message_record.bid_quote, quote4_message_base + 48);
  skip
}

/* Quote 4 Message to the wire, 94 bytes from where the cursor stands */
inline encode_quote4_message(quote4_message_record) {
  quote4_message_at = 0;
  do
  :: quote4_message_at < 2 -> wire[at] = quote4_message_record.reserved_2[quote4_message_at]; at = at + 1; quote4_message_at = quote4_message_at + 1
  :: else -> break
  od;
  encode_ask_quote(quote4_message_record.ask_quote);
  encode_bid_quote(quote4_message_record.bid_quote);
  skip
}

/* Quote 4 Message off the wire, 94 bytes from where the cursor stands */
inline decode_quote4_message(quote4_message_record) {
  quote4_message_at = 0;
  do
  :: quote4_message_at < 2 -> quote4_message_record.reserved_2[quote4_message_at] = wire[at]; at = at + 1; quote4_message_at = quote4_message_at + 1
  :: else -> break
  od;
  decode_ask_quote(quote4_message_record.ask_quote);
  decode_bid_quote(quote4_message_record.bid_quote);
  skip
}

/* what was read of Quote 4 Message is what was written, byte for byte */
inline equal_quote4_message(quote4_message_read, quote4_message_written) {
  quote4_message_at = 0;
  do
  :: quote4_message_at < 2 -> assert(quote4_message_read.reserved_2[quote4_message_at] == quote4_message_written.reserved_2[quote4_message_at]); quote4_message_at = quote4_message_at + 1
  :: else -> break
  od;
  equal_ask_quote(quote4_message_read.ask_quote, quote4_message_written.ask_quote);
  equal_bid_quote(quote4_message_read.bid_quote, quote4_message_written.bid_quote);
  skip
}

/* ---- Quote 5 Message: 94 bytes ----------------------------------------------- */

/* In this tag, Quote 5 (ask and bid quotes with the 5th Highest Priority) information is set. This tag appears as part of realtime data. */
typedef Quote5Message {
  byte reserved_2[2];
  AskQuote ask_quote;
  BidQuote bid_quote
};

int quote5_message_at;

/* every byte of Quote 5 Message set to one value */
inline fill_quote5_message(quote5_message_record, quote5_message_value) {
  quote5_message_at = 0;
  do
  :: quote5_message_at < 2 -> quote5_message_record.reserved_2[quote5_message_at] = quote5_message_value; quote5_message_at = quote5_message_at + 1
  :: else -> break
  od;
  fill_ask_quote(quote5_message_record.ask_quote, quote5_message_value);
  fill_bid_quote(quote5_message_record.bid_quote, quote5_message_value);
  skip
}

/* each byte of Quote 5 Message set to where it lies, so a field read out of place says so */
inline ramp_quote5_message(quote5_message_record, quote5_message_base) {
  quote5_message_at = 0;
  do
  :: quote5_message_at < 2 -> quote5_message_record.reserved_2[quote5_message_at] = (quote5_message_base + 0 + quote5_message_at + 1) % 256; quote5_message_at = quote5_message_at + 1
  :: else -> break
  od;
  ramp_ask_quote(quote5_message_record.ask_quote, quote5_message_base + 2);
  ramp_bid_quote(quote5_message_record.bid_quote, quote5_message_base + 48);
  skip
}

/* Quote 5 Message to the wire, 94 bytes from where the cursor stands */
inline encode_quote5_message(quote5_message_record) {
  quote5_message_at = 0;
  do
  :: quote5_message_at < 2 -> wire[at] = quote5_message_record.reserved_2[quote5_message_at]; at = at + 1; quote5_message_at = quote5_message_at + 1
  :: else -> break
  od;
  encode_ask_quote(quote5_message_record.ask_quote);
  encode_bid_quote(quote5_message_record.bid_quote);
  skip
}

/* Quote 5 Message off the wire, 94 bytes from where the cursor stands */
inline decode_quote5_message(quote5_message_record) {
  quote5_message_at = 0;
  do
  :: quote5_message_at < 2 -> quote5_message_record.reserved_2[quote5_message_at] = wire[at]; at = at + 1; quote5_message_at = quote5_message_at + 1
  :: else -> break
  od;
  decode_ask_quote(quote5_message_record.ask_quote);
  decode_bid_quote(quote5_message_record.bid_quote);
  skip
}

/* what was read of Quote 5 Message is what was written, byte for byte */
inline equal_quote5_message(quote5_message_read, quote5_message_written) {
  quote5_message_at = 0;
  do
  :: quote5_message_at < 2 -> assert(quote5_message_read.reserved_2[quote5_message_at] == quote5_message_written.reserved_2[quote5_message_at]); quote5_message_at = quote5_message_at + 1
  :: else -> break
  od;
  equal_ask_quote(quote5_message_read.ask_quote, quote5_message_written.ask_quote);
  equal_bid_quote(quote5_message_read.bid_quote, quote5_message_written.bid_quote);
  skip
}

/* ---- Quote 6 Message: 94 bytes ----------------------------------------------- */

/* In this tag, Quote 6 (ask and bid quotes with the 6th Highest Priority) information is set. This tag appears as part of realtime data. */
typedef Quote6Message {
  byte reserved_2[2];
  AskQuote ask_quote;
  BidQuote bid_quote
};

int quote6_message_at;

/* every byte of Quote 6 Message set to one value */
inline fill_quote6_message(quote6_message_record, quote6_message_value) {
  quote6_message_at = 0;
  do
  :: quote6_message_at < 2 -> quote6_message_record.reserved_2[quote6_message_at] = quote6_message_value; quote6_message_at = quote6_message_at + 1
  :: else -> break
  od;
  fill_ask_quote(quote6_message_record.ask_quote, quote6_message_value);
  fill_bid_quote(quote6_message_record.bid_quote, quote6_message_value);
  skip
}

/* each byte of Quote 6 Message set to where it lies, so a field read out of place says so */
inline ramp_quote6_message(quote6_message_record, quote6_message_base) {
  quote6_message_at = 0;
  do
  :: quote6_message_at < 2 -> quote6_message_record.reserved_2[quote6_message_at] = (quote6_message_base + 0 + quote6_message_at + 1) % 256; quote6_message_at = quote6_message_at + 1
  :: else -> break
  od;
  ramp_ask_quote(quote6_message_record.ask_quote, quote6_message_base + 2);
  ramp_bid_quote(quote6_message_record.bid_quote, quote6_message_base + 48);
  skip
}

/* Quote 6 Message to the wire, 94 bytes from where the cursor stands */
inline encode_quote6_message(quote6_message_record) {
  quote6_message_at = 0;
  do
  :: quote6_message_at < 2 -> wire[at] = quote6_message_record.reserved_2[quote6_message_at]; at = at + 1; quote6_message_at = quote6_message_at + 1
  :: else -> break
  od;
  encode_ask_quote(quote6_message_record.ask_quote);
  encode_bid_quote(quote6_message_record.bid_quote);
  skip
}

/* Quote 6 Message off the wire, 94 bytes from where the cursor stands */
inline decode_quote6_message(quote6_message_record) {
  quote6_message_at = 0;
  do
  :: quote6_message_at < 2 -> quote6_message_record.reserved_2[quote6_message_at] = wire[at]; at = at + 1; quote6_message_at = quote6_message_at + 1
  :: else -> break
  od;
  decode_ask_quote(quote6_message_record.ask_quote);
  decode_bid_quote(quote6_message_record.bid_quote);
  skip
}

/* what was read of Quote 6 Message is what was written, byte for byte */
inline equal_quote6_message(quote6_message_read, quote6_message_written) {
  quote6_message_at = 0;
  do
  :: quote6_message_at < 2 -> assert(quote6_message_read.reserved_2[quote6_message_at] == quote6_message_written.reserved_2[quote6_message_at]); quote6_message_at = quote6_message_at + 1
  :: else -> break
  od;
  equal_ask_quote(quote6_message_read.ask_quote, quote6_message_written.ask_quote);
  equal_bid_quote(quote6_message_read.bid_quote, quote6_message_written.bid_quote);
  skip
}

/* ---- Quote 7 Message: 94 bytes ----------------------------------------------- */

/* In this tag, Quote 7 (ask and bid quotes with the 7th Highest Priority) information is set. This tag appears as part of realtime data. */
typedef Quote7Message {
  byte reserved_2[2];
  AskQuote ask_quote;
  BidQuote bid_quote
};

int quote7_message_at;

/* every byte of Quote 7 Message set to one value */
inline fill_quote7_message(quote7_message_record, quote7_message_value) {
  quote7_message_at = 0;
  do
  :: quote7_message_at < 2 -> quote7_message_record.reserved_2[quote7_message_at] = quote7_message_value; quote7_message_at = quote7_message_at + 1
  :: else -> break
  od;
  fill_ask_quote(quote7_message_record.ask_quote, quote7_message_value);
  fill_bid_quote(quote7_message_record.bid_quote, quote7_message_value);
  skip
}

/* each byte of Quote 7 Message set to where it lies, so a field read out of place says so */
inline ramp_quote7_message(quote7_message_record, quote7_message_base) {
  quote7_message_at = 0;
  do
  :: quote7_message_at < 2 -> quote7_message_record.reserved_2[quote7_message_at] = (quote7_message_base + 0 + quote7_message_at + 1) % 256; quote7_message_at = quote7_message_at + 1
  :: else -> break
  od;
  ramp_ask_quote(quote7_message_record.ask_quote, quote7_message_base + 2);
  ramp_bid_quote(quote7_message_record.bid_quote, quote7_message_base + 48);
  skip
}

/* Quote 7 Message to the wire, 94 bytes from where the cursor stands */
inline encode_quote7_message(quote7_message_record) {
  quote7_message_at = 0;
  do
  :: quote7_message_at < 2 -> wire[at] = quote7_message_record.reserved_2[quote7_message_at]; at = at + 1; quote7_message_at = quote7_message_at + 1
  :: else -> break
  od;
  encode_ask_quote(quote7_message_record.ask_quote);
  encode_bid_quote(quote7_message_record.bid_quote);
  skip
}

/* Quote 7 Message off the wire, 94 bytes from where the cursor stands */
inline decode_quote7_message(quote7_message_record) {
  quote7_message_at = 0;
  do
  :: quote7_message_at < 2 -> quote7_message_record.reserved_2[quote7_message_at] = wire[at]; at = at + 1; quote7_message_at = quote7_message_at + 1
  :: else -> break
  od;
  decode_ask_quote(quote7_message_record.ask_quote);
  decode_bid_quote(quote7_message_record.bid_quote);
  skip
}

/* what was read of Quote 7 Message is what was written, byte for byte */
inline equal_quote7_message(quote7_message_read, quote7_message_written) {
  quote7_message_at = 0;
  do
  :: quote7_message_at < 2 -> assert(quote7_message_read.reserved_2[quote7_message_at] == quote7_message_written.reserved_2[quote7_message_at]); quote7_message_at = quote7_message_at + 1
  :: else -> break
  od;
  equal_ask_quote(quote7_message_read.ask_quote, quote7_message_written.ask_quote);
  equal_bid_quote(quote7_message_read.bid_quote, quote7_message_written.bid_quote);
  skip
}

/* ---- Quote 8 Message: 94 bytes ----------------------------------------------- */

/* In this tag, Quote 8 (ask and bid quotes with the 8th Highest Priority) information is set. This tag appears as part of realtime data. */
typedef Quote8Message {
  byte reserved_2[2];
  AskQuote ask_quote;
  BidQuote bid_quote
};

int quote8_message_at;

/* every byte of Quote 8 Message set to one value */
inline fill_quote8_message(quote8_message_record, quote8_message_value) {
  quote8_message_at = 0;
  do
  :: quote8_message_at < 2 -> quote8_message_record.reserved_2[quote8_message_at] = quote8_message_value; quote8_message_at = quote8_message_at + 1
  :: else -> break
  od;
  fill_ask_quote(quote8_message_record.ask_quote, quote8_message_value);
  fill_bid_quote(quote8_message_record.bid_quote, quote8_message_value);
  skip
}

/* each byte of Quote 8 Message set to where it lies, so a field read out of place says so */
inline ramp_quote8_message(quote8_message_record, quote8_message_base) {
  quote8_message_at = 0;
  do
  :: quote8_message_at < 2 -> quote8_message_record.reserved_2[quote8_message_at] = (quote8_message_base + 0 + quote8_message_at + 1) % 256; quote8_message_at = quote8_message_at + 1
  :: else -> break
  od;
  ramp_ask_quote(quote8_message_record.ask_quote, quote8_message_base + 2);
  ramp_bid_quote(quote8_message_record.bid_quote, quote8_message_base + 48);
  skip
}

/* Quote 8 Message to the wire, 94 bytes from where the cursor stands */
inline encode_quote8_message(quote8_message_record) {
  quote8_message_at = 0;
  do
  :: quote8_message_at < 2 -> wire[at] = quote8_message_record.reserved_2[quote8_message_at]; at = at + 1; quote8_message_at = quote8_message_at + 1
  :: else -> break
  od;
  encode_ask_quote(quote8_message_record.ask_quote);
  encode_bid_quote(quote8_message_record.bid_quote);
  skip
}

/* Quote 8 Message off the wire, 94 bytes from where the cursor stands */
inline decode_quote8_message(quote8_message_record) {
  quote8_message_at = 0;
  do
  :: quote8_message_at < 2 -> quote8_message_record.reserved_2[quote8_message_at] = wire[at]; at = at + 1; quote8_message_at = quote8_message_at + 1
  :: else -> break
  od;
  decode_ask_quote(quote8_message_record.ask_quote);
  decode_bid_quote(quote8_message_record.bid_quote);
  skip
}

/* what was read of Quote 8 Message is what was written, byte for byte */
inline equal_quote8_message(quote8_message_read, quote8_message_written) {
  quote8_message_at = 0;
  do
  :: quote8_message_at < 2 -> assert(quote8_message_read.reserved_2[quote8_message_at] == quote8_message_written.reserved_2[quote8_message_at]); quote8_message_at = quote8_message_at + 1
  :: else -> break
  od;
  equal_ask_quote(quote8_message_read.ask_quote, quote8_message_written.ask_quote);
  equal_bid_quote(quote8_message_read.bid_quote, quote8_message_written.bid_quote);
  skip
}

/* ---- Quote 9 Message: 94 bytes ----------------------------------------------- */

/* In this tag, Quote 9 (ask and bid quotes with the 9th Highest Priority) information is set. This tag appears as part of realtime data. */
typedef Quote9Message {
  byte reserved_2[2];
  AskQuote ask_quote;
  BidQuote bid_quote
};

int quote9_message_at;

/* every byte of Quote 9 Message set to one value */
inline fill_quote9_message(quote9_message_record, quote9_message_value) {
  quote9_message_at = 0;
  do
  :: quote9_message_at < 2 -> quote9_message_record.reserved_2[quote9_message_at] = quote9_message_value; quote9_message_at = quote9_message_at + 1
  :: else -> break
  od;
  fill_ask_quote(quote9_message_record.ask_quote, quote9_message_value);
  fill_bid_quote(quote9_message_record.bid_quote, quote9_message_value);
  skip
}

/* each byte of Quote 9 Message set to where it lies, so a field read out of place says so */
inline ramp_quote9_message(quote9_message_record, quote9_message_base) {
  quote9_message_at = 0;
  do
  :: quote9_message_at < 2 -> quote9_message_record.reserved_2[quote9_message_at] = (quote9_message_base + 0 + quote9_message_at + 1) % 256; quote9_message_at = quote9_message_at + 1
  :: else -> break
  od;
  ramp_ask_quote(quote9_message_record.ask_quote, quote9_message_base + 2);
  ramp_bid_quote(quote9_message_record.bid_quote, quote9_message_base + 48);
  skip
}

/* Quote 9 Message to the wire, 94 bytes from where the cursor stands */
inline encode_quote9_message(quote9_message_record) {
  quote9_message_at = 0;
  do
  :: quote9_message_at < 2 -> wire[at] = quote9_message_record.reserved_2[quote9_message_at]; at = at + 1; quote9_message_at = quote9_message_at + 1
  :: else -> break
  od;
  encode_ask_quote(quote9_message_record.ask_quote);
  encode_bid_quote(quote9_message_record.bid_quote);
  skip
}

/* Quote 9 Message off the wire, 94 bytes from where the cursor stands */
inline decode_quote9_message(quote9_message_record) {
  quote9_message_at = 0;
  do
  :: quote9_message_at < 2 -> quote9_message_record.reserved_2[quote9_message_at] = wire[at]; at = at + 1; quote9_message_at = quote9_message_at + 1
  :: else -> break
  od;
  decode_ask_quote(quote9_message_record.ask_quote);
  decode_bid_quote(quote9_message_record.bid_quote);
  skip
}

/* what was read of Quote 9 Message is what was written, byte for byte */
inline equal_quote9_message(quote9_message_read, quote9_message_written) {
  quote9_message_at = 0;
  do
  :: quote9_message_at < 2 -> assert(quote9_message_read.reserved_2[quote9_message_at] == quote9_message_written.reserved_2[quote9_message_at]); quote9_message_at = quote9_message_at + 1
  :: else -> break
  od;
  equal_ask_quote(quote9_message_read.ask_quote, quote9_message_written.ask_quote);
  equal_bid_quote(quote9_message_read.bid_quote, quote9_message_written.bid_quote);
  skip
}

/* ---- Quote 10 Message: 94 bytes ---------------------------------------------- */

/* In this tag, Quote 10 (ask and bid quotes with the 10th Highest Priority) information is set. This tag appears as part of realtime data. */
typedef Quote10Message {
  byte reserved_2[2];
  AskQuote ask_quote;
  BidQuote bid_quote
};

int quote10_message_at;

/* every byte of Quote 10 Message set to one value */
inline fill_quote10_message(quote10_message_record, quote10_message_value) {
  quote10_message_at = 0;
  do
  :: quote10_message_at < 2 -> quote10_message_record.reserved_2[quote10_message_at] = quote10_message_value; quote10_message_at = quote10_message_at + 1
  :: else -> break
  od;
  fill_ask_quote(quote10_message_record.ask_quote, quote10_message_value);
  fill_bid_quote(quote10_message_record.bid_quote, quote10_message_value);
  skip
}

/* each byte of Quote 10 Message set to where it lies, so a field read out of place says so */
inline ramp_quote10_message(quote10_message_record, quote10_message_base) {
  quote10_message_at = 0;
  do
  :: quote10_message_at < 2 -> quote10_message_record.reserved_2[quote10_message_at] = (quote10_message_base + 0 + quote10_message_at + 1) % 256; quote10_message_at = quote10_message_at + 1
  :: else -> break
  od;
  ramp_ask_quote(quote10_message_record.ask_quote, quote10_message_base + 2);
  ramp_bid_quote(quote10_message_record.bid_quote, quote10_message_base + 48);
  skip
}

/* Quote 10 Message to the wire, 94 bytes from where the cursor stands */
inline encode_quote10_message(quote10_message_record) {
  quote10_message_at = 0;
  do
  :: quote10_message_at < 2 -> wire[at] = quote10_message_record.reserved_2[quote10_message_at]; at = at + 1; quote10_message_at = quote10_message_at + 1
  :: else -> break
  od;
  encode_ask_quote(quote10_message_record.ask_quote);
  encode_bid_quote(quote10_message_record.bid_quote);
  skip
}

/* Quote 10 Message off the wire, 94 bytes from where the cursor stands */
inline decode_quote10_message(quote10_message_record) {
  quote10_message_at = 0;
  do
  :: quote10_message_at < 2 -> quote10_message_record.reserved_2[quote10_message_at] = wire[at]; at = at + 1; quote10_message_at = quote10_message_at + 1
  :: else -> break
  od;
  decode_ask_quote(quote10_message_record.ask_quote);
  decode_bid_quote(quote10_message_record.bid_quote);
  skip
}

/* what was read of Quote 10 Message is what was written, byte for byte */
inline equal_quote10_message(quote10_message_read, quote10_message_written) {
  quote10_message_at = 0;
  do
  :: quote10_message_at < 2 -> assert(quote10_message_read.reserved_2[quote10_message_at] == quote10_message_written.reserved_2[quote10_message_at]); quote10_message_at = quote10_message_at + 1
  :: else -> break
  od;
  equal_ask_quote(quote10_message_read.ask_quote, quote10_message_written.ask_quote);
  equal_bid_quote(quote10_message_read.bid_quote, quote10_message_written.bid_quote);
  skip
}

/* ---- Sell Order: 29 bytes ---------------------------------------------------- */

/* Sell Order */
typedef SellOrder {
  byte change_flag;
  byte time_c_12[12];
  QuoteQuantity quote_quantity
};

int sell_order_at;

/* every byte of Sell Order set to one value */
inline fill_sell_order(sell_order_record, sell_order_value) {
  sell_order_record.change_flag = sell_order_value;
  sell_order_at = 0;
  do
  :: sell_order_at < 12 -> sell_order_record.time_c_12[sell_order_at] = sell_order_value; sell_order_at = sell_order_at + 1
  :: else -> break
  od;
  fill_quote_quantity(sell_order_record.quote_quantity, sell_order_value);
  skip
}

/* each byte of Sell Order set to where it lies, so a field read out of place says so */
inline ramp_sell_order(sell_order_record, sell_order_base) {
  sell_order_record.change_flag = (sell_order_base + 0 + 1) % 256;
  sell_order_at = 0;
  do
  :: sell_order_at < 12 -> sell_order_record.time_c_12[sell_order_at] = (sell_order_base + 1 + sell_order_at + 1) % 256; sell_order_at = sell_order_at + 1
  :: else -> break
  od;
  ramp_quote_quantity(sell_order_record.quote_quantity, sell_order_base + 13);
  skip
}

/* Sell Order to the wire, 29 bytes from where the cursor stands */
inline encode_sell_order(sell_order_record) {
  wire[at] = sell_order_record.change_flag; at = at + 1;
  sell_order_at = 0;
  do
  :: sell_order_at < 12 -> wire[at] = sell_order_record.time_c_12[sell_order_at]; at = at + 1; sell_order_at = sell_order_at + 1
  :: else -> break
  od;
  encode_quote_quantity(sell_order_record.quote_quantity);
  skip
}

/* Sell Order off the wire, 29 bytes from where the cursor stands */
inline decode_sell_order(sell_order_record) {
  sell_order_record.change_flag = wire[at]; at = at + 1;
  sell_order_at = 0;
  do
  :: sell_order_at < 12 -> sell_order_record.time_c_12[sell_order_at] = wire[at]; at = at + 1; sell_order_at = sell_order_at + 1
  :: else -> break
  od;
  decode_quote_quantity(sell_order_record.quote_quantity);
  skip
}

/* what was read of Sell Order is what was written, byte for byte */
inline equal_sell_order(sell_order_read, sell_order_written) {
  assert(sell_order_read.change_flag == sell_order_written.change_flag);
  sell_order_at = 0;
  do
  :: sell_order_at < 12 -> assert(sell_order_read.time_c_12[sell_order_at] == sell_order_written.time_c_12[sell_order_at]); sell_order_at = sell_order_at + 1
  :: else -> break
  od;
  equal_quote_quantity(sell_order_read.quote_quantity, sell_order_written.quote_quantity);
  skip
}

/* ---- Buy Order: 29 bytes ----------------------------------------------------- */

/* Buy Order */
typedef BuyOrder {
  byte change_flag;
  byte time_c_12[12];
  QuoteQuantity quote_quantity
};

int buy_order_at;

/* every byte of Buy Order set to one value */
inline fill_buy_order(buy_order_record, buy_order_value) {
  buy_order_record.change_flag = buy_order_value;
  buy_order_at = 0;
  do
  :: buy_order_at < 12 -> buy_order_record.time_c_12[buy_order_at] = buy_order_value; buy_order_at = buy_order_at + 1
  :: else -> break
  od;
  fill_quote_quantity(buy_order_record.quote_quantity, buy_order_value);
  skip
}

/* each byte of Buy Order set to where it lies, so a field read out of place says so */
inline ramp_buy_order(buy_order_record, buy_order_base) {
  buy_order_record.change_flag = (buy_order_base + 0 + 1) % 256;
  buy_order_at = 0;
  do
  :: buy_order_at < 12 -> buy_order_record.time_c_12[buy_order_at] = (buy_order_base + 1 + buy_order_at + 1) % 256; buy_order_at = buy_order_at + 1
  :: else -> break
  od;
  ramp_quote_quantity(buy_order_record.quote_quantity, buy_order_base + 13);
  skip
}

/* Buy Order to the wire, 29 bytes from where the cursor stands */
inline encode_buy_order(buy_order_record) {
  wire[at] = buy_order_record.change_flag; at = at + 1;
  buy_order_at = 0;
  do
  :: buy_order_at < 12 -> wire[at] = buy_order_record.time_c_12[buy_order_at]; at = at + 1; buy_order_at = buy_order_at + 1
  :: else -> break
  od;
  encode_quote_quantity(buy_order_record.quote_quantity);
  skip
}

/* Buy Order off the wire, 29 bytes from where the cursor stands */
inline decode_buy_order(buy_order_record) {
  buy_order_record.change_flag = wire[at]; at = at + 1;
  buy_order_at = 0;
  do
  :: buy_order_at < 12 -> buy_order_record.time_c_12[buy_order_at] = wire[at]; at = at + 1; buy_order_at = buy_order_at + 1
  :: else -> break
  od;
  decode_quote_quantity(buy_order_record.quote_quantity);
  skip
}

/* what was read of Buy Order is what was written, byte for byte */
inline equal_buy_order(buy_order_read, buy_order_written) {
  assert(buy_order_read.change_flag == buy_order_written.change_flag);
  buy_order_at = 0;
  do
  :: buy_order_at < 12 -> assert(buy_order_read.time_c_12[buy_order_at] == buy_order_written.time_c_12[buy_order_at]); buy_order_at = buy_order_at + 1
  :: else -> break
  od;
  equal_quote_quantity(buy_order_read.quote_quantity, buy_order_written.quote_quantity);
  skip
}

/* ---- Market Order Message: 60 bytes ------------------------------------------ */

/* In this tag, both Ask and Bid Market Order Information is set. This tag appears as part of realtime data. */
typedef MarketOrderMessage {
  byte reserved_2[2];
  SellOrder sell_order;
  BuyOrder buy_order
};

int market_order_message_at;

/* every byte of Market Order Message set to one value */
inline fill_market_order_message(market_order_message_record, market_order_message_value) {
  market_order_message_at = 0;
  do
  :: market_order_message_at < 2 -> market_order_message_record.reserved_2[market_order_message_at] = market_order_message_value; market_order_message_at = market_order_message_at + 1
  :: else -> break
  od;
  fill_sell_order(market_order_message_record.sell_order, market_order_message_value);
  fill_buy_order(market_order_message_record.buy_order, market_order_message_value);
  skip
}

/* each byte of Market Order Message set to where it lies, so a field read out of place says so */
inline ramp_market_order_message(market_order_message_record, market_order_message_base) {
  market_order_message_at = 0;
  do
  :: market_order_message_at < 2 -> market_order_message_record.reserved_2[market_order_message_at] = (market_order_message_base + 0 + market_order_message_at + 1) % 256; market_order_message_at = market_order_message_at + 1
  :: else -> break
  od;
  ramp_sell_order(market_order_message_record.sell_order, market_order_message_base + 2);
  ramp_buy_order(market_order_message_record.buy_order, market_order_message_base + 31);
  skip
}

/* Market Order Message to the wire, 60 bytes from where the cursor stands */
inline encode_market_order_message(market_order_message_record) {
  market_order_message_at = 0;
  do
  :: market_order_message_at < 2 -> wire[at] = market_order_message_record.reserved_2[market_order_message_at]; at = at + 1; market_order_message_at = market_order_message_at + 1
  :: else -> break
  od;
  encode_sell_order(market_order_message_record.sell_order);
  encode_buy_order(market_order_message_record.buy_order);
  skip
}

/* Market Order Message off the wire, 60 bytes from where the cursor stands */
inline decode_market_order_message(market_order_message_record) {
  market_order_message_at = 0;
  do
  :: market_order_message_at < 2 -> market_order_message_record.reserved_2[market_order_message_at] = wire[at]; at = at + 1; market_order_message_at = market_order_message_at + 1
  :: else -> break
  od;
  decode_sell_order(market_order_message_record.sell_order);
  decode_buy_order(market_order_message_record.buy_order);
  skip
}

/* what was read of Market Order Message is what was written, byte for byte */
inline equal_market_order_message(market_order_message_read, market_order_message_written) {
  market_order_message_at = 0;
  do
  :: market_order_message_at < 2 -> assert(market_order_message_read.reserved_2[market_order_message_at] == market_order_message_written.reserved_2[market_order_message_at]); market_order_message_at = market_order_message_at + 1
  :: else -> break
  od;
  equal_sell_order(market_order_message_read.sell_order, market_order_message_written.sell_order);
  equal_buy_order(market_order_message_read.buy_order, market_order_message_written.buy_order);
  skip
}

/* ---- Over Quote: 29 bytes ---------------------------------------------------- */

/* OVER Quote */
typedef OverQuote {
  byte change_flag;
  byte time_c_12[12];
  QuoteQuantity quote_quantity
};

int over_quote_at;

/* every byte of Over Quote set to one value */
inline fill_over_quote(over_quote_record, over_quote_value) {
  over_quote_record.change_flag = over_quote_value;
  over_quote_at = 0;
  do
  :: over_quote_at < 12 -> over_quote_record.time_c_12[over_quote_at] = over_quote_value; over_quote_at = over_quote_at + 1
  :: else -> break
  od;
  fill_quote_quantity(over_quote_record.quote_quantity, over_quote_value);
  skip
}

/* each byte of Over Quote set to where it lies, so a field read out of place says so */
inline ramp_over_quote(over_quote_record, over_quote_base) {
  over_quote_record.change_flag = (over_quote_base + 0 + 1) % 256;
  over_quote_at = 0;
  do
  :: over_quote_at < 12 -> over_quote_record.time_c_12[over_quote_at] = (over_quote_base + 1 + over_quote_at + 1) % 256; over_quote_at = over_quote_at + 1
  :: else -> break
  od;
  ramp_quote_quantity(over_quote_record.quote_quantity, over_quote_base + 13);
  skip
}

/* Over Quote to the wire, 29 bytes from where the cursor stands */
inline encode_over_quote(over_quote_record) {
  wire[at] = over_quote_record.change_flag; at = at + 1;
  over_quote_at = 0;
  do
  :: over_quote_at < 12 -> wire[at] = over_quote_record.time_c_12[over_quote_at]; at = at + 1; over_quote_at = over_quote_at + 1
  :: else -> break
  od;
  encode_quote_quantity(over_quote_record.quote_quantity);
  skip
}

/* Over Quote off the wire, 29 bytes from where the cursor stands */
inline decode_over_quote(over_quote_record) {
  over_quote_record.change_flag = wire[at]; at = at + 1;
  over_quote_at = 0;
  do
  :: over_quote_at < 12 -> over_quote_record.time_c_12[over_quote_at] = wire[at]; at = at + 1; over_quote_at = over_quote_at + 1
  :: else -> break
  od;
  decode_quote_quantity(over_quote_record.quote_quantity);
  skip
}

/* what was read of Over Quote is what was written, byte for byte */
inline equal_over_quote(over_quote_read, over_quote_written) {
  assert(over_quote_read.change_flag == over_quote_written.change_flag);
  over_quote_at = 0;
  do
  :: over_quote_at < 12 -> assert(over_quote_read.time_c_12[over_quote_at] == over_quote_written.time_c_12[over_quote_at]); over_quote_at = over_quote_at + 1
  :: else -> break
  od;
  equal_quote_quantity(over_quote_read.quote_quantity, over_quote_written.quote_quantity);
  skip
}

/* ---- Under Quote: 29 bytes --------------------------------------------------- */

/* UNDER Quote */
typedef UnderQuote {
  byte change_flag;
  byte time_c_12[12];
  QuoteQuantity quote_quantity
};

int under_quote_at;

/* every byte of Under Quote set to one value */
inline fill_under_quote(under_quote_record, under_quote_value) {
  under_quote_record.change_flag = under_quote_value;
  under_quote_at = 0;
  do
  :: under_quote_at < 12 -> under_quote_record.time_c_12[under_quote_at] = under_quote_value; under_quote_at = under_quote_at + 1
  :: else -> break
  od;
  fill_quote_quantity(under_quote_record.quote_quantity, under_quote_value);
  skip
}

/* each byte of Under Quote set to where it lies, so a field read out of place says so */
inline ramp_under_quote(under_quote_record, under_quote_base) {
  under_quote_record.change_flag = (under_quote_base + 0 + 1) % 256;
  under_quote_at = 0;
  do
  :: under_quote_at < 12 -> under_quote_record.time_c_12[under_quote_at] = (under_quote_base + 1 + under_quote_at + 1) % 256; under_quote_at = under_quote_at + 1
  :: else -> break
  od;
  ramp_quote_quantity(under_quote_record.quote_quantity, under_quote_base + 13);
  skip
}

/* Under Quote to the wire, 29 bytes from where the cursor stands */
inline encode_under_quote(under_quote_record) {
  wire[at] = under_quote_record.change_flag; at = at + 1;
  under_quote_at = 0;
  do
  :: under_quote_at < 12 -> wire[at] = under_quote_record.time_c_12[under_quote_at]; at = at + 1; under_quote_at = under_quote_at + 1
  :: else -> break
  od;
  encode_quote_quantity(under_quote_record.quote_quantity);
  skip
}

/* Under Quote off the wire, 29 bytes from where the cursor stands */
inline decode_under_quote(under_quote_record) {
  under_quote_record.change_flag = wire[at]; at = at + 1;
  under_quote_at = 0;
  do
  :: under_quote_at < 12 -> under_quote_record.time_c_12[under_quote_at] = wire[at]; at = at + 1; under_quote_at = under_quote_at + 1
  :: else -> break
  od;
  decode_quote_quantity(under_quote_record.quote_quantity);
  skip
}

/* what was read of Under Quote is what was written, byte for byte */
inline equal_under_quote(under_quote_read, under_quote_written) {
  assert(under_quote_read.change_flag == under_quote_written.change_flag);
  under_quote_at = 0;
  do
  :: under_quote_at < 12 -> assert(under_quote_read.time_c_12[under_quote_at] == under_quote_written.time_c_12[under_quote_at]); under_quote_at = under_quote_at + 1
  :: else -> break
  od;
  equal_quote_quantity(under_quote_read.quote_quantity, under_quote_written.quote_quantity);
  skip
}

/* ---- Over Under Message: 60 bytes -------------------------------------------- */

/* In this tag, OVER/UNDER quote (Total of quote 11 (Ask) and above or quote 11 (Bid) and below) information is set. This tag is appeared as one of realtime data. */
typedef OverUnderMessage {
  byte reserved_2[2];
  OverQuote over_quote;
  UnderQuote under_quote
};

int over_under_message_at;

/* every byte of Over Under Message set to one value */
inline fill_over_under_message(over_under_message_record, over_under_message_value) {
  over_under_message_at = 0;
  do
  :: over_under_message_at < 2 -> over_under_message_record.reserved_2[over_under_message_at] = over_under_message_value; over_under_message_at = over_under_message_at + 1
  :: else -> break
  od;
  fill_over_quote(over_under_message_record.over_quote, over_under_message_value);
  fill_under_quote(over_under_message_record.under_quote, over_under_message_value);
  skip
}

/* each byte of Over Under Message set to where it lies, so a field read out of place says so */
inline ramp_over_under_message(over_under_message_record, over_under_message_base) {
  over_under_message_at = 0;
  do
  :: over_under_message_at < 2 -> over_under_message_record.reserved_2[over_under_message_at] = (over_under_message_base + 0 + over_under_message_at + 1) % 256; over_under_message_at = over_under_message_at + 1
  :: else -> break
  od;
  ramp_over_quote(over_under_message_record.over_quote, over_under_message_base + 2);
  ramp_under_quote(over_under_message_record.under_quote, over_under_message_base + 31);
  skip
}

/* Over Under Message to the wire, 60 bytes from where the cursor stands */
inline encode_over_under_message(over_under_message_record) {
  over_under_message_at = 0;
  do
  :: over_under_message_at < 2 -> wire[at] = over_under_message_record.reserved_2[over_under_message_at]; at = at + 1; over_under_message_at = over_under_message_at + 1
  :: else -> break
  od;
  encode_over_quote(over_under_message_record.over_quote);
  encode_under_quote(over_under_message_record.under_quote);
  skip
}

/* Over Under Message off the wire, 60 bytes from where the cursor stands */
inline decode_over_under_message(over_under_message_record) {
  over_under_message_at = 0;
  do
  :: over_under_message_at < 2 -> over_under_message_record.reserved_2[over_under_message_at] = wire[at]; at = at + 1; over_under_message_at = over_under_message_at + 1
  :: else -> break
  od;
  decode_over_quote(over_under_message_record.over_quote);
  decode_under_quote(over_under_message_record.under_quote);
  skip
}

/* what was read of Over Under Message is what was written, byte for byte */
inline equal_over_under_message(over_under_message_read, over_under_message_written) {
  over_under_message_at = 0;
  do
  :: over_under_message_at < 2 -> assert(over_under_message_read.reserved_2[over_under_message_at] == over_under_message_written.reserved_2[over_under_message_at]); over_under_message_at = over_under_message_at + 1
  :: else -> break
  od;
  equal_over_quote(over_under_message_read.over_quote, over_under_message_written.over_quote);
  equal_under_quote(over_under_message_read.under_quote, over_under_message_written.under_quote);
  skip
}

/* ---- Trading Volume: 23 bytes ------------------------------------------------ */

/* Trading Volume */
typedef TradingVolume {
  byte reserved_1;
  byte trading_volume_turnover_unit_flag;
  byte trading_volume_c_14[14];
  byte time_c_6[6];
  byte second_reserved_1
};

int trading_volume_at;

/* every byte of Trading Volume set to one value */
inline fill_trading_volume(trading_volume_record, trading_volume_value) {
  trading_volume_record.reserved_1 = trading_volume_value;
  trading_volume_record.trading_volume_turnover_unit_flag = trading_volume_value;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.trading_volume_c_14[trading_volume_at] = trading_volume_value; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 6 -> trading_volume_record.time_c_6[trading_volume_at] = trading_volume_value; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.second_reserved_1 = trading_volume_value;
  skip
}

/* each byte of Trading Volume set to where it lies, so a field read out of place says so */
inline ramp_trading_volume(trading_volume_record, trading_volume_base) {
  trading_volume_record.reserved_1 = (trading_volume_base + 0 + 1) % 256;
  trading_volume_record.trading_volume_turnover_unit_flag = (trading_volume_base + 1 + 1) % 256;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.trading_volume_c_14[trading_volume_at] = (trading_volume_base + 2 + trading_volume_at + 1) % 256; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 6 -> trading_volume_record.time_c_6[trading_volume_at] = (trading_volume_base + 16 + trading_volume_at + 1) % 256; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.second_reserved_1 = (trading_volume_base + 22 + 1) % 256;
  skip
}

/* Trading Volume to the wire, 23 bytes from where the cursor stands */
inline encode_trading_volume(trading_volume_record) {
  wire[at] = trading_volume_record.reserved_1; at = at + 1;
  wire[at] = trading_volume_record.trading_volume_turnover_unit_flag; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> wire[at] = trading_volume_record.trading_volume_c_14[trading_volume_at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 6 -> wire[at] = trading_volume_record.time_c_6[trading_volume_at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  wire[at] = trading_volume_record.second_reserved_1; at = at + 1;
  skip
}

/* Trading Volume off the wire, 23 bytes from where the cursor stands */
inline decode_trading_volume(trading_volume_record) {
  trading_volume_record.reserved_1 = wire[at]; at = at + 1;
  trading_volume_record.trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> trading_volume_record.trading_volume_c_14[trading_volume_at] = wire[at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 6 -> trading_volume_record.time_c_6[trading_volume_at] = wire[at]; at = at + 1; trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_record.second_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Volume is what was written, byte for byte */
inline equal_trading_volume(trading_volume_read, trading_volume_written) {
  assert(trading_volume_read.reserved_1 == trading_volume_written.reserved_1);
  assert(trading_volume_read.trading_volume_turnover_unit_flag == trading_volume_written.trading_volume_turnover_unit_flag);
  trading_volume_at = 0;
  do
  :: trading_volume_at < 14 -> assert(trading_volume_read.trading_volume_c_14[trading_volume_at] == trading_volume_written.trading_volume_c_14[trading_volume_at]); trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  trading_volume_at = 0;
  do
  :: trading_volume_at < 6 -> assert(trading_volume_read.time_c_6[trading_volume_at] == trading_volume_written.time_c_6[trading_volume_at]); trading_volume_at = trading_volume_at + 1
  :: else -> break
  od;
  assert(trading_volume_read.second_reserved_1 == trading_volume_written.second_reserved_1);
  skip
}

/* ---- Trading Volume Message: 25 bytes ---------------------------------------- */

/* In this tag, by-issue trading volume information is set. This tag appears as part of realtime data. */
typedef TradingVolumeMessage {
  byte reserved_2[2];
  TradingVolume trading_volume
};

int trading_volume_message_at;

/* every byte of Trading Volume Message set to one value */
inline fill_trading_volume_message(trading_volume_message_record, trading_volume_message_value) {
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 2 -> trading_volume_message_record.reserved_2[trading_volume_message_at] = trading_volume_message_value; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  fill_trading_volume(trading_volume_message_record.trading_volume, trading_volume_message_value);
  skip
}

/* each byte of Trading Volume Message set to where it lies, so a field read out of place says so */
inline ramp_trading_volume_message(trading_volume_message_record, trading_volume_message_base) {
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 2 -> trading_volume_message_record.reserved_2[trading_volume_message_at] = (trading_volume_message_base + 0 + trading_volume_message_at + 1) % 256; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  ramp_trading_volume(trading_volume_message_record.trading_volume, trading_volume_message_base + 2);
  skip
}

/* Trading Volume Message to the wire, 25 bytes from where the cursor stands */
inline encode_trading_volume_message(trading_volume_message_record) {
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 2 -> wire[at] = trading_volume_message_record.reserved_2[trading_volume_message_at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  encode_trading_volume(trading_volume_message_record.trading_volume);
  skip
}

/* Trading Volume Message off the wire, 25 bytes from where the cursor stands */
inline decode_trading_volume_message(trading_volume_message_record) {
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 2 -> trading_volume_message_record.reserved_2[trading_volume_message_at] = wire[at]; at = at + 1; trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  decode_trading_volume(trading_volume_message_record.trading_volume);
  skip
}

/* what was read of Trading Volume Message is what was written, byte for byte */
inline equal_trading_volume_message(trading_volume_message_read, trading_volume_message_written) {
  trading_volume_message_at = 0;
  do
  :: trading_volume_message_at < 2 -> assert(trading_volume_message_read.reserved_2[trading_volume_message_at] == trading_volume_message_written.reserved_2[trading_volume_message_at]); trading_volume_message_at = trading_volume_message_at + 1
  :: else -> break
  od;
  equal_trading_volume(trading_volume_message_read.trading_volume, trading_volume_message_written.trading_volume);
  skip
}

/* ---- Turnover In Yen Value: 23 bytes ----------------------------------------- */

/* Turnover in yen value */
typedef TurnoverInYenValue {
  byte reserved_1;
  byte trading_volume_turnover_unit_flag;
  byte turnover_value[14];
  byte time_c_6[6];
  byte second_reserved_1
};

int turnover_in_yen_value_at;

/* every byte of Turnover In Yen Value set to one value */
inline fill_turnover_in_yen_value(turnover_in_yen_value_record, turnover_in_yen_value_value) {
  turnover_in_yen_value_record.reserved_1 = turnover_in_yen_value_value;
  turnover_in_yen_value_record.trading_volume_turnover_unit_flag = turnover_in_yen_value_value;
  turnover_in_yen_value_at = 0;
  do
  :: turnover_in_yen_value_at < 14 -> turnover_in_yen_value_record.turnover_value[turnover_in_yen_value_at] = turnover_in_yen_value_value; turnover_in_yen_value_at = turnover_in_yen_value_at + 1
  :: else -> break
  od;
  turnover_in_yen_value_at = 0;
  do
  :: turnover_in_yen_value_at < 6 -> turnover_in_yen_value_record.time_c_6[turnover_in_yen_value_at] = turnover_in_yen_value_value; turnover_in_yen_value_at = turnover_in_yen_value_at + 1
  :: else -> break
  od;
  turnover_in_yen_value_record.second_reserved_1 = turnover_in_yen_value_value;
  skip
}

/* each byte of Turnover In Yen Value set to where it lies, so a field read out of place says so */
inline ramp_turnover_in_yen_value(turnover_in_yen_value_record, turnover_in_yen_value_base) {
  turnover_in_yen_value_record.reserved_1 = (turnover_in_yen_value_base + 0 + 1) % 256;
  turnover_in_yen_value_record.trading_volume_turnover_unit_flag = (turnover_in_yen_value_base + 1 + 1) % 256;
  turnover_in_yen_value_at = 0;
  do
  :: turnover_in_yen_value_at < 14 -> turnover_in_yen_value_record.turnover_value[turnover_in_yen_value_at] = (turnover_in_yen_value_base + 2 + turnover_in_yen_value_at + 1) % 256; turnover_in_yen_value_at = turnover_in_yen_value_at + 1
  :: else -> break
  od;
  turnover_in_yen_value_at = 0;
  do
  :: turnover_in_yen_value_at < 6 -> turnover_in_yen_value_record.time_c_6[turnover_in_yen_value_at] = (turnover_in_yen_value_base + 16 + turnover_in_yen_value_at + 1) % 256; turnover_in_yen_value_at = turnover_in_yen_value_at + 1
  :: else -> break
  od;
  turnover_in_yen_value_record.second_reserved_1 = (turnover_in_yen_value_base + 22 + 1) % 256;
  skip
}

/* Turnover In Yen Value to the wire, 23 bytes from where the cursor stands */
inline encode_turnover_in_yen_value(turnover_in_yen_value_record) {
  wire[at] = turnover_in_yen_value_record.reserved_1; at = at + 1;
  wire[at] = turnover_in_yen_value_record.trading_volume_turnover_unit_flag; at = at + 1;
  turnover_in_yen_value_at = 0;
  do
  :: turnover_in_yen_value_at < 14 -> wire[at] = turnover_in_yen_value_record.turnover_value[turnover_in_yen_value_at]; at = at + 1; turnover_in_yen_value_at = turnover_in_yen_value_at + 1
  :: else -> break
  od;
  turnover_in_yen_value_at = 0;
  do
  :: turnover_in_yen_value_at < 6 -> wire[at] = turnover_in_yen_value_record.time_c_6[turnover_in_yen_value_at]; at = at + 1; turnover_in_yen_value_at = turnover_in_yen_value_at + 1
  :: else -> break
  od;
  wire[at] = turnover_in_yen_value_record.second_reserved_1; at = at + 1;
  skip
}

/* Turnover In Yen Value off the wire, 23 bytes from where the cursor stands */
inline decode_turnover_in_yen_value(turnover_in_yen_value_record) {
  turnover_in_yen_value_record.reserved_1 = wire[at]; at = at + 1;
  turnover_in_yen_value_record.trading_volume_turnover_unit_flag = wire[at]; at = at + 1;
  turnover_in_yen_value_at = 0;
  do
  :: turnover_in_yen_value_at < 14 -> turnover_in_yen_value_record.turnover_value[turnover_in_yen_value_at] = wire[at]; at = at + 1; turnover_in_yen_value_at = turnover_in_yen_value_at + 1
  :: else -> break
  od;
  turnover_in_yen_value_at = 0;
  do
  :: turnover_in_yen_value_at < 6 -> turnover_in_yen_value_record.time_c_6[turnover_in_yen_value_at] = wire[at]; at = at + 1; turnover_in_yen_value_at = turnover_in_yen_value_at + 1
  :: else -> break
  od;
  turnover_in_yen_value_record.second_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Turnover In Yen Value is what was written, byte for byte */
inline equal_turnover_in_yen_value(turnover_in_yen_value_read, turnover_in_yen_value_written) {
  assert(turnover_in_yen_value_read.reserved_1 == turnover_in_yen_value_written.reserved_1);
  assert(turnover_in_yen_value_read.trading_volume_turnover_unit_flag == turnover_in_yen_value_written.trading_volume_turnover_unit_flag);
  turnover_in_yen_value_at = 0;
  do
  :: turnover_in_yen_value_at < 14 -> assert(turnover_in_yen_value_read.turnover_value[turnover_in_yen_value_at] == turnover_in_yen_value_written.turnover_value[turnover_in_yen_value_at]); turnover_in_yen_value_at = turnover_in_yen_value_at + 1
  :: else -> break
  od;
  turnover_in_yen_value_at = 0;
  do
  :: turnover_in_yen_value_at < 6 -> assert(turnover_in_yen_value_read.time_c_6[turnover_in_yen_value_at] == turnover_in_yen_value_written.time_c_6[turnover_in_yen_value_at]); turnover_in_yen_value_at = turnover_in_yen_value_at + 1
  :: else -> break
  od;
  assert(turnover_in_yen_value_read.second_reserved_1 == turnover_in_yen_value_written.second_reserved_1);
  skip
}

/* ---- Turnover Message: 25 bytes ---------------------------------------------- */

/* In this tag, by-issue Turnover Information is set. This tag appears as part of realtime data. */
typedef TurnoverMessage {
  byte reserved_2[2];
  TurnoverInYenValue turnover_in_yen_value
};

int turnover_message_at;

/* every byte of Turnover Message set to one value */
inline fill_turnover_message(turnover_message_record, turnover_message_value) {
  turnover_message_at = 0;
  do
  :: turnover_message_at < 2 -> turnover_message_record.reserved_2[turnover_message_at] = turnover_message_value; turnover_message_at = turnover_message_at + 1
  :: else -> break
  od;
  fill_turnover_in_yen_value(turnover_message_record.turnover_in_yen_value, turnover_message_value);
  skip
}

/* each byte of Turnover Message set to where it lies, so a field read out of place says so */
inline ramp_turnover_message(turnover_message_record, turnover_message_base) {
  turnover_message_at = 0;
  do
  :: turnover_message_at < 2 -> turnover_message_record.reserved_2[turnover_message_at] = (turnover_message_base + 0 + turnover_message_at + 1) % 256; turnover_message_at = turnover_message_at + 1
  :: else -> break
  od;
  ramp_turnover_in_yen_value(turnover_message_record.turnover_in_yen_value, turnover_message_base + 2);
  skip
}

/* Turnover Message to the wire, 25 bytes from where the cursor stands */
inline encode_turnover_message(turnover_message_record) {
  turnover_message_at = 0;
  do
  :: turnover_message_at < 2 -> wire[at] = turnover_message_record.reserved_2[turnover_message_at]; at = at + 1; turnover_message_at = turnover_message_at + 1
  :: else -> break
  od;
  encode_turnover_in_yen_value(turnover_message_record.turnover_in_yen_value);
  skip
}

/* Turnover Message off the wire, 25 bytes from where the cursor stands */
inline decode_turnover_message(turnover_message_record) {
  turnover_message_at = 0;
  do
  :: turnover_message_at < 2 -> turnover_message_record.reserved_2[turnover_message_at] = wire[at]; at = at + 1; turnover_message_at = turnover_message_at + 1
  :: else -> break
  od;
  decode_turnover_in_yen_value(turnover_message_record.turnover_in_yen_value);
  skip
}

/* what was read of Turnover Message is what was written, byte for byte */
inline equal_turnover_message(turnover_message_read, turnover_message_written) {
  turnover_message_at = 0;
  do
  :: turnover_message_at < 2 -> assert(turnover_message_read.reserved_2[turnover_message_at] == turnover_message_written.reserved_2[turnover_message_at]); turnover_message_at = turnover_message_at + 1
  :: else -> break
  od;
  equal_turnover_in_yen_value(turnover_message_read.turnover_in_yen_value, turnover_message_written.turnover_in_yen_value);
  skip
}

/* ---- All Day Vwap: 24 bytes -------------------------------------------------- */

/* All-Day VWAP */
typedef AllDayVwap {
  byte reserved_1;
  byte lot_size_unit_flag;
  byte all_day_vwap_c_14[14];
  byte sign;
  byte time_c_6[6];
  byte second_reserved_1
};

int all_day_vwap_at;

/* every byte of All Day Vwap set to one value */
inline fill_all_day_vwap(all_day_vwap_record, all_day_vwap_value) {
  all_day_vwap_record.reserved_1 = all_day_vwap_value;
  all_day_vwap_record.lot_size_unit_flag = all_day_vwap_value;
  all_day_vwap_at = 0;
  do
  :: all_day_vwap_at < 14 -> all_day_vwap_record.all_day_vwap_c_14[all_day_vwap_at] = all_day_vwap_value; all_day_vwap_at = all_day_vwap_at + 1
  :: else -> break
  od;
  all_day_vwap_record.sign = all_day_vwap_value;
  all_day_vwap_at = 0;
  do
  :: all_day_vwap_at < 6 -> all_day_vwap_record.time_c_6[all_day_vwap_at] = all_day_vwap_value; all_day_vwap_at = all_day_vwap_at + 1
  :: else -> break
  od;
  all_day_vwap_record.second_reserved_1 = all_day_vwap_value;
  skip
}

/* each byte of All Day Vwap set to where it lies, so a field read out of place says so */
inline ramp_all_day_vwap(all_day_vwap_record, all_day_vwap_base) {
  all_day_vwap_record.reserved_1 = (all_day_vwap_base + 0 + 1) % 256;
  all_day_vwap_record.lot_size_unit_flag = (all_day_vwap_base + 1 + 1) % 256;
  all_day_vwap_at = 0;
  do
  :: all_day_vwap_at < 14 -> all_day_vwap_record.all_day_vwap_c_14[all_day_vwap_at] = (all_day_vwap_base + 2 + all_day_vwap_at + 1) % 256; all_day_vwap_at = all_day_vwap_at + 1
  :: else -> break
  od;
  all_day_vwap_record.sign = (all_day_vwap_base + 16 + 1) % 256;
  all_day_vwap_at = 0;
  do
  :: all_day_vwap_at < 6 -> all_day_vwap_record.time_c_6[all_day_vwap_at] = (all_day_vwap_base + 17 + all_day_vwap_at + 1) % 256; all_day_vwap_at = all_day_vwap_at + 1
  :: else -> break
  od;
  all_day_vwap_record.second_reserved_1 = (all_day_vwap_base + 23 + 1) % 256;
  skip
}

/* All Day Vwap to the wire, 24 bytes from where the cursor stands */
inline encode_all_day_vwap(all_day_vwap_record) {
  wire[at] = all_day_vwap_record.reserved_1; at = at + 1;
  wire[at] = all_day_vwap_record.lot_size_unit_flag; at = at + 1;
  all_day_vwap_at = 0;
  do
  :: all_day_vwap_at < 14 -> wire[at] = all_day_vwap_record.all_day_vwap_c_14[all_day_vwap_at]; at = at + 1; all_day_vwap_at = all_day_vwap_at + 1
  :: else -> break
  od;
  wire[at] = all_day_vwap_record.sign; at = at + 1;
  all_day_vwap_at = 0;
  do
  :: all_day_vwap_at < 6 -> wire[at] = all_day_vwap_record.time_c_6[all_day_vwap_at]; at = at + 1; all_day_vwap_at = all_day_vwap_at + 1
  :: else -> break
  od;
  wire[at] = all_day_vwap_record.second_reserved_1; at = at + 1;
  skip
}

/* All Day Vwap off the wire, 24 bytes from where the cursor stands */
inline decode_all_day_vwap(all_day_vwap_record) {
  all_day_vwap_record.reserved_1 = wire[at]; at = at + 1;
  all_day_vwap_record.lot_size_unit_flag = wire[at]; at = at + 1;
  all_day_vwap_at = 0;
  do
  :: all_day_vwap_at < 14 -> all_day_vwap_record.all_day_vwap_c_14[all_day_vwap_at] = wire[at]; at = at + 1; all_day_vwap_at = all_day_vwap_at + 1
  :: else -> break
  od;
  all_day_vwap_record.sign = wire[at]; at = at + 1;
  all_day_vwap_at = 0;
  do
  :: all_day_vwap_at < 6 -> all_day_vwap_record.time_c_6[all_day_vwap_at] = wire[at]; at = at + 1; all_day_vwap_at = all_day_vwap_at + 1
  :: else -> break
  od;
  all_day_vwap_record.second_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of All Day Vwap is what was written, byte for byte */
inline equal_all_day_vwap(all_day_vwap_read, all_day_vwap_written) {
  assert(all_day_vwap_read.reserved_1 == all_day_vwap_written.reserved_1);
  assert(all_day_vwap_read.lot_size_unit_flag == all_day_vwap_written.lot_size_unit_flag);
  all_day_vwap_at = 0;
  do
  :: all_day_vwap_at < 14 -> assert(all_day_vwap_read.all_day_vwap_c_14[all_day_vwap_at] == all_day_vwap_written.all_day_vwap_c_14[all_day_vwap_at]); all_day_vwap_at = all_day_vwap_at + 1
  :: else -> break
  od;
  assert(all_day_vwap_read.sign == all_day_vwap_written.sign);
  all_day_vwap_at = 0;
  do
  :: all_day_vwap_at < 6 -> assert(all_day_vwap_read.time_c_6[all_day_vwap_at] == all_day_vwap_written.time_c_6[all_day_vwap_at]); all_day_vwap_at = all_day_vwap_at + 1
  :: else -> break
  od;
  assert(all_day_vwap_read.second_reserved_1 == all_day_vwap_written.second_reserved_1);
  skip
}

/* ---- Current Session Vwap: 24 bytes ------------------------------------------ */

/* Current-Session VWAP */
typedef CurrentSessionVwap {
  byte reserved_1;
  byte lot_size_unit_flag;
  byte current_session_vwap_c_14[14];
  byte sign;
  byte time_c_6[6];
  byte second_reserved_1
};

int current_session_vwap_at;

/* every byte of Current Session Vwap set to one value */
inline fill_current_session_vwap(current_session_vwap_record, current_session_vwap_value) {
  current_session_vwap_record.reserved_1 = current_session_vwap_value;
  current_session_vwap_record.lot_size_unit_flag = current_session_vwap_value;
  current_session_vwap_at = 0;
  do
  :: current_session_vwap_at < 14 -> current_session_vwap_record.current_session_vwap_c_14[current_session_vwap_at] = current_session_vwap_value; current_session_vwap_at = current_session_vwap_at + 1
  :: else -> break
  od;
  current_session_vwap_record.sign = current_session_vwap_value;
  current_session_vwap_at = 0;
  do
  :: current_session_vwap_at < 6 -> current_session_vwap_record.time_c_6[current_session_vwap_at] = current_session_vwap_value; current_session_vwap_at = current_session_vwap_at + 1
  :: else -> break
  od;
  current_session_vwap_record.second_reserved_1 = current_session_vwap_value;
  skip
}

/* each byte of Current Session Vwap set to where it lies, so a field read out of place says so */
inline ramp_current_session_vwap(current_session_vwap_record, current_session_vwap_base) {
  current_session_vwap_record.reserved_1 = (current_session_vwap_base + 0 + 1) % 256;
  current_session_vwap_record.lot_size_unit_flag = (current_session_vwap_base + 1 + 1) % 256;
  current_session_vwap_at = 0;
  do
  :: current_session_vwap_at < 14 -> current_session_vwap_record.current_session_vwap_c_14[current_session_vwap_at] = (current_session_vwap_base + 2 + current_session_vwap_at + 1) % 256; current_session_vwap_at = current_session_vwap_at + 1
  :: else -> break
  od;
  current_session_vwap_record.sign = (current_session_vwap_base + 16 + 1) % 256;
  current_session_vwap_at = 0;
  do
  :: current_session_vwap_at < 6 -> current_session_vwap_record.time_c_6[current_session_vwap_at] = (current_session_vwap_base + 17 + current_session_vwap_at + 1) % 256; current_session_vwap_at = current_session_vwap_at + 1
  :: else -> break
  od;
  current_session_vwap_record.second_reserved_1 = (current_session_vwap_base + 23 + 1) % 256;
  skip
}

/* Current Session Vwap to the wire, 24 bytes from where the cursor stands */
inline encode_current_session_vwap(current_session_vwap_record) {
  wire[at] = current_session_vwap_record.reserved_1; at = at + 1;
  wire[at] = current_session_vwap_record.lot_size_unit_flag; at = at + 1;
  current_session_vwap_at = 0;
  do
  :: current_session_vwap_at < 14 -> wire[at] = current_session_vwap_record.current_session_vwap_c_14[current_session_vwap_at]; at = at + 1; current_session_vwap_at = current_session_vwap_at + 1
  :: else -> break
  od;
  wire[at] = current_session_vwap_record.sign; at = at + 1;
  current_session_vwap_at = 0;
  do
  :: current_session_vwap_at < 6 -> wire[at] = current_session_vwap_record.time_c_6[current_session_vwap_at]; at = at + 1; current_session_vwap_at = current_session_vwap_at + 1
  :: else -> break
  od;
  wire[at] = current_session_vwap_record.second_reserved_1; at = at + 1;
  skip
}

/* Current Session Vwap off the wire, 24 bytes from where the cursor stands */
inline decode_current_session_vwap(current_session_vwap_record) {
  current_session_vwap_record.reserved_1 = wire[at]; at = at + 1;
  current_session_vwap_record.lot_size_unit_flag = wire[at]; at = at + 1;
  current_session_vwap_at = 0;
  do
  :: current_session_vwap_at < 14 -> current_session_vwap_record.current_session_vwap_c_14[current_session_vwap_at] = wire[at]; at = at + 1; current_session_vwap_at = current_session_vwap_at + 1
  :: else -> break
  od;
  current_session_vwap_record.sign = wire[at]; at = at + 1;
  current_session_vwap_at = 0;
  do
  :: current_session_vwap_at < 6 -> current_session_vwap_record.time_c_6[current_session_vwap_at] = wire[at]; at = at + 1; current_session_vwap_at = current_session_vwap_at + 1
  :: else -> break
  od;
  current_session_vwap_record.second_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Current Session Vwap is what was written, byte for byte */
inline equal_current_session_vwap(current_session_vwap_read, current_session_vwap_written) {
  assert(current_session_vwap_read.reserved_1 == current_session_vwap_written.reserved_1);
  assert(current_session_vwap_read.lot_size_unit_flag == current_session_vwap_written.lot_size_unit_flag);
  current_session_vwap_at = 0;
  do
  :: current_session_vwap_at < 14 -> assert(current_session_vwap_read.current_session_vwap_c_14[current_session_vwap_at] == current_session_vwap_written.current_session_vwap_c_14[current_session_vwap_at]); current_session_vwap_at = current_session_vwap_at + 1
  :: else -> break
  od;
  assert(current_session_vwap_read.sign == current_session_vwap_written.sign);
  current_session_vwap_at = 0;
  do
  :: current_session_vwap_at < 6 -> assert(current_session_vwap_read.time_c_6[current_session_vwap_at] == current_session_vwap_written.time_c_6[current_session_vwap_at]); current_session_vwap_at = current_session_vwap_at + 1
  :: else -> break
  od;
  assert(current_session_vwap_read.second_reserved_1 == current_session_vwap_written.second_reserved_1);
  skip
}

/* ---- Vwap Message: 50 bytes -------------------------------------------------- */

/* In this tag, by-issue Volume Weighted Stock Price average (VWAP) Information is set. This tag appears as part of realtime data. */
typedef VwapMessage {
  byte reserved_2[2];
  AllDayVwap all_day_vwap;
  CurrentSessionVwap current_session_vwap
};

int vwap_message_at;

/* every byte of Vwap Message set to one value */
inline fill_vwap_message(vwap_message_record, vwap_message_value) {
  vwap_message_at = 0;
  do
  :: vwap_message_at < 2 -> vwap_message_record.reserved_2[vwap_message_at] = vwap_message_value; vwap_message_at = vwap_message_at + 1
  :: else -> break
  od;
  fill_all_day_vwap(vwap_message_record.all_day_vwap, vwap_message_value);
  fill_current_session_vwap(vwap_message_record.current_session_vwap, vwap_message_value);
  skip
}

/* each byte of Vwap Message set to where it lies, so a field read out of place says so */
inline ramp_vwap_message(vwap_message_record, vwap_message_base) {
  vwap_message_at = 0;
  do
  :: vwap_message_at < 2 -> vwap_message_record.reserved_2[vwap_message_at] = (vwap_message_base + 0 + vwap_message_at + 1) % 256; vwap_message_at = vwap_message_at + 1
  :: else -> break
  od;
  ramp_all_day_vwap(vwap_message_record.all_day_vwap, vwap_message_base + 2);
  ramp_current_session_vwap(vwap_message_record.current_session_vwap, vwap_message_base + 26);
  skip
}

/* Vwap Message to the wire, 50 bytes from where the cursor stands */
inline encode_vwap_message(vwap_message_record) {
  vwap_message_at = 0;
  do
  :: vwap_message_at < 2 -> wire[at] = vwap_message_record.reserved_2[vwap_message_at]; at = at + 1; vwap_message_at = vwap_message_at + 1
  :: else -> break
  od;
  encode_all_day_vwap(vwap_message_record.all_day_vwap);
  encode_current_session_vwap(vwap_message_record.current_session_vwap);
  skip
}

/* Vwap Message off the wire, 50 bytes from where the cursor stands */
inline decode_vwap_message(vwap_message_record) {
  vwap_message_at = 0;
  do
  :: vwap_message_at < 2 -> vwap_message_record.reserved_2[vwap_message_at] = wire[at]; at = at + 1; vwap_message_at = vwap_message_at + 1
  :: else -> break
  od;
  decode_all_day_vwap(vwap_message_record.all_day_vwap);
  decode_current_session_vwap(vwap_message_record.current_session_vwap);
  skip
}

/* what was read of Vwap Message is what was written, byte for byte */
inline equal_vwap_message(vwap_message_read, vwap_message_written) {
  vwap_message_at = 0;
  do
  :: vwap_message_at < 2 -> assert(vwap_message_read.reserved_2[vwap_message_at] == vwap_message_written.reserved_2[vwap_message_at]); vwap_message_at = vwap_message_at + 1
  :: else -> break
  od;
  equal_all_day_vwap(vwap_message_read.all_day_vwap, vwap_message_written.all_day_vwap);
  equal_current_session_vwap(vwap_message_read.current_session_vwap, vwap_message_written.current_session_vwap);
  skip
}

/* ---- Parity Estimated Price: 23 bytes ---------------------------------------- */

/* Parity/Estimated Price */
typedef ParityEstimatedPrice {
  byte unit_flag;
  byte parity_estimated_price_c_14[14];
  byte sign;
  byte time_c_6[6];
  byte reserved_1
};

int parity_estimated_price_at;

/* every byte of Parity Estimated Price set to one value */
inline fill_parity_estimated_price(parity_estimated_price_record, parity_estimated_price_value) {
  parity_estimated_price_record.unit_flag = parity_estimated_price_value;
  parity_estimated_price_at = 0;
  do
  :: parity_estimated_price_at < 14 -> parity_estimated_price_record.parity_estimated_price_c_14[parity_estimated_price_at] = parity_estimated_price_value; parity_estimated_price_at = parity_estimated_price_at + 1
  :: else -> break
  od;
  parity_estimated_price_record.sign = parity_estimated_price_value;
  parity_estimated_price_at = 0;
  do
  :: parity_estimated_price_at < 6 -> parity_estimated_price_record.time_c_6[parity_estimated_price_at] = parity_estimated_price_value; parity_estimated_price_at = parity_estimated_price_at + 1
  :: else -> break
  od;
  parity_estimated_price_record.reserved_1 = parity_estimated_price_value;
  skip
}

/* each byte of Parity Estimated Price set to where it lies, so a field read out of place says so */
inline ramp_parity_estimated_price(parity_estimated_price_record, parity_estimated_price_base) {
  parity_estimated_price_record.unit_flag = (parity_estimated_price_base + 0 + 1) % 256;
  parity_estimated_price_at = 0;
  do
  :: parity_estimated_price_at < 14 -> parity_estimated_price_record.parity_estimated_price_c_14[parity_estimated_price_at] = (parity_estimated_price_base + 1 + parity_estimated_price_at + 1) % 256; parity_estimated_price_at = parity_estimated_price_at + 1
  :: else -> break
  od;
  parity_estimated_price_record.sign = (parity_estimated_price_base + 15 + 1) % 256;
  parity_estimated_price_at = 0;
  do
  :: parity_estimated_price_at < 6 -> parity_estimated_price_record.time_c_6[parity_estimated_price_at] = (parity_estimated_price_base + 16 + parity_estimated_price_at + 1) % 256; parity_estimated_price_at = parity_estimated_price_at + 1
  :: else -> break
  od;
  parity_estimated_price_record.reserved_1 = (parity_estimated_price_base + 22 + 1) % 256;
  skip
}

/* Parity Estimated Price to the wire, 23 bytes from where the cursor stands */
inline encode_parity_estimated_price(parity_estimated_price_record) {
  wire[at] = parity_estimated_price_record.unit_flag; at = at + 1;
  parity_estimated_price_at = 0;
  do
  :: parity_estimated_price_at < 14 -> wire[at] = parity_estimated_price_record.parity_estimated_price_c_14[parity_estimated_price_at]; at = at + 1; parity_estimated_price_at = parity_estimated_price_at + 1
  :: else -> break
  od;
  wire[at] = parity_estimated_price_record.sign; at = at + 1;
  parity_estimated_price_at = 0;
  do
  :: parity_estimated_price_at < 6 -> wire[at] = parity_estimated_price_record.time_c_6[parity_estimated_price_at]; at = at + 1; parity_estimated_price_at = parity_estimated_price_at + 1
  :: else -> break
  od;
  wire[at] = parity_estimated_price_record.reserved_1; at = at + 1;
  skip
}

/* Parity Estimated Price off the wire, 23 bytes from where the cursor stands */
inline decode_parity_estimated_price(parity_estimated_price_record) {
  parity_estimated_price_record.unit_flag = wire[at]; at = at + 1;
  parity_estimated_price_at = 0;
  do
  :: parity_estimated_price_at < 14 -> parity_estimated_price_record.parity_estimated_price_c_14[parity_estimated_price_at] = wire[at]; at = at + 1; parity_estimated_price_at = parity_estimated_price_at + 1
  :: else -> break
  od;
  parity_estimated_price_record.sign = wire[at]; at = at + 1;
  parity_estimated_price_at = 0;
  do
  :: parity_estimated_price_at < 6 -> parity_estimated_price_record.time_c_6[parity_estimated_price_at] = wire[at]; at = at + 1; parity_estimated_price_at = parity_estimated_price_at + 1
  :: else -> break
  od;
  parity_estimated_price_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Parity Estimated Price is what was written, byte for byte */
inline equal_parity_estimated_price(parity_estimated_price_read, parity_estimated_price_written) {
  assert(parity_estimated_price_read.unit_flag == parity_estimated_price_written.unit_flag);
  parity_estimated_price_at = 0;
  do
  :: parity_estimated_price_at < 14 -> assert(parity_estimated_price_read.parity_estimated_price_c_14[parity_estimated_price_at] == parity_estimated_price_written.parity_estimated_price_c_14[parity_estimated_price_at]); parity_estimated_price_at = parity_estimated_price_at + 1
  :: else -> break
  od;
  assert(parity_estimated_price_read.sign == parity_estimated_price_written.sign);
  parity_estimated_price_at = 0;
  do
  :: parity_estimated_price_at < 6 -> assert(parity_estimated_price_read.time_c_6[parity_estimated_price_at] == parity_estimated_price_written.time_c_6[parity_estimated_price_at]); parity_estimated_price_at = parity_estimated_price_at + 1
  :: else -> break
  od;
  assert(parity_estimated_price_read.reserved_1 == parity_estimated_price_written.reserved_1);
  skip
}

/* ---- Parity Message: 25 bytes ------------------------------------------------ */

/* In this tag, estimated Price Information for parity of CB is set. This tag appears as part of realtime data. */
typedef ParityMessage {
  byte reserved_2[2];
  ParityEstimatedPrice parity_estimated_price
};

int parity_message_at;

/* every byte of Parity Message set to one value */
inline fill_parity_message(parity_message_record, parity_message_value) {
  parity_message_at = 0;
  do
  :: parity_message_at < 2 -> parity_message_record.reserved_2[parity_message_at] = parity_message_value; parity_message_at = parity_message_at + 1
  :: else -> break
  od;
  fill_parity_estimated_price(parity_message_record.parity_estimated_price, parity_message_value);
  skip
}

/* each byte of Parity Message set to where it lies, so a field read out of place says so */
inline ramp_parity_message(parity_message_record, parity_message_base) {
  parity_message_at = 0;
  do
  :: parity_message_at < 2 -> parity_message_record.reserved_2[parity_message_at] = (parity_message_base + 0 + parity_message_at + 1) % 256; parity_message_at = parity_message_at + 1
  :: else -> break
  od;
  ramp_parity_estimated_price(parity_message_record.parity_estimated_price, parity_message_base + 2);
  skip
}

/* Parity Message to the wire, 25 bytes from where the cursor stands */
inline encode_parity_message(parity_message_record) {
  parity_message_at = 0;
  do
  :: parity_message_at < 2 -> wire[at] = parity_message_record.reserved_2[parity_message_at]; at = at + 1; parity_message_at = parity_message_at + 1
  :: else -> break
  od;
  encode_parity_estimated_price(parity_message_record.parity_estimated_price);
  skip
}

/* Parity Message off the wire, 25 bytes from where the cursor stands */
inline decode_parity_message(parity_message_record) {
  parity_message_at = 0;
  do
  :: parity_message_at < 2 -> parity_message_record.reserved_2[parity_message_at] = wire[at]; at = at + 1; parity_message_at = parity_message_at + 1
  :: else -> break
  od;
  decode_parity_estimated_price(parity_message_record.parity_estimated_price);
  skip
}

/* what was read of Parity Message is what was written, byte for byte */
inline equal_parity_message(parity_message_read, parity_message_written) {
  parity_message_at = 0;
  do
  :: parity_message_at < 2 -> assert(parity_message_read.reserved_2[parity_message_at] == parity_message_written.reserved_2[parity_message_at]); parity_message_at = parity_message_at + 1
  :: else -> break
  od;
  equal_parity_estimated_price(parity_message_read.parity_estimated_price, parity_message_written.parity_estimated_price);
  skip
}

/* ---- Direct Yield: 9 bytes --------------------------------------------------- */

/* Direct Yield */
typedef DirectYield {
  byte direct_yield_c_8[8];
  byte sign
};

int direct_yield_at;

/* every byte of Direct Yield set to one value */
inline fill_direct_yield(direct_yield_record, direct_yield_value) {
  direct_yield_at = 0;
  do
  :: direct_yield_at < 8 -> direct_yield_record.direct_yield_c_8[direct_yield_at] = direct_yield_value; direct_yield_at = direct_yield_at + 1
  :: else -> break
  od;
  direct_yield_record.sign = direct_yield_value;
  skip
}

/* each byte of Direct Yield set to where it lies, so a field read out of place says so */
inline ramp_direct_yield(direct_yield_record, direct_yield_base) {
  direct_yield_at = 0;
  do
  :: direct_yield_at < 8 -> direct_yield_record.direct_yield_c_8[direct_yield_at] = (direct_yield_base + 0 + direct_yield_at + 1) % 256; direct_yield_at = direct_yield_at + 1
  :: else -> break
  od;
  direct_yield_record.sign = (direct_yield_base + 8 + 1) % 256;
  skip
}

/* Direct Yield to the wire, 9 bytes from where the cursor stands */
inline encode_direct_yield(direct_yield_record) {
  direct_yield_at = 0;
  do
  :: direct_yield_at < 8 -> wire[at] = direct_yield_record.direct_yield_c_8[direct_yield_at]; at = at + 1; direct_yield_at = direct_yield_at + 1
  :: else -> break
  od;
  wire[at] = direct_yield_record.sign; at = at + 1;
  skip
}

/* Direct Yield off the wire, 9 bytes from where the cursor stands */
inline decode_direct_yield(direct_yield_record) {
  direct_yield_at = 0;
  do
  :: direct_yield_at < 8 -> direct_yield_record.direct_yield_c_8[direct_yield_at] = wire[at]; at = at + 1; direct_yield_at = direct_yield_at + 1
  :: else -> break
  od;
  direct_yield_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Direct Yield is what was written, byte for byte */
inline equal_direct_yield(direct_yield_read, direct_yield_written) {
  direct_yield_at = 0;
  do
  :: direct_yield_at < 8 -> assert(direct_yield_read.direct_yield_c_8[direct_yield_at] == direct_yield_written.direct_yield_c_8[direct_yield_at]); direct_yield_at = direct_yield_at + 1
  :: else -> break
  od;
  assert(direct_yield_read.sign == direct_yield_written.sign);
  skip
}

/* ---- Final Yield: 9 bytes ---------------------------------------------------- */

/* Final Yield */
typedef FinalYield {
  byte final_yield_c_8[8];
  byte sign
};

int final_yield_at;

/* every byte of Final Yield set to one value */
inline fill_final_yield(final_yield_record, final_yield_value) {
  final_yield_at = 0;
  do
  :: final_yield_at < 8 -> final_yield_record.final_yield_c_8[final_yield_at] = final_yield_value; final_yield_at = final_yield_at + 1
  :: else -> break
  od;
  final_yield_record.sign = final_yield_value;
  skip
}

/* each byte of Final Yield set to where it lies, so a field read out of place says so */
inline ramp_final_yield(final_yield_record, final_yield_base) {
  final_yield_at = 0;
  do
  :: final_yield_at < 8 -> final_yield_record.final_yield_c_8[final_yield_at] = (final_yield_base + 0 + final_yield_at + 1) % 256; final_yield_at = final_yield_at + 1
  :: else -> break
  od;
  final_yield_record.sign = (final_yield_base + 8 + 1) % 256;
  skip
}

/* Final Yield to the wire, 9 bytes from where the cursor stands */
inline encode_final_yield(final_yield_record) {
  final_yield_at = 0;
  do
  :: final_yield_at < 8 -> wire[at] = final_yield_record.final_yield_c_8[final_yield_at]; at = at + 1; final_yield_at = final_yield_at + 1
  :: else -> break
  od;
  wire[at] = final_yield_record.sign; at = at + 1;
  skip
}

/* Final Yield off the wire, 9 bytes from where the cursor stands */
inline decode_final_yield(final_yield_record) {
  final_yield_at = 0;
  do
  :: final_yield_at < 8 -> final_yield_record.final_yield_c_8[final_yield_at] = wire[at]; at = at + 1; final_yield_at = final_yield_at + 1
  :: else -> break
  od;
  final_yield_record.sign = wire[at]; at = at + 1;
  skip
}

/* what was read of Final Yield is what was written, byte for byte */
inline equal_final_yield(final_yield_read, final_yield_written) {
  final_yield_at = 0;
  do
  :: final_yield_at < 8 -> assert(final_yield_read.final_yield_c_8[final_yield_at] == final_yield_written.final_yield_c_8[final_yield_at]); final_yield_at = final_yield_at + 1
  :: else -> break
  od;
  assert(final_yield_read.sign == final_yield_written.sign);
  skip
}

/* ---- Yield Message: 27 bytes ------------------------------------------------- */

/* In this tag, Direct and Final Yield Information for CB is set. This tag appears as part of realtime data. */
typedef YieldMessage {
  byte reserved_2[2];
  DirectYield direct_yield;
  FinalYield final_yield;
  byte time_c_6[6];
  byte reserved_1
};

int yield_message_at;

/* every byte of Yield Message set to one value */
inline fill_yield_message(yield_message_record, yield_message_value) {
  yield_message_at = 0;
  do
  :: yield_message_at < 2 -> yield_message_record.reserved_2[yield_message_at] = yield_message_value; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  fill_direct_yield(yield_message_record.direct_yield, yield_message_value);
  fill_final_yield(yield_message_record.final_yield, yield_message_value);
  yield_message_at = 0;
  do
  :: yield_message_at < 6 -> yield_message_record.time_c_6[yield_message_at] = yield_message_value; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_record.reserved_1 = yield_message_value;
  skip
}

/* each byte of Yield Message set to where it lies, so a field read out of place says so */
inline ramp_yield_message(yield_message_record, yield_message_base) {
  yield_message_at = 0;
  do
  :: yield_message_at < 2 -> yield_message_record.reserved_2[yield_message_at] = (yield_message_base + 0 + yield_message_at + 1) % 256; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  ramp_direct_yield(yield_message_record.direct_yield, yield_message_base + 2);
  ramp_final_yield(yield_message_record.final_yield, yield_message_base + 11);
  yield_message_at = 0;
  do
  :: yield_message_at < 6 -> yield_message_record.time_c_6[yield_message_at] = (yield_message_base + 20 + yield_message_at + 1) % 256; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_record.reserved_1 = (yield_message_base + 26 + 1) % 256;
  skip
}

/* Yield Message to the wire, 27 bytes from where the cursor stands */
inline encode_yield_message(yield_message_record) {
  yield_message_at = 0;
  do
  :: yield_message_at < 2 -> wire[at] = yield_message_record.reserved_2[yield_message_at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  encode_direct_yield(yield_message_record.direct_yield);
  encode_final_yield(yield_message_record.final_yield);
  yield_message_at = 0;
  do
  :: yield_message_at < 6 -> wire[at] = yield_message_record.time_c_6[yield_message_at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  wire[at] = yield_message_record.reserved_1; at = at + 1;
  skip
}

/* Yield Message off the wire, 27 bytes from where the cursor stands */
inline decode_yield_message(yield_message_record) {
  yield_message_at = 0;
  do
  :: yield_message_at < 2 -> yield_message_record.reserved_2[yield_message_at] = wire[at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  decode_direct_yield(yield_message_record.direct_yield);
  decode_final_yield(yield_message_record.final_yield);
  yield_message_at = 0;
  do
  :: yield_message_at < 6 -> yield_message_record.time_c_6[yield_message_at] = wire[at]; at = at + 1; yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  yield_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Yield Message is what was written, byte for byte */
inline equal_yield_message(yield_message_read, yield_message_written) {
  yield_message_at = 0;
  do
  :: yield_message_at < 2 -> assert(yield_message_read.reserved_2[yield_message_at] == yield_message_written.reserved_2[yield_message_at]); yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  equal_direct_yield(yield_message_read.direct_yield, yield_message_written.direct_yield);
  equal_final_yield(yield_message_read.final_yield, yield_message_written.final_yield);
  yield_message_at = 0;
  do
  :: yield_message_at < 6 -> assert(yield_message_read.time_c_6[yield_message_at] == yield_message_written.time_c_6[yield_message_at]); yield_message_at = yield_message_at + 1
  :: else -> break
  od;
  assert(yield_message_read.reserved_1 == yield_message_written.reserved_1);
  skip
}

/* ---- Control Message: 10 bytes ----------------------------------------------- */

/* In this tag, the Test Mode Flag and the Start/End Flag that are used in a Control Message are set. This tag appears as part of a Control Message. */
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

/* Update No Message: encoded, read back, and compared */
proctype check_update_no_message() {
  UpdateNoMessage update_no_message_sent;
  UpdateNoMessage update_no_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_update_no_message(update_no_message_sent, 0)
  :: pattern == 1 -> fill_update_no_message(update_no_message_sent, 32)
  :: pattern == 2 -> fill_update_no_message(update_no_message_sent, 255)
  :: else -> ramp_update_no_message(update_no_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_update_no_message(update_no_message_sent);
    assert(at == 8);
    at = 0;
    decode_update_no_message(update_no_message_got);
    assert(at == 8);
    equal_update_no_message(update_no_message_got, update_no_message_sent)
  }
}

/* Status Information: encoded, read back, and compared */
proctype check_status_information() {
  StatusInformation status_information_sent;
  StatusInformation status_information_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_status_information(status_information_sent, 0)
  :: pattern == 1 -> fill_status_information(status_information_sent, 32)
  :: pattern == 2 -> fill_status_information(status_information_sent, 255)
  :: else -> ramp_status_information(status_information_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_status_information(status_information_sent);
    assert(at == 5);
    at = 0;
    decode_status_information(status_information_got);
    assert(at == 5);
    equal_status_information(status_information_got, status_information_sent)
  }
}

/* Status Information Message: encoded, read back, and compared */
proctype check_status_information_message() {
  StatusInformationMessage status_information_message_sent;
  StatusInformationMessage status_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_status_information_message(status_information_message_sent, 0)
  :: pattern == 1 -> fill_status_information_message(status_information_message_sent, 32)
  :: pattern == 2 -> fill_status_information_message(status_information_message_sent, 255)
  :: else -> ramp_status_information_message(status_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_status_information_message(status_information_message_sent);
    assert(at == 24);
    at = 0;
    decode_status_information_message(status_information_message_got);
    assert(at == 24);
    equal_status_information_message(status_information_message_got, status_information_message_sent)
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
    assert(at == 16);
    at = 0;
    decode_price(price_got);
    assert(at == 16);
    equal_price(price_got, price_sent)
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

/* High: encoded, read back, and compared */
proctype check_high() {
  High high_sent;
  High high_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_high(high_sent, 0)
  :: pattern == 1 -> fill_high(high_sent, 32)
  :: pattern == 2 -> fill_high(high_sent, 255)
  :: else -> ramp_high(high_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_high(high_sent);
    assert(at == 24);
    at = 0;
    decode_high(high_got);
    assert(at == 24);
    equal_high(high_got, high_sent)
  }
}

/* Low: encoded, read back, and compared */
proctype check_low() {
  Low low_sent;
  Low low_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_low(low_sent, 0)
  :: pattern == 1 -> fill_low(low_sent, 32)
  :: pattern == 2 -> fill_low(low_sent, 255)
  :: else -> ramp_low(low_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_low(low_sent);
    assert(at == 24);
    at = 0;
    decode_low(low_got);
    assert(at == 24);
    equal_low(low_got, low_sent)
  }
}

/* Current: encoded, read back, and compared */
proctype check_current() {
  Current current_sent;
  Current current_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_current(current_sent, 0)
  :: pattern == 1 -> fill_current(current_sent, 32)
  :: pattern == 2 -> fill_current(current_sent, 255)
  :: else -> ramp_current(current_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_current(current_sent);
    assert(at == 32);
    at = 0;
    decode_current(current_got);
    assert(at == 32);
    equal_current(current_got, current_sent)
  }
}

/* Open High Low And Current Price Message: encoded, read back, and compared */
proctype check_open_high_low_and_current_price_message() {
  OpenHighLowAndCurrentPriceMessage open_high_low_and_current_price_message_sent;
  OpenHighLowAndCurrentPriceMessage open_high_low_and_current_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_high_low_and_current_price_message(open_high_low_and_current_price_message_sent, 0)
  :: pattern == 1 -> fill_open_high_low_and_current_price_message(open_high_low_and_current_price_message_sent, 32)
  :: pattern == 2 -> fill_open_high_low_and_current_price_message(open_high_low_and_current_price_message_sent, 255)
  :: else -> ramp_open_high_low_and_current_price_message(open_high_low_and_current_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_high_low_and_current_price_message(open_high_low_and_current_price_message_sent);
    assert(at == 105);
    at = 0;
    decode_open_high_low_and_current_price_message(open_high_low_and_current_price_message_got);
    assert(at == 105);
    equal_open_high_low_and_current_price_message(open_high_low_and_current_price_message_got, open_high_low_and_current_price_message_sent)
  }
}

/* Quote Quantity: encoded, read back, and compared */
proctype check_quote_quantity() {
  QuoteQuantity quote_quantity_sent;
  QuoteQuantity quote_quantity_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_quantity(quote_quantity_sent, 0)
  :: pattern == 1 -> fill_quote_quantity(quote_quantity_sent, 32)
  :: pattern == 2 -> fill_quote_quantity(quote_quantity_sent, 255)
  :: else -> ramp_quote_quantity(quote_quantity_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_quantity(quote_quantity_sent);
    assert(at == 16);
    at = 0;
    decode_quote_quantity(quote_quantity_got);
    assert(at == 16);
    equal_quote_quantity(quote_quantity_got, quote_quantity_sent)
  }
}

/* Ask Quote: encoded, read back, and compared */
proctype check_ask_quote() {
  AskQuote ask_quote_sent;
  AskQuote ask_quote_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ask_quote(ask_quote_sent, 0)
  :: pattern == 1 -> fill_ask_quote(ask_quote_sent, 32)
  :: pattern == 2 -> fill_ask_quote(ask_quote_sent, 255)
  :: else -> ramp_ask_quote(ask_quote_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ask_quote(ask_quote_sent);
    assert(at == 46);
    at = 0;
    decode_ask_quote(ask_quote_got);
    assert(at == 46);
    equal_ask_quote(ask_quote_got, ask_quote_sent)
  }
}

/* Bid Quote: encoded, read back, and compared */
proctype check_bid_quote() {
  BidQuote bid_quote_sent;
  BidQuote bid_quote_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bid_quote(bid_quote_sent, 0)
  :: pattern == 1 -> fill_bid_quote(bid_quote_sent, 32)
  :: pattern == 2 -> fill_bid_quote(bid_quote_sent, 255)
  :: else -> ramp_bid_quote(bid_quote_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bid_quote(bid_quote_sent);
    assert(at == 46);
    at = 0;
    decode_bid_quote(bid_quote_got);
    assert(at == 46);
    equal_bid_quote(bid_quote_got, bid_quote_sent)
  }
}

/* Quote 1 Message: encoded, read back, and compared */
proctype check_quote1_message() {
  Quote1Message quote1_message_sent;
  Quote1Message quote1_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote1_message(quote1_message_sent, 0)
  :: pattern == 1 -> fill_quote1_message(quote1_message_sent, 32)
  :: pattern == 2 -> fill_quote1_message(quote1_message_sent, 255)
  :: else -> ramp_quote1_message(quote1_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote1_message(quote1_message_sent);
    assert(at == 94);
    at = 0;
    decode_quote1_message(quote1_message_got);
    assert(at == 94);
    equal_quote1_message(quote1_message_got, quote1_message_sent)
  }
}

/* Quote 2 Message: encoded, read back, and compared */
proctype check_quote2_message() {
  Quote2Message quote2_message_sent;
  Quote2Message quote2_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote2_message(quote2_message_sent, 0)
  :: pattern == 1 -> fill_quote2_message(quote2_message_sent, 32)
  :: pattern == 2 -> fill_quote2_message(quote2_message_sent, 255)
  :: else -> ramp_quote2_message(quote2_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote2_message(quote2_message_sent);
    assert(at == 94);
    at = 0;
    decode_quote2_message(quote2_message_got);
    assert(at == 94);
    equal_quote2_message(quote2_message_got, quote2_message_sent)
  }
}

/* Quote 3 Message: encoded, read back, and compared */
proctype check_quote3_message() {
  Quote3Message quote3_message_sent;
  Quote3Message quote3_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote3_message(quote3_message_sent, 0)
  :: pattern == 1 -> fill_quote3_message(quote3_message_sent, 32)
  :: pattern == 2 -> fill_quote3_message(quote3_message_sent, 255)
  :: else -> ramp_quote3_message(quote3_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote3_message(quote3_message_sent);
    assert(at == 94);
    at = 0;
    decode_quote3_message(quote3_message_got);
    assert(at == 94);
    equal_quote3_message(quote3_message_got, quote3_message_sent)
  }
}

/* Quote 4 Message: encoded, read back, and compared */
proctype check_quote4_message() {
  Quote4Message quote4_message_sent;
  Quote4Message quote4_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote4_message(quote4_message_sent, 0)
  :: pattern == 1 -> fill_quote4_message(quote4_message_sent, 32)
  :: pattern == 2 -> fill_quote4_message(quote4_message_sent, 255)
  :: else -> ramp_quote4_message(quote4_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote4_message(quote4_message_sent);
    assert(at == 94);
    at = 0;
    decode_quote4_message(quote4_message_got);
    assert(at == 94);
    equal_quote4_message(quote4_message_got, quote4_message_sent)
  }
}

/* Quote 5 Message: encoded, read back, and compared */
proctype check_quote5_message() {
  Quote5Message quote5_message_sent;
  Quote5Message quote5_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote5_message(quote5_message_sent, 0)
  :: pattern == 1 -> fill_quote5_message(quote5_message_sent, 32)
  :: pattern == 2 -> fill_quote5_message(quote5_message_sent, 255)
  :: else -> ramp_quote5_message(quote5_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote5_message(quote5_message_sent);
    assert(at == 94);
    at = 0;
    decode_quote5_message(quote5_message_got);
    assert(at == 94);
    equal_quote5_message(quote5_message_got, quote5_message_sent)
  }
}

/* Quote 6 Message: encoded, read back, and compared */
proctype check_quote6_message() {
  Quote6Message quote6_message_sent;
  Quote6Message quote6_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote6_message(quote6_message_sent, 0)
  :: pattern == 1 -> fill_quote6_message(quote6_message_sent, 32)
  :: pattern == 2 -> fill_quote6_message(quote6_message_sent, 255)
  :: else -> ramp_quote6_message(quote6_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote6_message(quote6_message_sent);
    assert(at == 94);
    at = 0;
    decode_quote6_message(quote6_message_got);
    assert(at == 94);
    equal_quote6_message(quote6_message_got, quote6_message_sent)
  }
}

/* Quote 7 Message: encoded, read back, and compared */
proctype check_quote7_message() {
  Quote7Message quote7_message_sent;
  Quote7Message quote7_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote7_message(quote7_message_sent, 0)
  :: pattern == 1 -> fill_quote7_message(quote7_message_sent, 32)
  :: pattern == 2 -> fill_quote7_message(quote7_message_sent, 255)
  :: else -> ramp_quote7_message(quote7_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote7_message(quote7_message_sent);
    assert(at == 94);
    at = 0;
    decode_quote7_message(quote7_message_got);
    assert(at == 94);
    equal_quote7_message(quote7_message_got, quote7_message_sent)
  }
}

/* Quote 8 Message: encoded, read back, and compared */
proctype check_quote8_message() {
  Quote8Message quote8_message_sent;
  Quote8Message quote8_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote8_message(quote8_message_sent, 0)
  :: pattern == 1 -> fill_quote8_message(quote8_message_sent, 32)
  :: pattern == 2 -> fill_quote8_message(quote8_message_sent, 255)
  :: else -> ramp_quote8_message(quote8_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote8_message(quote8_message_sent);
    assert(at == 94);
    at = 0;
    decode_quote8_message(quote8_message_got);
    assert(at == 94);
    equal_quote8_message(quote8_message_got, quote8_message_sent)
  }
}

/* Quote 9 Message: encoded, read back, and compared */
proctype check_quote9_message() {
  Quote9Message quote9_message_sent;
  Quote9Message quote9_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote9_message(quote9_message_sent, 0)
  :: pattern == 1 -> fill_quote9_message(quote9_message_sent, 32)
  :: pattern == 2 -> fill_quote9_message(quote9_message_sent, 255)
  :: else -> ramp_quote9_message(quote9_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote9_message(quote9_message_sent);
    assert(at == 94);
    at = 0;
    decode_quote9_message(quote9_message_got);
    assert(at == 94);
    equal_quote9_message(quote9_message_got, quote9_message_sent)
  }
}

/* Quote 10 Message: encoded, read back, and compared */
proctype check_quote10_message() {
  Quote10Message quote10_message_sent;
  Quote10Message quote10_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote10_message(quote10_message_sent, 0)
  :: pattern == 1 -> fill_quote10_message(quote10_message_sent, 32)
  :: pattern == 2 -> fill_quote10_message(quote10_message_sent, 255)
  :: else -> ramp_quote10_message(quote10_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote10_message(quote10_message_sent);
    assert(at == 94);
    at = 0;
    decode_quote10_message(quote10_message_got);
    assert(at == 94);
    equal_quote10_message(quote10_message_got, quote10_message_sent)
  }
}

/* Sell Order: encoded, read back, and compared */
proctype check_sell_order() {
  SellOrder sell_order_sent;
  SellOrder sell_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sell_order(sell_order_sent, 0)
  :: pattern == 1 -> fill_sell_order(sell_order_sent, 32)
  :: pattern == 2 -> fill_sell_order(sell_order_sent, 255)
  :: else -> ramp_sell_order(sell_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sell_order(sell_order_sent);
    assert(at == 29);
    at = 0;
    decode_sell_order(sell_order_got);
    assert(at == 29);
    equal_sell_order(sell_order_got, sell_order_sent)
  }
}

/* Buy Order: encoded, read back, and compared */
proctype check_buy_order() {
  BuyOrder buy_order_sent;
  BuyOrder buy_order_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_buy_order(buy_order_sent, 0)
  :: pattern == 1 -> fill_buy_order(buy_order_sent, 32)
  :: pattern == 2 -> fill_buy_order(buy_order_sent, 255)
  :: else -> ramp_buy_order(buy_order_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_buy_order(buy_order_sent);
    assert(at == 29);
    at = 0;
    decode_buy_order(buy_order_got);
    assert(at == 29);
    equal_buy_order(buy_order_got, buy_order_sent)
  }
}

/* Market Order Message: encoded, read back, and compared */
proctype check_market_order_message() {
  MarketOrderMessage market_order_message_sent;
  MarketOrderMessage market_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_order_message(market_order_message_sent, 0)
  :: pattern == 1 -> fill_market_order_message(market_order_message_sent, 32)
  :: pattern == 2 -> fill_market_order_message(market_order_message_sent, 255)
  :: else -> ramp_market_order_message(market_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_order_message(market_order_message_sent);
    assert(at == 60);
    at = 0;
    decode_market_order_message(market_order_message_got);
    assert(at == 60);
    equal_market_order_message(market_order_message_got, market_order_message_sent)
  }
}

/* Over Quote: encoded, read back, and compared */
proctype check_over_quote() {
  OverQuote over_quote_sent;
  OverQuote over_quote_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_over_quote(over_quote_sent, 0)
  :: pattern == 1 -> fill_over_quote(over_quote_sent, 32)
  :: pattern == 2 -> fill_over_quote(over_quote_sent, 255)
  :: else -> ramp_over_quote(over_quote_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_over_quote(over_quote_sent);
    assert(at == 29);
    at = 0;
    decode_over_quote(over_quote_got);
    assert(at == 29);
    equal_over_quote(over_quote_got, over_quote_sent)
  }
}

/* Under Quote: encoded, read back, and compared */
proctype check_under_quote() {
  UnderQuote under_quote_sent;
  UnderQuote under_quote_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_under_quote(under_quote_sent, 0)
  :: pattern == 1 -> fill_under_quote(under_quote_sent, 32)
  :: pattern == 2 -> fill_under_quote(under_quote_sent, 255)
  :: else -> ramp_under_quote(under_quote_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_under_quote(under_quote_sent);
    assert(at == 29);
    at = 0;
    decode_under_quote(under_quote_got);
    assert(at == 29);
    equal_under_quote(under_quote_got, under_quote_sent)
  }
}

/* Over Under Message: encoded, read back, and compared */
proctype check_over_under_message() {
  OverUnderMessage over_under_message_sent;
  OverUnderMessage over_under_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_over_under_message(over_under_message_sent, 0)
  :: pattern == 1 -> fill_over_under_message(over_under_message_sent, 32)
  :: pattern == 2 -> fill_over_under_message(over_under_message_sent, 255)
  :: else -> ramp_over_under_message(over_under_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_over_under_message(over_under_message_sent);
    assert(at == 60);
    at = 0;
    decode_over_under_message(over_under_message_got);
    assert(at == 60);
    equal_over_under_message(over_under_message_got, over_under_message_sent)
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
    assert(at == 23);
    at = 0;
    decode_trading_volume(trading_volume_got);
    assert(at == 23);
    equal_trading_volume(trading_volume_got, trading_volume_sent)
  }
}

/* Trading Volume Message: encoded, read back, and compared */
proctype check_trading_volume_message() {
  TradingVolumeMessage trading_volume_message_sent;
  TradingVolumeMessage trading_volume_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_volume_message(trading_volume_message_sent, 0)
  :: pattern == 1 -> fill_trading_volume_message(trading_volume_message_sent, 32)
  :: pattern == 2 -> fill_trading_volume_message(trading_volume_message_sent, 255)
  :: else -> ramp_trading_volume_message(trading_volume_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_volume_message(trading_volume_message_sent);
    assert(at == 25);
    at = 0;
    decode_trading_volume_message(trading_volume_message_got);
    assert(at == 25);
    equal_trading_volume_message(trading_volume_message_got, trading_volume_message_sent)
  }
}

/* Turnover In Yen Value: encoded, read back, and compared */
proctype check_turnover_in_yen_value() {
  TurnoverInYenValue turnover_in_yen_value_sent;
  TurnoverInYenValue turnover_in_yen_value_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_turnover_in_yen_value(turnover_in_yen_value_sent, 0)
  :: pattern == 1 -> fill_turnover_in_yen_value(turnover_in_yen_value_sent, 32)
  :: pattern == 2 -> fill_turnover_in_yen_value(turnover_in_yen_value_sent, 255)
  :: else -> ramp_turnover_in_yen_value(turnover_in_yen_value_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_turnover_in_yen_value(turnover_in_yen_value_sent);
    assert(at == 23);
    at = 0;
    decode_turnover_in_yen_value(turnover_in_yen_value_got);
    assert(at == 23);
    equal_turnover_in_yen_value(turnover_in_yen_value_got, turnover_in_yen_value_sent)
  }
}

/* Turnover Message: encoded, read back, and compared */
proctype check_turnover_message() {
  TurnoverMessage turnover_message_sent;
  TurnoverMessage turnover_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_turnover_message(turnover_message_sent, 0)
  :: pattern == 1 -> fill_turnover_message(turnover_message_sent, 32)
  :: pattern == 2 -> fill_turnover_message(turnover_message_sent, 255)
  :: else -> ramp_turnover_message(turnover_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_turnover_message(turnover_message_sent);
    assert(at == 25);
    at = 0;
    decode_turnover_message(turnover_message_got);
    assert(at == 25);
    equal_turnover_message(turnover_message_got, turnover_message_sent)
  }
}

/* All Day Vwap: encoded, read back, and compared */
proctype check_all_day_vwap() {
  AllDayVwap all_day_vwap_sent;
  AllDayVwap all_day_vwap_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_all_day_vwap(all_day_vwap_sent, 0)
  :: pattern == 1 -> fill_all_day_vwap(all_day_vwap_sent, 32)
  :: pattern == 2 -> fill_all_day_vwap(all_day_vwap_sent, 255)
  :: else -> ramp_all_day_vwap(all_day_vwap_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_all_day_vwap(all_day_vwap_sent);
    assert(at == 24);
    at = 0;
    decode_all_day_vwap(all_day_vwap_got);
    assert(at == 24);
    equal_all_day_vwap(all_day_vwap_got, all_day_vwap_sent)
  }
}

/* Current Session Vwap: encoded, read back, and compared */
proctype check_current_session_vwap() {
  CurrentSessionVwap current_session_vwap_sent;
  CurrentSessionVwap current_session_vwap_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_current_session_vwap(current_session_vwap_sent, 0)
  :: pattern == 1 -> fill_current_session_vwap(current_session_vwap_sent, 32)
  :: pattern == 2 -> fill_current_session_vwap(current_session_vwap_sent, 255)
  :: else -> ramp_current_session_vwap(current_session_vwap_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_current_session_vwap(current_session_vwap_sent);
    assert(at == 24);
    at = 0;
    decode_current_session_vwap(current_session_vwap_got);
    assert(at == 24);
    equal_current_session_vwap(current_session_vwap_got, current_session_vwap_sent)
  }
}

/* Vwap Message: encoded, read back, and compared */
proctype check_vwap_message() {
  VwapMessage vwap_message_sent;
  VwapMessage vwap_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_vwap_message(vwap_message_sent, 0)
  :: pattern == 1 -> fill_vwap_message(vwap_message_sent, 32)
  :: pattern == 2 -> fill_vwap_message(vwap_message_sent, 255)
  :: else -> ramp_vwap_message(vwap_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_vwap_message(vwap_message_sent);
    assert(at == 50);
    at = 0;
    decode_vwap_message(vwap_message_got);
    assert(at == 50);
    equal_vwap_message(vwap_message_got, vwap_message_sent)
  }
}

/* Parity Estimated Price: encoded, read back, and compared */
proctype check_parity_estimated_price() {
  ParityEstimatedPrice parity_estimated_price_sent;
  ParityEstimatedPrice parity_estimated_price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_parity_estimated_price(parity_estimated_price_sent, 0)
  :: pattern == 1 -> fill_parity_estimated_price(parity_estimated_price_sent, 32)
  :: pattern == 2 -> fill_parity_estimated_price(parity_estimated_price_sent, 255)
  :: else -> ramp_parity_estimated_price(parity_estimated_price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_parity_estimated_price(parity_estimated_price_sent);
    assert(at == 23);
    at = 0;
    decode_parity_estimated_price(parity_estimated_price_got);
    assert(at == 23);
    equal_parity_estimated_price(parity_estimated_price_got, parity_estimated_price_sent)
  }
}

/* Parity Message: encoded, read back, and compared */
proctype check_parity_message() {
  ParityMessage parity_message_sent;
  ParityMessage parity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_parity_message(parity_message_sent, 0)
  :: pattern == 1 -> fill_parity_message(parity_message_sent, 32)
  :: pattern == 2 -> fill_parity_message(parity_message_sent, 255)
  :: else -> ramp_parity_message(parity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_parity_message(parity_message_sent);
    assert(at == 25);
    at = 0;
    decode_parity_message(parity_message_got);
    assert(at == 25);
    equal_parity_message(parity_message_got, parity_message_sent)
  }
}

/* Direct Yield: encoded, read back, and compared */
proctype check_direct_yield() {
  DirectYield direct_yield_sent;
  DirectYield direct_yield_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_direct_yield(direct_yield_sent, 0)
  :: pattern == 1 -> fill_direct_yield(direct_yield_sent, 32)
  :: pattern == 2 -> fill_direct_yield(direct_yield_sent, 255)
  :: else -> ramp_direct_yield(direct_yield_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_direct_yield(direct_yield_sent);
    assert(at == 9);
    at = 0;
    decode_direct_yield(direct_yield_got);
    assert(at == 9);
    equal_direct_yield(direct_yield_got, direct_yield_sent)
  }
}

/* Final Yield: encoded, read back, and compared */
proctype check_final_yield() {
  FinalYield final_yield_sent;
  FinalYield final_yield_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_final_yield(final_yield_sent, 0)
  :: pattern == 1 -> fill_final_yield(final_yield_sent, 32)
  :: pattern == 2 -> fill_final_yield(final_yield_sent, 255)
  :: else -> ramp_final_yield(final_yield_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_final_yield(final_yield_sent);
    assert(at == 9);
    at = 0;
    decode_final_yield(final_yield_got);
    assert(at == 9);
    equal_final_yield(final_yield_got, final_yield_sent)
  }
}

/* Yield Message: encoded, read back, and compared */
proctype check_yield_message() {
  YieldMessage yield_message_sent;
  YieldMessage yield_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_yield_message(yield_message_sent, 0)
  :: pattern == 1 -> fill_yield_message(yield_message_sent, 32)
  :: pattern == 2 -> fill_yield_message(yield_message_sent, 255)
  :: else -> ramp_yield_message(yield_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_yield_message(yield_message_sent);
    assert(at == 27);
    at = 0;
    decode_yield_message(yield_message_got);
    assert(at == 27);
    equal_yield_message(yield_message_got, yield_message_sent)
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
  :: run check_update_no_message()
  :: run check_status_information()
  :: run check_status_information_message()
  :: run check_price()
  :: run check_open()
  :: run check_high()
  :: run check_low()
  :: run check_current()
  :: run check_open_high_low_and_current_price_message()
  :: run check_quote_quantity()
  :: run check_ask_quote()
  :: run check_bid_quote()
  :: run check_quote1_message()
  :: run check_quote2_message()
  :: run check_quote3_message()
  :: run check_quote4_message()
  :: run check_quote5_message()
  :: run check_quote6_message()
  :: run check_quote7_message()
  :: run check_quote8_message()
  :: run check_quote9_message()
  :: run check_quote10_message()
  :: run check_sell_order()
  :: run check_buy_order()
  :: run check_market_order_message()
  :: run check_over_quote()
  :: run check_under_quote()
  :: run check_over_under_message()
  :: run check_trading_volume()
  :: run check_trading_volume_message()
  :: run check_turnover_in_yen_value()
  :: run check_turnover_message()
  :: run check_all_day_vwap()
  :: run check_current_session_vwap()
  :: run check_vwap_message()
  :: run check_parity_estimated_price()
  :: run check_parity_message()
  :: run check_direct_yield()
  :: run check_final_yield()
  :: run check_yield_message()
  :: run check_control_message()
  fi
}
