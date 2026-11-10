/*
 * National Stock Exchange of India Ltd Order Entry
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
 *   - a Composite rule
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 170

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 40 bytes ------------------------------------------------ */

/* MESSAGE_HEADER */
typedef MessageHeader {
  byte transaction_code[2];
  byte log_time[4];
  byte alpha_char[2];
  byte trader_id[4];
  byte error_code[2];
  byte header_timestamp[8];
  byte time_stamp_1[8];
  byte time_stamp_2[8];
  byte message_length[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = (message_header_base + 6 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = (message_header_base + 8 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = (message_header_base + 12 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = (message_header_base + 14 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = (message_header_base + 22 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = (message_header_base + 30 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = (message_header_base + 38 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 40 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.transaction_code[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.log_time[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.alpha_char[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.trader_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.error_code[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.header_timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.time_stamp_1[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.time_stamp_2[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 40 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.transaction_code[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.log_time[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.alpha_char[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.trader_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.error_code[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.header_timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_1[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.time_stamp_2[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.transaction_code[message_header_at] == message_header_written.transaction_code[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.log_time[message_header_at] == message_header_written.log_time[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.alpha_char[message_header_at] == message_header_written.alpha_char[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.trader_id[message_header_at] == message_header_written.trader_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.error_code[message_header_at] == message_header_written.error_code[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.header_timestamp[message_header_at] == message_header_written.header_timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.time_stamp_1[message_header_at] == message_header_written.time_stamp_1[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.time_stamp_2[message_header_at] == message_header_written.time_stamp_2[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel On Logout Status Request Message: 12 bytes ----------------------- */

/* Sent as COL_USER_STATUS_CHANGE _IN */
typedef CancelOnLogoutStatusRequestMessage {
  byte user_id[4];
  byte colo_user_bit;
  byte reserved_7[7]
};

int cancel_on_logout_status_request_message_at;

/* every byte of Cancel On Logout Status Request Message set to one value */
inline fill_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_record, cancel_on_logout_status_request_message_value) {
  cancel_on_logout_status_request_message_at = 0;
  do
  :: cancel_on_logout_status_request_message_at < 4 -> cancel_on_logout_status_request_message_record.user_id[cancel_on_logout_status_request_message_at] = cancel_on_logout_status_request_message_value; cancel_on_logout_status_request_message_at = cancel_on_logout_status_request_message_at + 1
  :: else -> break
  od;
  cancel_on_logout_status_request_message_record.colo_user_bit = cancel_on_logout_status_request_message_value;
  cancel_on_logout_status_request_message_at = 0;
  do
  :: cancel_on_logout_status_request_message_at < 7 -> cancel_on_logout_status_request_message_record.reserved_7[cancel_on_logout_status_request_message_at] = cancel_on_logout_status_request_message_value; cancel_on_logout_status_request_message_at = cancel_on_logout_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel On Logout Status Request Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_record, cancel_on_logout_status_request_message_base) {
  cancel_on_logout_status_request_message_at = 0;
  do
  :: cancel_on_logout_status_request_message_at < 4 -> cancel_on_logout_status_request_message_record.user_id[cancel_on_logout_status_request_message_at] = (cancel_on_logout_status_request_message_base + 0 + cancel_on_logout_status_request_message_at + 1) % 256; cancel_on_logout_status_request_message_at = cancel_on_logout_status_request_message_at + 1
  :: else -> break
  od;
  cancel_on_logout_status_request_message_record.colo_user_bit = (cancel_on_logout_status_request_message_base + 4 + 1) % 256;
  cancel_on_logout_status_request_message_at = 0;
  do
  :: cancel_on_logout_status_request_message_at < 7 -> cancel_on_logout_status_request_message_record.reserved_7[cancel_on_logout_status_request_message_at] = (cancel_on_logout_status_request_message_base + 5 + cancel_on_logout_status_request_message_at + 1) % 256; cancel_on_logout_status_request_message_at = cancel_on_logout_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel On Logout Status Request Message to the wire, 12 bytes from where the cursor stands */
inline encode_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_record) {
  cancel_on_logout_status_request_message_at = 0;
  do
  :: cancel_on_logout_status_request_message_at < 4 -> wire[at] = cancel_on_logout_status_request_message_record.user_id[cancel_on_logout_status_request_message_at]; at = at + 1; cancel_on_logout_status_request_message_at = cancel_on_logout_status_request_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_on_logout_status_request_message_record.colo_user_bit; at = at + 1;
  cancel_on_logout_status_request_message_at = 0;
  do
  :: cancel_on_logout_status_request_message_at < 7 -> wire[at] = cancel_on_logout_status_request_message_record.reserved_7[cancel_on_logout_status_request_message_at]; at = at + 1; cancel_on_logout_status_request_message_at = cancel_on_logout_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel On Logout Status Request Message off the wire, 12 bytes from where the cursor stands */
inline decode_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_record) {
  cancel_on_logout_status_request_message_at = 0;
  do
  :: cancel_on_logout_status_request_message_at < 4 -> cancel_on_logout_status_request_message_record.user_id[cancel_on_logout_status_request_message_at] = wire[at]; at = at + 1; cancel_on_logout_status_request_message_at = cancel_on_logout_status_request_message_at + 1
  :: else -> break
  od;
  cancel_on_logout_status_request_message_record.colo_user_bit = wire[at]; at = at + 1;
  cancel_on_logout_status_request_message_at = 0;
  do
  :: cancel_on_logout_status_request_message_at < 7 -> cancel_on_logout_status_request_message_record.reserved_7[cancel_on_logout_status_request_message_at] = wire[at]; at = at + 1; cancel_on_logout_status_request_message_at = cancel_on_logout_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel On Logout Status Request Message is what was written, byte for byte */
inline equal_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_read, cancel_on_logout_status_request_message_written) {
  cancel_on_logout_status_request_message_at = 0;
  do
  :: cancel_on_logout_status_request_message_at < 4 -> assert(cancel_on_logout_status_request_message_read.user_id[cancel_on_logout_status_request_message_at] == cancel_on_logout_status_request_message_written.user_id[cancel_on_logout_status_request_message_at]); cancel_on_logout_status_request_message_at = cancel_on_logout_status_request_message_at + 1
  :: else -> break
  od;
  assert(cancel_on_logout_status_request_message_read.colo_user_bit == cancel_on_logout_status_request_message_written.colo_user_bit);
  cancel_on_logout_status_request_message_at = 0;
  do
  :: cancel_on_logout_status_request_message_at < 7 -> assert(cancel_on_logout_status_request_message_read.reserved_7[cancel_on_logout_status_request_message_at] == cancel_on_logout_status_request_message_written.reserved_7[cancel_on_logout_status_request_message_at]); cancel_on_logout_status_request_message_at = cancel_on_logout_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sec Info: 12 bytes ------------------------------------------------------ */

/* SEC_INFO */
typedef SecInfo {
  byte symbol[10];
  byte series[2]
};

int sec_info_at;

/* every byte of Sec Info set to one value */
inline fill_sec_info(sec_info_record, sec_info_value) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sec Info set to where it lies, so a field read out of place says so */
inline ramp_sec_info(sec_info_record, sec_info_base) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = (sec_info_base + 0 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = (sec_info_base + 10 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info to the wire, 12 bytes from where the cursor stands */
inline encode_sec_info(sec_info_record) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> wire[at] = sec_info_record.symbol[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> wire[at] = sec_info_record.series[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info off the wire, 12 bytes from where the cursor stands */
inline decode_sec_info(sec_info_record) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sec Info is what was written, byte for byte */
inline equal_sec_info(sec_info_read, sec_info_written) {
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> assert(sec_info_read.symbol[sec_info_at] == sec_info_written.symbol[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> assert(sec_info_read.series[sec_info_at] == sec_info_written.series[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Inquiry Request Message: 16 bytes ------------------------------- */

/* Sent as AUCTION_INQUIRY_IN */
typedef AuctionInquiryRequestMessage {
  SecInfo sec_info;
  byte auction_no[2];
  byte page_indicator;
  byte filler
};

int auction_inquiry_request_message_at;

/* every byte of Auction Inquiry Request Message set to one value */
inline fill_auction_inquiry_request_message(auction_inquiry_request_message_record, auction_inquiry_request_message_value) {
  fill_sec_info(auction_inquiry_request_message_record.sec_info, auction_inquiry_request_message_value);
  auction_inquiry_request_message_at = 0;
  do
  :: auction_inquiry_request_message_at < 2 -> auction_inquiry_request_message_record.auction_no[auction_inquiry_request_message_at] = auction_inquiry_request_message_value; auction_inquiry_request_message_at = auction_inquiry_request_message_at + 1
  :: else -> break
  od;
  auction_inquiry_request_message_record.page_indicator = auction_inquiry_request_message_value;
  auction_inquiry_request_message_record.filler = auction_inquiry_request_message_value;
  skip
}

/* each byte of Auction Inquiry Request Message set to where it lies, so a field read out of place says so */
inline ramp_auction_inquiry_request_message(auction_inquiry_request_message_record, auction_inquiry_request_message_base) {
  ramp_sec_info(auction_inquiry_request_message_record.sec_info, auction_inquiry_request_message_base + 0);
  auction_inquiry_request_message_at = 0;
  do
  :: auction_inquiry_request_message_at < 2 -> auction_inquiry_request_message_record.auction_no[auction_inquiry_request_message_at] = (auction_inquiry_request_message_base + 12 + auction_inquiry_request_message_at + 1) % 256; auction_inquiry_request_message_at = auction_inquiry_request_message_at + 1
  :: else -> break
  od;
  auction_inquiry_request_message_record.page_indicator = (auction_inquiry_request_message_base + 14 + 1) % 256;
  auction_inquiry_request_message_record.filler = (auction_inquiry_request_message_base + 15 + 1) % 256;
  skip
}

/* Auction Inquiry Request Message to the wire, 16 bytes from where the cursor stands */
inline encode_auction_inquiry_request_message(auction_inquiry_request_message_record) {
  encode_sec_info(auction_inquiry_request_message_record.sec_info);
  auction_inquiry_request_message_at = 0;
  do
  :: auction_inquiry_request_message_at < 2 -> wire[at] = auction_inquiry_request_message_record.auction_no[auction_inquiry_request_message_at]; at = at + 1; auction_inquiry_request_message_at = auction_inquiry_request_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_inquiry_request_message_record.page_indicator; at = at + 1;
  wire[at] = auction_inquiry_request_message_record.filler; at = at + 1;
  skip
}

/* Auction Inquiry Request Message off the wire, 16 bytes from where the cursor stands */
inline decode_auction_inquiry_request_message(auction_inquiry_request_message_record) {
  decode_sec_info(auction_inquiry_request_message_record.sec_info);
  auction_inquiry_request_message_at = 0;
  do
  :: auction_inquiry_request_message_at < 2 -> auction_inquiry_request_message_record.auction_no[auction_inquiry_request_message_at] = wire[at]; at = at + 1; auction_inquiry_request_message_at = auction_inquiry_request_message_at + 1
  :: else -> break
  od;
  auction_inquiry_request_message_record.page_indicator = wire[at]; at = at + 1;
  auction_inquiry_request_message_record.filler = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Inquiry Request Message is what was written, byte for byte */
inline equal_auction_inquiry_request_message(auction_inquiry_request_message_read, auction_inquiry_request_message_written) {
  equal_sec_info(auction_inquiry_request_message_read.sec_info, auction_inquiry_request_message_written.sec_info);
  auction_inquiry_request_message_at = 0;
  do
  :: auction_inquiry_request_message_at < 2 -> assert(auction_inquiry_request_message_read.auction_no[auction_inquiry_request_message_at] == auction_inquiry_request_message_written.auction_no[auction_inquiry_request_message_at]); auction_inquiry_request_message_at = auction_inquiry_request_message_at + 1
  :: else -> break
  od;
  assert(auction_inquiry_request_message_read.page_indicator == auction_inquiry_request_message_written.page_indicator);
  assert(auction_inquiry_request_message_read.filler == auction_inquiry_request_message_written.filler);
  skip
}

/* ---- Box Sign Off Message: 2 bytes ------------------------------------------- */

/* Sent as BOX_SIGN_OFF */
typedef BoxSignOffMessage {
  byte box_id[2]
};

int box_sign_off_message_at;

/* every byte of Box Sign Off Message set to one value */
inline fill_box_sign_off_message(box_sign_off_message_record, box_sign_off_message_value) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> box_sign_off_message_record.box_id[box_sign_off_message_at] = box_sign_off_message_value; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Box Sign Off Message set to where it lies, so a field read out of place says so */
inline ramp_box_sign_off_message(box_sign_off_message_record, box_sign_off_message_base) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> box_sign_off_message_record.box_id[box_sign_off_message_at] = (box_sign_off_message_base + 0 + box_sign_off_message_at + 1) % 256; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign Off Message to the wire, 2 bytes from where the cursor stands */
inline encode_box_sign_off_message(box_sign_off_message_record) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> wire[at] = box_sign_off_message_record.box_id[box_sign_off_message_at]; at = at + 1; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign Off Message off the wire, 2 bytes from where the cursor stands */
inline decode_box_sign_off_message(box_sign_off_message_record) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> box_sign_off_message_record.box_id[box_sign_off_message_at] = wire[at]; at = at + 1; box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Box Sign Off Message is what was written, byte for byte */
inline equal_box_sign_off_message(box_sign_off_message_read, box_sign_off_message_written) {
  box_sign_off_message_at = 0;
  do
  :: box_sign_off_message_at < 2 -> assert(box_sign_off_message_read.box_id[box_sign_off_message_at] == box_sign_off_message_written.box_id[box_sign_off_message_at]); box_sign_off_message_at = box_sign_off_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Box Sign On Request Message: 20 bytes ----------------------------------- */

/* Sent as BOX_SIGN_ON_REQUEST_IN */
typedef BoxSignOnRequestMessage {
  byte box_id[2];
  byte broker_id[5];
  byte reserved_5[5];
  byte session_key[8]
};

int box_sign_on_request_message_at;

/* every byte of Box Sign On Request Message set to one value */
inline fill_box_sign_on_request_message(box_sign_on_request_message_record, box_sign_on_request_message_value) {
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 2 -> box_sign_on_request_message_record.box_id[box_sign_on_request_message_at] = box_sign_on_request_message_value; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.broker_id[box_sign_on_request_message_at] = box_sign_on_request_message_value; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.reserved_5[box_sign_on_request_message_at] = box_sign_on_request_message_value; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 8 -> box_sign_on_request_message_record.session_key[box_sign_on_request_message_at] = box_sign_on_request_message_value; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Box Sign On Request Message set to where it lies, so a field read out of place says so */
inline ramp_box_sign_on_request_message(box_sign_on_request_message_record, box_sign_on_request_message_base) {
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 2 -> box_sign_on_request_message_record.box_id[box_sign_on_request_message_at] = (box_sign_on_request_message_base + 0 + box_sign_on_request_message_at + 1) % 256; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.broker_id[box_sign_on_request_message_at] = (box_sign_on_request_message_base + 2 + box_sign_on_request_message_at + 1) % 256; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.reserved_5[box_sign_on_request_message_at] = (box_sign_on_request_message_base + 7 + box_sign_on_request_message_at + 1) % 256; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 8 -> box_sign_on_request_message_record.session_key[box_sign_on_request_message_at] = (box_sign_on_request_message_base + 12 + box_sign_on_request_message_at + 1) % 256; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request Message to the wire, 20 bytes from where the cursor stands */
inline encode_box_sign_on_request_message(box_sign_on_request_message_record) {
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 2 -> wire[at] = box_sign_on_request_message_record.box_id[box_sign_on_request_message_at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> wire[at] = box_sign_on_request_message_record.broker_id[box_sign_on_request_message_at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> wire[at] = box_sign_on_request_message_record.reserved_5[box_sign_on_request_message_at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 8 -> wire[at] = box_sign_on_request_message_record.session_key[box_sign_on_request_message_at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Box Sign On Request Message off the wire, 20 bytes from where the cursor stands */
inline decode_box_sign_on_request_message(box_sign_on_request_message_record) {
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 2 -> box_sign_on_request_message_record.box_id[box_sign_on_request_message_at] = wire[at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.broker_id[box_sign_on_request_message_at] = wire[at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> box_sign_on_request_message_record.reserved_5[box_sign_on_request_message_at] = wire[at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 8 -> box_sign_on_request_message_record.session_key[box_sign_on_request_message_at] = wire[at]; at = at + 1; box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Box Sign On Request Message is what was written, byte for byte */
inline equal_box_sign_on_request_message(box_sign_on_request_message_read, box_sign_on_request_message_written) {
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 2 -> assert(box_sign_on_request_message_read.box_id[box_sign_on_request_message_at] == box_sign_on_request_message_written.box_id[box_sign_on_request_message_at]); box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> assert(box_sign_on_request_message_read.broker_id[box_sign_on_request_message_at] == box_sign_on_request_message_written.broker_id[box_sign_on_request_message_at]); box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 5 -> assert(box_sign_on_request_message_read.reserved_5[box_sign_on_request_message_at] == box_sign_on_request_message_written.reserved_5[box_sign_on_request_message_at]); box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  box_sign_on_request_message_at = 0;
  do
  :: box_sign_on_request_message_at < 8 -> assert(box_sign_on_request_message_read.session_key[box_sign_on_request_message_at] == box_sign_on_request_message_written.session_key[box_sign_on_request_message_at]); box_sign_on_request_message_at = box_sign_on_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Gateway Router Request Message: 8 bytes --------------------------------- */

/* Sent as GR_REQUEST */
typedef GatewayRouterRequestMessage {
  byte box_id[2];
  byte broker_id[5];
  byte filler
};

int gateway_router_request_message_at;

/* every byte of Gateway Router Request Message set to one value */
inline fill_gateway_router_request_message(gateway_router_request_message_record, gateway_router_request_message_value) {
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 2 -> gateway_router_request_message_record.box_id[gateway_router_request_message_at] = gateway_router_request_message_value; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 5 -> gateway_router_request_message_record.broker_id[gateway_router_request_message_at] = gateway_router_request_message_value; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_record.filler = gateway_router_request_message_value;
  skip
}

/* each byte of Gateway Router Request Message set to where it lies, so a field read out of place says so */
inline ramp_gateway_router_request_message(gateway_router_request_message_record, gateway_router_request_message_base) {
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 2 -> gateway_router_request_message_record.box_id[gateway_router_request_message_at] = (gateway_router_request_message_base + 0 + gateway_router_request_message_at + 1) % 256; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 5 -> gateway_router_request_message_record.broker_id[gateway_router_request_message_at] = (gateway_router_request_message_base + 2 + gateway_router_request_message_at + 1) % 256; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_record.filler = (gateway_router_request_message_base + 7 + 1) % 256;
  skip
}

/* Gateway Router Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_gateway_router_request_message(gateway_router_request_message_record) {
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 2 -> wire[at] = gateway_router_request_message_record.box_id[gateway_router_request_message_at]; at = at + 1; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 5 -> wire[at] = gateway_router_request_message_record.broker_id[gateway_router_request_message_at]; at = at + 1; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  wire[at] = gateway_router_request_message_record.filler; at = at + 1;
  skip
}

/* Gateway Router Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_gateway_router_request_message(gateway_router_request_message_record) {
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 2 -> gateway_router_request_message_record.box_id[gateway_router_request_message_at] = wire[at]; at = at + 1; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 5 -> gateway_router_request_message_record.broker_id[gateway_router_request_message_at] = wire[at]; at = at + 1; gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_record.filler = wire[at]; at = at + 1;
  skip
}

/* what was read of Gateway Router Request Message is what was written, byte for byte */
inline equal_gateway_router_request_message(gateway_router_request_message_read, gateway_router_request_message_written) {
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 2 -> assert(gateway_router_request_message_read.box_id[gateway_router_request_message_at] == gateway_router_request_message_written.box_id[gateway_router_request_message_at]); gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  gateway_router_request_message_at = 0;
  do
  :: gateway_router_request_message_at < 5 -> assert(gateway_router_request_message_read.broker_id[gateway_router_request_message_at] == gateway_router_request_message_written.broker_id[gateway_router_request_message_at]); gateway_router_request_message_at = gateway_router_request_message_at + 1
  :: else -> break
  od;
  assert(gateway_router_request_message_read.filler == gateway_router_request_message_written.filler);
  skip
}

/* ---- Password Reset In Message: 18 bytes ------------------------------------- */

/* Sent as RESET_PASSWORD_IN */
typedef PasswordResetInMessage {
  byte user_id[4];
  byte reserved_14[14]
};

int password_reset_in_message_at;

/* every byte of Password Reset In Message set to one value */
inline fill_password_reset_in_message(password_reset_in_message_record, password_reset_in_message_value) {
  password_reset_in_message_at = 0;
  do
  :: password_reset_in_message_at < 4 -> password_reset_in_message_record.user_id[password_reset_in_message_at] = password_reset_in_message_value; password_reset_in_message_at = password_reset_in_message_at + 1
  :: else -> break
  od;
  password_reset_in_message_at = 0;
  do
  :: password_reset_in_message_at < 14 -> password_reset_in_message_record.reserved_14[password_reset_in_message_at] = password_reset_in_message_value; password_reset_in_message_at = password_reset_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Password Reset In Message set to where it lies, so a field read out of place says so */
inline ramp_password_reset_in_message(password_reset_in_message_record, password_reset_in_message_base) {
  password_reset_in_message_at = 0;
  do
  :: password_reset_in_message_at < 4 -> password_reset_in_message_record.user_id[password_reset_in_message_at] = (password_reset_in_message_base + 0 + password_reset_in_message_at + 1) % 256; password_reset_in_message_at = password_reset_in_message_at + 1
  :: else -> break
  od;
  password_reset_in_message_at = 0;
  do
  :: password_reset_in_message_at < 14 -> password_reset_in_message_record.reserved_14[password_reset_in_message_at] = (password_reset_in_message_base + 4 + password_reset_in_message_at + 1) % 256; password_reset_in_message_at = password_reset_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Password Reset In Message to the wire, 18 bytes from where the cursor stands */
inline encode_password_reset_in_message(password_reset_in_message_record) {
  password_reset_in_message_at = 0;
  do
  :: password_reset_in_message_at < 4 -> wire[at] = password_reset_in_message_record.user_id[password_reset_in_message_at]; at = at + 1; password_reset_in_message_at = password_reset_in_message_at + 1
  :: else -> break
  od;
  password_reset_in_message_at = 0;
  do
  :: password_reset_in_message_at < 14 -> wire[at] = password_reset_in_message_record.reserved_14[password_reset_in_message_at]; at = at + 1; password_reset_in_message_at = password_reset_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Password Reset In Message off the wire, 18 bytes from where the cursor stands */
inline decode_password_reset_in_message(password_reset_in_message_record) {
  password_reset_in_message_at = 0;
  do
  :: password_reset_in_message_at < 4 -> password_reset_in_message_record.user_id[password_reset_in_message_at] = wire[at]; at = at + 1; password_reset_in_message_at = password_reset_in_message_at + 1
  :: else -> break
  od;
  password_reset_in_message_at = 0;
  do
  :: password_reset_in_message_at < 14 -> password_reset_in_message_record.reserved_14[password_reset_in_message_at] = wire[at]; at = at + 1; password_reset_in_message_at = password_reset_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Password Reset In Message is what was written, byte for byte */
inline equal_password_reset_in_message(password_reset_in_message_read, password_reset_in_message_written) {
  password_reset_in_message_at = 0;
  do
  :: password_reset_in_message_at < 4 -> assert(password_reset_in_message_read.user_id[password_reset_in_message_at] == password_reset_in_message_written.user_id[password_reset_in_message_at]); password_reset_in_message_at = password_reset_in_message_at + 1
  :: else -> break
  od;
  password_reset_in_message_at = 0;
  do
  :: password_reset_in_message_at < 14 -> assert(password_reset_in_message_read.reserved_14[password_reset_in_message_at] == password_reset_in_message_written.reserved_14[password_reset_in_message_at]); password_reset_in_message_at = password_reset_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Inquiry In Message: 170 bytes ------------------------------------- */

/* Sent as TRADE_CANCEL_IN, TRADE_MOD_IN */
typedef TradeInquiryInMessage {
  SecInfo sec_info;
  byte fill_number[4];
  byte fill_qty[4];
  byte fill_price[4];
  byte market_type[2];
  byte new_volume[4];
  byte reserved_24[24];
  byte buy_broker_id[5];
  byte sell_broker_id[5];
  byte trader_id[4];
  byte requested_by[2];
  byte buy_account_number[10];
  byte sell_account_number[10];
  byte buy_pan[10];
  byte sell_pan[10];
  byte reserved_60[60]
};

int trade_inquiry_in_message_at;

/* every byte of Trade Inquiry In Message set to one value */
inline fill_trade_inquiry_in_message(trade_inquiry_in_message_record, trade_inquiry_in_message_value) {
  fill_sec_info(trade_inquiry_in_message_record.sec_info, trade_inquiry_in_message_value);
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.fill_number[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.fill_qty[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.fill_price[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 2 -> trade_inquiry_in_message_record.market_type[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.new_volume[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 24 -> trade_inquiry_in_message_record.reserved_24[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 5 -> trade_inquiry_in_message_record.buy_broker_id[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 5 -> trade_inquiry_in_message_record.sell_broker_id[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.trader_id[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 2 -> trade_inquiry_in_message_record.requested_by[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.buy_account_number[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.sell_account_number[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.buy_pan[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.sell_pan[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 60 -> trade_inquiry_in_message_record.reserved_60[trade_inquiry_in_message_at] = trade_inquiry_in_message_value; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Inquiry In Message set to where it lies, so a field read out of place says so */
inline ramp_trade_inquiry_in_message(trade_inquiry_in_message_record, trade_inquiry_in_message_base) {
  ramp_sec_info(trade_inquiry_in_message_record.sec_info, trade_inquiry_in_message_base + 0);
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.fill_number[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 12 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.fill_qty[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 16 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.fill_price[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 20 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 2 -> trade_inquiry_in_message_record.market_type[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 24 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.new_volume[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 26 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 24 -> trade_inquiry_in_message_record.reserved_24[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 30 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 5 -> trade_inquiry_in_message_record.buy_broker_id[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 54 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 5 -> trade_inquiry_in_message_record.sell_broker_id[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 59 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.trader_id[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 64 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 2 -> trade_inquiry_in_message_record.requested_by[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 68 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.buy_account_number[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 70 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.sell_account_number[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 80 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.buy_pan[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 90 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.sell_pan[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 100 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 60 -> trade_inquiry_in_message_record.reserved_60[trade_inquiry_in_message_at] = (trade_inquiry_in_message_base + 110 + trade_inquiry_in_message_at + 1) % 256; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Inquiry In Message to the wire, 170 bytes from where the cursor stands */
inline encode_trade_inquiry_in_message(trade_inquiry_in_message_record) {
  encode_sec_info(trade_inquiry_in_message_record.sec_info);
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> wire[at] = trade_inquiry_in_message_record.fill_number[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> wire[at] = trade_inquiry_in_message_record.fill_qty[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> wire[at] = trade_inquiry_in_message_record.fill_price[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 2 -> wire[at] = trade_inquiry_in_message_record.market_type[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> wire[at] = trade_inquiry_in_message_record.new_volume[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 24 -> wire[at] = trade_inquiry_in_message_record.reserved_24[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 5 -> wire[at] = trade_inquiry_in_message_record.buy_broker_id[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 5 -> wire[at] = trade_inquiry_in_message_record.sell_broker_id[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> wire[at] = trade_inquiry_in_message_record.trader_id[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 2 -> wire[at] = trade_inquiry_in_message_record.requested_by[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> wire[at] = trade_inquiry_in_message_record.buy_account_number[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> wire[at] = trade_inquiry_in_message_record.sell_account_number[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> wire[at] = trade_inquiry_in_message_record.buy_pan[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> wire[at] = trade_inquiry_in_message_record.sell_pan[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 60 -> wire[at] = trade_inquiry_in_message_record.reserved_60[trade_inquiry_in_message_at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Inquiry In Message off the wire, 170 bytes from where the cursor stands */
inline decode_trade_inquiry_in_message(trade_inquiry_in_message_record) {
  decode_sec_info(trade_inquiry_in_message_record.sec_info);
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.fill_number[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.fill_qty[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.fill_price[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 2 -> trade_inquiry_in_message_record.market_type[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.new_volume[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 24 -> trade_inquiry_in_message_record.reserved_24[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 5 -> trade_inquiry_in_message_record.buy_broker_id[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 5 -> trade_inquiry_in_message_record.sell_broker_id[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> trade_inquiry_in_message_record.trader_id[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 2 -> trade_inquiry_in_message_record.requested_by[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.buy_account_number[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.sell_account_number[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.buy_pan[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> trade_inquiry_in_message_record.sell_pan[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 60 -> trade_inquiry_in_message_record.reserved_60[trade_inquiry_in_message_at] = wire[at]; at = at + 1; trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Inquiry In Message is what was written, byte for byte */
inline equal_trade_inquiry_in_message(trade_inquiry_in_message_read, trade_inquiry_in_message_written) {
  equal_sec_info(trade_inquiry_in_message_read.sec_info, trade_inquiry_in_message_written.sec_info);
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> assert(trade_inquiry_in_message_read.fill_number[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.fill_number[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> assert(trade_inquiry_in_message_read.fill_qty[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.fill_qty[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> assert(trade_inquiry_in_message_read.fill_price[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.fill_price[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 2 -> assert(trade_inquiry_in_message_read.market_type[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.market_type[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> assert(trade_inquiry_in_message_read.new_volume[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.new_volume[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 24 -> assert(trade_inquiry_in_message_read.reserved_24[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.reserved_24[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 5 -> assert(trade_inquiry_in_message_read.buy_broker_id[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.buy_broker_id[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 5 -> assert(trade_inquiry_in_message_read.sell_broker_id[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.sell_broker_id[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 4 -> assert(trade_inquiry_in_message_read.trader_id[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.trader_id[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 2 -> assert(trade_inquiry_in_message_read.requested_by[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.requested_by[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> assert(trade_inquiry_in_message_read.buy_account_number[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.buy_account_number[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> assert(trade_inquiry_in_message_read.sell_account_number[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.sell_account_number[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> assert(trade_inquiry_in_message_read.buy_pan[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.buy_pan[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 10 -> assert(trade_inquiry_in_message_read.sell_pan[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.sell_pan[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  trade_inquiry_in_message_at = 0;
  do
  :: trade_inquiry_in_message_at < 60 -> assert(trade_inquiry_in_message_read.reserved_60[trade_inquiry_in_message_at] == trade_inquiry_in_message_written.reserved_60[trade_inquiry_in_message_at]); trade_inquiry_in_message_at = trade_inquiry_in_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Update Local Database Request Message: 22 bytes ------------------------- */

/* Sent as UPDATE_LOCALDB_IN */
typedef UpdateLocalDatabaseRequestMessage {
  byte last_update_security_time[4];
  byte last_update_participant_time[4];
  byte request_for_open_orders;
  byte reserved_1;
  byte normal_market_status[2];
  byte odd_lot_market_status[2];
  byte spot_market_status[2];
  byte auction_market_status[2];
  byte call_auction_1_market_status[2];
  byte call_auction_2_market_status[2]
};

int update_local_database_request_message_at;

/* every byte of Update Local Database Request Message set to one value */
inline fill_update_local_database_request_message(update_local_database_request_message_record, update_local_database_request_message_value) {
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_security_time[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_participant_time[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_record.request_for_open_orders = update_local_database_request_message_value;
  update_local_database_request_message_record.reserved_1 = update_local_database_request_message_value;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.normal_market_status[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.odd_lot_market_status[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.spot_market_status[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.auction_market_status[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.call_auction_1_market_status[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.call_auction_2_market_status[update_local_database_request_message_at] = update_local_database_request_message_value; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Update Local Database Request Message set to where it lies, so a field read out of place says so */
inline ramp_update_local_database_request_message(update_local_database_request_message_record, update_local_database_request_message_base) {
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_security_time[update_local_database_request_message_at] = (update_local_database_request_message_base + 0 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_participant_time[update_local_database_request_message_at] = (update_local_database_request_message_base + 4 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_record.request_for_open_orders = (update_local_database_request_message_base + 8 + 1) % 256;
  update_local_database_request_message_record.reserved_1 = (update_local_database_request_message_base + 9 + 1) % 256;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.normal_market_status[update_local_database_request_message_at] = (update_local_database_request_message_base + 10 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.odd_lot_market_status[update_local_database_request_message_at] = (update_local_database_request_message_base + 12 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.spot_market_status[update_local_database_request_message_at] = (update_local_database_request_message_base + 14 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.auction_market_status[update_local_database_request_message_at] = (update_local_database_request_message_base + 16 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.call_auction_1_market_status[update_local_database_request_message_at] = (update_local_database_request_message_base + 18 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.call_auction_2_market_status[update_local_database_request_message_at] = (update_local_database_request_message_base + 20 + update_local_database_request_message_at + 1) % 256; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Request Message to the wire, 22 bytes from where the cursor stands */
inline encode_update_local_database_request_message(update_local_database_request_message_record) {
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> wire[at] = update_local_database_request_message_record.last_update_security_time[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> wire[at] = update_local_database_request_message_record.last_update_participant_time[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  wire[at] = update_local_database_request_message_record.request_for_open_orders; at = at + 1;
  wire[at] = update_local_database_request_message_record.reserved_1; at = at + 1;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> wire[at] = update_local_database_request_message_record.normal_market_status[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> wire[at] = update_local_database_request_message_record.odd_lot_market_status[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> wire[at] = update_local_database_request_message_record.spot_market_status[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> wire[at] = update_local_database_request_message_record.auction_market_status[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> wire[at] = update_local_database_request_message_record.call_auction_1_market_status[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> wire[at] = update_local_database_request_message_record.call_auction_2_market_status[update_local_database_request_message_at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Update Local Database Request Message off the wire, 22 bytes from where the cursor stands */
inline decode_update_local_database_request_message(update_local_database_request_message_record) {
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_security_time[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> update_local_database_request_message_record.last_update_participant_time[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_record.request_for_open_orders = wire[at]; at = at + 1;
  update_local_database_request_message_record.reserved_1 = wire[at]; at = at + 1;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.normal_market_status[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.odd_lot_market_status[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.spot_market_status[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.auction_market_status[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.call_auction_1_market_status[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> update_local_database_request_message_record.call_auction_2_market_status[update_local_database_request_message_at] = wire[at]; at = at + 1; update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Update Local Database Request Message is what was written, byte for byte */
inline equal_update_local_database_request_message(update_local_database_request_message_read, update_local_database_request_message_written) {
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> assert(update_local_database_request_message_read.last_update_security_time[update_local_database_request_message_at] == update_local_database_request_message_written.last_update_security_time[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 4 -> assert(update_local_database_request_message_read.last_update_participant_time[update_local_database_request_message_at] == update_local_database_request_message_written.last_update_participant_time[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  assert(update_local_database_request_message_read.request_for_open_orders == update_local_database_request_message_written.request_for_open_orders);
  assert(update_local_database_request_message_read.reserved_1 == update_local_database_request_message_written.reserved_1);
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> assert(update_local_database_request_message_read.normal_market_status[update_local_database_request_message_at] == update_local_database_request_message_written.normal_market_status[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> assert(update_local_database_request_message_read.odd_lot_market_status[update_local_database_request_message_at] == update_local_database_request_message_written.odd_lot_market_status[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> assert(update_local_database_request_message_read.spot_market_status[update_local_database_request_message_at] == update_local_database_request_message_written.spot_market_status[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> assert(update_local_database_request_message_read.auction_market_status[update_local_database_request_message_at] == update_local_database_request_message_written.auction_market_status[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> assert(update_local_database_request_message_read.call_auction_1_market_status[update_local_database_request_message_at] == update_local_database_request_message_written.call_auction_1_market_status[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  update_local_database_request_message_at = 0;
  do
  :: update_local_database_request_message_at < 2 -> assert(update_local_database_request_message_read.call_auction_2_market_status[update_local_database_request_message_at] == update_local_database_request_message_written.call_auction_2_market_status[update_local_database_request_message_at]); update_local_database_request_message_at = update_local_database_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Modification Cancellation Status Request Message: 12 bytes -------- */

/* Sent as TRD_MOD_CXL_STATUS_CHANGE _IN */
typedef TradeModificationCancellationStatusRequestMessage {
  byte user_id[4];
  byte trd_mod_cxl_bit;
  byte reserved_7[7]
};

int trade_modification_cancellation_status_request_message_at;

/* every byte of Trade Modification Cancellation Status Request Message set to one value */
inline fill_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_record, trade_modification_cancellation_status_request_message_value) {
  trade_modification_cancellation_status_request_message_at = 0;
  do
  :: trade_modification_cancellation_status_request_message_at < 4 -> trade_modification_cancellation_status_request_message_record.user_id[trade_modification_cancellation_status_request_message_at] = trade_modification_cancellation_status_request_message_value; trade_modification_cancellation_status_request_message_at = trade_modification_cancellation_status_request_message_at + 1
  :: else -> break
  od;
  trade_modification_cancellation_status_request_message_record.trd_mod_cxl_bit = trade_modification_cancellation_status_request_message_value;
  trade_modification_cancellation_status_request_message_at = 0;
  do
  :: trade_modification_cancellation_status_request_message_at < 7 -> trade_modification_cancellation_status_request_message_record.reserved_7[trade_modification_cancellation_status_request_message_at] = trade_modification_cancellation_status_request_message_value; trade_modification_cancellation_status_request_message_at = trade_modification_cancellation_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Modification Cancellation Status Request Message set to where it lies, so a field read out of place says so */
inline ramp_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_record, trade_modification_cancellation_status_request_message_base) {
  trade_modification_cancellation_status_request_message_at = 0;
  do
  :: trade_modification_cancellation_status_request_message_at < 4 -> trade_modification_cancellation_status_request_message_record.user_id[trade_modification_cancellation_status_request_message_at] = (trade_modification_cancellation_status_request_message_base + 0 + trade_modification_cancellation_status_request_message_at + 1) % 256; trade_modification_cancellation_status_request_message_at = trade_modification_cancellation_status_request_message_at + 1
  :: else -> break
  od;
  trade_modification_cancellation_status_request_message_record.trd_mod_cxl_bit = (trade_modification_cancellation_status_request_message_base + 4 + 1) % 256;
  trade_modification_cancellation_status_request_message_at = 0;
  do
  :: trade_modification_cancellation_status_request_message_at < 7 -> trade_modification_cancellation_status_request_message_record.reserved_7[trade_modification_cancellation_status_request_message_at] = (trade_modification_cancellation_status_request_message_base + 5 + trade_modification_cancellation_status_request_message_at + 1) % 256; trade_modification_cancellation_status_request_message_at = trade_modification_cancellation_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Modification Cancellation Status Request Message to the wire, 12 bytes from where the cursor stands */
inline encode_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_record) {
  trade_modification_cancellation_status_request_message_at = 0;
  do
  :: trade_modification_cancellation_status_request_message_at < 4 -> wire[at] = trade_modification_cancellation_status_request_message_record.user_id[trade_modification_cancellation_status_request_message_at]; at = at + 1; trade_modification_cancellation_status_request_message_at = trade_modification_cancellation_status_request_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_modification_cancellation_status_request_message_record.trd_mod_cxl_bit; at = at + 1;
  trade_modification_cancellation_status_request_message_at = 0;
  do
  :: trade_modification_cancellation_status_request_message_at < 7 -> wire[at] = trade_modification_cancellation_status_request_message_record.reserved_7[trade_modification_cancellation_status_request_message_at]; at = at + 1; trade_modification_cancellation_status_request_message_at = trade_modification_cancellation_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Modification Cancellation Status Request Message off the wire, 12 bytes from where the cursor stands */
inline decode_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_record) {
  trade_modification_cancellation_status_request_message_at = 0;
  do
  :: trade_modification_cancellation_status_request_message_at < 4 -> trade_modification_cancellation_status_request_message_record.user_id[trade_modification_cancellation_status_request_message_at] = wire[at]; at = at + 1; trade_modification_cancellation_status_request_message_at = trade_modification_cancellation_status_request_message_at + 1
  :: else -> break
  od;
  trade_modification_cancellation_status_request_message_record.trd_mod_cxl_bit = wire[at]; at = at + 1;
  trade_modification_cancellation_status_request_message_at = 0;
  do
  :: trade_modification_cancellation_status_request_message_at < 7 -> trade_modification_cancellation_status_request_message_record.reserved_7[trade_modification_cancellation_status_request_message_at] = wire[at]; at = at + 1; trade_modification_cancellation_status_request_message_at = trade_modification_cancellation_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Modification Cancellation Status Request Message is what was written, byte for byte */
inline equal_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_read, trade_modification_cancellation_status_request_message_written) {
  trade_modification_cancellation_status_request_message_at = 0;
  do
  :: trade_modification_cancellation_status_request_message_at < 4 -> assert(trade_modification_cancellation_status_request_message_read.user_id[trade_modification_cancellation_status_request_message_at] == trade_modification_cancellation_status_request_message_written.user_id[trade_modification_cancellation_status_request_message_at]); trade_modification_cancellation_status_request_message_at = trade_modification_cancellation_status_request_message_at + 1
  :: else -> break
  od;
  assert(trade_modification_cancellation_status_request_message_read.trd_mod_cxl_bit == trade_modification_cancellation_status_request_message_written.trd_mod_cxl_bit);
  trade_modification_cancellation_status_request_message_at = 0;
  do
  :: trade_modification_cancellation_status_request_message_at < 7 -> assert(trade_modification_cancellation_status_request_message_read.reserved_7[trade_modification_cancellation_status_request_message_at] == trade_modification_cancellation_status_request_message_written.reserved_7[trade_modification_cancellation_status_request_message_at]); trade_modification_cancellation_status_request_message_at = trade_modification_cancellation_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- User Unlock Request Message: 28 bytes ----------------------------------- */

/* Sent as USER_ADDR_UNLOCK_IN */
typedef UserUnlockRequestMessage {
  byte user_id[4];
  byte reserved_24[24]
};

int user_unlock_request_message_at;

/* every byte of User Unlock Request Message set to one value */
inline fill_user_unlock_request_message(user_unlock_request_message_record, user_unlock_request_message_value) {
  user_unlock_request_message_at = 0;
  do
  :: user_unlock_request_message_at < 4 -> user_unlock_request_message_record.user_id[user_unlock_request_message_at] = user_unlock_request_message_value; user_unlock_request_message_at = user_unlock_request_message_at + 1
  :: else -> break
  od;
  user_unlock_request_message_at = 0;
  do
  :: user_unlock_request_message_at < 24 -> user_unlock_request_message_record.reserved_24[user_unlock_request_message_at] = user_unlock_request_message_value; user_unlock_request_message_at = user_unlock_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of User Unlock Request Message set to where it lies, so a field read out of place says so */
inline ramp_user_unlock_request_message(user_unlock_request_message_record, user_unlock_request_message_base) {
  user_unlock_request_message_at = 0;
  do
  :: user_unlock_request_message_at < 4 -> user_unlock_request_message_record.user_id[user_unlock_request_message_at] = (user_unlock_request_message_base + 0 + user_unlock_request_message_at + 1) % 256; user_unlock_request_message_at = user_unlock_request_message_at + 1
  :: else -> break
  od;
  user_unlock_request_message_at = 0;
  do
  :: user_unlock_request_message_at < 24 -> user_unlock_request_message_record.reserved_24[user_unlock_request_message_at] = (user_unlock_request_message_base + 4 + user_unlock_request_message_at + 1) % 256; user_unlock_request_message_at = user_unlock_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Unlock Request Message to the wire, 28 bytes from where the cursor stands */
inline encode_user_unlock_request_message(user_unlock_request_message_record) {
  user_unlock_request_message_at = 0;
  do
  :: user_unlock_request_message_at < 4 -> wire[at] = user_unlock_request_message_record.user_id[user_unlock_request_message_at]; at = at + 1; user_unlock_request_message_at = user_unlock_request_message_at + 1
  :: else -> break
  od;
  user_unlock_request_message_at = 0;
  do
  :: user_unlock_request_message_at < 24 -> wire[at] = user_unlock_request_message_record.reserved_24[user_unlock_request_message_at]; at = at + 1; user_unlock_request_message_at = user_unlock_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* User Unlock Request Message off the wire, 28 bytes from where the cursor stands */
inline decode_user_unlock_request_message(user_unlock_request_message_record) {
  user_unlock_request_message_at = 0;
  do
  :: user_unlock_request_message_at < 4 -> user_unlock_request_message_record.user_id[user_unlock_request_message_at] = wire[at]; at = at + 1; user_unlock_request_message_at = user_unlock_request_message_at + 1
  :: else -> break
  od;
  user_unlock_request_message_at = 0;
  do
  :: user_unlock_request_message_at < 24 -> user_unlock_request_message_record.reserved_24[user_unlock_request_message_at] = wire[at]; at = at + 1; user_unlock_request_message_at = user_unlock_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of User Unlock Request Message is what was written, byte for byte */
inline equal_user_unlock_request_message(user_unlock_request_message_read, user_unlock_request_message_written) {
  user_unlock_request_message_at = 0;
  do
  :: user_unlock_request_message_at < 4 -> assert(user_unlock_request_message_read.user_id[user_unlock_request_message_at] == user_unlock_request_message_written.user_id[user_unlock_request_message_at]); user_unlock_request_message_at = user_unlock_request_message_at + 1
  :: else -> break
  od;
  user_unlock_request_message_at = 0;
  do
  :: user_unlock_request_message_at < 24 -> assert(user_unlock_request_message_read.reserved_24[user_unlock_request_message_at] == user_unlock_request_message_written.reserved_24[user_unlock_request_message_at]); user_unlock_request_message_at = user_unlock_request_message_at + 1
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
    assert(at == 40);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 40);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Cancel On Logout Status Request Message: encoded, read back, and compared */
proctype check_cancel_on_logout_status_request_message() {
  CancelOnLogoutStatusRequestMessage cancel_on_logout_status_request_message_sent;
  CancelOnLogoutStatusRequestMessage cancel_on_logout_status_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_sent, 0)
  :: pattern == 1 -> fill_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_sent, 32)
  :: pattern == 2 -> fill_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_sent, 255)
  :: else -> ramp_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_sent);
    assert(at == 12);
    at = 0;
    decode_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_got);
    assert(at == 12);
    equal_cancel_on_logout_status_request_message(cancel_on_logout_status_request_message_got, cancel_on_logout_status_request_message_sent)
  }
}

/* Sec Info: encoded, read back, and compared */
proctype check_sec_info() {
  SecInfo sec_info_sent;
  SecInfo sec_info_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sec_info(sec_info_sent, 0)
  :: pattern == 1 -> fill_sec_info(sec_info_sent, 32)
  :: pattern == 2 -> fill_sec_info(sec_info_sent, 255)
  :: else -> ramp_sec_info(sec_info_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sec_info(sec_info_sent);
    assert(at == 12);
    at = 0;
    decode_sec_info(sec_info_got);
    assert(at == 12);
    equal_sec_info(sec_info_got, sec_info_sent)
  }
}

/* Auction Inquiry Request Message: encoded, read back, and compared */
proctype check_auction_inquiry_request_message() {
  AuctionInquiryRequestMessage auction_inquiry_request_message_sent;
  AuctionInquiryRequestMessage auction_inquiry_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_inquiry_request_message(auction_inquiry_request_message_sent, 0)
  :: pattern == 1 -> fill_auction_inquiry_request_message(auction_inquiry_request_message_sent, 32)
  :: pattern == 2 -> fill_auction_inquiry_request_message(auction_inquiry_request_message_sent, 255)
  :: else -> ramp_auction_inquiry_request_message(auction_inquiry_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_inquiry_request_message(auction_inquiry_request_message_sent);
    assert(at == 16);
    at = 0;
    decode_auction_inquiry_request_message(auction_inquiry_request_message_got);
    assert(at == 16);
    equal_auction_inquiry_request_message(auction_inquiry_request_message_got, auction_inquiry_request_message_sent)
  }
}

/* Box Sign Off Message: encoded, read back, and compared */
proctype check_box_sign_off_message() {
  BoxSignOffMessage box_sign_off_message_sent;
  BoxSignOffMessage box_sign_off_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_box_sign_off_message(box_sign_off_message_sent, 0)
  :: pattern == 1 -> fill_box_sign_off_message(box_sign_off_message_sent, 32)
  :: pattern == 2 -> fill_box_sign_off_message(box_sign_off_message_sent, 255)
  :: else -> ramp_box_sign_off_message(box_sign_off_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_box_sign_off_message(box_sign_off_message_sent);
    assert(at == 2);
    at = 0;
    decode_box_sign_off_message(box_sign_off_message_got);
    assert(at == 2);
    equal_box_sign_off_message(box_sign_off_message_got, box_sign_off_message_sent)
  }
}

/* Box Sign On Request Message: encoded, read back, and compared */
proctype check_box_sign_on_request_message() {
  BoxSignOnRequestMessage box_sign_on_request_message_sent;
  BoxSignOnRequestMessage box_sign_on_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_box_sign_on_request_message(box_sign_on_request_message_sent, 0)
  :: pattern == 1 -> fill_box_sign_on_request_message(box_sign_on_request_message_sent, 32)
  :: pattern == 2 -> fill_box_sign_on_request_message(box_sign_on_request_message_sent, 255)
  :: else -> ramp_box_sign_on_request_message(box_sign_on_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_box_sign_on_request_message(box_sign_on_request_message_sent);
    assert(at == 20);
    at = 0;
    decode_box_sign_on_request_message(box_sign_on_request_message_got);
    assert(at == 20);
    equal_box_sign_on_request_message(box_sign_on_request_message_got, box_sign_on_request_message_sent)
  }
}

/* Gateway Router Request Message: encoded, read back, and compared */
proctype check_gateway_router_request_message() {
  GatewayRouterRequestMessage gateway_router_request_message_sent;
  GatewayRouterRequestMessage gateway_router_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gateway_router_request_message(gateway_router_request_message_sent, 0)
  :: pattern == 1 -> fill_gateway_router_request_message(gateway_router_request_message_sent, 32)
  :: pattern == 2 -> fill_gateway_router_request_message(gateway_router_request_message_sent, 255)
  :: else -> ramp_gateway_router_request_message(gateway_router_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gateway_router_request_message(gateway_router_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_gateway_router_request_message(gateway_router_request_message_got);
    assert(at == 8);
    equal_gateway_router_request_message(gateway_router_request_message_got, gateway_router_request_message_sent)
  }
}

/* Password Reset In Message: encoded, read back, and compared */
proctype check_password_reset_in_message() {
  PasswordResetInMessage password_reset_in_message_sent;
  PasswordResetInMessage password_reset_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_password_reset_in_message(password_reset_in_message_sent, 0)
  :: pattern == 1 -> fill_password_reset_in_message(password_reset_in_message_sent, 32)
  :: pattern == 2 -> fill_password_reset_in_message(password_reset_in_message_sent, 255)
  :: else -> ramp_password_reset_in_message(password_reset_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_password_reset_in_message(password_reset_in_message_sent);
    assert(at == 18);
    at = 0;
    decode_password_reset_in_message(password_reset_in_message_got);
    assert(at == 18);
    equal_password_reset_in_message(password_reset_in_message_got, password_reset_in_message_sent)
  }
}

/* Trade Inquiry In Message: encoded, read back, and compared */
proctype check_trade_inquiry_in_message() {
  TradeInquiryInMessage trade_inquiry_in_message_sent;
  TradeInquiryInMessage trade_inquiry_in_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_inquiry_in_message(trade_inquiry_in_message_sent, 0)
  :: pattern == 1 -> fill_trade_inquiry_in_message(trade_inquiry_in_message_sent, 32)
  :: pattern == 2 -> fill_trade_inquiry_in_message(trade_inquiry_in_message_sent, 255)
  :: else -> ramp_trade_inquiry_in_message(trade_inquiry_in_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_inquiry_in_message(trade_inquiry_in_message_sent);
    assert(at == 170);
    at = 0;
    decode_trade_inquiry_in_message(trade_inquiry_in_message_got);
    assert(at == 170);
    equal_trade_inquiry_in_message(trade_inquiry_in_message_got, trade_inquiry_in_message_sent)
  }
}

/* Update Local Database Request Message: encoded, read back, and compared */
proctype check_update_local_database_request_message() {
  UpdateLocalDatabaseRequestMessage update_local_database_request_message_sent;
  UpdateLocalDatabaseRequestMessage update_local_database_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_update_local_database_request_message(update_local_database_request_message_sent, 0)
  :: pattern == 1 -> fill_update_local_database_request_message(update_local_database_request_message_sent, 32)
  :: pattern == 2 -> fill_update_local_database_request_message(update_local_database_request_message_sent, 255)
  :: else -> ramp_update_local_database_request_message(update_local_database_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_update_local_database_request_message(update_local_database_request_message_sent);
    assert(at == 22);
    at = 0;
    decode_update_local_database_request_message(update_local_database_request_message_got);
    assert(at == 22);
    equal_update_local_database_request_message(update_local_database_request_message_got, update_local_database_request_message_sent)
  }
}

/* Trade Modification Cancellation Status Request Message: encoded, read back, and compared */
proctype check_trade_modification_cancellation_status_request_message() {
  TradeModificationCancellationStatusRequestMessage trade_modification_cancellation_status_request_message_sent;
  TradeModificationCancellationStatusRequestMessage trade_modification_cancellation_status_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_sent, 0)
  :: pattern == 1 -> fill_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_sent, 32)
  :: pattern == 2 -> fill_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_sent, 255)
  :: else -> ramp_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_sent);
    assert(at == 12);
    at = 0;
    decode_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_got);
    assert(at == 12);
    equal_trade_modification_cancellation_status_request_message(trade_modification_cancellation_status_request_message_got, trade_modification_cancellation_status_request_message_sent)
  }
}

/* User Unlock Request Message: encoded, read back, and compared */
proctype check_user_unlock_request_message() {
  UserUnlockRequestMessage user_unlock_request_message_sent;
  UserUnlockRequestMessage user_unlock_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_user_unlock_request_message(user_unlock_request_message_sent, 0)
  :: pattern == 1 -> fill_user_unlock_request_message(user_unlock_request_message_sent, 32)
  :: pattern == 2 -> fill_user_unlock_request_message(user_unlock_request_message_sent, 255)
  :: else -> ramp_user_unlock_request_message(user_unlock_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_user_unlock_request_message(user_unlock_request_message_sent);
    assert(at == 28);
    at = 0;
    decode_user_unlock_request_message(user_unlock_request_message_got);
    assert(at == 28);
    equal_user_unlock_request_message(user_unlock_request_message_got, user_unlock_request_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_cancel_on_logout_status_request_message()
  :: run check_sec_info()
  :: run check_auction_inquiry_request_message()
  :: run check_box_sign_off_message()
  :: run check_box_sign_on_request_message()
  :: run check_gateway_router_request_message()
  :: run check_password_reset_in_message()
  :: run check_trade_inquiry_in_message()
  :: run check_update_local_database_request_message()
  :: run check_trade_modification_cancellation_status_request_message()
  :: run check_user_unlock_request_message()
  fi
}
