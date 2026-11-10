/*
 * Eurex Exchange Enhanced Trading Interface
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
 *   - a length prefix framing what follows
 *   - a run counted by a field
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

/* ---- Message Header: 6 bytes ------------------------------------------------- */

/* Eurex T7 Eti message header */
typedef MessageHeader {
  byte body_len[4];
  byte template_id[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_len[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_len[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 6 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.body_len[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.template_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 6 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.body_len[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.body_len[message_header_at] == message_header_written.body_len[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.template_id[message_header_at] == message_header_written.template_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Request Header Comp: 8 bytes -------------------------------------------- */

typedef RequestHeaderComp {
  byte msg_seq_num[4];
  byte sender_sub_id[4]
};

int request_header_comp_at;

/* every byte of Request Header Comp set to one value */
inline fill_request_header_comp(request_header_comp_record, request_header_comp_value) {
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.msg_seq_num[request_header_comp_at] = request_header_comp_value; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.sender_sub_id[request_header_comp_at] = request_header_comp_value; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Request Header Comp set to where it lies, so a field read out of place says so */
inline ramp_request_header_comp(request_header_comp_record, request_header_comp_base) {
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.msg_seq_num[request_header_comp_at] = (request_header_comp_base + 0 + request_header_comp_at + 1) % 256; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.sender_sub_id[request_header_comp_at] = (request_header_comp_base + 4 + request_header_comp_at + 1) % 256; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Request Header Comp to the wire, 8 bytes from where the cursor stands */
inline encode_request_header_comp(request_header_comp_record) {
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> wire[at] = request_header_comp_record.msg_seq_num[request_header_comp_at]; at = at + 1; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> wire[at] = request_header_comp_record.sender_sub_id[request_header_comp_at]; at = at + 1; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Request Header Comp off the wire, 8 bytes from where the cursor stands */
inline decode_request_header_comp(request_header_comp_record) {
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.msg_seq_num[request_header_comp_at] = wire[at]; at = at + 1; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> request_header_comp_record.sender_sub_id[request_header_comp_at] = wire[at]; at = at + 1; request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Request Header Comp is what was written, byte for byte */
inline equal_request_header_comp(request_header_comp_read, request_header_comp_written) {
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> assert(request_header_comp_read.msg_seq_num[request_header_comp_at] == request_header_comp_written.msg_seq_num[request_header_comp_at]); request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  request_header_comp_at = 0;
  do
  :: request_header_comp_at < 4 -> assert(request_header_comp_read.sender_sub_id[request_header_comp_at] == request_header_comp_written.sender_sub_id[request_header_comp_at]); request_header_comp_at = request_header_comp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Old Basket Data Grp Comp: 64 bytes -------------------------------------- */

typedef OldBasketDataGrpComp {
  byte basket_trd_match_id[8];
  byte basket_exec_id[4];
  byte trade_report_id[20];
  byte maturity_month_year[4];
  byte basket_trade_report_type;
  byte basket_trade_report_text[20];
  byte pad7[7]
};

int old_basket_data_grp_comp_at;

/* every byte of Old Basket Data Grp Comp set to one value */
inline fill_old_basket_data_grp_comp(old_basket_data_grp_comp_record, old_basket_data_grp_comp_value) {
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 8 -> old_basket_data_grp_comp_record.basket_trd_match_id[old_basket_data_grp_comp_at] = old_basket_data_grp_comp_value; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 4 -> old_basket_data_grp_comp_record.basket_exec_id[old_basket_data_grp_comp_at] = old_basket_data_grp_comp_value; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 20 -> old_basket_data_grp_comp_record.trade_report_id[old_basket_data_grp_comp_at] = old_basket_data_grp_comp_value; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 4 -> old_basket_data_grp_comp_record.maturity_month_year[old_basket_data_grp_comp_at] = old_basket_data_grp_comp_value; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_record.basket_trade_report_type = old_basket_data_grp_comp_value;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 20 -> old_basket_data_grp_comp_record.basket_trade_report_text[old_basket_data_grp_comp_at] = old_basket_data_grp_comp_value; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 7 -> old_basket_data_grp_comp_record.pad7[old_basket_data_grp_comp_at] = old_basket_data_grp_comp_value; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Old Basket Data Grp Comp set to where it lies, so a field read out of place says so */
inline ramp_old_basket_data_grp_comp(old_basket_data_grp_comp_record, old_basket_data_grp_comp_base) {
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 8 -> old_basket_data_grp_comp_record.basket_trd_match_id[old_basket_data_grp_comp_at] = (old_basket_data_grp_comp_base + 0 + old_basket_data_grp_comp_at + 1) % 256; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 4 -> old_basket_data_grp_comp_record.basket_exec_id[old_basket_data_grp_comp_at] = (old_basket_data_grp_comp_base + 8 + old_basket_data_grp_comp_at + 1) % 256; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 20 -> old_basket_data_grp_comp_record.trade_report_id[old_basket_data_grp_comp_at] = (old_basket_data_grp_comp_base + 12 + old_basket_data_grp_comp_at + 1) % 256; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 4 -> old_basket_data_grp_comp_record.maturity_month_year[old_basket_data_grp_comp_at] = (old_basket_data_grp_comp_base + 32 + old_basket_data_grp_comp_at + 1) % 256; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_record.basket_trade_report_type = (old_basket_data_grp_comp_base + 36 + 1) % 256;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 20 -> old_basket_data_grp_comp_record.basket_trade_report_text[old_basket_data_grp_comp_at] = (old_basket_data_grp_comp_base + 37 + old_basket_data_grp_comp_at + 1) % 256; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 7 -> old_basket_data_grp_comp_record.pad7[old_basket_data_grp_comp_at] = (old_basket_data_grp_comp_base + 57 + old_basket_data_grp_comp_at + 1) % 256; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Old Basket Data Grp Comp to the wire, 64 bytes from where the cursor stands */
inline encode_old_basket_data_grp_comp(old_basket_data_grp_comp_record) {
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 8 -> wire[at] = old_basket_data_grp_comp_record.basket_trd_match_id[old_basket_data_grp_comp_at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 4 -> wire[at] = old_basket_data_grp_comp_record.basket_exec_id[old_basket_data_grp_comp_at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 20 -> wire[at] = old_basket_data_grp_comp_record.trade_report_id[old_basket_data_grp_comp_at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 4 -> wire[at] = old_basket_data_grp_comp_record.maturity_month_year[old_basket_data_grp_comp_at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  wire[at] = old_basket_data_grp_comp_record.basket_trade_report_type; at = at + 1;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 20 -> wire[at] = old_basket_data_grp_comp_record.basket_trade_report_text[old_basket_data_grp_comp_at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 7 -> wire[at] = old_basket_data_grp_comp_record.pad7[old_basket_data_grp_comp_at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  skip
}

/* Old Basket Data Grp Comp off the wire, 64 bytes from where the cursor stands */
inline decode_old_basket_data_grp_comp(old_basket_data_grp_comp_record) {
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 8 -> old_basket_data_grp_comp_record.basket_trd_match_id[old_basket_data_grp_comp_at] = wire[at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 4 -> old_basket_data_grp_comp_record.basket_exec_id[old_basket_data_grp_comp_at] = wire[at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 20 -> old_basket_data_grp_comp_record.trade_report_id[old_basket_data_grp_comp_at] = wire[at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 4 -> old_basket_data_grp_comp_record.maturity_month_year[old_basket_data_grp_comp_at] = wire[at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_record.basket_trade_report_type = wire[at]; at = at + 1;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 20 -> old_basket_data_grp_comp_record.basket_trade_report_text[old_basket_data_grp_comp_at] = wire[at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 7 -> old_basket_data_grp_comp_record.pad7[old_basket_data_grp_comp_at] = wire[at]; at = at + 1; old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Old Basket Data Grp Comp is what was written, byte for byte */
inline equal_old_basket_data_grp_comp(old_basket_data_grp_comp_read, old_basket_data_grp_comp_written) {
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 8 -> assert(old_basket_data_grp_comp_read.basket_trd_match_id[old_basket_data_grp_comp_at] == old_basket_data_grp_comp_written.basket_trd_match_id[old_basket_data_grp_comp_at]); old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 4 -> assert(old_basket_data_grp_comp_read.basket_exec_id[old_basket_data_grp_comp_at] == old_basket_data_grp_comp_written.basket_exec_id[old_basket_data_grp_comp_at]); old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 20 -> assert(old_basket_data_grp_comp_read.trade_report_id[old_basket_data_grp_comp_at] == old_basket_data_grp_comp_written.trade_report_id[old_basket_data_grp_comp_at]); old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 4 -> assert(old_basket_data_grp_comp_read.maturity_month_year[old_basket_data_grp_comp_at] == old_basket_data_grp_comp_written.maturity_month_year[old_basket_data_grp_comp_at]); old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  assert(old_basket_data_grp_comp_read.basket_trade_report_type == old_basket_data_grp_comp_written.basket_trade_report_type);
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 20 -> assert(old_basket_data_grp_comp_read.basket_trade_report_text[old_basket_data_grp_comp_at] == old_basket_data_grp_comp_written.basket_trade_report_text[old_basket_data_grp_comp_at]); old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  old_basket_data_grp_comp_at = 0;
  do
  :: old_basket_data_grp_comp_at < 7 -> assert(old_basket_data_grp_comp_read.pad7[old_basket_data_grp_comp_at] == old_basket_data_grp_comp_written.pad7[old_basket_data_grp_comp_at]); old_basket_data_grp_comp_at = old_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Basket Data Grp Comp: 48 bytes -------------------------------------- */

typedef NewBasketDataGrpComp {
  byte trade_report_id[20];
  byte maturity_month_year[4];
  byte basket_trade_report_type;
  byte basket_trade_report_text[20];
  byte pad3[3]
};

int new_basket_data_grp_comp_at;

/* every byte of New Basket Data Grp Comp set to one value */
inline fill_new_basket_data_grp_comp(new_basket_data_grp_comp_record, new_basket_data_grp_comp_value) {
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 20 -> new_basket_data_grp_comp_record.trade_report_id[new_basket_data_grp_comp_at] = new_basket_data_grp_comp_value; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 4 -> new_basket_data_grp_comp_record.maturity_month_year[new_basket_data_grp_comp_at] = new_basket_data_grp_comp_value; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_record.basket_trade_report_type = new_basket_data_grp_comp_value;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 20 -> new_basket_data_grp_comp_record.basket_trade_report_text[new_basket_data_grp_comp_at] = new_basket_data_grp_comp_value; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 3 -> new_basket_data_grp_comp_record.pad3[new_basket_data_grp_comp_at] = new_basket_data_grp_comp_value; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Basket Data Grp Comp set to where it lies, so a field read out of place says so */
inline ramp_new_basket_data_grp_comp(new_basket_data_grp_comp_record, new_basket_data_grp_comp_base) {
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 20 -> new_basket_data_grp_comp_record.trade_report_id[new_basket_data_grp_comp_at] = (new_basket_data_grp_comp_base + 0 + new_basket_data_grp_comp_at + 1) % 256; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 4 -> new_basket_data_grp_comp_record.maturity_month_year[new_basket_data_grp_comp_at] = (new_basket_data_grp_comp_base + 20 + new_basket_data_grp_comp_at + 1) % 256; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_record.basket_trade_report_type = (new_basket_data_grp_comp_base + 24 + 1) % 256;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 20 -> new_basket_data_grp_comp_record.basket_trade_report_text[new_basket_data_grp_comp_at] = (new_basket_data_grp_comp_base + 25 + new_basket_data_grp_comp_at + 1) % 256; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 3 -> new_basket_data_grp_comp_record.pad3[new_basket_data_grp_comp_at] = (new_basket_data_grp_comp_base + 45 + new_basket_data_grp_comp_at + 1) % 256; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  skip
}

/* New Basket Data Grp Comp to the wire, 48 bytes from where the cursor stands */
inline encode_new_basket_data_grp_comp(new_basket_data_grp_comp_record) {
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 20 -> wire[at] = new_basket_data_grp_comp_record.trade_report_id[new_basket_data_grp_comp_at]; at = at + 1; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 4 -> wire[at] = new_basket_data_grp_comp_record.maturity_month_year[new_basket_data_grp_comp_at]; at = at + 1; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  wire[at] = new_basket_data_grp_comp_record.basket_trade_report_type; at = at + 1;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 20 -> wire[at] = new_basket_data_grp_comp_record.basket_trade_report_text[new_basket_data_grp_comp_at]; at = at + 1; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 3 -> wire[at] = new_basket_data_grp_comp_record.pad3[new_basket_data_grp_comp_at]; at = at + 1; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  skip
}

/* New Basket Data Grp Comp off the wire, 48 bytes from where the cursor stands */
inline decode_new_basket_data_grp_comp(new_basket_data_grp_comp_record) {
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 20 -> new_basket_data_grp_comp_record.trade_report_id[new_basket_data_grp_comp_at] = wire[at]; at = at + 1; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 4 -> new_basket_data_grp_comp_record.maturity_month_year[new_basket_data_grp_comp_at] = wire[at]; at = at + 1; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_record.basket_trade_report_type = wire[at]; at = at + 1;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 20 -> new_basket_data_grp_comp_record.basket_trade_report_text[new_basket_data_grp_comp_at] = wire[at]; at = at + 1; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 3 -> new_basket_data_grp_comp_record.pad3[new_basket_data_grp_comp_at] = wire[at]; at = at + 1; new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Basket Data Grp Comp is what was written, byte for byte */
inline equal_new_basket_data_grp_comp(new_basket_data_grp_comp_read, new_basket_data_grp_comp_written) {
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 20 -> assert(new_basket_data_grp_comp_read.trade_report_id[new_basket_data_grp_comp_at] == new_basket_data_grp_comp_written.trade_report_id[new_basket_data_grp_comp_at]); new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 4 -> assert(new_basket_data_grp_comp_read.maturity_month_year[new_basket_data_grp_comp_at] == new_basket_data_grp_comp_written.maturity_month_year[new_basket_data_grp_comp_at]); new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  assert(new_basket_data_grp_comp_read.basket_trade_report_type == new_basket_data_grp_comp_written.basket_trade_report_type);
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 20 -> assert(new_basket_data_grp_comp_read.basket_trade_report_text[new_basket_data_grp_comp_at] == new_basket_data_grp_comp_written.basket_trade_report_text[new_basket_data_grp_comp_at]); new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
  :: else -> break
  od;
  new_basket_data_grp_comp_at = 0;
  do
  :: new_basket_data_grp_comp_at < 3 -> assert(new_basket_data_grp_comp_read.pad3[new_basket_data_grp_comp_at] == new_basket_data_grp_comp_written.pad3[new_basket_data_grp_comp_at]); new_basket_data_grp_comp_at = new_basket_data_grp_comp_at + 1
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
    assert(at == 6);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 6);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Request Header Comp: encoded, read back, and compared */
proctype check_request_header_comp() {
  RequestHeaderComp request_header_comp_sent;
  RequestHeaderComp request_header_comp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_header_comp(request_header_comp_sent, 0)
  :: pattern == 1 -> fill_request_header_comp(request_header_comp_sent, 32)
  :: pattern == 2 -> fill_request_header_comp(request_header_comp_sent, 255)
  :: else -> ramp_request_header_comp(request_header_comp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_header_comp(request_header_comp_sent);
    assert(at == 8);
    at = 0;
    decode_request_header_comp(request_header_comp_got);
    assert(at == 8);
    equal_request_header_comp(request_header_comp_got, request_header_comp_sent)
  }
}

/* Old Basket Data Grp Comp: encoded, read back, and compared */
proctype check_old_basket_data_grp_comp() {
  OldBasketDataGrpComp old_basket_data_grp_comp_sent;
  OldBasketDataGrpComp old_basket_data_grp_comp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_old_basket_data_grp_comp(old_basket_data_grp_comp_sent, 0)
  :: pattern == 1 -> fill_old_basket_data_grp_comp(old_basket_data_grp_comp_sent, 32)
  :: pattern == 2 -> fill_old_basket_data_grp_comp(old_basket_data_grp_comp_sent, 255)
  :: else -> ramp_old_basket_data_grp_comp(old_basket_data_grp_comp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_old_basket_data_grp_comp(old_basket_data_grp_comp_sent);
    assert(at == 64);
    at = 0;
    decode_old_basket_data_grp_comp(old_basket_data_grp_comp_got);
    assert(at == 64);
    equal_old_basket_data_grp_comp(old_basket_data_grp_comp_got, old_basket_data_grp_comp_sent)
  }
}

/* New Basket Data Grp Comp: encoded, read back, and compared */
proctype check_new_basket_data_grp_comp() {
  NewBasketDataGrpComp new_basket_data_grp_comp_sent;
  NewBasketDataGrpComp new_basket_data_grp_comp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_basket_data_grp_comp(new_basket_data_grp_comp_sent, 0)
  :: pattern == 1 -> fill_new_basket_data_grp_comp(new_basket_data_grp_comp_sent, 32)
  :: pattern == 2 -> fill_new_basket_data_grp_comp(new_basket_data_grp_comp_sent, 255)
  :: else -> ramp_new_basket_data_grp_comp(new_basket_data_grp_comp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_basket_data_grp_comp(new_basket_data_grp_comp_sent);
    assert(at == 48);
    at = 0;
    decode_new_basket_data_grp_comp(new_basket_data_grp_comp_got);
    assert(at == 48);
    equal_new_basket_data_grp_comp(new_basket_data_grp_comp_got, new_basket_data_grp_comp_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_request_header_comp()
  :: run check_old_basket_data_grp_comp()
  :: run check_new_basket_data_grp_comp()
  fi
}
