/*
 * Koscom Co., Ltd. MDCS Realtime Koscom
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
#define WIRE 247

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- K Otc Issue Closing Message: 35 bytes ----------------------------------- */

/* K-OTC Issue Closing. Reports closing price and the quotation category per ISIN. */
typedef KOtcIssueClosingMessage {
  byte isin[12];
  byte data_seq_number[8];
  byte closing_price[9];
  byte quotation_category;
  byte filler_4[4];
  byte end_keyword
};

int k_otc_issue_closing_message_at;

/* every byte of K Otc Issue Closing Message set to one value */
inline fill_k_otc_issue_closing_message(k_otc_issue_closing_message_record, k_otc_issue_closing_message_value) {
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 12 -> k_otc_issue_closing_message_record.isin[k_otc_issue_closing_message_at] = k_otc_issue_closing_message_value; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 8 -> k_otc_issue_closing_message_record.data_seq_number[k_otc_issue_closing_message_at] = k_otc_issue_closing_message_value; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 9 -> k_otc_issue_closing_message_record.closing_price[k_otc_issue_closing_message_at] = k_otc_issue_closing_message_value; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_record.quotation_category = k_otc_issue_closing_message_value;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 4 -> k_otc_issue_closing_message_record.filler_4[k_otc_issue_closing_message_at] = k_otc_issue_closing_message_value; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_record.end_keyword = k_otc_issue_closing_message_value;
  skip
}

/* each byte of K Otc Issue Closing Message set to where it lies, so a field read out of place says so */
inline ramp_k_otc_issue_closing_message(k_otc_issue_closing_message_record, k_otc_issue_closing_message_base) {
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 12 -> k_otc_issue_closing_message_record.isin[k_otc_issue_closing_message_at] = (k_otc_issue_closing_message_base + 0 + k_otc_issue_closing_message_at + 1) % 256; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 8 -> k_otc_issue_closing_message_record.data_seq_number[k_otc_issue_closing_message_at] = (k_otc_issue_closing_message_base + 12 + k_otc_issue_closing_message_at + 1) % 256; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 9 -> k_otc_issue_closing_message_record.closing_price[k_otc_issue_closing_message_at] = (k_otc_issue_closing_message_base + 20 + k_otc_issue_closing_message_at + 1) % 256; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_record.quotation_category = (k_otc_issue_closing_message_base + 29 + 1) % 256;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 4 -> k_otc_issue_closing_message_record.filler_4[k_otc_issue_closing_message_at] = (k_otc_issue_closing_message_base + 30 + k_otc_issue_closing_message_at + 1) % 256; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_record.end_keyword = (k_otc_issue_closing_message_base + 34 + 1) % 256;
  skip
}

/* K Otc Issue Closing Message to the wire, 35 bytes from where the cursor stands */
inline encode_k_otc_issue_closing_message(k_otc_issue_closing_message_record) {
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 12 -> wire[at] = k_otc_issue_closing_message_record.isin[k_otc_issue_closing_message_at]; at = at + 1; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 8 -> wire[at] = k_otc_issue_closing_message_record.data_seq_number[k_otc_issue_closing_message_at]; at = at + 1; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 9 -> wire[at] = k_otc_issue_closing_message_record.closing_price[k_otc_issue_closing_message_at]; at = at + 1; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  wire[at] = k_otc_issue_closing_message_record.quotation_category; at = at + 1;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 4 -> wire[at] = k_otc_issue_closing_message_record.filler_4[k_otc_issue_closing_message_at]; at = at + 1; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  wire[at] = k_otc_issue_closing_message_record.end_keyword; at = at + 1;
  skip
}

/* K Otc Issue Closing Message off the wire, 35 bytes from where the cursor stands */
inline decode_k_otc_issue_closing_message(k_otc_issue_closing_message_record) {
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 12 -> k_otc_issue_closing_message_record.isin[k_otc_issue_closing_message_at] = wire[at]; at = at + 1; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 8 -> k_otc_issue_closing_message_record.data_seq_number[k_otc_issue_closing_message_at] = wire[at]; at = at + 1; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 9 -> k_otc_issue_closing_message_record.closing_price[k_otc_issue_closing_message_at] = wire[at]; at = at + 1; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_record.quotation_category = wire[at]; at = at + 1;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 4 -> k_otc_issue_closing_message_record.filler_4[k_otc_issue_closing_message_at] = wire[at]; at = at + 1; k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of K Otc Issue Closing Message is what was written, byte for byte */
inline equal_k_otc_issue_closing_message(k_otc_issue_closing_message_read, k_otc_issue_closing_message_written) {
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 12 -> assert(k_otc_issue_closing_message_read.isin[k_otc_issue_closing_message_at] == k_otc_issue_closing_message_written.isin[k_otc_issue_closing_message_at]); k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 8 -> assert(k_otc_issue_closing_message_read.data_seq_number[k_otc_issue_closing_message_at] == k_otc_issue_closing_message_written.data_seq_number[k_otc_issue_closing_message_at]); k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 9 -> assert(k_otc_issue_closing_message_read.closing_price[k_otc_issue_closing_message_at] == k_otc_issue_closing_message_written.closing_price[k_otc_issue_closing_message_at]); k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  assert(k_otc_issue_closing_message_read.quotation_category == k_otc_issue_closing_message_written.quotation_category);
  k_otc_issue_closing_message_at = 0;
  do
  :: k_otc_issue_closing_message_at < 4 -> assert(k_otc_issue_closing_message_read.filler_4[k_otc_issue_closing_message_at] == k_otc_issue_closing_message_written.filler_4[k_otc_issue_closing_message_at]); k_otc_issue_closing_message_at = k_otc_issue_closing_message_at + 1
  :: else -> break
  od;
  assert(k_otc_issue_closing_message_read.end_keyword == k_otc_issue_closing_message_written.end_keyword);
  skip
}

/* ---- K Otc Market Operation Message: 25 bytes -------------------------------- */

/* K-OTC Market Operation. Trading halt / lift-after-halt events with reason code. */
typedef KOtcMarketOperationMessage {
  byte isin[12];
  byte data_seq_number[8];
  byte type;
  byte reason[2];
  byte filler_1;
  byte end_keyword
};

int k_otc_market_operation_message_at;

/* every byte of K Otc Market Operation Message set to one value */
inline fill_k_otc_market_operation_message(k_otc_market_operation_message_record, k_otc_market_operation_message_value) {
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 12 -> k_otc_market_operation_message_record.isin[k_otc_market_operation_message_at] = k_otc_market_operation_message_value; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 8 -> k_otc_market_operation_message_record.data_seq_number[k_otc_market_operation_message_at] = k_otc_market_operation_message_value; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  k_otc_market_operation_message_record.type = k_otc_market_operation_message_value;
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 2 -> k_otc_market_operation_message_record.reason[k_otc_market_operation_message_at] = k_otc_market_operation_message_value; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  k_otc_market_operation_message_record.filler_1 = k_otc_market_operation_message_value;
  k_otc_market_operation_message_record.end_keyword = k_otc_market_operation_message_value;
  skip
}

/* each byte of K Otc Market Operation Message set to where it lies, so a field read out of place says so */
inline ramp_k_otc_market_operation_message(k_otc_market_operation_message_record, k_otc_market_operation_message_base) {
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 12 -> k_otc_market_operation_message_record.isin[k_otc_market_operation_message_at] = (k_otc_market_operation_message_base + 0 + k_otc_market_operation_message_at + 1) % 256; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 8 -> k_otc_market_operation_message_record.data_seq_number[k_otc_market_operation_message_at] = (k_otc_market_operation_message_base + 12 + k_otc_market_operation_message_at + 1) % 256; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  k_otc_market_operation_message_record.type = (k_otc_market_operation_message_base + 20 + 1) % 256;
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 2 -> k_otc_market_operation_message_record.reason[k_otc_market_operation_message_at] = (k_otc_market_operation_message_base + 21 + k_otc_market_operation_message_at + 1) % 256; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  k_otc_market_operation_message_record.filler_1 = (k_otc_market_operation_message_base + 23 + 1) % 256;
  k_otc_market_operation_message_record.end_keyword = (k_otc_market_operation_message_base + 24 + 1) % 256;
  skip
}

/* K Otc Market Operation Message to the wire, 25 bytes from where the cursor stands */
inline encode_k_otc_market_operation_message(k_otc_market_operation_message_record) {
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 12 -> wire[at] = k_otc_market_operation_message_record.isin[k_otc_market_operation_message_at]; at = at + 1; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 8 -> wire[at] = k_otc_market_operation_message_record.data_seq_number[k_otc_market_operation_message_at]; at = at + 1; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  wire[at] = k_otc_market_operation_message_record.type; at = at + 1;
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 2 -> wire[at] = k_otc_market_operation_message_record.reason[k_otc_market_operation_message_at]; at = at + 1; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  wire[at] = k_otc_market_operation_message_record.filler_1; at = at + 1;
  wire[at] = k_otc_market_operation_message_record.end_keyword; at = at + 1;
  skip
}

/* K Otc Market Operation Message off the wire, 25 bytes from where the cursor stands */
inline decode_k_otc_market_operation_message(k_otc_market_operation_message_record) {
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 12 -> k_otc_market_operation_message_record.isin[k_otc_market_operation_message_at] = wire[at]; at = at + 1; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 8 -> k_otc_market_operation_message_record.data_seq_number[k_otc_market_operation_message_at] = wire[at]; at = at + 1; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  k_otc_market_operation_message_record.type = wire[at]; at = at + 1;
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 2 -> k_otc_market_operation_message_record.reason[k_otc_market_operation_message_at] = wire[at]; at = at + 1; k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  k_otc_market_operation_message_record.filler_1 = wire[at]; at = at + 1;
  k_otc_market_operation_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of K Otc Market Operation Message is what was written, byte for byte */
inline equal_k_otc_market_operation_message(k_otc_market_operation_message_read, k_otc_market_operation_message_written) {
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 12 -> assert(k_otc_market_operation_message_read.isin[k_otc_market_operation_message_at] == k_otc_market_operation_message_written.isin[k_otc_market_operation_message_at]); k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 8 -> assert(k_otc_market_operation_message_read.data_seq_number[k_otc_market_operation_message_at] == k_otc_market_operation_message_written.data_seq_number[k_otc_market_operation_message_at]); k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  assert(k_otc_market_operation_message_read.type == k_otc_market_operation_message_written.type);
  k_otc_market_operation_message_at = 0;
  do
  :: k_otc_market_operation_message_at < 2 -> assert(k_otc_market_operation_message_read.reason[k_otc_market_operation_message_at] == k_otc_market_operation_message_written.reason[k_otc_market_operation_message_at]); k_otc_market_operation_message_at = k_otc_market_operation_message_at + 1
  :: else -> break
  od;
  assert(k_otc_market_operation_message_read.filler_1 == k_otc_market_operation_message_written.filler_1);
  assert(k_otc_market_operation_message_read.end_keyword == k_otc_market_operation_message_written.end_keyword);
  skip
}

/* ---- K Otc Market Action Message: 95 bytes ----------------------------------- */

/* K-OTC Market Action. Basis price and upper/lower limit price changes. */
typedef KOtcMarketActionMessage {
  byte isin_nullable[12];
  byte data_type[2];
  byte change_date[8];
  byte change_time[8];
  byte basis_price_before_action[9];
  byte upper_limit_price_before_action[9];
  byte lower_limit_price_before_action[9];
  byte basis_price_after_action[9];
  byte upper_limit_price_after_action[9];
  byte lower_limit_price_after_action[9];
  byte filler_10[10];
  byte end_keyword
};

int k_otc_market_action_message_at;

/* every byte of K Otc Market Action Message set to one value */
inline fill_k_otc_market_action_message(k_otc_market_action_message_record, k_otc_market_action_message_value) {
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 12 -> k_otc_market_action_message_record.isin_nullable[k_otc_market_action_message_at] = k_otc_market_action_message_value; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 2 -> k_otc_market_action_message_record.data_type[k_otc_market_action_message_at] = k_otc_market_action_message_value; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 8 -> k_otc_market_action_message_record.change_date[k_otc_market_action_message_at] = k_otc_market_action_message_value; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 8 -> k_otc_market_action_message_record.change_time[k_otc_market_action_message_at] = k_otc_market_action_message_value; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.basis_price_before_action[k_otc_market_action_message_at] = k_otc_market_action_message_value; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.upper_limit_price_before_action[k_otc_market_action_message_at] = k_otc_market_action_message_value; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.lower_limit_price_before_action[k_otc_market_action_message_at] = k_otc_market_action_message_value; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.basis_price_after_action[k_otc_market_action_message_at] = k_otc_market_action_message_value; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.upper_limit_price_after_action[k_otc_market_action_message_at] = k_otc_market_action_message_value; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.lower_limit_price_after_action[k_otc_market_action_message_at] = k_otc_market_action_message_value; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 10 -> k_otc_market_action_message_record.filler_10[k_otc_market_action_message_at] = k_otc_market_action_message_value; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_record.end_keyword = k_otc_market_action_message_value;
  skip
}

/* each byte of K Otc Market Action Message set to where it lies, so a field read out of place says so */
inline ramp_k_otc_market_action_message(k_otc_market_action_message_record, k_otc_market_action_message_base) {
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 12 -> k_otc_market_action_message_record.isin_nullable[k_otc_market_action_message_at] = (k_otc_market_action_message_base + 0 + k_otc_market_action_message_at + 1) % 256; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 2 -> k_otc_market_action_message_record.data_type[k_otc_market_action_message_at] = (k_otc_market_action_message_base + 12 + k_otc_market_action_message_at + 1) % 256; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 8 -> k_otc_market_action_message_record.change_date[k_otc_market_action_message_at] = (k_otc_market_action_message_base + 14 + k_otc_market_action_message_at + 1) % 256; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 8 -> k_otc_market_action_message_record.change_time[k_otc_market_action_message_at] = (k_otc_market_action_message_base + 22 + k_otc_market_action_message_at + 1) % 256; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.basis_price_before_action[k_otc_market_action_message_at] = (k_otc_market_action_message_base + 30 + k_otc_market_action_message_at + 1) % 256; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.upper_limit_price_before_action[k_otc_market_action_message_at] = (k_otc_market_action_message_base + 39 + k_otc_market_action_message_at + 1) % 256; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.lower_limit_price_before_action[k_otc_market_action_message_at] = (k_otc_market_action_message_base + 48 + k_otc_market_action_message_at + 1) % 256; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.basis_price_after_action[k_otc_market_action_message_at] = (k_otc_market_action_message_base + 57 + k_otc_market_action_message_at + 1) % 256; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.upper_limit_price_after_action[k_otc_market_action_message_at] = (k_otc_market_action_message_base + 66 + k_otc_market_action_message_at + 1) % 256; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.lower_limit_price_after_action[k_otc_market_action_message_at] = (k_otc_market_action_message_base + 75 + k_otc_market_action_message_at + 1) % 256; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 10 -> k_otc_market_action_message_record.filler_10[k_otc_market_action_message_at] = (k_otc_market_action_message_base + 84 + k_otc_market_action_message_at + 1) % 256; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_record.end_keyword = (k_otc_market_action_message_base + 94 + 1) % 256;
  skip
}

/* K Otc Market Action Message to the wire, 95 bytes from where the cursor stands */
inline encode_k_otc_market_action_message(k_otc_market_action_message_record) {
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 12 -> wire[at] = k_otc_market_action_message_record.isin_nullable[k_otc_market_action_message_at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 2 -> wire[at] = k_otc_market_action_message_record.data_type[k_otc_market_action_message_at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 8 -> wire[at] = k_otc_market_action_message_record.change_date[k_otc_market_action_message_at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 8 -> wire[at] = k_otc_market_action_message_record.change_time[k_otc_market_action_message_at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> wire[at] = k_otc_market_action_message_record.basis_price_before_action[k_otc_market_action_message_at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> wire[at] = k_otc_market_action_message_record.upper_limit_price_before_action[k_otc_market_action_message_at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> wire[at] = k_otc_market_action_message_record.lower_limit_price_before_action[k_otc_market_action_message_at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> wire[at] = k_otc_market_action_message_record.basis_price_after_action[k_otc_market_action_message_at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> wire[at] = k_otc_market_action_message_record.upper_limit_price_after_action[k_otc_market_action_message_at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> wire[at] = k_otc_market_action_message_record.lower_limit_price_after_action[k_otc_market_action_message_at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 10 -> wire[at] = k_otc_market_action_message_record.filler_10[k_otc_market_action_message_at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  wire[at] = k_otc_market_action_message_record.end_keyword; at = at + 1;
  skip
}

/* K Otc Market Action Message off the wire, 95 bytes from where the cursor stands */
inline decode_k_otc_market_action_message(k_otc_market_action_message_record) {
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 12 -> k_otc_market_action_message_record.isin_nullable[k_otc_market_action_message_at] = wire[at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 2 -> k_otc_market_action_message_record.data_type[k_otc_market_action_message_at] = wire[at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 8 -> k_otc_market_action_message_record.change_date[k_otc_market_action_message_at] = wire[at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 8 -> k_otc_market_action_message_record.change_time[k_otc_market_action_message_at] = wire[at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.basis_price_before_action[k_otc_market_action_message_at] = wire[at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.upper_limit_price_before_action[k_otc_market_action_message_at] = wire[at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.lower_limit_price_before_action[k_otc_market_action_message_at] = wire[at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.basis_price_after_action[k_otc_market_action_message_at] = wire[at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.upper_limit_price_after_action[k_otc_market_action_message_at] = wire[at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> k_otc_market_action_message_record.lower_limit_price_after_action[k_otc_market_action_message_at] = wire[at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 10 -> k_otc_market_action_message_record.filler_10[k_otc_market_action_message_at] = wire[at]; at = at + 1; k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of K Otc Market Action Message is what was written, byte for byte */
inline equal_k_otc_market_action_message(k_otc_market_action_message_read, k_otc_market_action_message_written) {
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 12 -> assert(k_otc_market_action_message_read.isin_nullable[k_otc_market_action_message_at] == k_otc_market_action_message_written.isin_nullable[k_otc_market_action_message_at]); k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 2 -> assert(k_otc_market_action_message_read.data_type[k_otc_market_action_message_at] == k_otc_market_action_message_written.data_type[k_otc_market_action_message_at]); k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 8 -> assert(k_otc_market_action_message_read.change_date[k_otc_market_action_message_at] == k_otc_market_action_message_written.change_date[k_otc_market_action_message_at]); k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 8 -> assert(k_otc_market_action_message_read.change_time[k_otc_market_action_message_at] == k_otc_market_action_message_written.change_time[k_otc_market_action_message_at]); k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> assert(k_otc_market_action_message_read.basis_price_before_action[k_otc_market_action_message_at] == k_otc_market_action_message_written.basis_price_before_action[k_otc_market_action_message_at]); k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> assert(k_otc_market_action_message_read.upper_limit_price_before_action[k_otc_market_action_message_at] == k_otc_market_action_message_written.upper_limit_price_before_action[k_otc_market_action_message_at]); k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> assert(k_otc_market_action_message_read.lower_limit_price_before_action[k_otc_market_action_message_at] == k_otc_market_action_message_written.lower_limit_price_before_action[k_otc_market_action_message_at]); k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> assert(k_otc_market_action_message_read.basis_price_after_action[k_otc_market_action_message_at] == k_otc_market_action_message_written.basis_price_after_action[k_otc_market_action_message_at]); k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> assert(k_otc_market_action_message_read.upper_limit_price_after_action[k_otc_market_action_message_at] == k_otc_market_action_message_written.upper_limit_price_after_action[k_otc_market_action_message_at]); k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 9 -> assert(k_otc_market_action_message_read.lower_limit_price_after_action[k_otc_market_action_message_at] == k_otc_market_action_message_written.lower_limit_price_after_action[k_otc_market_action_message_at]); k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  k_otc_market_action_message_at = 0;
  do
  :: k_otc_market_action_message_at < 10 -> assert(k_otc_market_action_message_read.filler_10[k_otc_market_action_message_at] == k_otc_market_action_message_written.filler_10[k_otc_market_action_message_at]); k_otc_market_action_message_at = k_otc_market_action_message_at + 1
  :: else -> break
  od;
  assert(k_otc_market_action_message_read.end_keyword == k_otc_market_action_message_written.end_keyword);
  skip
}

/* ---- K Otc Quote Message: 195 bytes ------------------------------------------ */

/* K-OTC Quote. Bid/ask quote with remaining quantity at the best price. */
typedef KOtcQuoteMessage {
  byte isin[12];
  byte data_seq_number[8];
  byte process_type;
  byte quote_number[6];
  byte original_quote_number[6];
  byte original_quote_price[9];
  byte bidask_type;
  byte price[9];
  byte quantity[10];
  byte subscription_time[6];
  byte total_remaining_quantity_of_ask[10];
  byte total_remaining_quantity_of_bid[10];
  byte ask_best_order[9];
  byte remaining_quantity_of_ask_best_order[10];
  byte bid_best_order[9];
  byte remaining_quantity_of_bid_best_order[10];
  byte price_compare_remaining_quantity_of_order[10];
  byte original_price_compare_remaining_quantity_of_order[10];
  byte securities_company_number[3];
  byte branch_name[12];
  byte filler_33[33];
  byte end_keyword
};

int k_otc_quote_message_at;

/* every byte of K Otc Quote Message set to one value */
inline fill_k_otc_quote_message(k_otc_quote_message_record, k_otc_quote_message_value) {
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 12 -> k_otc_quote_message_record.isin[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 8 -> k_otc_quote_message_record.data_seq_number[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_record.process_type = k_otc_quote_message_value;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> k_otc_quote_message_record.quote_number[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> k_otc_quote_message_record.original_quote_number[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.original_quote_price[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_record.bidask_type = k_otc_quote_message_value;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.price[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.quantity[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> k_otc_quote_message_record.subscription_time[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.total_remaining_quantity_of_ask[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.total_remaining_quantity_of_bid[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.ask_best_order[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.remaining_quantity_of_ask_best_order[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.bid_best_order[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.remaining_quantity_of_bid_best_order[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.price_compare_remaining_quantity_of_order[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.original_price_compare_remaining_quantity_of_order[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 3 -> k_otc_quote_message_record.securities_company_number[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 12 -> k_otc_quote_message_record.branch_name[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 33 -> k_otc_quote_message_record.filler_33[k_otc_quote_message_at] = k_otc_quote_message_value; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_record.end_keyword = k_otc_quote_message_value;
  skip
}

/* each byte of K Otc Quote Message set to where it lies, so a field read out of place says so */
inline ramp_k_otc_quote_message(k_otc_quote_message_record, k_otc_quote_message_base) {
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 12 -> k_otc_quote_message_record.isin[k_otc_quote_message_at] = (k_otc_quote_message_base + 0 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 8 -> k_otc_quote_message_record.data_seq_number[k_otc_quote_message_at] = (k_otc_quote_message_base + 12 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_record.process_type = (k_otc_quote_message_base + 20 + 1) % 256;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> k_otc_quote_message_record.quote_number[k_otc_quote_message_at] = (k_otc_quote_message_base + 21 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> k_otc_quote_message_record.original_quote_number[k_otc_quote_message_at] = (k_otc_quote_message_base + 27 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.original_quote_price[k_otc_quote_message_at] = (k_otc_quote_message_base + 33 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_record.bidask_type = (k_otc_quote_message_base + 42 + 1) % 256;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.price[k_otc_quote_message_at] = (k_otc_quote_message_base + 43 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.quantity[k_otc_quote_message_at] = (k_otc_quote_message_base + 52 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> k_otc_quote_message_record.subscription_time[k_otc_quote_message_at] = (k_otc_quote_message_base + 62 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.total_remaining_quantity_of_ask[k_otc_quote_message_at] = (k_otc_quote_message_base + 68 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.total_remaining_quantity_of_bid[k_otc_quote_message_at] = (k_otc_quote_message_base + 78 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.ask_best_order[k_otc_quote_message_at] = (k_otc_quote_message_base + 88 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.remaining_quantity_of_ask_best_order[k_otc_quote_message_at] = (k_otc_quote_message_base + 97 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.bid_best_order[k_otc_quote_message_at] = (k_otc_quote_message_base + 107 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.remaining_quantity_of_bid_best_order[k_otc_quote_message_at] = (k_otc_quote_message_base + 116 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.price_compare_remaining_quantity_of_order[k_otc_quote_message_at] = (k_otc_quote_message_base + 126 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.original_price_compare_remaining_quantity_of_order[k_otc_quote_message_at] = (k_otc_quote_message_base + 136 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 3 -> k_otc_quote_message_record.securities_company_number[k_otc_quote_message_at] = (k_otc_quote_message_base + 146 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 12 -> k_otc_quote_message_record.branch_name[k_otc_quote_message_at] = (k_otc_quote_message_base + 149 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 33 -> k_otc_quote_message_record.filler_33[k_otc_quote_message_at] = (k_otc_quote_message_base + 161 + k_otc_quote_message_at + 1) % 256; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_record.end_keyword = (k_otc_quote_message_base + 194 + 1) % 256;
  skip
}

/* K Otc Quote Message to the wire, 195 bytes from where the cursor stands */
inline encode_k_otc_quote_message(k_otc_quote_message_record) {
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 12 -> wire[at] = k_otc_quote_message_record.isin[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 8 -> wire[at] = k_otc_quote_message_record.data_seq_number[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = k_otc_quote_message_record.process_type; at = at + 1;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> wire[at] = k_otc_quote_message_record.quote_number[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> wire[at] = k_otc_quote_message_record.original_quote_number[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> wire[at] = k_otc_quote_message_record.original_quote_price[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = k_otc_quote_message_record.bidask_type; at = at + 1;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> wire[at] = k_otc_quote_message_record.price[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> wire[at] = k_otc_quote_message_record.quantity[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> wire[at] = k_otc_quote_message_record.subscription_time[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> wire[at] = k_otc_quote_message_record.total_remaining_quantity_of_ask[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> wire[at] = k_otc_quote_message_record.total_remaining_quantity_of_bid[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> wire[at] = k_otc_quote_message_record.ask_best_order[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> wire[at] = k_otc_quote_message_record.remaining_quantity_of_ask_best_order[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> wire[at] = k_otc_quote_message_record.bid_best_order[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> wire[at] = k_otc_quote_message_record.remaining_quantity_of_bid_best_order[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> wire[at] = k_otc_quote_message_record.price_compare_remaining_quantity_of_order[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> wire[at] = k_otc_quote_message_record.original_price_compare_remaining_quantity_of_order[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 3 -> wire[at] = k_otc_quote_message_record.securities_company_number[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 12 -> wire[at] = k_otc_quote_message_record.branch_name[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 33 -> wire[at] = k_otc_quote_message_record.filler_33[k_otc_quote_message_at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = k_otc_quote_message_record.end_keyword; at = at + 1;
  skip
}

/* K Otc Quote Message off the wire, 195 bytes from where the cursor stands */
inline decode_k_otc_quote_message(k_otc_quote_message_record) {
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 12 -> k_otc_quote_message_record.isin[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 8 -> k_otc_quote_message_record.data_seq_number[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_record.process_type = wire[at]; at = at + 1;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> k_otc_quote_message_record.quote_number[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> k_otc_quote_message_record.original_quote_number[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.original_quote_price[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_record.bidask_type = wire[at]; at = at + 1;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.price[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.quantity[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> k_otc_quote_message_record.subscription_time[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.total_remaining_quantity_of_ask[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.total_remaining_quantity_of_bid[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.ask_best_order[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.remaining_quantity_of_ask_best_order[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> k_otc_quote_message_record.bid_best_order[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.remaining_quantity_of_bid_best_order[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.price_compare_remaining_quantity_of_order[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> k_otc_quote_message_record.original_price_compare_remaining_quantity_of_order[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 3 -> k_otc_quote_message_record.securities_company_number[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 12 -> k_otc_quote_message_record.branch_name[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 33 -> k_otc_quote_message_record.filler_33[k_otc_quote_message_at] = wire[at]; at = at + 1; k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of K Otc Quote Message is what was written, byte for byte */
inline equal_k_otc_quote_message(k_otc_quote_message_read, k_otc_quote_message_written) {
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 12 -> assert(k_otc_quote_message_read.isin[k_otc_quote_message_at] == k_otc_quote_message_written.isin[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 8 -> assert(k_otc_quote_message_read.data_seq_number[k_otc_quote_message_at] == k_otc_quote_message_written.data_seq_number[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  assert(k_otc_quote_message_read.process_type == k_otc_quote_message_written.process_type);
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> assert(k_otc_quote_message_read.quote_number[k_otc_quote_message_at] == k_otc_quote_message_written.quote_number[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> assert(k_otc_quote_message_read.original_quote_number[k_otc_quote_message_at] == k_otc_quote_message_written.original_quote_number[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> assert(k_otc_quote_message_read.original_quote_price[k_otc_quote_message_at] == k_otc_quote_message_written.original_quote_price[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  assert(k_otc_quote_message_read.bidask_type == k_otc_quote_message_written.bidask_type);
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> assert(k_otc_quote_message_read.price[k_otc_quote_message_at] == k_otc_quote_message_written.price[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> assert(k_otc_quote_message_read.quantity[k_otc_quote_message_at] == k_otc_quote_message_written.quantity[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 6 -> assert(k_otc_quote_message_read.subscription_time[k_otc_quote_message_at] == k_otc_quote_message_written.subscription_time[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> assert(k_otc_quote_message_read.total_remaining_quantity_of_ask[k_otc_quote_message_at] == k_otc_quote_message_written.total_remaining_quantity_of_ask[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> assert(k_otc_quote_message_read.total_remaining_quantity_of_bid[k_otc_quote_message_at] == k_otc_quote_message_written.total_remaining_quantity_of_bid[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> assert(k_otc_quote_message_read.ask_best_order[k_otc_quote_message_at] == k_otc_quote_message_written.ask_best_order[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> assert(k_otc_quote_message_read.remaining_quantity_of_ask_best_order[k_otc_quote_message_at] == k_otc_quote_message_written.remaining_quantity_of_ask_best_order[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 9 -> assert(k_otc_quote_message_read.bid_best_order[k_otc_quote_message_at] == k_otc_quote_message_written.bid_best_order[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> assert(k_otc_quote_message_read.remaining_quantity_of_bid_best_order[k_otc_quote_message_at] == k_otc_quote_message_written.remaining_quantity_of_bid_best_order[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> assert(k_otc_quote_message_read.price_compare_remaining_quantity_of_order[k_otc_quote_message_at] == k_otc_quote_message_written.price_compare_remaining_quantity_of_order[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 10 -> assert(k_otc_quote_message_read.original_price_compare_remaining_quantity_of_order[k_otc_quote_message_at] == k_otc_quote_message_written.original_price_compare_remaining_quantity_of_order[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 3 -> assert(k_otc_quote_message_read.securities_company_number[k_otc_quote_message_at] == k_otc_quote_message_written.securities_company_number[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 12 -> assert(k_otc_quote_message_read.branch_name[k_otc_quote_message_at] == k_otc_quote_message_written.branch_name[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  k_otc_quote_message_at = 0;
  do
  :: k_otc_quote_message_at < 33 -> assert(k_otc_quote_message_read.filler_33[k_otc_quote_message_at] == k_otc_quote_message_written.filler_33[k_otc_quote_message_at]); k_otc_quote_message_at = k_otc_quote_message_at + 1
  :: else -> break
  od;
  assert(k_otc_quote_message_read.end_keyword == k_otc_quote_message_written.end_keyword);
  skip
}

/* ---- K Otc Order Filled Message: 247 bytes ----------------------------------- */

/* K-OTC Order Filled. Trade prints with running totals, high/low, weighted average price, and previous-day comparison. */
typedef KOtcOrderFilledMessage {
  byte isin[12];
  byte data_seq_number[8];
  byte trading_number[6];
  byte trading_price[9];
  byte trading_volume[12];
  byte trading_time[6];
  byte ask_quote_number[6];
  byte bid_quote_number[6];
  byte high_price[9];
  byte low_price[9];
  byte weighted_average_stock_price[9];
  byte total_trading_accumulated_volume[12];
  byte total_trading_accumulated_value[14];
  byte total_remaining_quantity_of_ask[10];
  byte total_remaining_quantity_of_bid[10];
  byte best_ask_order[9];
  byte remaining_quantity_of_best_ask_order[10];
  byte best_bid_order[9];
  byte remaining_quantity_of_best_bid_order[10];
  byte compared_to_previous_day_type;
  byte compared_to_previous_day[9];
  byte trading_price_compare_remaining_quantity_of_ask[10];
  byte trading_price_compare_remaining_quantity_of_bid[10];
  byte filler_40[40];
  byte end_keyword
};

int k_otc_order_filled_message_at;

/* every byte of K Otc Order Filled Message set to one value */
inline fill_k_otc_order_filled_message(k_otc_order_filled_message_record, k_otc_order_filled_message_value) {
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> k_otc_order_filled_message_record.isin[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 8 -> k_otc_order_filled_message_record.data_seq_number[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.trading_number[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.trading_price[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> k_otc_order_filled_message_record.trading_volume[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.trading_time[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.ask_quote_number[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.bid_quote_number[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.high_price[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.low_price[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.weighted_average_stock_price[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> k_otc_order_filled_message_record.total_trading_accumulated_volume[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 14 -> k_otc_order_filled_message_record.total_trading_accumulated_value[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.total_remaining_quantity_of_ask[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.total_remaining_quantity_of_bid[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.best_ask_order[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.remaining_quantity_of_best_ask_order[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.best_bid_order[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.remaining_quantity_of_best_bid_order[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_record.compared_to_previous_day_type = k_otc_order_filled_message_value;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.compared_to_previous_day[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.trading_price_compare_remaining_quantity_of_ask[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.trading_price_compare_remaining_quantity_of_bid[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 40 -> k_otc_order_filled_message_record.filler_40[k_otc_order_filled_message_at] = k_otc_order_filled_message_value; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_record.end_keyword = k_otc_order_filled_message_value;
  skip
}

/* each byte of K Otc Order Filled Message set to where it lies, so a field read out of place says so */
inline ramp_k_otc_order_filled_message(k_otc_order_filled_message_record, k_otc_order_filled_message_base) {
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> k_otc_order_filled_message_record.isin[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 0 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 8 -> k_otc_order_filled_message_record.data_seq_number[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 12 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.trading_number[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 20 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.trading_price[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 26 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> k_otc_order_filled_message_record.trading_volume[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 35 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.trading_time[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 47 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.ask_quote_number[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 53 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.bid_quote_number[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 59 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.high_price[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 65 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.low_price[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 74 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.weighted_average_stock_price[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 83 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> k_otc_order_filled_message_record.total_trading_accumulated_volume[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 92 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 14 -> k_otc_order_filled_message_record.total_trading_accumulated_value[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 104 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.total_remaining_quantity_of_ask[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 118 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.total_remaining_quantity_of_bid[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 128 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.best_ask_order[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 138 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.remaining_quantity_of_best_ask_order[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 147 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.best_bid_order[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 157 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.remaining_quantity_of_best_bid_order[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 166 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_record.compared_to_previous_day_type = (k_otc_order_filled_message_base + 176 + 1) % 256;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.compared_to_previous_day[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 177 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.trading_price_compare_remaining_quantity_of_ask[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 186 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.trading_price_compare_remaining_quantity_of_bid[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 196 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 40 -> k_otc_order_filled_message_record.filler_40[k_otc_order_filled_message_at] = (k_otc_order_filled_message_base + 206 + k_otc_order_filled_message_at + 1) % 256; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_record.end_keyword = (k_otc_order_filled_message_base + 246 + 1) % 256;
  skip
}

/* K Otc Order Filled Message to the wire, 247 bytes from where the cursor stands */
inline encode_k_otc_order_filled_message(k_otc_order_filled_message_record) {
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> wire[at] = k_otc_order_filled_message_record.isin[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 8 -> wire[at] = k_otc_order_filled_message_record.data_seq_number[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> wire[at] = k_otc_order_filled_message_record.trading_number[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> wire[at] = k_otc_order_filled_message_record.trading_price[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> wire[at] = k_otc_order_filled_message_record.trading_volume[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> wire[at] = k_otc_order_filled_message_record.trading_time[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> wire[at] = k_otc_order_filled_message_record.ask_quote_number[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> wire[at] = k_otc_order_filled_message_record.bid_quote_number[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> wire[at] = k_otc_order_filled_message_record.high_price[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> wire[at] = k_otc_order_filled_message_record.low_price[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> wire[at] = k_otc_order_filled_message_record.weighted_average_stock_price[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> wire[at] = k_otc_order_filled_message_record.total_trading_accumulated_volume[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 14 -> wire[at] = k_otc_order_filled_message_record.total_trading_accumulated_value[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> wire[at] = k_otc_order_filled_message_record.total_remaining_quantity_of_ask[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> wire[at] = k_otc_order_filled_message_record.total_remaining_quantity_of_bid[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> wire[at] = k_otc_order_filled_message_record.best_ask_order[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> wire[at] = k_otc_order_filled_message_record.remaining_quantity_of_best_ask_order[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> wire[at] = k_otc_order_filled_message_record.best_bid_order[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> wire[at] = k_otc_order_filled_message_record.remaining_quantity_of_best_bid_order[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  wire[at] = k_otc_order_filled_message_record.compared_to_previous_day_type; at = at + 1;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> wire[at] = k_otc_order_filled_message_record.compared_to_previous_day[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> wire[at] = k_otc_order_filled_message_record.trading_price_compare_remaining_quantity_of_ask[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> wire[at] = k_otc_order_filled_message_record.trading_price_compare_remaining_quantity_of_bid[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 40 -> wire[at] = k_otc_order_filled_message_record.filler_40[k_otc_order_filled_message_at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  wire[at] = k_otc_order_filled_message_record.end_keyword; at = at + 1;
  skip
}

/* K Otc Order Filled Message off the wire, 247 bytes from where the cursor stands */
inline decode_k_otc_order_filled_message(k_otc_order_filled_message_record) {
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> k_otc_order_filled_message_record.isin[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 8 -> k_otc_order_filled_message_record.data_seq_number[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.trading_number[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.trading_price[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> k_otc_order_filled_message_record.trading_volume[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.trading_time[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.ask_quote_number[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> k_otc_order_filled_message_record.bid_quote_number[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.high_price[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.low_price[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.weighted_average_stock_price[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> k_otc_order_filled_message_record.total_trading_accumulated_volume[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 14 -> k_otc_order_filled_message_record.total_trading_accumulated_value[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.total_remaining_quantity_of_ask[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.total_remaining_quantity_of_bid[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.best_ask_order[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.remaining_quantity_of_best_ask_order[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.best_bid_order[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.remaining_quantity_of_best_bid_order[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_record.compared_to_previous_day_type = wire[at]; at = at + 1;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> k_otc_order_filled_message_record.compared_to_previous_day[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.trading_price_compare_remaining_quantity_of_ask[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> k_otc_order_filled_message_record.trading_price_compare_remaining_quantity_of_bid[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 40 -> k_otc_order_filled_message_record.filler_40[k_otc_order_filled_message_at] = wire[at]; at = at + 1; k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of K Otc Order Filled Message is what was written, byte for byte */
inline equal_k_otc_order_filled_message(k_otc_order_filled_message_read, k_otc_order_filled_message_written) {
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> assert(k_otc_order_filled_message_read.isin[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.isin[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 8 -> assert(k_otc_order_filled_message_read.data_seq_number[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.data_seq_number[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> assert(k_otc_order_filled_message_read.trading_number[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.trading_number[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> assert(k_otc_order_filled_message_read.trading_price[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.trading_price[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> assert(k_otc_order_filled_message_read.trading_volume[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.trading_volume[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> assert(k_otc_order_filled_message_read.trading_time[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.trading_time[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> assert(k_otc_order_filled_message_read.ask_quote_number[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.ask_quote_number[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 6 -> assert(k_otc_order_filled_message_read.bid_quote_number[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.bid_quote_number[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> assert(k_otc_order_filled_message_read.high_price[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.high_price[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> assert(k_otc_order_filled_message_read.low_price[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.low_price[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> assert(k_otc_order_filled_message_read.weighted_average_stock_price[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.weighted_average_stock_price[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 12 -> assert(k_otc_order_filled_message_read.total_trading_accumulated_volume[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.total_trading_accumulated_volume[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 14 -> assert(k_otc_order_filled_message_read.total_trading_accumulated_value[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.total_trading_accumulated_value[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> assert(k_otc_order_filled_message_read.total_remaining_quantity_of_ask[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.total_remaining_quantity_of_ask[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> assert(k_otc_order_filled_message_read.total_remaining_quantity_of_bid[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.total_remaining_quantity_of_bid[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> assert(k_otc_order_filled_message_read.best_ask_order[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.best_ask_order[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> assert(k_otc_order_filled_message_read.remaining_quantity_of_best_ask_order[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.remaining_quantity_of_best_ask_order[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> assert(k_otc_order_filled_message_read.best_bid_order[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.best_bid_order[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> assert(k_otc_order_filled_message_read.remaining_quantity_of_best_bid_order[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.remaining_quantity_of_best_bid_order[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  assert(k_otc_order_filled_message_read.compared_to_previous_day_type == k_otc_order_filled_message_written.compared_to_previous_day_type);
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 9 -> assert(k_otc_order_filled_message_read.compared_to_previous_day[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.compared_to_previous_day[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> assert(k_otc_order_filled_message_read.trading_price_compare_remaining_quantity_of_ask[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.trading_price_compare_remaining_quantity_of_ask[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 10 -> assert(k_otc_order_filled_message_read.trading_price_compare_remaining_quantity_of_bid[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.trading_price_compare_remaining_quantity_of_bid[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  k_otc_order_filled_message_at = 0;
  do
  :: k_otc_order_filled_message_at < 40 -> assert(k_otc_order_filled_message_read.filler_40[k_otc_order_filled_message_at] == k_otc_order_filled_message_written.filler_40[k_otc_order_filled_message_at]); k_otc_order_filled_message_at = k_otc_order_filled_message_at + 1
  :: else -> break
  od;
  assert(k_otc_order_filled_message_read.end_keyword == k_otc_order_filled_message_written.end_keyword);
  skip
}

/* ---- Otc Bond Traded Info Message: 105 bytes --------------------------------- */

/* OTC Bond Traded Information. Reports today's or prior-day trading history with volume, pretax unit price, yield, settlement date, and FX category. */
typedef OtcBondTradedInfoMessage {
  byte isin[12];
  byte subcategory[2];
  byte trading_date[8];
  byte registered_time[6];
  byte process_category;
  byte registered_number[8];
  byte originally_registered_number[8];
  byte trading_type_category;
  byte volume[16];
  byte pretax_unit_price[8];
  byte pretax_yield[8];
  byte settlement_date_otc[8];
  byte market_base_rate[8];
  byte fx_category;
  byte based_fx[8];
  byte trading_category;
  byte end_keyword
};

int otc_bond_traded_info_message_at;

/* every byte of Otc Bond Traded Info Message set to one value */
inline fill_otc_bond_traded_info_message(otc_bond_traded_info_message_record, otc_bond_traded_info_message_value) {
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 12 -> otc_bond_traded_info_message_record.isin[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 2 -> otc_bond_traded_info_message_record.subcategory[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.trading_date[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 6 -> otc_bond_traded_info_message_record.registered_time[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.process_category = otc_bond_traded_info_message_value;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.registered_number[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.originally_registered_number[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.trading_type_category = otc_bond_traded_info_message_value;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 16 -> otc_bond_traded_info_message_record.volume[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.pretax_unit_price[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.pretax_yield[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.settlement_date_otc[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.market_base_rate[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.fx_category = otc_bond_traded_info_message_value;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.based_fx[otc_bond_traded_info_message_at] = otc_bond_traded_info_message_value; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.trading_category = otc_bond_traded_info_message_value;
  otc_bond_traded_info_message_record.end_keyword = otc_bond_traded_info_message_value;
  skip
}

/* each byte of Otc Bond Traded Info Message set to where it lies, so a field read out of place says so */
inline ramp_otc_bond_traded_info_message(otc_bond_traded_info_message_record, otc_bond_traded_info_message_base) {
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 12 -> otc_bond_traded_info_message_record.isin[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 0 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 2 -> otc_bond_traded_info_message_record.subcategory[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 12 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.trading_date[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 14 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 6 -> otc_bond_traded_info_message_record.registered_time[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 22 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.process_category = (otc_bond_traded_info_message_base + 28 + 1) % 256;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.registered_number[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 29 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.originally_registered_number[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 37 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.trading_type_category = (otc_bond_traded_info_message_base + 45 + 1) % 256;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 16 -> otc_bond_traded_info_message_record.volume[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 46 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.pretax_unit_price[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 62 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.pretax_yield[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 70 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.settlement_date_otc[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 78 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.market_base_rate[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 86 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.fx_category = (otc_bond_traded_info_message_base + 94 + 1) % 256;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.based_fx[otc_bond_traded_info_message_at] = (otc_bond_traded_info_message_base + 95 + otc_bond_traded_info_message_at + 1) % 256; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.trading_category = (otc_bond_traded_info_message_base + 103 + 1) % 256;
  otc_bond_traded_info_message_record.end_keyword = (otc_bond_traded_info_message_base + 104 + 1) % 256;
  skip
}

/* Otc Bond Traded Info Message to the wire, 105 bytes from where the cursor stands */
inline encode_otc_bond_traded_info_message(otc_bond_traded_info_message_record) {
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 12 -> wire[at] = otc_bond_traded_info_message_record.isin[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 2 -> wire[at] = otc_bond_traded_info_message_record.subcategory[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> wire[at] = otc_bond_traded_info_message_record.trading_date[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 6 -> wire[at] = otc_bond_traded_info_message_record.registered_time[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  wire[at] = otc_bond_traded_info_message_record.process_category; at = at + 1;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> wire[at] = otc_bond_traded_info_message_record.registered_number[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> wire[at] = otc_bond_traded_info_message_record.originally_registered_number[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  wire[at] = otc_bond_traded_info_message_record.trading_type_category; at = at + 1;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 16 -> wire[at] = otc_bond_traded_info_message_record.volume[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> wire[at] = otc_bond_traded_info_message_record.pretax_unit_price[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> wire[at] = otc_bond_traded_info_message_record.pretax_yield[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> wire[at] = otc_bond_traded_info_message_record.settlement_date_otc[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> wire[at] = otc_bond_traded_info_message_record.market_base_rate[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  wire[at] = otc_bond_traded_info_message_record.fx_category; at = at + 1;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> wire[at] = otc_bond_traded_info_message_record.based_fx[otc_bond_traded_info_message_at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  wire[at] = otc_bond_traded_info_message_record.trading_category; at = at + 1;
  wire[at] = otc_bond_traded_info_message_record.end_keyword; at = at + 1;
  skip
}

/* Otc Bond Traded Info Message off the wire, 105 bytes from where the cursor stands */
inline decode_otc_bond_traded_info_message(otc_bond_traded_info_message_record) {
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 12 -> otc_bond_traded_info_message_record.isin[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 2 -> otc_bond_traded_info_message_record.subcategory[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.trading_date[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 6 -> otc_bond_traded_info_message_record.registered_time[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.process_category = wire[at]; at = at + 1;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.registered_number[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.originally_registered_number[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.trading_type_category = wire[at]; at = at + 1;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 16 -> otc_bond_traded_info_message_record.volume[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.pretax_unit_price[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.pretax_yield[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.settlement_date_otc[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.market_base_rate[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.fx_category = wire[at]; at = at + 1;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> otc_bond_traded_info_message_record.based_fx[otc_bond_traded_info_message_at] = wire[at]; at = at + 1; otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_record.trading_category = wire[at]; at = at + 1;
  otc_bond_traded_info_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Otc Bond Traded Info Message is what was written, byte for byte */
inline equal_otc_bond_traded_info_message(otc_bond_traded_info_message_read, otc_bond_traded_info_message_written) {
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 12 -> assert(otc_bond_traded_info_message_read.isin[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.isin[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 2 -> assert(otc_bond_traded_info_message_read.subcategory[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.subcategory[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> assert(otc_bond_traded_info_message_read.trading_date[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.trading_date[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 6 -> assert(otc_bond_traded_info_message_read.registered_time[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.registered_time[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  assert(otc_bond_traded_info_message_read.process_category == otc_bond_traded_info_message_written.process_category);
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> assert(otc_bond_traded_info_message_read.registered_number[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.registered_number[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> assert(otc_bond_traded_info_message_read.originally_registered_number[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.originally_registered_number[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  assert(otc_bond_traded_info_message_read.trading_type_category == otc_bond_traded_info_message_written.trading_type_category);
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 16 -> assert(otc_bond_traded_info_message_read.volume[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.volume[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> assert(otc_bond_traded_info_message_read.pretax_unit_price[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.pretax_unit_price[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> assert(otc_bond_traded_info_message_read.pretax_yield[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.pretax_yield[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> assert(otc_bond_traded_info_message_read.settlement_date_otc[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.settlement_date_otc[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> assert(otc_bond_traded_info_message_read.market_base_rate[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.market_base_rate[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  assert(otc_bond_traded_info_message_read.fx_category == otc_bond_traded_info_message_written.fx_category);
  otc_bond_traded_info_message_at = 0;
  do
  :: otc_bond_traded_info_message_at < 8 -> assert(otc_bond_traded_info_message_read.based_fx[otc_bond_traded_info_message_at] == otc_bond_traded_info_message_written.based_fx[otc_bond_traded_info_message_at]); otc_bond_traded_info_message_at = otc_bond_traded_info_message_at + 1
  :: else -> break
  od;
  assert(otc_bond_traded_info_message_read.trading_category == otc_bond_traded_info_message_written.trading_category);
  assert(otc_bond_traded_info_message_read.end_keyword == otc_bond_traded_info_message_written.end_keyword);
  skip
}

/* ---- Otc Bond Trades Per Institution Message: 105 bytes ---------------------- */

/* OTC Bond trade aggregates per institution. Reports bid and ask yields and trading volumes/values per institution code and bond type. */
typedef OtcBondTradesPerInstitutionMessage {
  byte data_process_category;
  byte date[8];
  byte institution_code[4];
  byte bond_type_code[4];
  byte ask_yield_institution[8];
  byte ask_trading_volume_institution[15];
  byte ask_trading_value_institution[15];
  byte bid_yield_institution[8];
  byte bid_trading_volume_institution[15];
  byte bid_trading_value_institution[15];
  byte filler_11[11];
  byte end_keyword
};

int otc_bond_trades_per_institution_message_at;

/* every byte of Otc Bond Trades Per Institution Message set to one value */
inline fill_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_record, otc_bond_trades_per_institution_message_value) {
  otc_bond_trades_per_institution_message_record.data_process_category = otc_bond_trades_per_institution_message_value;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> otc_bond_trades_per_institution_message_record.date[otc_bond_trades_per_institution_message_at] = otc_bond_trades_per_institution_message_value; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 4 -> otc_bond_trades_per_institution_message_record.institution_code[otc_bond_trades_per_institution_message_at] = otc_bond_trades_per_institution_message_value; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 4 -> otc_bond_trades_per_institution_message_record.bond_type_code[otc_bond_trades_per_institution_message_at] = otc_bond_trades_per_institution_message_value; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> otc_bond_trades_per_institution_message_record.ask_yield_institution[otc_bond_trades_per_institution_message_at] = otc_bond_trades_per_institution_message_value; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.ask_trading_volume_institution[otc_bond_trades_per_institution_message_at] = otc_bond_trades_per_institution_message_value; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.ask_trading_value_institution[otc_bond_trades_per_institution_message_at] = otc_bond_trades_per_institution_message_value; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> otc_bond_trades_per_institution_message_record.bid_yield_institution[otc_bond_trades_per_institution_message_at] = otc_bond_trades_per_institution_message_value; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.bid_trading_volume_institution[otc_bond_trades_per_institution_message_at] = otc_bond_trades_per_institution_message_value; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.bid_trading_value_institution[otc_bond_trades_per_institution_message_at] = otc_bond_trades_per_institution_message_value; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 11 -> otc_bond_trades_per_institution_message_record.filler_11[otc_bond_trades_per_institution_message_at] = otc_bond_trades_per_institution_message_value; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_record.end_keyword = otc_bond_trades_per_institution_message_value;
  skip
}

/* each byte of Otc Bond Trades Per Institution Message set to where it lies, so a field read out of place says so */
inline ramp_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_record, otc_bond_trades_per_institution_message_base) {
  otc_bond_trades_per_institution_message_record.data_process_category = (otc_bond_trades_per_institution_message_base + 0 + 1) % 256;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> otc_bond_trades_per_institution_message_record.date[otc_bond_trades_per_institution_message_at] = (otc_bond_trades_per_institution_message_base + 1 + otc_bond_trades_per_institution_message_at + 1) % 256; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 4 -> otc_bond_trades_per_institution_message_record.institution_code[otc_bond_trades_per_institution_message_at] = (otc_bond_trades_per_institution_message_base + 9 + otc_bond_trades_per_institution_message_at + 1) % 256; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 4 -> otc_bond_trades_per_institution_message_record.bond_type_code[otc_bond_trades_per_institution_message_at] = (otc_bond_trades_per_institution_message_base + 13 + otc_bond_trades_per_institution_message_at + 1) % 256; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> otc_bond_trades_per_institution_message_record.ask_yield_institution[otc_bond_trades_per_institution_message_at] = (otc_bond_trades_per_institution_message_base + 17 + otc_bond_trades_per_institution_message_at + 1) % 256; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.ask_trading_volume_institution[otc_bond_trades_per_institution_message_at] = (otc_bond_trades_per_institution_message_base + 25 + otc_bond_trades_per_institution_message_at + 1) % 256; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.ask_trading_value_institution[otc_bond_trades_per_institution_message_at] = (otc_bond_trades_per_institution_message_base + 40 + otc_bond_trades_per_institution_message_at + 1) % 256; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> otc_bond_trades_per_institution_message_record.bid_yield_institution[otc_bond_trades_per_institution_message_at] = (otc_bond_trades_per_institution_message_base + 55 + otc_bond_trades_per_institution_message_at + 1) % 256; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.bid_trading_volume_institution[otc_bond_trades_per_institution_message_at] = (otc_bond_trades_per_institution_message_base + 63 + otc_bond_trades_per_institution_message_at + 1) % 256; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.bid_trading_value_institution[otc_bond_trades_per_institution_message_at] = (otc_bond_trades_per_institution_message_base + 78 + otc_bond_trades_per_institution_message_at + 1) % 256; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 11 -> otc_bond_trades_per_institution_message_record.filler_11[otc_bond_trades_per_institution_message_at] = (otc_bond_trades_per_institution_message_base + 93 + otc_bond_trades_per_institution_message_at + 1) % 256; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_record.end_keyword = (otc_bond_trades_per_institution_message_base + 104 + 1) % 256;
  skip
}

/* Otc Bond Trades Per Institution Message to the wire, 105 bytes from where the cursor stands */
inline encode_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_record) {
  wire[at] = otc_bond_trades_per_institution_message_record.data_process_category; at = at + 1;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> wire[at] = otc_bond_trades_per_institution_message_record.date[otc_bond_trades_per_institution_message_at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 4 -> wire[at] = otc_bond_trades_per_institution_message_record.institution_code[otc_bond_trades_per_institution_message_at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 4 -> wire[at] = otc_bond_trades_per_institution_message_record.bond_type_code[otc_bond_trades_per_institution_message_at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> wire[at] = otc_bond_trades_per_institution_message_record.ask_yield_institution[otc_bond_trades_per_institution_message_at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> wire[at] = otc_bond_trades_per_institution_message_record.ask_trading_volume_institution[otc_bond_trades_per_institution_message_at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> wire[at] = otc_bond_trades_per_institution_message_record.ask_trading_value_institution[otc_bond_trades_per_institution_message_at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> wire[at] = otc_bond_trades_per_institution_message_record.bid_yield_institution[otc_bond_trades_per_institution_message_at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> wire[at] = otc_bond_trades_per_institution_message_record.bid_trading_volume_institution[otc_bond_trades_per_institution_message_at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> wire[at] = otc_bond_trades_per_institution_message_record.bid_trading_value_institution[otc_bond_trades_per_institution_message_at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 11 -> wire[at] = otc_bond_trades_per_institution_message_record.filler_11[otc_bond_trades_per_institution_message_at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  wire[at] = otc_bond_trades_per_institution_message_record.end_keyword; at = at + 1;
  skip
}

/* Otc Bond Trades Per Institution Message off the wire, 105 bytes from where the cursor stands */
inline decode_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_record) {
  otc_bond_trades_per_institution_message_record.data_process_category = wire[at]; at = at + 1;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> otc_bond_trades_per_institution_message_record.date[otc_bond_trades_per_institution_message_at] = wire[at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 4 -> otc_bond_trades_per_institution_message_record.institution_code[otc_bond_trades_per_institution_message_at] = wire[at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 4 -> otc_bond_trades_per_institution_message_record.bond_type_code[otc_bond_trades_per_institution_message_at] = wire[at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> otc_bond_trades_per_institution_message_record.ask_yield_institution[otc_bond_trades_per_institution_message_at] = wire[at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.ask_trading_volume_institution[otc_bond_trades_per_institution_message_at] = wire[at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.ask_trading_value_institution[otc_bond_trades_per_institution_message_at] = wire[at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> otc_bond_trades_per_institution_message_record.bid_yield_institution[otc_bond_trades_per_institution_message_at] = wire[at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.bid_trading_volume_institution[otc_bond_trades_per_institution_message_at] = wire[at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> otc_bond_trades_per_institution_message_record.bid_trading_value_institution[otc_bond_trades_per_institution_message_at] = wire[at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 11 -> otc_bond_trades_per_institution_message_record.filler_11[otc_bond_trades_per_institution_message_at] = wire[at]; at = at + 1; otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Otc Bond Trades Per Institution Message is what was written, byte for byte */
inline equal_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_read, otc_bond_trades_per_institution_message_written) {
  assert(otc_bond_trades_per_institution_message_read.data_process_category == otc_bond_trades_per_institution_message_written.data_process_category);
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> assert(otc_bond_trades_per_institution_message_read.date[otc_bond_trades_per_institution_message_at] == otc_bond_trades_per_institution_message_written.date[otc_bond_trades_per_institution_message_at]); otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 4 -> assert(otc_bond_trades_per_institution_message_read.institution_code[otc_bond_trades_per_institution_message_at] == otc_bond_trades_per_institution_message_written.institution_code[otc_bond_trades_per_institution_message_at]); otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 4 -> assert(otc_bond_trades_per_institution_message_read.bond_type_code[otc_bond_trades_per_institution_message_at] == otc_bond_trades_per_institution_message_written.bond_type_code[otc_bond_trades_per_institution_message_at]); otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> assert(otc_bond_trades_per_institution_message_read.ask_yield_institution[otc_bond_trades_per_institution_message_at] == otc_bond_trades_per_institution_message_written.ask_yield_institution[otc_bond_trades_per_institution_message_at]); otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> assert(otc_bond_trades_per_institution_message_read.ask_trading_volume_institution[otc_bond_trades_per_institution_message_at] == otc_bond_trades_per_institution_message_written.ask_trading_volume_institution[otc_bond_trades_per_institution_message_at]); otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> assert(otc_bond_trades_per_institution_message_read.ask_trading_value_institution[otc_bond_trades_per_institution_message_at] == otc_bond_trades_per_institution_message_written.ask_trading_value_institution[otc_bond_trades_per_institution_message_at]); otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 8 -> assert(otc_bond_trades_per_institution_message_read.bid_yield_institution[otc_bond_trades_per_institution_message_at] == otc_bond_trades_per_institution_message_written.bid_yield_institution[otc_bond_trades_per_institution_message_at]); otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> assert(otc_bond_trades_per_institution_message_read.bid_trading_volume_institution[otc_bond_trades_per_institution_message_at] == otc_bond_trades_per_institution_message_written.bid_trading_volume_institution[otc_bond_trades_per_institution_message_at]); otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 15 -> assert(otc_bond_trades_per_institution_message_read.bid_trading_value_institution[otc_bond_trades_per_institution_message_at] == otc_bond_trades_per_institution_message_written.bid_trading_value_institution[otc_bond_trades_per_institution_message_at]); otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  otc_bond_trades_per_institution_message_at = 0;
  do
  :: otc_bond_trades_per_institution_message_at < 11 -> assert(otc_bond_trades_per_institution_message_read.filler_11[otc_bond_trades_per_institution_message_at] == otc_bond_trades_per_institution_message_written.filler_11[otc_bond_trades_per_institution_message_at]); otc_bond_trades_per_institution_message_at = otc_bond_trades_per_institution_message_at + 1
  :: else -> break
  od;
  assert(otc_bond_trades_per_institution_message_read.end_keyword == otc_bond_trades_per_institution_message_written.end_keyword);
  skip
}

/* ---- Otc Bond Types Per Investor Message: 135 bytes -------------------------- */

/* OTC Bond trade aggregates per investor category. Bid/ask yields and trading volumes/values per ISIN and investor category. */
typedef OtcBondTypesPerInvestorMessage {
  byte isin[12];
  byte sequence_number[8];
  byte trading_date[8];
  byte investor_category[4];
  byte ask_yield_investor[10];
  byte bid_yield_investor[10];
  byte ask_trading_volume_investor[20];
  byte bid_trading_volume_investor[20];
  byte ask_trading_value_investor[20];
  byte bid_trading_value_investor[20];
  byte filler_2[2];
  byte end_keyword
};

int otc_bond_types_per_investor_message_at;

/* every byte of Otc Bond Types Per Investor Message set to one value */
inline fill_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_record, otc_bond_types_per_investor_message_value) {
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 12 -> otc_bond_types_per_investor_message_record.isin[otc_bond_types_per_investor_message_at] = otc_bond_types_per_investor_message_value; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 8 -> otc_bond_types_per_investor_message_record.sequence_number[otc_bond_types_per_investor_message_at] = otc_bond_types_per_investor_message_value; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 8 -> otc_bond_types_per_investor_message_record.trading_date[otc_bond_types_per_investor_message_at] = otc_bond_types_per_investor_message_value; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 4 -> otc_bond_types_per_investor_message_record.investor_category[otc_bond_types_per_investor_message_at] = otc_bond_types_per_investor_message_value; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 10 -> otc_bond_types_per_investor_message_record.ask_yield_investor[otc_bond_types_per_investor_message_at] = otc_bond_types_per_investor_message_value; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 10 -> otc_bond_types_per_investor_message_record.bid_yield_investor[otc_bond_types_per_investor_message_at] = otc_bond_types_per_investor_message_value; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.ask_trading_volume_investor[otc_bond_types_per_investor_message_at] = otc_bond_types_per_investor_message_value; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.bid_trading_volume_investor[otc_bond_types_per_investor_message_at] = otc_bond_types_per_investor_message_value; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.ask_trading_value_investor[otc_bond_types_per_investor_message_at] = otc_bond_types_per_investor_message_value; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.bid_trading_value_investor[otc_bond_types_per_investor_message_at] = otc_bond_types_per_investor_message_value; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 2 -> otc_bond_types_per_investor_message_record.filler_2[otc_bond_types_per_investor_message_at] = otc_bond_types_per_investor_message_value; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_record.end_keyword = otc_bond_types_per_investor_message_value;
  skip
}

/* each byte of Otc Bond Types Per Investor Message set to where it lies, so a field read out of place says so */
inline ramp_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_record, otc_bond_types_per_investor_message_base) {
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 12 -> otc_bond_types_per_investor_message_record.isin[otc_bond_types_per_investor_message_at] = (otc_bond_types_per_investor_message_base + 0 + otc_bond_types_per_investor_message_at + 1) % 256; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 8 -> otc_bond_types_per_investor_message_record.sequence_number[otc_bond_types_per_investor_message_at] = (otc_bond_types_per_investor_message_base + 12 + otc_bond_types_per_investor_message_at + 1) % 256; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 8 -> otc_bond_types_per_investor_message_record.trading_date[otc_bond_types_per_investor_message_at] = (otc_bond_types_per_investor_message_base + 20 + otc_bond_types_per_investor_message_at + 1) % 256; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 4 -> otc_bond_types_per_investor_message_record.investor_category[otc_bond_types_per_investor_message_at] = (otc_bond_types_per_investor_message_base + 28 + otc_bond_types_per_investor_message_at + 1) % 256; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 10 -> otc_bond_types_per_investor_message_record.ask_yield_investor[otc_bond_types_per_investor_message_at] = (otc_bond_types_per_investor_message_base + 32 + otc_bond_types_per_investor_message_at + 1) % 256; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 10 -> otc_bond_types_per_investor_message_record.bid_yield_investor[otc_bond_types_per_investor_message_at] = (otc_bond_types_per_investor_message_base + 42 + otc_bond_types_per_investor_message_at + 1) % 256; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.ask_trading_volume_investor[otc_bond_types_per_investor_message_at] = (otc_bond_types_per_investor_message_base + 52 + otc_bond_types_per_investor_message_at + 1) % 256; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.bid_trading_volume_investor[otc_bond_types_per_investor_message_at] = (otc_bond_types_per_investor_message_base + 72 + otc_bond_types_per_investor_message_at + 1) % 256; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.ask_trading_value_investor[otc_bond_types_per_investor_message_at] = (otc_bond_types_per_investor_message_base + 92 + otc_bond_types_per_investor_message_at + 1) % 256; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.bid_trading_value_investor[otc_bond_types_per_investor_message_at] = (otc_bond_types_per_investor_message_base + 112 + otc_bond_types_per_investor_message_at + 1) % 256; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 2 -> otc_bond_types_per_investor_message_record.filler_2[otc_bond_types_per_investor_message_at] = (otc_bond_types_per_investor_message_base + 132 + otc_bond_types_per_investor_message_at + 1) % 256; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_record.end_keyword = (otc_bond_types_per_investor_message_base + 134 + 1) % 256;
  skip
}

/* Otc Bond Types Per Investor Message to the wire, 135 bytes from where the cursor stands */
inline encode_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_record) {
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 12 -> wire[at] = otc_bond_types_per_investor_message_record.isin[otc_bond_types_per_investor_message_at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 8 -> wire[at] = otc_bond_types_per_investor_message_record.sequence_number[otc_bond_types_per_investor_message_at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 8 -> wire[at] = otc_bond_types_per_investor_message_record.trading_date[otc_bond_types_per_investor_message_at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 4 -> wire[at] = otc_bond_types_per_investor_message_record.investor_category[otc_bond_types_per_investor_message_at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 10 -> wire[at] = otc_bond_types_per_investor_message_record.ask_yield_investor[otc_bond_types_per_investor_message_at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 10 -> wire[at] = otc_bond_types_per_investor_message_record.bid_yield_investor[otc_bond_types_per_investor_message_at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> wire[at] = otc_bond_types_per_investor_message_record.ask_trading_volume_investor[otc_bond_types_per_investor_message_at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> wire[at] = otc_bond_types_per_investor_message_record.bid_trading_volume_investor[otc_bond_types_per_investor_message_at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> wire[at] = otc_bond_types_per_investor_message_record.ask_trading_value_investor[otc_bond_types_per_investor_message_at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> wire[at] = otc_bond_types_per_investor_message_record.bid_trading_value_investor[otc_bond_types_per_investor_message_at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 2 -> wire[at] = otc_bond_types_per_investor_message_record.filler_2[otc_bond_types_per_investor_message_at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  wire[at] = otc_bond_types_per_investor_message_record.end_keyword; at = at + 1;
  skip
}

/* Otc Bond Types Per Investor Message off the wire, 135 bytes from where the cursor stands */
inline decode_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_record) {
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 12 -> otc_bond_types_per_investor_message_record.isin[otc_bond_types_per_investor_message_at] = wire[at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 8 -> otc_bond_types_per_investor_message_record.sequence_number[otc_bond_types_per_investor_message_at] = wire[at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 8 -> otc_bond_types_per_investor_message_record.trading_date[otc_bond_types_per_investor_message_at] = wire[at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 4 -> otc_bond_types_per_investor_message_record.investor_category[otc_bond_types_per_investor_message_at] = wire[at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 10 -> otc_bond_types_per_investor_message_record.ask_yield_investor[otc_bond_types_per_investor_message_at] = wire[at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 10 -> otc_bond_types_per_investor_message_record.bid_yield_investor[otc_bond_types_per_investor_message_at] = wire[at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.ask_trading_volume_investor[otc_bond_types_per_investor_message_at] = wire[at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.bid_trading_volume_investor[otc_bond_types_per_investor_message_at] = wire[at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.ask_trading_value_investor[otc_bond_types_per_investor_message_at] = wire[at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> otc_bond_types_per_investor_message_record.bid_trading_value_investor[otc_bond_types_per_investor_message_at] = wire[at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 2 -> otc_bond_types_per_investor_message_record.filler_2[otc_bond_types_per_investor_message_at] = wire[at]; at = at + 1; otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Otc Bond Types Per Investor Message is what was written, byte for byte */
inline equal_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_read, otc_bond_types_per_investor_message_written) {
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 12 -> assert(otc_bond_types_per_investor_message_read.isin[otc_bond_types_per_investor_message_at] == otc_bond_types_per_investor_message_written.isin[otc_bond_types_per_investor_message_at]); otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 8 -> assert(otc_bond_types_per_investor_message_read.sequence_number[otc_bond_types_per_investor_message_at] == otc_bond_types_per_investor_message_written.sequence_number[otc_bond_types_per_investor_message_at]); otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 8 -> assert(otc_bond_types_per_investor_message_read.trading_date[otc_bond_types_per_investor_message_at] == otc_bond_types_per_investor_message_written.trading_date[otc_bond_types_per_investor_message_at]); otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 4 -> assert(otc_bond_types_per_investor_message_read.investor_category[otc_bond_types_per_investor_message_at] == otc_bond_types_per_investor_message_written.investor_category[otc_bond_types_per_investor_message_at]); otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 10 -> assert(otc_bond_types_per_investor_message_read.ask_yield_investor[otc_bond_types_per_investor_message_at] == otc_bond_types_per_investor_message_written.ask_yield_investor[otc_bond_types_per_investor_message_at]); otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 10 -> assert(otc_bond_types_per_investor_message_read.bid_yield_investor[otc_bond_types_per_investor_message_at] == otc_bond_types_per_investor_message_written.bid_yield_investor[otc_bond_types_per_investor_message_at]); otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> assert(otc_bond_types_per_investor_message_read.ask_trading_volume_investor[otc_bond_types_per_investor_message_at] == otc_bond_types_per_investor_message_written.ask_trading_volume_investor[otc_bond_types_per_investor_message_at]); otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> assert(otc_bond_types_per_investor_message_read.bid_trading_volume_investor[otc_bond_types_per_investor_message_at] == otc_bond_types_per_investor_message_written.bid_trading_volume_investor[otc_bond_types_per_investor_message_at]); otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> assert(otc_bond_types_per_investor_message_read.ask_trading_value_investor[otc_bond_types_per_investor_message_at] == otc_bond_types_per_investor_message_written.ask_trading_value_investor[otc_bond_types_per_investor_message_at]); otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 20 -> assert(otc_bond_types_per_investor_message_read.bid_trading_value_investor[otc_bond_types_per_investor_message_at] == otc_bond_types_per_investor_message_written.bid_trading_value_investor[otc_bond_types_per_investor_message_at]); otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  otc_bond_types_per_investor_message_at = 0;
  do
  :: otc_bond_types_per_investor_message_at < 2 -> assert(otc_bond_types_per_investor_message_read.filler_2[otc_bond_types_per_investor_message_at] == otc_bond_types_per_investor_message_written.filler_2[otc_bond_types_per_investor_message_at]); otc_bond_types_per_investor_message_at = otc_bond_types_per_investor_message_at + 1
  :: else -> break
  od;
  assert(otc_bond_types_per_investor_message_read.end_keyword == otc_bond_types_per_investor_message_written.end_keyword);
  skip
}

/* ---- K Bond Message: 145 bytes ----------------------------------------------- */

/* K-BOND dissemination. Quotes and trades with profit rate or price, contract category, settlement date, and replacement order details. */
typedef KBondMessage {
  byte isin[12];
  byte data_small_category[2];
  byte data_source_type;
  byte sequence_number[8];
  byte original_sequence_number[8];
  byte replacement_type;
  byte previous_isin_of_replacement[8];
  byte input_date[8];
  byte quotes_offer_time[6];
  byte bond_type_name[40];
  byte change_category;
  byte market_data_type;
  byte profit_rate_quotes_trading[8];
  byte price_quotes_trading[8];
  byte contract_category;
  byte quotes_amount[16];
  byte contract_date[2];
  byte settlement_date_k_bond[2];
  byte filler_11[11];
  byte end_keyword
};

int k_bond_message_at;

/* every byte of K Bond Message set to one value */
inline fill_k_bond_message(k_bond_message_record, k_bond_message_value) {
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 12 -> k_bond_message_record.isin[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> k_bond_message_record.data_small_category[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.data_source_type = k_bond_message_value;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.sequence_number[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.original_sequence_number[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.replacement_type = k_bond_message_value;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.previous_isin_of_replacement[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.input_date[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 6 -> k_bond_message_record.quotes_offer_time[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 40 -> k_bond_message_record.bond_type_name[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.change_category = k_bond_message_value;
  k_bond_message_record.market_data_type = k_bond_message_value;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.profit_rate_quotes_trading[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.price_quotes_trading[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.contract_category = k_bond_message_value;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 16 -> k_bond_message_record.quotes_amount[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> k_bond_message_record.contract_date[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> k_bond_message_record.settlement_date_k_bond[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 11 -> k_bond_message_record.filler_11[k_bond_message_at] = k_bond_message_value; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.end_keyword = k_bond_message_value;
  skip
}

/* each byte of K Bond Message set to where it lies, so a field read out of place says so */
inline ramp_k_bond_message(k_bond_message_record, k_bond_message_base) {
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 12 -> k_bond_message_record.isin[k_bond_message_at] = (k_bond_message_base + 0 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> k_bond_message_record.data_small_category[k_bond_message_at] = (k_bond_message_base + 12 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.data_source_type = (k_bond_message_base + 14 + 1) % 256;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.sequence_number[k_bond_message_at] = (k_bond_message_base + 15 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.original_sequence_number[k_bond_message_at] = (k_bond_message_base + 23 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.replacement_type = (k_bond_message_base + 31 + 1) % 256;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.previous_isin_of_replacement[k_bond_message_at] = (k_bond_message_base + 32 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.input_date[k_bond_message_at] = (k_bond_message_base + 40 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 6 -> k_bond_message_record.quotes_offer_time[k_bond_message_at] = (k_bond_message_base + 48 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 40 -> k_bond_message_record.bond_type_name[k_bond_message_at] = (k_bond_message_base + 54 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.change_category = (k_bond_message_base + 94 + 1) % 256;
  k_bond_message_record.market_data_type = (k_bond_message_base + 95 + 1) % 256;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.profit_rate_quotes_trading[k_bond_message_at] = (k_bond_message_base + 96 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.price_quotes_trading[k_bond_message_at] = (k_bond_message_base + 104 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.contract_category = (k_bond_message_base + 112 + 1) % 256;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 16 -> k_bond_message_record.quotes_amount[k_bond_message_at] = (k_bond_message_base + 113 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> k_bond_message_record.contract_date[k_bond_message_at] = (k_bond_message_base + 129 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> k_bond_message_record.settlement_date_k_bond[k_bond_message_at] = (k_bond_message_base + 131 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 11 -> k_bond_message_record.filler_11[k_bond_message_at] = (k_bond_message_base + 133 + k_bond_message_at + 1) % 256; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.end_keyword = (k_bond_message_base + 144 + 1) % 256;
  skip
}

/* K Bond Message to the wire, 145 bytes from where the cursor stands */
inline encode_k_bond_message(k_bond_message_record) {
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 12 -> wire[at] = k_bond_message_record.isin[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> wire[at] = k_bond_message_record.data_small_category[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  wire[at] = k_bond_message_record.data_source_type; at = at + 1;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> wire[at] = k_bond_message_record.sequence_number[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> wire[at] = k_bond_message_record.original_sequence_number[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  wire[at] = k_bond_message_record.replacement_type; at = at + 1;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> wire[at] = k_bond_message_record.previous_isin_of_replacement[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> wire[at] = k_bond_message_record.input_date[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 6 -> wire[at] = k_bond_message_record.quotes_offer_time[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 40 -> wire[at] = k_bond_message_record.bond_type_name[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  wire[at] = k_bond_message_record.change_category; at = at + 1;
  wire[at] = k_bond_message_record.market_data_type; at = at + 1;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> wire[at] = k_bond_message_record.profit_rate_quotes_trading[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> wire[at] = k_bond_message_record.price_quotes_trading[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  wire[at] = k_bond_message_record.contract_category; at = at + 1;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 16 -> wire[at] = k_bond_message_record.quotes_amount[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> wire[at] = k_bond_message_record.contract_date[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> wire[at] = k_bond_message_record.settlement_date_k_bond[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 11 -> wire[at] = k_bond_message_record.filler_11[k_bond_message_at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  wire[at] = k_bond_message_record.end_keyword; at = at + 1;
  skip
}

/* K Bond Message off the wire, 145 bytes from where the cursor stands */
inline decode_k_bond_message(k_bond_message_record) {
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 12 -> k_bond_message_record.isin[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> k_bond_message_record.data_small_category[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.data_source_type = wire[at]; at = at + 1;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.sequence_number[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.original_sequence_number[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.replacement_type = wire[at]; at = at + 1;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.previous_isin_of_replacement[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.input_date[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 6 -> k_bond_message_record.quotes_offer_time[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 40 -> k_bond_message_record.bond_type_name[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.change_category = wire[at]; at = at + 1;
  k_bond_message_record.market_data_type = wire[at]; at = at + 1;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.profit_rate_quotes_trading[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> k_bond_message_record.price_quotes_trading[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.contract_category = wire[at]; at = at + 1;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 16 -> k_bond_message_record.quotes_amount[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> k_bond_message_record.contract_date[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> k_bond_message_record.settlement_date_k_bond[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 11 -> k_bond_message_record.filler_11[k_bond_message_at] = wire[at]; at = at + 1; k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of K Bond Message is what was written, byte for byte */
inline equal_k_bond_message(k_bond_message_read, k_bond_message_written) {
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 12 -> assert(k_bond_message_read.isin[k_bond_message_at] == k_bond_message_written.isin[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> assert(k_bond_message_read.data_small_category[k_bond_message_at] == k_bond_message_written.data_small_category[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  assert(k_bond_message_read.data_source_type == k_bond_message_written.data_source_type);
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> assert(k_bond_message_read.sequence_number[k_bond_message_at] == k_bond_message_written.sequence_number[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> assert(k_bond_message_read.original_sequence_number[k_bond_message_at] == k_bond_message_written.original_sequence_number[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  assert(k_bond_message_read.replacement_type == k_bond_message_written.replacement_type);
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> assert(k_bond_message_read.previous_isin_of_replacement[k_bond_message_at] == k_bond_message_written.previous_isin_of_replacement[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> assert(k_bond_message_read.input_date[k_bond_message_at] == k_bond_message_written.input_date[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 6 -> assert(k_bond_message_read.quotes_offer_time[k_bond_message_at] == k_bond_message_written.quotes_offer_time[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 40 -> assert(k_bond_message_read.bond_type_name[k_bond_message_at] == k_bond_message_written.bond_type_name[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  assert(k_bond_message_read.change_category == k_bond_message_written.change_category);
  assert(k_bond_message_read.market_data_type == k_bond_message_written.market_data_type);
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> assert(k_bond_message_read.profit_rate_quotes_trading[k_bond_message_at] == k_bond_message_written.profit_rate_quotes_trading[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 8 -> assert(k_bond_message_read.price_quotes_trading[k_bond_message_at] == k_bond_message_written.price_quotes_trading[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  assert(k_bond_message_read.contract_category == k_bond_message_written.contract_category);
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 16 -> assert(k_bond_message_read.quotes_amount[k_bond_message_at] == k_bond_message_written.quotes_amount[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> assert(k_bond_message_read.contract_date[k_bond_message_at] == k_bond_message_written.contract_date[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 2 -> assert(k_bond_message_read.settlement_date_k_bond[k_bond_message_at] == k_bond_message_written.settlement_date_k_bond[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  k_bond_message_at = 0;
  do
  :: k_bond_message_at < 11 -> assert(k_bond_message_read.filler_11[k_bond_message_at] == k_bond_message_written.filler_11[k_bond_message_at]); k_bond_message_at = k_bond_message_at + 1
  :: else -> break
  od;
  assert(k_bond_message_read.end_keyword == k_bond_message_written.end_keyword);
  skip
}

/* ---- Mkf Index Message: 72 bytes --------------------------------------------- */

/* MKF Index real-time message. Reports current index value, sign and magnitude of change against the previous day, and accumulated trading volume and value for one MKF index identifier. */
typedef MkfIndexMessage {
  byte index_id[6];
  byte isin[12];
  byte time[6];
  byte index[9];
  byte sign;
  byte comparison[9];
  byte trading_volume[12];
  byte trading_value[12];
  byte filler_4[4];
  byte end_keyword
};

int mkf_index_message_at;

/* every byte of Mkf Index Message set to one value */
inline fill_mkf_index_message(mkf_index_message_record, mkf_index_message_value) {
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 6 -> mkf_index_message_record.index_id[mkf_index_message_at] = mkf_index_message_value; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> mkf_index_message_record.isin[mkf_index_message_at] = mkf_index_message_value; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 6 -> mkf_index_message_record.time[mkf_index_message_at] = mkf_index_message_value; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 9 -> mkf_index_message_record.index[mkf_index_message_at] = mkf_index_message_value; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_record.sign = mkf_index_message_value;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 9 -> mkf_index_message_record.comparison[mkf_index_message_at] = mkf_index_message_value; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> mkf_index_message_record.trading_volume[mkf_index_message_at] = mkf_index_message_value; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> mkf_index_message_record.trading_value[mkf_index_message_at] = mkf_index_message_value; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 4 -> mkf_index_message_record.filler_4[mkf_index_message_at] = mkf_index_message_value; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_record.end_keyword = mkf_index_message_value;
  skip
}

/* each byte of Mkf Index Message set to where it lies, so a field read out of place says so */
inline ramp_mkf_index_message(mkf_index_message_record, mkf_index_message_base) {
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 6 -> mkf_index_message_record.index_id[mkf_index_message_at] = (mkf_index_message_base + 0 + mkf_index_message_at + 1) % 256; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> mkf_index_message_record.isin[mkf_index_message_at] = (mkf_index_message_base + 6 + mkf_index_message_at + 1) % 256; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 6 -> mkf_index_message_record.time[mkf_index_message_at] = (mkf_index_message_base + 18 + mkf_index_message_at + 1) % 256; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 9 -> mkf_index_message_record.index[mkf_index_message_at] = (mkf_index_message_base + 24 + mkf_index_message_at + 1) % 256; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_record.sign = (mkf_index_message_base + 33 + 1) % 256;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 9 -> mkf_index_message_record.comparison[mkf_index_message_at] = (mkf_index_message_base + 34 + mkf_index_message_at + 1) % 256; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> mkf_index_message_record.trading_volume[mkf_index_message_at] = (mkf_index_message_base + 43 + mkf_index_message_at + 1) % 256; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> mkf_index_message_record.trading_value[mkf_index_message_at] = (mkf_index_message_base + 55 + mkf_index_message_at + 1) % 256; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 4 -> mkf_index_message_record.filler_4[mkf_index_message_at] = (mkf_index_message_base + 67 + mkf_index_message_at + 1) % 256; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_record.end_keyword = (mkf_index_message_base + 71 + 1) % 256;
  skip
}

/* Mkf Index Message to the wire, 72 bytes from where the cursor stands */
inline encode_mkf_index_message(mkf_index_message_record) {
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 6 -> wire[at] = mkf_index_message_record.index_id[mkf_index_message_at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> wire[at] = mkf_index_message_record.isin[mkf_index_message_at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 6 -> wire[at] = mkf_index_message_record.time[mkf_index_message_at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 9 -> wire[at] = mkf_index_message_record.index[mkf_index_message_at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  wire[at] = mkf_index_message_record.sign; at = at + 1;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 9 -> wire[at] = mkf_index_message_record.comparison[mkf_index_message_at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> wire[at] = mkf_index_message_record.trading_volume[mkf_index_message_at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> wire[at] = mkf_index_message_record.trading_value[mkf_index_message_at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 4 -> wire[at] = mkf_index_message_record.filler_4[mkf_index_message_at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  wire[at] = mkf_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Mkf Index Message off the wire, 72 bytes from where the cursor stands */
inline decode_mkf_index_message(mkf_index_message_record) {
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 6 -> mkf_index_message_record.index_id[mkf_index_message_at] = wire[at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> mkf_index_message_record.isin[mkf_index_message_at] = wire[at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 6 -> mkf_index_message_record.time[mkf_index_message_at] = wire[at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 9 -> mkf_index_message_record.index[mkf_index_message_at] = wire[at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_record.sign = wire[at]; at = at + 1;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 9 -> mkf_index_message_record.comparison[mkf_index_message_at] = wire[at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> mkf_index_message_record.trading_volume[mkf_index_message_at] = wire[at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> mkf_index_message_record.trading_value[mkf_index_message_at] = wire[at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 4 -> mkf_index_message_record.filler_4[mkf_index_message_at] = wire[at]; at = at + 1; mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Mkf Index Message is what was written, byte for byte */
inline equal_mkf_index_message(mkf_index_message_read, mkf_index_message_written) {
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 6 -> assert(mkf_index_message_read.index_id[mkf_index_message_at] == mkf_index_message_written.index_id[mkf_index_message_at]); mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> assert(mkf_index_message_read.isin[mkf_index_message_at] == mkf_index_message_written.isin[mkf_index_message_at]); mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 6 -> assert(mkf_index_message_read.time[mkf_index_message_at] == mkf_index_message_written.time[mkf_index_message_at]); mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 9 -> assert(mkf_index_message_read.index[mkf_index_message_at] == mkf_index_message_written.index[mkf_index_message_at]); mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  assert(mkf_index_message_read.sign == mkf_index_message_written.sign);
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 9 -> assert(mkf_index_message_read.comparison[mkf_index_message_at] == mkf_index_message_written.comparison[mkf_index_message_at]); mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> assert(mkf_index_message_read.trading_volume[mkf_index_message_at] == mkf_index_message_written.trading_volume[mkf_index_message_at]); mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 12 -> assert(mkf_index_message_read.trading_value[mkf_index_message_at] == mkf_index_message_written.trading_value[mkf_index_message_at]); mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  mkf_index_message_at = 0;
  do
  :: mkf_index_message_at < 4 -> assert(mkf_index_message_read.filler_4[mkf_index_message_at] == mkf_index_message_written.filler_4[mkf_index_message_at]); mkf_index_message_at = mkf_index_message_at + 1
  :: else -> break
  od;
  assert(mkf_index_message_read.end_keyword == mkf_index_message_written.end_keyword);
  skip
}

/* ---- Mkf Index Jpy Message: 72 bytes ----------------------------------------- */

/* MKF Index real-time message with the Japanese Yen exchange rate reflected. Identical field layout to the Mkf Index Message. */
typedef MkfIndexJpyMessage {
  byte index_id[6];
  byte isin[12];
  byte time[6];
  byte index[9];
  byte sign;
  byte comparison[9];
  byte trading_volume[12];
  byte trading_value[12];
  byte filler_4[4];
  byte end_keyword
};

int mkf_index_jpy_message_at;

/* every byte of Mkf Index Jpy Message set to one value */
inline fill_mkf_index_jpy_message(mkf_index_jpy_message_record, mkf_index_jpy_message_value) {
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 6 -> mkf_index_jpy_message_record.index_id[mkf_index_jpy_message_at] = mkf_index_jpy_message_value; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> mkf_index_jpy_message_record.isin[mkf_index_jpy_message_at] = mkf_index_jpy_message_value; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 6 -> mkf_index_jpy_message_record.time[mkf_index_jpy_message_at] = mkf_index_jpy_message_value; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 9 -> mkf_index_jpy_message_record.index[mkf_index_jpy_message_at] = mkf_index_jpy_message_value; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_record.sign = mkf_index_jpy_message_value;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 9 -> mkf_index_jpy_message_record.comparison[mkf_index_jpy_message_at] = mkf_index_jpy_message_value; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> mkf_index_jpy_message_record.trading_volume[mkf_index_jpy_message_at] = mkf_index_jpy_message_value; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> mkf_index_jpy_message_record.trading_value[mkf_index_jpy_message_at] = mkf_index_jpy_message_value; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 4 -> mkf_index_jpy_message_record.filler_4[mkf_index_jpy_message_at] = mkf_index_jpy_message_value; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_record.end_keyword = mkf_index_jpy_message_value;
  skip
}

/* each byte of Mkf Index Jpy Message set to where it lies, so a field read out of place says so */
inline ramp_mkf_index_jpy_message(mkf_index_jpy_message_record, mkf_index_jpy_message_base) {
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 6 -> mkf_index_jpy_message_record.index_id[mkf_index_jpy_message_at] = (mkf_index_jpy_message_base + 0 + mkf_index_jpy_message_at + 1) % 256; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> mkf_index_jpy_message_record.isin[mkf_index_jpy_message_at] = (mkf_index_jpy_message_base + 6 + mkf_index_jpy_message_at + 1) % 256; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 6 -> mkf_index_jpy_message_record.time[mkf_index_jpy_message_at] = (mkf_index_jpy_message_base + 18 + mkf_index_jpy_message_at + 1) % 256; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 9 -> mkf_index_jpy_message_record.index[mkf_index_jpy_message_at] = (mkf_index_jpy_message_base + 24 + mkf_index_jpy_message_at + 1) % 256; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_record.sign = (mkf_index_jpy_message_base + 33 + 1) % 256;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 9 -> mkf_index_jpy_message_record.comparison[mkf_index_jpy_message_at] = (mkf_index_jpy_message_base + 34 + mkf_index_jpy_message_at + 1) % 256; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> mkf_index_jpy_message_record.trading_volume[mkf_index_jpy_message_at] = (mkf_index_jpy_message_base + 43 + mkf_index_jpy_message_at + 1) % 256; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> mkf_index_jpy_message_record.trading_value[mkf_index_jpy_message_at] = (mkf_index_jpy_message_base + 55 + mkf_index_jpy_message_at + 1) % 256; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 4 -> mkf_index_jpy_message_record.filler_4[mkf_index_jpy_message_at] = (mkf_index_jpy_message_base + 67 + mkf_index_jpy_message_at + 1) % 256; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_record.end_keyword = (mkf_index_jpy_message_base + 71 + 1) % 256;
  skip
}

/* Mkf Index Jpy Message to the wire, 72 bytes from where the cursor stands */
inline encode_mkf_index_jpy_message(mkf_index_jpy_message_record) {
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 6 -> wire[at] = mkf_index_jpy_message_record.index_id[mkf_index_jpy_message_at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> wire[at] = mkf_index_jpy_message_record.isin[mkf_index_jpy_message_at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 6 -> wire[at] = mkf_index_jpy_message_record.time[mkf_index_jpy_message_at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 9 -> wire[at] = mkf_index_jpy_message_record.index[mkf_index_jpy_message_at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  wire[at] = mkf_index_jpy_message_record.sign; at = at + 1;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 9 -> wire[at] = mkf_index_jpy_message_record.comparison[mkf_index_jpy_message_at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> wire[at] = mkf_index_jpy_message_record.trading_volume[mkf_index_jpy_message_at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> wire[at] = mkf_index_jpy_message_record.trading_value[mkf_index_jpy_message_at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 4 -> wire[at] = mkf_index_jpy_message_record.filler_4[mkf_index_jpy_message_at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  wire[at] = mkf_index_jpy_message_record.end_keyword; at = at + 1;
  skip
}

/* Mkf Index Jpy Message off the wire, 72 bytes from where the cursor stands */
inline decode_mkf_index_jpy_message(mkf_index_jpy_message_record) {
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 6 -> mkf_index_jpy_message_record.index_id[mkf_index_jpy_message_at] = wire[at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> mkf_index_jpy_message_record.isin[mkf_index_jpy_message_at] = wire[at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 6 -> mkf_index_jpy_message_record.time[mkf_index_jpy_message_at] = wire[at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 9 -> mkf_index_jpy_message_record.index[mkf_index_jpy_message_at] = wire[at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_record.sign = wire[at]; at = at + 1;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 9 -> mkf_index_jpy_message_record.comparison[mkf_index_jpy_message_at] = wire[at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> mkf_index_jpy_message_record.trading_volume[mkf_index_jpy_message_at] = wire[at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> mkf_index_jpy_message_record.trading_value[mkf_index_jpy_message_at] = wire[at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 4 -> mkf_index_jpy_message_record.filler_4[mkf_index_jpy_message_at] = wire[at]; at = at + 1; mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Mkf Index Jpy Message is what was written, byte for byte */
inline equal_mkf_index_jpy_message(mkf_index_jpy_message_read, mkf_index_jpy_message_written) {
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 6 -> assert(mkf_index_jpy_message_read.index_id[mkf_index_jpy_message_at] == mkf_index_jpy_message_written.index_id[mkf_index_jpy_message_at]); mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> assert(mkf_index_jpy_message_read.isin[mkf_index_jpy_message_at] == mkf_index_jpy_message_written.isin[mkf_index_jpy_message_at]); mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 6 -> assert(mkf_index_jpy_message_read.time[mkf_index_jpy_message_at] == mkf_index_jpy_message_written.time[mkf_index_jpy_message_at]); mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 9 -> assert(mkf_index_jpy_message_read.index[mkf_index_jpy_message_at] == mkf_index_jpy_message_written.index[mkf_index_jpy_message_at]); mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  assert(mkf_index_jpy_message_read.sign == mkf_index_jpy_message_written.sign);
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 9 -> assert(mkf_index_jpy_message_read.comparison[mkf_index_jpy_message_at] == mkf_index_jpy_message_written.comparison[mkf_index_jpy_message_at]); mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> assert(mkf_index_jpy_message_read.trading_volume[mkf_index_jpy_message_at] == mkf_index_jpy_message_written.trading_volume[mkf_index_jpy_message_at]); mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 12 -> assert(mkf_index_jpy_message_read.trading_value[mkf_index_jpy_message_at] == mkf_index_jpy_message_written.trading_value[mkf_index_jpy_message_at]); mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  mkf_index_jpy_message_at = 0;
  do
  :: mkf_index_jpy_message_at < 4 -> assert(mkf_index_jpy_message_read.filler_4[mkf_index_jpy_message_at] == mkf_index_jpy_message_written.filler_4[mkf_index_jpy_message_at]); mkf_index_jpy_message_at = mkf_index_jpy_message_at + 1
  :: else -> break
  od;
  assert(mkf_index_jpy_message_read.end_keyword == mkf_index_jpy_message_written.end_keyword);
  skip
}

/* ---- Wisefn Index Message: 72 bytes ------------------------------------------ */

/* WISEfn equity index real-time message. Identical field layout to the Mkf Index Message. */
typedef WisefnIndexMessage {
  byte index_id[6];
  byte isin[12];
  byte time[6];
  byte index[9];
  byte sign;
  byte comparison[9];
  byte trading_volume[12];
  byte trading_value[12];
  byte filler_4[4];
  byte end_keyword
};

int wisefn_index_message_at;

/* every byte of Wisefn Index Message set to one value */
inline fill_wisefn_index_message(wisefn_index_message_record, wisefn_index_message_value) {
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 6 -> wisefn_index_message_record.index_id[wisefn_index_message_at] = wisefn_index_message_value; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wisefn_index_message_record.isin[wisefn_index_message_at] = wisefn_index_message_value; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 6 -> wisefn_index_message_record.time[wisefn_index_message_at] = wisefn_index_message_value; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 9 -> wisefn_index_message_record.index[wisefn_index_message_at] = wisefn_index_message_value; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_record.sign = wisefn_index_message_value;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 9 -> wisefn_index_message_record.comparison[wisefn_index_message_at] = wisefn_index_message_value; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wisefn_index_message_record.trading_volume[wisefn_index_message_at] = wisefn_index_message_value; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wisefn_index_message_record.trading_value[wisefn_index_message_at] = wisefn_index_message_value; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 4 -> wisefn_index_message_record.filler_4[wisefn_index_message_at] = wisefn_index_message_value; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_record.end_keyword = wisefn_index_message_value;
  skip
}

/* each byte of Wisefn Index Message set to where it lies, so a field read out of place says so */
inline ramp_wisefn_index_message(wisefn_index_message_record, wisefn_index_message_base) {
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 6 -> wisefn_index_message_record.index_id[wisefn_index_message_at] = (wisefn_index_message_base + 0 + wisefn_index_message_at + 1) % 256; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wisefn_index_message_record.isin[wisefn_index_message_at] = (wisefn_index_message_base + 6 + wisefn_index_message_at + 1) % 256; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 6 -> wisefn_index_message_record.time[wisefn_index_message_at] = (wisefn_index_message_base + 18 + wisefn_index_message_at + 1) % 256; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 9 -> wisefn_index_message_record.index[wisefn_index_message_at] = (wisefn_index_message_base + 24 + wisefn_index_message_at + 1) % 256; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_record.sign = (wisefn_index_message_base + 33 + 1) % 256;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 9 -> wisefn_index_message_record.comparison[wisefn_index_message_at] = (wisefn_index_message_base + 34 + wisefn_index_message_at + 1) % 256; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wisefn_index_message_record.trading_volume[wisefn_index_message_at] = (wisefn_index_message_base + 43 + wisefn_index_message_at + 1) % 256; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wisefn_index_message_record.trading_value[wisefn_index_message_at] = (wisefn_index_message_base + 55 + wisefn_index_message_at + 1) % 256; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 4 -> wisefn_index_message_record.filler_4[wisefn_index_message_at] = (wisefn_index_message_base + 67 + wisefn_index_message_at + 1) % 256; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_record.end_keyword = (wisefn_index_message_base + 71 + 1) % 256;
  skip
}

/* Wisefn Index Message to the wire, 72 bytes from where the cursor stands */
inline encode_wisefn_index_message(wisefn_index_message_record) {
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 6 -> wire[at] = wisefn_index_message_record.index_id[wisefn_index_message_at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wire[at] = wisefn_index_message_record.isin[wisefn_index_message_at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 6 -> wire[at] = wisefn_index_message_record.time[wisefn_index_message_at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 9 -> wire[at] = wisefn_index_message_record.index[wisefn_index_message_at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wire[at] = wisefn_index_message_record.sign; at = at + 1;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 9 -> wire[at] = wisefn_index_message_record.comparison[wisefn_index_message_at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wire[at] = wisefn_index_message_record.trading_volume[wisefn_index_message_at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wire[at] = wisefn_index_message_record.trading_value[wisefn_index_message_at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 4 -> wire[at] = wisefn_index_message_record.filler_4[wisefn_index_message_at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wire[at] = wisefn_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Wisefn Index Message off the wire, 72 bytes from where the cursor stands */
inline decode_wisefn_index_message(wisefn_index_message_record) {
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 6 -> wisefn_index_message_record.index_id[wisefn_index_message_at] = wire[at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wisefn_index_message_record.isin[wisefn_index_message_at] = wire[at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 6 -> wisefn_index_message_record.time[wisefn_index_message_at] = wire[at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 9 -> wisefn_index_message_record.index[wisefn_index_message_at] = wire[at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_record.sign = wire[at]; at = at + 1;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 9 -> wisefn_index_message_record.comparison[wisefn_index_message_at] = wire[at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wisefn_index_message_record.trading_volume[wisefn_index_message_at] = wire[at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> wisefn_index_message_record.trading_value[wisefn_index_message_at] = wire[at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 4 -> wisefn_index_message_record.filler_4[wisefn_index_message_at] = wire[at]; at = at + 1; wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Wisefn Index Message is what was written, byte for byte */
inline equal_wisefn_index_message(wisefn_index_message_read, wisefn_index_message_written) {
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 6 -> assert(wisefn_index_message_read.index_id[wisefn_index_message_at] == wisefn_index_message_written.index_id[wisefn_index_message_at]); wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> assert(wisefn_index_message_read.isin[wisefn_index_message_at] == wisefn_index_message_written.isin[wisefn_index_message_at]); wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 6 -> assert(wisefn_index_message_read.time[wisefn_index_message_at] == wisefn_index_message_written.time[wisefn_index_message_at]); wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 9 -> assert(wisefn_index_message_read.index[wisefn_index_message_at] == wisefn_index_message_written.index[wisefn_index_message_at]); wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  assert(wisefn_index_message_read.sign == wisefn_index_message_written.sign);
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 9 -> assert(wisefn_index_message_read.comparison[wisefn_index_message_at] == wisefn_index_message_written.comparison[wisefn_index_message_at]); wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> assert(wisefn_index_message_read.trading_volume[wisefn_index_message_at] == wisefn_index_message_written.trading_volume[wisefn_index_message_at]); wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 12 -> assert(wisefn_index_message_read.trading_value[wisefn_index_message_at] == wisefn_index_message_written.trading_value[wisefn_index_message_at]); wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  wisefn_index_message_at = 0;
  do
  :: wisefn_index_message_at < 4 -> assert(wisefn_index_message_read.filler_4[wisefn_index_message_at] == wisefn_index_message_written.filler_4[wisefn_index_message_at]); wisefn_index_message_at = wisefn_index_message_at + 1
  :: else -> break
  od;
  assert(wisefn_index_message_read.end_keyword == wisefn_index_message_written.end_keyword);
  skip
}

/* ---- Kis Index Message: 72 bytes --------------------------------------------- */

/* KIS equity index real-time message. Identical field layout to the Mkf Index Message. */
typedef KisIndexMessage {
  byte index_id[6];
  byte isin[12];
  byte time[6];
  byte index[9];
  byte sign;
  byte comparison[9];
  byte trading_volume[12];
  byte trading_value[12];
  byte filler_4[4];
  byte end_keyword
};

int kis_index_message_at;

/* every byte of Kis Index Message set to one value */
inline fill_kis_index_message(kis_index_message_record, kis_index_message_value) {
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 6 -> kis_index_message_record.index_id[kis_index_message_at] = kis_index_message_value; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> kis_index_message_record.isin[kis_index_message_at] = kis_index_message_value; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 6 -> kis_index_message_record.time[kis_index_message_at] = kis_index_message_value; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 9 -> kis_index_message_record.index[kis_index_message_at] = kis_index_message_value; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_record.sign = kis_index_message_value;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 9 -> kis_index_message_record.comparison[kis_index_message_at] = kis_index_message_value; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> kis_index_message_record.trading_volume[kis_index_message_at] = kis_index_message_value; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> kis_index_message_record.trading_value[kis_index_message_at] = kis_index_message_value; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 4 -> kis_index_message_record.filler_4[kis_index_message_at] = kis_index_message_value; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_record.end_keyword = kis_index_message_value;
  skip
}

/* each byte of Kis Index Message set to where it lies, so a field read out of place says so */
inline ramp_kis_index_message(kis_index_message_record, kis_index_message_base) {
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 6 -> kis_index_message_record.index_id[kis_index_message_at] = (kis_index_message_base + 0 + kis_index_message_at + 1) % 256; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> kis_index_message_record.isin[kis_index_message_at] = (kis_index_message_base + 6 + kis_index_message_at + 1) % 256; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 6 -> kis_index_message_record.time[kis_index_message_at] = (kis_index_message_base + 18 + kis_index_message_at + 1) % 256; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 9 -> kis_index_message_record.index[kis_index_message_at] = (kis_index_message_base + 24 + kis_index_message_at + 1) % 256; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_record.sign = (kis_index_message_base + 33 + 1) % 256;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 9 -> kis_index_message_record.comparison[kis_index_message_at] = (kis_index_message_base + 34 + kis_index_message_at + 1) % 256; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> kis_index_message_record.trading_volume[kis_index_message_at] = (kis_index_message_base + 43 + kis_index_message_at + 1) % 256; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> kis_index_message_record.trading_value[kis_index_message_at] = (kis_index_message_base + 55 + kis_index_message_at + 1) % 256; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 4 -> kis_index_message_record.filler_4[kis_index_message_at] = (kis_index_message_base + 67 + kis_index_message_at + 1) % 256; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_record.end_keyword = (kis_index_message_base + 71 + 1) % 256;
  skip
}

/* Kis Index Message to the wire, 72 bytes from where the cursor stands */
inline encode_kis_index_message(kis_index_message_record) {
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 6 -> wire[at] = kis_index_message_record.index_id[kis_index_message_at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> wire[at] = kis_index_message_record.isin[kis_index_message_at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 6 -> wire[at] = kis_index_message_record.time[kis_index_message_at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 9 -> wire[at] = kis_index_message_record.index[kis_index_message_at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  wire[at] = kis_index_message_record.sign; at = at + 1;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 9 -> wire[at] = kis_index_message_record.comparison[kis_index_message_at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> wire[at] = kis_index_message_record.trading_volume[kis_index_message_at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> wire[at] = kis_index_message_record.trading_value[kis_index_message_at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 4 -> wire[at] = kis_index_message_record.filler_4[kis_index_message_at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  wire[at] = kis_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Kis Index Message off the wire, 72 bytes from where the cursor stands */
inline decode_kis_index_message(kis_index_message_record) {
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 6 -> kis_index_message_record.index_id[kis_index_message_at] = wire[at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> kis_index_message_record.isin[kis_index_message_at] = wire[at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 6 -> kis_index_message_record.time[kis_index_message_at] = wire[at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 9 -> kis_index_message_record.index[kis_index_message_at] = wire[at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_record.sign = wire[at]; at = at + 1;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 9 -> kis_index_message_record.comparison[kis_index_message_at] = wire[at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> kis_index_message_record.trading_volume[kis_index_message_at] = wire[at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> kis_index_message_record.trading_value[kis_index_message_at] = wire[at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 4 -> kis_index_message_record.filler_4[kis_index_message_at] = wire[at]; at = at + 1; kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Kis Index Message is what was written, byte for byte */
inline equal_kis_index_message(kis_index_message_read, kis_index_message_written) {
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 6 -> assert(kis_index_message_read.index_id[kis_index_message_at] == kis_index_message_written.index_id[kis_index_message_at]); kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> assert(kis_index_message_read.isin[kis_index_message_at] == kis_index_message_written.isin[kis_index_message_at]); kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 6 -> assert(kis_index_message_read.time[kis_index_message_at] == kis_index_message_written.time[kis_index_message_at]); kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 9 -> assert(kis_index_message_read.index[kis_index_message_at] == kis_index_message_written.index[kis_index_message_at]); kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  assert(kis_index_message_read.sign == kis_index_message_written.sign);
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 9 -> assert(kis_index_message_read.comparison[kis_index_message_at] == kis_index_message_written.comparison[kis_index_message_at]); kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> assert(kis_index_message_read.trading_volume[kis_index_message_at] == kis_index_message_written.trading_volume[kis_index_message_at]); kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 12 -> assert(kis_index_message_read.trading_value[kis_index_message_at] == kis_index_message_written.trading_value[kis_index_message_at]); kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  kis_index_message_at = 0;
  do
  :: kis_index_message_at < 4 -> assert(kis_index_message_read.filler_4[kis_index_message_at] == kis_index_message_written.filler_4[kis_index_message_at]); kis_index_message_at = kis_index_message_at + 1
  :: else -> break
  od;
  assert(kis_index_message_read.end_keyword == kis_index_message_written.end_keyword);
  skip
}

/* ---- Mkf Bond Index Message: 109 bytes --------------------------------------- */

/* MKF Bond Index real-time message. Carries total profit / clean price / market price / call and zero re-investment indices, futures basis price, duration, convexity, and YTM for one bond index identifier. */
typedef MkfBondIndexMessage {
  byte filler_4[4];
  byte index_id[6];
  byte standard_date[8];
  byte standard_time[6];
  byte total_profit_index[10];
  byte clean_price_index[10];
  byte market_price_index[10];
  byte call_re_investment_index[10];
  byte zero_re_investment_index[10];
  byte futures_basis_price[9];
  byte average_duration_nullable[6];
  byte average_convexity[6];
  byte average_ytm[6];
  byte average_forward_ytm[6];
  byte filler_1;
  byte end_keyword
};

int mkf_bond_index_message_at;

/* every byte of Mkf Bond Index Message set to one value */
inline fill_mkf_bond_index_message(mkf_bond_index_message_record, mkf_bond_index_message_value) {
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 4 -> mkf_bond_index_message_record.filler_4[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.index_id[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 8 -> mkf_bond_index_message_record.standard_date[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.standard_time[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.total_profit_index[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.clean_price_index[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.market_price_index[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.call_re_investment_index[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.zero_re_investment_index[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 9 -> mkf_bond_index_message_record.futures_basis_price[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_duration_nullable[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_convexity[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_ytm[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_forward_ytm[mkf_bond_index_message_at] = mkf_bond_index_message_value; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_record.filler_1 = mkf_bond_index_message_value;
  mkf_bond_index_message_record.end_keyword = mkf_bond_index_message_value;
  skip
}

/* each byte of Mkf Bond Index Message set to where it lies, so a field read out of place says so */
inline ramp_mkf_bond_index_message(mkf_bond_index_message_record, mkf_bond_index_message_base) {
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 4 -> mkf_bond_index_message_record.filler_4[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 0 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.index_id[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 4 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 8 -> mkf_bond_index_message_record.standard_date[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 10 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.standard_time[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 18 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.total_profit_index[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 24 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.clean_price_index[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 34 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.market_price_index[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 44 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.call_re_investment_index[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 54 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.zero_re_investment_index[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 64 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 9 -> mkf_bond_index_message_record.futures_basis_price[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 74 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_duration_nullable[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 83 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_convexity[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 89 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_ytm[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 95 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_forward_ytm[mkf_bond_index_message_at] = (mkf_bond_index_message_base + 101 + mkf_bond_index_message_at + 1) % 256; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_record.filler_1 = (mkf_bond_index_message_base + 107 + 1) % 256;
  mkf_bond_index_message_record.end_keyword = (mkf_bond_index_message_base + 108 + 1) % 256;
  skip
}

/* Mkf Bond Index Message to the wire, 109 bytes from where the cursor stands */
inline encode_mkf_bond_index_message(mkf_bond_index_message_record) {
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 4 -> wire[at] = mkf_bond_index_message_record.filler_4[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> wire[at] = mkf_bond_index_message_record.index_id[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 8 -> wire[at] = mkf_bond_index_message_record.standard_date[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> wire[at] = mkf_bond_index_message_record.standard_time[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> wire[at] = mkf_bond_index_message_record.total_profit_index[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> wire[at] = mkf_bond_index_message_record.clean_price_index[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> wire[at] = mkf_bond_index_message_record.market_price_index[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> wire[at] = mkf_bond_index_message_record.call_re_investment_index[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> wire[at] = mkf_bond_index_message_record.zero_re_investment_index[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 9 -> wire[at] = mkf_bond_index_message_record.futures_basis_price[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> wire[at] = mkf_bond_index_message_record.average_duration_nullable[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> wire[at] = mkf_bond_index_message_record.average_convexity[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> wire[at] = mkf_bond_index_message_record.average_ytm[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> wire[at] = mkf_bond_index_message_record.average_forward_ytm[mkf_bond_index_message_at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  wire[at] = mkf_bond_index_message_record.filler_1; at = at + 1;
  wire[at] = mkf_bond_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Mkf Bond Index Message off the wire, 109 bytes from where the cursor stands */
inline decode_mkf_bond_index_message(mkf_bond_index_message_record) {
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 4 -> mkf_bond_index_message_record.filler_4[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.index_id[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 8 -> mkf_bond_index_message_record.standard_date[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.standard_time[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.total_profit_index[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.clean_price_index[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.market_price_index[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.call_re_investment_index[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> mkf_bond_index_message_record.zero_re_investment_index[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 9 -> mkf_bond_index_message_record.futures_basis_price[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_duration_nullable[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_convexity[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_ytm[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> mkf_bond_index_message_record.average_forward_ytm[mkf_bond_index_message_at] = wire[at]; at = at + 1; mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_record.filler_1 = wire[at]; at = at + 1;
  mkf_bond_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Mkf Bond Index Message is what was written, byte for byte */
inline equal_mkf_bond_index_message(mkf_bond_index_message_read, mkf_bond_index_message_written) {
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 4 -> assert(mkf_bond_index_message_read.filler_4[mkf_bond_index_message_at] == mkf_bond_index_message_written.filler_4[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> assert(mkf_bond_index_message_read.index_id[mkf_bond_index_message_at] == mkf_bond_index_message_written.index_id[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 8 -> assert(mkf_bond_index_message_read.standard_date[mkf_bond_index_message_at] == mkf_bond_index_message_written.standard_date[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> assert(mkf_bond_index_message_read.standard_time[mkf_bond_index_message_at] == mkf_bond_index_message_written.standard_time[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> assert(mkf_bond_index_message_read.total_profit_index[mkf_bond_index_message_at] == mkf_bond_index_message_written.total_profit_index[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> assert(mkf_bond_index_message_read.clean_price_index[mkf_bond_index_message_at] == mkf_bond_index_message_written.clean_price_index[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> assert(mkf_bond_index_message_read.market_price_index[mkf_bond_index_message_at] == mkf_bond_index_message_written.market_price_index[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> assert(mkf_bond_index_message_read.call_re_investment_index[mkf_bond_index_message_at] == mkf_bond_index_message_written.call_re_investment_index[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 10 -> assert(mkf_bond_index_message_read.zero_re_investment_index[mkf_bond_index_message_at] == mkf_bond_index_message_written.zero_re_investment_index[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 9 -> assert(mkf_bond_index_message_read.futures_basis_price[mkf_bond_index_message_at] == mkf_bond_index_message_written.futures_basis_price[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> assert(mkf_bond_index_message_read.average_duration_nullable[mkf_bond_index_message_at] == mkf_bond_index_message_written.average_duration_nullable[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> assert(mkf_bond_index_message_read.average_convexity[mkf_bond_index_message_at] == mkf_bond_index_message_written.average_convexity[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> assert(mkf_bond_index_message_read.average_ytm[mkf_bond_index_message_at] == mkf_bond_index_message_written.average_ytm[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  mkf_bond_index_message_at = 0;
  do
  :: mkf_bond_index_message_at < 6 -> assert(mkf_bond_index_message_read.average_forward_ytm[mkf_bond_index_message_at] == mkf_bond_index_message_written.average_forward_ytm[mkf_bond_index_message_at]); mkf_bond_index_message_at = mkf_bond_index_message_at + 1
  :: else -> break
  od;
  assert(mkf_bond_index_message_read.filler_1 == mkf_bond_index_message_written.filler_1);
  assert(mkf_bond_index_message_read.end_keyword == mkf_bond_index_message_written.end_keyword);
  skip
}

/* ---- Kis Bond Index Message: 109 bytes --------------------------------------- */

/* KIS Bond Index real-time message. Identical field layout to the Mkf Bond Index Message. */
typedef KisBondIndexMessage {
  byte filler_4[4];
  byte index_id[6];
  byte standard_date[8];
  byte standard_time[6];
  byte total_profit_index[10];
  byte clean_price_index[10];
  byte market_price_index[10];
  byte call_re_investment_index[10];
  byte zero_re_investment_index[10];
  byte futures_basis_price[9];
  byte average_duration[6];
  byte average_convexity[6];
  byte average_ytm[6];
  byte average_forward_ytm[6];
  byte filler_1;
  byte end_keyword
};

int kis_bond_index_message_at;

/* every byte of Kis Bond Index Message set to one value */
inline fill_kis_bond_index_message(kis_bond_index_message_record, kis_bond_index_message_value) {
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 4 -> kis_bond_index_message_record.filler_4[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.index_id[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 8 -> kis_bond_index_message_record.standard_date[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.standard_time[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.total_profit_index[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.clean_price_index[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.market_price_index[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.call_re_investment_index[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.zero_re_investment_index[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 9 -> kis_bond_index_message_record.futures_basis_price[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_duration[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_convexity[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_ytm[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_forward_ytm[kis_bond_index_message_at] = kis_bond_index_message_value; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_record.filler_1 = kis_bond_index_message_value;
  kis_bond_index_message_record.end_keyword = kis_bond_index_message_value;
  skip
}

/* each byte of Kis Bond Index Message set to where it lies, so a field read out of place says so */
inline ramp_kis_bond_index_message(kis_bond_index_message_record, kis_bond_index_message_base) {
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 4 -> kis_bond_index_message_record.filler_4[kis_bond_index_message_at] = (kis_bond_index_message_base + 0 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.index_id[kis_bond_index_message_at] = (kis_bond_index_message_base + 4 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 8 -> kis_bond_index_message_record.standard_date[kis_bond_index_message_at] = (kis_bond_index_message_base + 10 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.standard_time[kis_bond_index_message_at] = (kis_bond_index_message_base + 18 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.total_profit_index[kis_bond_index_message_at] = (kis_bond_index_message_base + 24 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.clean_price_index[kis_bond_index_message_at] = (kis_bond_index_message_base + 34 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.market_price_index[kis_bond_index_message_at] = (kis_bond_index_message_base + 44 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.call_re_investment_index[kis_bond_index_message_at] = (kis_bond_index_message_base + 54 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.zero_re_investment_index[kis_bond_index_message_at] = (kis_bond_index_message_base + 64 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 9 -> kis_bond_index_message_record.futures_basis_price[kis_bond_index_message_at] = (kis_bond_index_message_base + 74 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_duration[kis_bond_index_message_at] = (kis_bond_index_message_base + 83 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_convexity[kis_bond_index_message_at] = (kis_bond_index_message_base + 89 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_ytm[kis_bond_index_message_at] = (kis_bond_index_message_base + 95 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_forward_ytm[kis_bond_index_message_at] = (kis_bond_index_message_base + 101 + kis_bond_index_message_at + 1) % 256; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_record.filler_1 = (kis_bond_index_message_base + 107 + 1) % 256;
  kis_bond_index_message_record.end_keyword = (kis_bond_index_message_base + 108 + 1) % 256;
  skip
}

/* Kis Bond Index Message to the wire, 109 bytes from where the cursor stands */
inline encode_kis_bond_index_message(kis_bond_index_message_record) {
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 4 -> wire[at] = kis_bond_index_message_record.filler_4[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> wire[at] = kis_bond_index_message_record.index_id[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 8 -> wire[at] = kis_bond_index_message_record.standard_date[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> wire[at] = kis_bond_index_message_record.standard_time[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> wire[at] = kis_bond_index_message_record.total_profit_index[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> wire[at] = kis_bond_index_message_record.clean_price_index[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> wire[at] = kis_bond_index_message_record.market_price_index[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> wire[at] = kis_bond_index_message_record.call_re_investment_index[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> wire[at] = kis_bond_index_message_record.zero_re_investment_index[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 9 -> wire[at] = kis_bond_index_message_record.futures_basis_price[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> wire[at] = kis_bond_index_message_record.average_duration[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> wire[at] = kis_bond_index_message_record.average_convexity[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> wire[at] = kis_bond_index_message_record.average_ytm[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> wire[at] = kis_bond_index_message_record.average_forward_ytm[kis_bond_index_message_at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  wire[at] = kis_bond_index_message_record.filler_1; at = at + 1;
  wire[at] = kis_bond_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Kis Bond Index Message off the wire, 109 bytes from where the cursor stands */
inline decode_kis_bond_index_message(kis_bond_index_message_record) {
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 4 -> kis_bond_index_message_record.filler_4[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.index_id[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 8 -> kis_bond_index_message_record.standard_date[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.standard_time[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.total_profit_index[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.clean_price_index[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.market_price_index[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.call_re_investment_index[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> kis_bond_index_message_record.zero_re_investment_index[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 9 -> kis_bond_index_message_record.futures_basis_price[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_duration[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_convexity[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_ytm[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> kis_bond_index_message_record.average_forward_ytm[kis_bond_index_message_at] = wire[at]; at = at + 1; kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_record.filler_1 = wire[at]; at = at + 1;
  kis_bond_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Kis Bond Index Message is what was written, byte for byte */
inline equal_kis_bond_index_message(kis_bond_index_message_read, kis_bond_index_message_written) {
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 4 -> assert(kis_bond_index_message_read.filler_4[kis_bond_index_message_at] == kis_bond_index_message_written.filler_4[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> assert(kis_bond_index_message_read.index_id[kis_bond_index_message_at] == kis_bond_index_message_written.index_id[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 8 -> assert(kis_bond_index_message_read.standard_date[kis_bond_index_message_at] == kis_bond_index_message_written.standard_date[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> assert(kis_bond_index_message_read.standard_time[kis_bond_index_message_at] == kis_bond_index_message_written.standard_time[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> assert(kis_bond_index_message_read.total_profit_index[kis_bond_index_message_at] == kis_bond_index_message_written.total_profit_index[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> assert(kis_bond_index_message_read.clean_price_index[kis_bond_index_message_at] == kis_bond_index_message_written.clean_price_index[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> assert(kis_bond_index_message_read.market_price_index[kis_bond_index_message_at] == kis_bond_index_message_written.market_price_index[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> assert(kis_bond_index_message_read.call_re_investment_index[kis_bond_index_message_at] == kis_bond_index_message_written.call_re_investment_index[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 10 -> assert(kis_bond_index_message_read.zero_re_investment_index[kis_bond_index_message_at] == kis_bond_index_message_written.zero_re_investment_index[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 9 -> assert(kis_bond_index_message_read.futures_basis_price[kis_bond_index_message_at] == kis_bond_index_message_written.futures_basis_price[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> assert(kis_bond_index_message_read.average_duration[kis_bond_index_message_at] == kis_bond_index_message_written.average_duration[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> assert(kis_bond_index_message_read.average_convexity[kis_bond_index_message_at] == kis_bond_index_message_written.average_convexity[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> assert(kis_bond_index_message_read.average_ytm[kis_bond_index_message_at] == kis_bond_index_message_written.average_ytm[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  kis_bond_index_message_at = 0;
  do
  :: kis_bond_index_message_at < 6 -> assert(kis_bond_index_message_read.average_forward_ytm[kis_bond_index_message_at] == kis_bond_index_message_written.average_forward_ytm[kis_bond_index_message_at]); kis_bond_index_message_at = kis_bond_index_message_at + 1
  :: else -> break
  od;
  assert(kis_bond_index_message_read.filler_1 == kis_bond_index_message_written.filler_1);
  assert(kis_bond_index_message_read.end_keyword == kis_bond_index_message_written.end_keyword);
  skip
}

/* ---- Kebi Bond Index Message: 109 bytes -------------------------------------- */

/* KEBI Bond Index real-time message. Identical field layout to the Mkf Bond Index Message. */
typedef KebiBondIndexMessage {
  byte filler_4[4];
  byte index_id[6];
  byte standard_date[8];
  byte standard_time[6];
  byte total_profit_index[10];
  byte clean_price_index[10];
  byte market_price_index[10];
  byte call_re_investment_index[10];
  byte zero_re_investment_index[10];
  byte futures_basis_price[9];
  byte average_duration_nullable[6];
  byte average_convexity[6];
  byte average_ytm[6];
  byte average_forward_ytm[6];
  byte filler_1;
  byte end_keyword
};

int kebi_bond_index_message_at;

/* every byte of Kebi Bond Index Message set to one value */
inline fill_kebi_bond_index_message(kebi_bond_index_message_record, kebi_bond_index_message_value) {
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 4 -> kebi_bond_index_message_record.filler_4[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.index_id[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 8 -> kebi_bond_index_message_record.standard_date[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.standard_time[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.total_profit_index[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.clean_price_index[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.market_price_index[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.call_re_investment_index[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.zero_re_investment_index[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 9 -> kebi_bond_index_message_record.futures_basis_price[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_duration_nullable[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_convexity[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_ytm[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_forward_ytm[kebi_bond_index_message_at] = kebi_bond_index_message_value; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_record.filler_1 = kebi_bond_index_message_value;
  kebi_bond_index_message_record.end_keyword = kebi_bond_index_message_value;
  skip
}

/* each byte of Kebi Bond Index Message set to where it lies, so a field read out of place says so */
inline ramp_kebi_bond_index_message(kebi_bond_index_message_record, kebi_bond_index_message_base) {
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 4 -> kebi_bond_index_message_record.filler_4[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 0 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.index_id[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 4 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 8 -> kebi_bond_index_message_record.standard_date[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 10 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.standard_time[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 18 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.total_profit_index[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 24 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.clean_price_index[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 34 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.market_price_index[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 44 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.call_re_investment_index[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 54 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.zero_re_investment_index[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 64 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 9 -> kebi_bond_index_message_record.futures_basis_price[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 74 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_duration_nullable[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 83 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_convexity[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 89 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_ytm[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 95 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_forward_ytm[kebi_bond_index_message_at] = (kebi_bond_index_message_base + 101 + kebi_bond_index_message_at + 1) % 256; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_record.filler_1 = (kebi_bond_index_message_base + 107 + 1) % 256;
  kebi_bond_index_message_record.end_keyword = (kebi_bond_index_message_base + 108 + 1) % 256;
  skip
}

/* Kebi Bond Index Message to the wire, 109 bytes from where the cursor stands */
inline encode_kebi_bond_index_message(kebi_bond_index_message_record) {
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 4 -> wire[at] = kebi_bond_index_message_record.filler_4[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> wire[at] = kebi_bond_index_message_record.index_id[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 8 -> wire[at] = kebi_bond_index_message_record.standard_date[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> wire[at] = kebi_bond_index_message_record.standard_time[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> wire[at] = kebi_bond_index_message_record.total_profit_index[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> wire[at] = kebi_bond_index_message_record.clean_price_index[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> wire[at] = kebi_bond_index_message_record.market_price_index[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> wire[at] = kebi_bond_index_message_record.call_re_investment_index[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> wire[at] = kebi_bond_index_message_record.zero_re_investment_index[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 9 -> wire[at] = kebi_bond_index_message_record.futures_basis_price[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> wire[at] = kebi_bond_index_message_record.average_duration_nullable[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> wire[at] = kebi_bond_index_message_record.average_convexity[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> wire[at] = kebi_bond_index_message_record.average_ytm[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> wire[at] = kebi_bond_index_message_record.average_forward_ytm[kebi_bond_index_message_at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  wire[at] = kebi_bond_index_message_record.filler_1; at = at + 1;
  wire[at] = kebi_bond_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Kebi Bond Index Message off the wire, 109 bytes from where the cursor stands */
inline decode_kebi_bond_index_message(kebi_bond_index_message_record) {
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 4 -> kebi_bond_index_message_record.filler_4[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.index_id[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 8 -> kebi_bond_index_message_record.standard_date[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.standard_time[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.total_profit_index[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.clean_price_index[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.market_price_index[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.call_re_investment_index[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> kebi_bond_index_message_record.zero_re_investment_index[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 9 -> kebi_bond_index_message_record.futures_basis_price[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_duration_nullable[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_convexity[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_ytm[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> kebi_bond_index_message_record.average_forward_ytm[kebi_bond_index_message_at] = wire[at]; at = at + 1; kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_record.filler_1 = wire[at]; at = at + 1;
  kebi_bond_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Kebi Bond Index Message is what was written, byte for byte */
inline equal_kebi_bond_index_message(kebi_bond_index_message_read, kebi_bond_index_message_written) {
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 4 -> assert(kebi_bond_index_message_read.filler_4[kebi_bond_index_message_at] == kebi_bond_index_message_written.filler_4[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> assert(kebi_bond_index_message_read.index_id[kebi_bond_index_message_at] == kebi_bond_index_message_written.index_id[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 8 -> assert(kebi_bond_index_message_read.standard_date[kebi_bond_index_message_at] == kebi_bond_index_message_written.standard_date[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> assert(kebi_bond_index_message_read.standard_time[kebi_bond_index_message_at] == kebi_bond_index_message_written.standard_time[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> assert(kebi_bond_index_message_read.total_profit_index[kebi_bond_index_message_at] == kebi_bond_index_message_written.total_profit_index[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> assert(kebi_bond_index_message_read.clean_price_index[kebi_bond_index_message_at] == kebi_bond_index_message_written.clean_price_index[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> assert(kebi_bond_index_message_read.market_price_index[kebi_bond_index_message_at] == kebi_bond_index_message_written.market_price_index[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> assert(kebi_bond_index_message_read.call_re_investment_index[kebi_bond_index_message_at] == kebi_bond_index_message_written.call_re_investment_index[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 10 -> assert(kebi_bond_index_message_read.zero_re_investment_index[kebi_bond_index_message_at] == kebi_bond_index_message_written.zero_re_investment_index[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 9 -> assert(kebi_bond_index_message_read.futures_basis_price[kebi_bond_index_message_at] == kebi_bond_index_message_written.futures_basis_price[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> assert(kebi_bond_index_message_read.average_duration_nullable[kebi_bond_index_message_at] == kebi_bond_index_message_written.average_duration_nullable[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> assert(kebi_bond_index_message_read.average_convexity[kebi_bond_index_message_at] == kebi_bond_index_message_written.average_convexity[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> assert(kebi_bond_index_message_read.average_ytm[kebi_bond_index_message_at] == kebi_bond_index_message_written.average_ytm[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  kebi_bond_index_message_at = 0;
  do
  :: kebi_bond_index_message_at < 6 -> assert(kebi_bond_index_message_read.average_forward_ytm[kebi_bond_index_message_at] == kebi_bond_index_message_written.average_forward_ytm[kebi_bond_index_message_at]); kebi_bond_index_message_at = kebi_bond_index_message_at + 1
  :: else -> break
  od;
  assert(kebi_bond_index_message_read.filler_1 == kebi_bond_index_message_written.filler_1);
  assert(kebi_bond_index_message_read.end_keyword == kebi_bond_index_message_written.end_keyword);
  skip
}

/* ---- Kabi Bond Index Message: 109 bytes -------------------------------------- */

/* KABI Bond Index real-time message. Same field layout as the Mkf Bond Index Message; KABI uses standard 100 rather than 10,000 for the various indices. */
typedef KabiBondIndexMessage {
  byte filler_4[4];
  byte index_id[6];
  byte standard_date[8];
  byte standard_time[6];
  byte total_profit_index[10];
  byte clean_price_index[10];
  byte market_price_index[10];
  byte call_re_investment_index[10];
  byte zero_re_investment_index[10];
  byte futures_basis_price_nullable[9];
  byte average_duration[6];
  byte average_convexity[6];
  byte average_ytm[6];
  byte average_forward_ytm_nullable[6];
  byte filler_1;
  byte end_keyword
};

int kabi_bond_index_message_at;

/* every byte of Kabi Bond Index Message set to one value */
inline fill_kabi_bond_index_message(kabi_bond_index_message_record, kabi_bond_index_message_value) {
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 4 -> kabi_bond_index_message_record.filler_4[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.index_id[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 8 -> kabi_bond_index_message_record.standard_date[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.standard_time[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.total_profit_index[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.clean_price_index[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.market_price_index[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.call_re_investment_index[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.zero_re_investment_index[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 9 -> kabi_bond_index_message_record.futures_basis_price_nullable[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_duration[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_convexity[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_ytm[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_forward_ytm_nullable[kabi_bond_index_message_at] = kabi_bond_index_message_value; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_record.filler_1 = kabi_bond_index_message_value;
  kabi_bond_index_message_record.end_keyword = kabi_bond_index_message_value;
  skip
}

/* each byte of Kabi Bond Index Message set to where it lies, so a field read out of place says so */
inline ramp_kabi_bond_index_message(kabi_bond_index_message_record, kabi_bond_index_message_base) {
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 4 -> kabi_bond_index_message_record.filler_4[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 0 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.index_id[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 4 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 8 -> kabi_bond_index_message_record.standard_date[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 10 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.standard_time[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 18 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.total_profit_index[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 24 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.clean_price_index[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 34 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.market_price_index[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 44 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.call_re_investment_index[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 54 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.zero_re_investment_index[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 64 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 9 -> kabi_bond_index_message_record.futures_basis_price_nullable[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 74 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_duration[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 83 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_convexity[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 89 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_ytm[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 95 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_forward_ytm_nullable[kabi_bond_index_message_at] = (kabi_bond_index_message_base + 101 + kabi_bond_index_message_at + 1) % 256; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_record.filler_1 = (kabi_bond_index_message_base + 107 + 1) % 256;
  kabi_bond_index_message_record.end_keyword = (kabi_bond_index_message_base + 108 + 1) % 256;
  skip
}

/* Kabi Bond Index Message to the wire, 109 bytes from where the cursor stands */
inline encode_kabi_bond_index_message(kabi_bond_index_message_record) {
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 4 -> wire[at] = kabi_bond_index_message_record.filler_4[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> wire[at] = kabi_bond_index_message_record.index_id[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 8 -> wire[at] = kabi_bond_index_message_record.standard_date[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> wire[at] = kabi_bond_index_message_record.standard_time[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> wire[at] = kabi_bond_index_message_record.total_profit_index[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> wire[at] = kabi_bond_index_message_record.clean_price_index[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> wire[at] = kabi_bond_index_message_record.market_price_index[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> wire[at] = kabi_bond_index_message_record.call_re_investment_index[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> wire[at] = kabi_bond_index_message_record.zero_re_investment_index[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 9 -> wire[at] = kabi_bond_index_message_record.futures_basis_price_nullable[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> wire[at] = kabi_bond_index_message_record.average_duration[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> wire[at] = kabi_bond_index_message_record.average_convexity[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> wire[at] = kabi_bond_index_message_record.average_ytm[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> wire[at] = kabi_bond_index_message_record.average_forward_ytm_nullable[kabi_bond_index_message_at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  wire[at] = kabi_bond_index_message_record.filler_1; at = at + 1;
  wire[at] = kabi_bond_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Kabi Bond Index Message off the wire, 109 bytes from where the cursor stands */
inline decode_kabi_bond_index_message(kabi_bond_index_message_record) {
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 4 -> kabi_bond_index_message_record.filler_4[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.index_id[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 8 -> kabi_bond_index_message_record.standard_date[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.standard_time[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.total_profit_index[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.clean_price_index[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.market_price_index[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.call_re_investment_index[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> kabi_bond_index_message_record.zero_re_investment_index[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 9 -> kabi_bond_index_message_record.futures_basis_price_nullable[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_duration[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_convexity[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_ytm[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> kabi_bond_index_message_record.average_forward_ytm_nullable[kabi_bond_index_message_at] = wire[at]; at = at + 1; kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_record.filler_1 = wire[at]; at = at + 1;
  kabi_bond_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Kabi Bond Index Message is what was written, byte for byte */
inline equal_kabi_bond_index_message(kabi_bond_index_message_read, kabi_bond_index_message_written) {
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 4 -> assert(kabi_bond_index_message_read.filler_4[kabi_bond_index_message_at] == kabi_bond_index_message_written.filler_4[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> assert(kabi_bond_index_message_read.index_id[kabi_bond_index_message_at] == kabi_bond_index_message_written.index_id[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 8 -> assert(kabi_bond_index_message_read.standard_date[kabi_bond_index_message_at] == kabi_bond_index_message_written.standard_date[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> assert(kabi_bond_index_message_read.standard_time[kabi_bond_index_message_at] == kabi_bond_index_message_written.standard_time[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> assert(kabi_bond_index_message_read.total_profit_index[kabi_bond_index_message_at] == kabi_bond_index_message_written.total_profit_index[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> assert(kabi_bond_index_message_read.clean_price_index[kabi_bond_index_message_at] == kabi_bond_index_message_written.clean_price_index[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> assert(kabi_bond_index_message_read.market_price_index[kabi_bond_index_message_at] == kabi_bond_index_message_written.market_price_index[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> assert(kabi_bond_index_message_read.call_re_investment_index[kabi_bond_index_message_at] == kabi_bond_index_message_written.call_re_investment_index[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 10 -> assert(kabi_bond_index_message_read.zero_re_investment_index[kabi_bond_index_message_at] == kabi_bond_index_message_written.zero_re_investment_index[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 9 -> assert(kabi_bond_index_message_read.futures_basis_price_nullable[kabi_bond_index_message_at] == kabi_bond_index_message_written.futures_basis_price_nullable[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> assert(kabi_bond_index_message_read.average_duration[kabi_bond_index_message_at] == kabi_bond_index_message_written.average_duration[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> assert(kabi_bond_index_message_read.average_convexity[kabi_bond_index_message_at] == kabi_bond_index_message_written.average_convexity[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> assert(kabi_bond_index_message_read.average_ytm[kabi_bond_index_message_at] == kabi_bond_index_message_written.average_ytm[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  kabi_bond_index_message_at = 0;
  do
  :: kabi_bond_index_message_at < 6 -> assert(kabi_bond_index_message_read.average_forward_ytm_nullable[kabi_bond_index_message_at] == kabi_bond_index_message_written.average_forward_ytm_nullable[kabi_bond_index_message_at]); kabi_bond_index_message_at = kabi_bond_index_message_at + 1
  :: else -> break
  od;
  assert(kabi_bond_index_message_read.filler_1 == kabi_bond_index_message_written.filler_1);
  assert(kabi_bond_index_message_read.end_keyword == kabi_bond_index_message_written.end_keyword);
  skip
}

/* ---- Nicepni Bond Index Message: 109 bytes ----------------------------------- */

/* NicePNI Bond Index real-time message. Identical field layout to the Mkf Bond Index Message. */
typedef NicepniBondIndexMessage {
  byte filler_4[4];
  byte index_id[6];
  byte standard_date[8];
  byte standard_time[6];
  byte total_profit_index[10];
  byte clean_price_index[10];
  byte market_price_index[10];
  byte call_re_investment_index[10];
  byte zero_re_investment_index[10];
  byte futures_basis_price[9];
  byte average_duration_nullable[6];
  byte average_convexity[6];
  byte average_ytm[6];
  byte average_forward_ytm[6];
  byte filler_1;
  byte end_keyword
};

int nicepni_bond_index_message_at;

/* every byte of Nicepni Bond Index Message set to one value */
inline fill_nicepni_bond_index_message(nicepni_bond_index_message_record, nicepni_bond_index_message_value) {
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 4 -> nicepni_bond_index_message_record.filler_4[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.index_id[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 8 -> nicepni_bond_index_message_record.standard_date[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.standard_time[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.total_profit_index[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.clean_price_index[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.market_price_index[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.call_re_investment_index[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.zero_re_investment_index[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 9 -> nicepni_bond_index_message_record.futures_basis_price[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_duration_nullable[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_convexity[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_ytm[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_forward_ytm[nicepni_bond_index_message_at] = nicepni_bond_index_message_value; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_record.filler_1 = nicepni_bond_index_message_value;
  nicepni_bond_index_message_record.end_keyword = nicepni_bond_index_message_value;
  skip
}

/* each byte of Nicepni Bond Index Message set to where it lies, so a field read out of place says so */
inline ramp_nicepni_bond_index_message(nicepni_bond_index_message_record, nicepni_bond_index_message_base) {
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 4 -> nicepni_bond_index_message_record.filler_4[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 0 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.index_id[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 4 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 8 -> nicepni_bond_index_message_record.standard_date[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 10 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.standard_time[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 18 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.total_profit_index[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 24 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.clean_price_index[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 34 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.market_price_index[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 44 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.call_re_investment_index[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 54 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.zero_re_investment_index[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 64 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 9 -> nicepni_bond_index_message_record.futures_basis_price[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 74 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_duration_nullable[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 83 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_convexity[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 89 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_ytm[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 95 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_forward_ytm[nicepni_bond_index_message_at] = (nicepni_bond_index_message_base + 101 + nicepni_bond_index_message_at + 1) % 256; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_record.filler_1 = (nicepni_bond_index_message_base + 107 + 1) % 256;
  nicepni_bond_index_message_record.end_keyword = (nicepni_bond_index_message_base + 108 + 1) % 256;
  skip
}

/* Nicepni Bond Index Message to the wire, 109 bytes from where the cursor stands */
inline encode_nicepni_bond_index_message(nicepni_bond_index_message_record) {
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 4 -> wire[at] = nicepni_bond_index_message_record.filler_4[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> wire[at] = nicepni_bond_index_message_record.index_id[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 8 -> wire[at] = nicepni_bond_index_message_record.standard_date[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> wire[at] = nicepni_bond_index_message_record.standard_time[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> wire[at] = nicepni_bond_index_message_record.total_profit_index[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> wire[at] = nicepni_bond_index_message_record.clean_price_index[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> wire[at] = nicepni_bond_index_message_record.market_price_index[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> wire[at] = nicepni_bond_index_message_record.call_re_investment_index[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> wire[at] = nicepni_bond_index_message_record.zero_re_investment_index[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 9 -> wire[at] = nicepni_bond_index_message_record.futures_basis_price[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> wire[at] = nicepni_bond_index_message_record.average_duration_nullable[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> wire[at] = nicepni_bond_index_message_record.average_convexity[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> wire[at] = nicepni_bond_index_message_record.average_ytm[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> wire[at] = nicepni_bond_index_message_record.average_forward_ytm[nicepni_bond_index_message_at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  wire[at] = nicepni_bond_index_message_record.filler_1; at = at + 1;
  wire[at] = nicepni_bond_index_message_record.end_keyword; at = at + 1;
  skip
}

/* Nicepni Bond Index Message off the wire, 109 bytes from where the cursor stands */
inline decode_nicepni_bond_index_message(nicepni_bond_index_message_record) {
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 4 -> nicepni_bond_index_message_record.filler_4[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.index_id[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 8 -> nicepni_bond_index_message_record.standard_date[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.standard_time[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.total_profit_index[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.clean_price_index[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.market_price_index[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.call_re_investment_index[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> nicepni_bond_index_message_record.zero_re_investment_index[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 9 -> nicepni_bond_index_message_record.futures_basis_price[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_duration_nullable[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_convexity[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_ytm[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> nicepni_bond_index_message_record.average_forward_ytm[nicepni_bond_index_message_at] = wire[at]; at = at + 1; nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_record.filler_1 = wire[at]; at = at + 1;
  nicepni_bond_index_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Nicepni Bond Index Message is what was written, byte for byte */
inline equal_nicepni_bond_index_message(nicepni_bond_index_message_read, nicepni_bond_index_message_written) {
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 4 -> assert(nicepni_bond_index_message_read.filler_4[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.filler_4[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> assert(nicepni_bond_index_message_read.index_id[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.index_id[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 8 -> assert(nicepni_bond_index_message_read.standard_date[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.standard_date[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> assert(nicepni_bond_index_message_read.standard_time[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.standard_time[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> assert(nicepni_bond_index_message_read.total_profit_index[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.total_profit_index[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> assert(nicepni_bond_index_message_read.clean_price_index[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.clean_price_index[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> assert(nicepni_bond_index_message_read.market_price_index[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.market_price_index[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> assert(nicepni_bond_index_message_read.call_re_investment_index[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.call_re_investment_index[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 10 -> assert(nicepni_bond_index_message_read.zero_re_investment_index[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.zero_re_investment_index[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 9 -> assert(nicepni_bond_index_message_read.futures_basis_price[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.futures_basis_price[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> assert(nicepni_bond_index_message_read.average_duration_nullable[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.average_duration_nullable[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> assert(nicepni_bond_index_message_read.average_convexity[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.average_convexity[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> assert(nicepni_bond_index_message_read.average_ytm[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.average_ytm[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  nicepni_bond_index_message_at = 0;
  do
  :: nicepni_bond_index_message_at < 6 -> assert(nicepni_bond_index_message_read.average_forward_ytm[nicepni_bond_index_message_at] == nicepni_bond_index_message_written.average_forward_ytm[nicepni_bond_index_message_at]); nicepni_bond_index_message_at = nicepni_bond_index_message_at + 1
  :: else -> break
  od;
  assert(nicepni_bond_index_message_read.filler_1 == nicepni_bond_index_message_written.filler_1);
  assert(nicepni_bond_index_message_read.end_keyword == nicepni_bond_index_message_written.end_keyword);
  skip
}

/* ---- Domestic Etf Inav Message: 65 bytes ------------------------------------- */

/* Domestic ETF intraday NAV (1-second interval). Carries previous-day and during-market/final NAV per ETF ISIN. */
typedef DomesticEtfInavMessage {
  byte isin[12];
  byte time[6];
  byte previous_nav[9];
  byte during_marketfinal_nav[9];
  byte filler_28[28];
  byte end_keyword
};

int domestic_etf_inav_message_at;

/* every byte of Domestic Etf Inav Message set to one value */
inline fill_domestic_etf_inav_message(domestic_etf_inav_message_record, domestic_etf_inav_message_value) {
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 12 -> domestic_etf_inav_message_record.isin[domestic_etf_inav_message_at] = domestic_etf_inav_message_value; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 6 -> domestic_etf_inav_message_record.time[domestic_etf_inav_message_at] = domestic_etf_inav_message_value; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 9 -> domestic_etf_inav_message_record.previous_nav[domestic_etf_inav_message_at] = domestic_etf_inav_message_value; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 9 -> domestic_etf_inav_message_record.during_marketfinal_nav[domestic_etf_inav_message_at] = domestic_etf_inav_message_value; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 28 -> domestic_etf_inav_message_record.filler_28[domestic_etf_inav_message_at] = domestic_etf_inav_message_value; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_record.end_keyword = domestic_etf_inav_message_value;
  skip
}

/* each byte of Domestic Etf Inav Message set to where it lies, so a field read out of place says so */
inline ramp_domestic_etf_inav_message(domestic_etf_inav_message_record, domestic_etf_inav_message_base) {
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 12 -> domestic_etf_inav_message_record.isin[domestic_etf_inav_message_at] = (domestic_etf_inav_message_base + 0 + domestic_etf_inav_message_at + 1) % 256; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 6 -> domestic_etf_inav_message_record.time[domestic_etf_inav_message_at] = (domestic_etf_inav_message_base + 12 + domestic_etf_inav_message_at + 1) % 256; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 9 -> domestic_etf_inav_message_record.previous_nav[domestic_etf_inav_message_at] = (domestic_etf_inav_message_base + 18 + domestic_etf_inav_message_at + 1) % 256; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 9 -> domestic_etf_inav_message_record.during_marketfinal_nav[domestic_etf_inav_message_at] = (domestic_etf_inav_message_base + 27 + domestic_etf_inav_message_at + 1) % 256; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 28 -> domestic_etf_inav_message_record.filler_28[domestic_etf_inav_message_at] = (domestic_etf_inav_message_base + 36 + domestic_etf_inav_message_at + 1) % 256; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_record.end_keyword = (domestic_etf_inav_message_base + 64 + 1) % 256;
  skip
}

/* Domestic Etf Inav Message to the wire, 65 bytes from where the cursor stands */
inline encode_domestic_etf_inav_message(domestic_etf_inav_message_record) {
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 12 -> wire[at] = domestic_etf_inav_message_record.isin[domestic_etf_inav_message_at]; at = at + 1; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 6 -> wire[at] = domestic_etf_inav_message_record.time[domestic_etf_inav_message_at]; at = at + 1; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 9 -> wire[at] = domestic_etf_inav_message_record.previous_nav[domestic_etf_inav_message_at]; at = at + 1; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 9 -> wire[at] = domestic_etf_inav_message_record.during_marketfinal_nav[domestic_etf_inav_message_at]; at = at + 1; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 28 -> wire[at] = domestic_etf_inav_message_record.filler_28[domestic_etf_inav_message_at]; at = at + 1; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  wire[at] = domestic_etf_inav_message_record.end_keyword; at = at + 1;
  skip
}

/* Domestic Etf Inav Message off the wire, 65 bytes from where the cursor stands */
inline decode_domestic_etf_inav_message(domestic_etf_inav_message_record) {
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 12 -> domestic_etf_inav_message_record.isin[domestic_etf_inav_message_at] = wire[at]; at = at + 1; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 6 -> domestic_etf_inav_message_record.time[domestic_etf_inav_message_at] = wire[at]; at = at + 1; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 9 -> domestic_etf_inav_message_record.previous_nav[domestic_etf_inav_message_at] = wire[at]; at = at + 1; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 9 -> domestic_etf_inav_message_record.during_marketfinal_nav[domestic_etf_inav_message_at] = wire[at]; at = at + 1; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 28 -> domestic_etf_inav_message_record.filler_28[domestic_etf_inav_message_at] = wire[at]; at = at + 1; domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Domestic Etf Inav Message is what was written, byte for byte */
inline equal_domestic_etf_inav_message(domestic_etf_inav_message_read, domestic_etf_inav_message_written) {
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 12 -> assert(domestic_etf_inav_message_read.isin[domestic_etf_inav_message_at] == domestic_etf_inav_message_written.isin[domestic_etf_inav_message_at]); domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 6 -> assert(domestic_etf_inav_message_read.time[domestic_etf_inav_message_at] == domestic_etf_inav_message_written.time[domestic_etf_inav_message_at]); domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 9 -> assert(domestic_etf_inav_message_read.previous_nav[domestic_etf_inav_message_at] == domestic_etf_inav_message_written.previous_nav[domestic_etf_inav_message_at]); domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 9 -> assert(domestic_etf_inav_message_read.during_marketfinal_nav[domestic_etf_inav_message_at] == domestic_etf_inav_message_written.during_marketfinal_nav[domestic_etf_inav_message_at]); domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_inav_message_at = 0;
  do
  :: domestic_etf_inav_message_at < 28 -> assert(domestic_etf_inav_message_read.filler_28[domestic_etf_inav_message_at] == domestic_etf_inav_message_written.filler_28[domestic_etf_inav_message_at]); domestic_etf_inav_message_at = domestic_etf_inav_message_at + 1
  :: else -> break
  od;
  assert(domestic_etf_inav_message_read.end_keyword == domestic_etf_inav_message_written.end_keyword);
  skip
}

/* ---- Domestic Etf Estimated Inav Message: 45 bytes --------------------------- */

/* Domestic ETF Estimated iNAV. Carries previous-day and during-market/final estimated NAV. */
typedef DomesticEtfEstimatedInavMessage {
  byte isin[12];
  byte time[6];
  byte previous_nav[9];
  byte during_marketfinal_market_nav[9];
  byte filler_8[8];
  byte end_keyword
};

int domestic_etf_estimated_inav_message_at;

/* every byte of Domestic Etf Estimated Inav Message set to one value */
inline fill_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_record, domestic_etf_estimated_inav_message_value) {
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 12 -> domestic_etf_estimated_inav_message_record.isin[domestic_etf_estimated_inav_message_at] = domestic_etf_estimated_inav_message_value; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 6 -> domestic_etf_estimated_inav_message_record.time[domestic_etf_estimated_inav_message_at] = domestic_etf_estimated_inav_message_value; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 9 -> domestic_etf_estimated_inav_message_record.previous_nav[domestic_etf_estimated_inav_message_at] = domestic_etf_estimated_inav_message_value; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 9 -> domestic_etf_estimated_inav_message_record.during_marketfinal_market_nav[domestic_etf_estimated_inav_message_at] = domestic_etf_estimated_inav_message_value; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 8 -> domestic_etf_estimated_inav_message_record.filler_8[domestic_etf_estimated_inav_message_at] = domestic_etf_estimated_inav_message_value; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_record.end_keyword = domestic_etf_estimated_inav_message_value;
  skip
}

/* each byte of Domestic Etf Estimated Inav Message set to where it lies, so a field read out of place says so */
inline ramp_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_record, domestic_etf_estimated_inav_message_base) {
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 12 -> domestic_etf_estimated_inav_message_record.isin[domestic_etf_estimated_inav_message_at] = (domestic_etf_estimated_inav_message_base + 0 + domestic_etf_estimated_inav_message_at + 1) % 256; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 6 -> domestic_etf_estimated_inav_message_record.time[domestic_etf_estimated_inav_message_at] = (domestic_etf_estimated_inav_message_base + 12 + domestic_etf_estimated_inav_message_at + 1) % 256; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 9 -> domestic_etf_estimated_inav_message_record.previous_nav[domestic_etf_estimated_inav_message_at] = (domestic_etf_estimated_inav_message_base + 18 + domestic_etf_estimated_inav_message_at + 1) % 256; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 9 -> domestic_etf_estimated_inav_message_record.during_marketfinal_market_nav[domestic_etf_estimated_inav_message_at] = (domestic_etf_estimated_inav_message_base + 27 + domestic_etf_estimated_inav_message_at + 1) % 256; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 8 -> domestic_etf_estimated_inav_message_record.filler_8[domestic_etf_estimated_inav_message_at] = (domestic_etf_estimated_inav_message_base + 36 + domestic_etf_estimated_inav_message_at + 1) % 256; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_record.end_keyword = (domestic_etf_estimated_inav_message_base + 44 + 1) % 256;
  skip
}

/* Domestic Etf Estimated Inav Message to the wire, 45 bytes from where the cursor stands */
inline encode_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_record) {
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 12 -> wire[at] = domestic_etf_estimated_inav_message_record.isin[domestic_etf_estimated_inav_message_at]; at = at + 1; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 6 -> wire[at] = domestic_etf_estimated_inav_message_record.time[domestic_etf_estimated_inav_message_at]; at = at + 1; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 9 -> wire[at] = domestic_etf_estimated_inav_message_record.previous_nav[domestic_etf_estimated_inav_message_at]; at = at + 1; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 9 -> wire[at] = domestic_etf_estimated_inav_message_record.during_marketfinal_market_nav[domestic_etf_estimated_inav_message_at]; at = at + 1; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 8 -> wire[at] = domestic_etf_estimated_inav_message_record.filler_8[domestic_etf_estimated_inav_message_at]; at = at + 1; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  wire[at] = domestic_etf_estimated_inav_message_record.end_keyword; at = at + 1;
  skip
}

/* Domestic Etf Estimated Inav Message off the wire, 45 bytes from where the cursor stands */
inline decode_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_record) {
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 12 -> domestic_etf_estimated_inav_message_record.isin[domestic_etf_estimated_inav_message_at] = wire[at]; at = at + 1; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 6 -> domestic_etf_estimated_inav_message_record.time[domestic_etf_estimated_inav_message_at] = wire[at]; at = at + 1; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 9 -> domestic_etf_estimated_inav_message_record.previous_nav[domestic_etf_estimated_inav_message_at] = wire[at]; at = at + 1; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 9 -> domestic_etf_estimated_inav_message_record.during_marketfinal_market_nav[domestic_etf_estimated_inav_message_at] = wire[at]; at = at + 1; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 8 -> domestic_etf_estimated_inav_message_record.filler_8[domestic_etf_estimated_inav_message_at] = wire[at]; at = at + 1; domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Domestic Etf Estimated Inav Message is what was written, byte for byte */
inline equal_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_read, domestic_etf_estimated_inav_message_written) {
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 12 -> assert(domestic_etf_estimated_inav_message_read.isin[domestic_etf_estimated_inav_message_at] == domestic_etf_estimated_inav_message_written.isin[domestic_etf_estimated_inav_message_at]); domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 6 -> assert(domestic_etf_estimated_inav_message_read.time[domestic_etf_estimated_inav_message_at] == domestic_etf_estimated_inav_message_written.time[domestic_etf_estimated_inav_message_at]); domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 9 -> assert(domestic_etf_estimated_inav_message_read.previous_nav[domestic_etf_estimated_inav_message_at] == domestic_etf_estimated_inav_message_written.previous_nav[domestic_etf_estimated_inav_message_at]); domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 9 -> assert(domestic_etf_estimated_inav_message_read.during_marketfinal_market_nav[domestic_etf_estimated_inav_message_at] == domestic_etf_estimated_inav_message_written.during_marketfinal_market_nav[domestic_etf_estimated_inav_message_at]); domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  domestic_etf_estimated_inav_message_at = 0;
  do
  :: domestic_etf_estimated_inav_message_at < 8 -> assert(domestic_etf_estimated_inav_message_read.filler_8[domestic_etf_estimated_inav_message_at] == domestic_etf_estimated_inav_message_written.filler_8[domestic_etf_estimated_inav_message_at]); domestic_etf_estimated_inav_message_at = domestic_etf_estimated_inav_message_at + 1
  :: else -> break
  od;
  assert(domestic_etf_estimated_inav_message_read.end_keyword == domestic_etf_estimated_inav_message_written.end_keyword);
  skip
}

/* ---- Global Etf Inav Message: 65 bytes --------------------------------------- */

/* Global ETF intraday NAV per ETF ISIN. */
typedef GlobalEtfInavMessage {
  byte isin[12];
  byte time[6];
  byte previous_nav[9];
  byte during_marketfinal_nav[9];
  byte filler_28[28];
  byte end_keyword
};

int global_etf_inav_message_at;

/* every byte of Global Etf Inav Message set to one value */
inline fill_global_etf_inav_message(global_etf_inav_message_record, global_etf_inav_message_value) {
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 12 -> global_etf_inav_message_record.isin[global_etf_inav_message_at] = global_etf_inav_message_value; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 6 -> global_etf_inav_message_record.time[global_etf_inav_message_at] = global_etf_inav_message_value; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 9 -> global_etf_inav_message_record.previous_nav[global_etf_inav_message_at] = global_etf_inav_message_value; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 9 -> global_etf_inav_message_record.during_marketfinal_nav[global_etf_inav_message_at] = global_etf_inav_message_value; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 28 -> global_etf_inav_message_record.filler_28[global_etf_inav_message_at] = global_etf_inav_message_value; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_record.end_keyword = global_etf_inav_message_value;
  skip
}

/* each byte of Global Etf Inav Message set to where it lies, so a field read out of place says so */
inline ramp_global_etf_inav_message(global_etf_inav_message_record, global_etf_inav_message_base) {
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 12 -> global_etf_inav_message_record.isin[global_etf_inav_message_at] = (global_etf_inav_message_base + 0 + global_etf_inav_message_at + 1) % 256; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 6 -> global_etf_inav_message_record.time[global_etf_inav_message_at] = (global_etf_inav_message_base + 12 + global_etf_inav_message_at + 1) % 256; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 9 -> global_etf_inav_message_record.previous_nav[global_etf_inav_message_at] = (global_etf_inav_message_base + 18 + global_etf_inav_message_at + 1) % 256; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 9 -> global_etf_inav_message_record.during_marketfinal_nav[global_etf_inav_message_at] = (global_etf_inav_message_base + 27 + global_etf_inav_message_at + 1) % 256; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 28 -> global_etf_inav_message_record.filler_28[global_etf_inav_message_at] = (global_etf_inav_message_base + 36 + global_etf_inav_message_at + 1) % 256; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_record.end_keyword = (global_etf_inav_message_base + 64 + 1) % 256;
  skip
}

/* Global Etf Inav Message to the wire, 65 bytes from where the cursor stands */
inline encode_global_etf_inav_message(global_etf_inav_message_record) {
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 12 -> wire[at] = global_etf_inav_message_record.isin[global_etf_inav_message_at]; at = at + 1; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 6 -> wire[at] = global_etf_inav_message_record.time[global_etf_inav_message_at]; at = at + 1; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 9 -> wire[at] = global_etf_inav_message_record.previous_nav[global_etf_inav_message_at]; at = at + 1; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 9 -> wire[at] = global_etf_inav_message_record.during_marketfinal_nav[global_etf_inav_message_at]; at = at + 1; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 28 -> wire[at] = global_etf_inav_message_record.filler_28[global_etf_inav_message_at]; at = at + 1; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  wire[at] = global_etf_inav_message_record.end_keyword; at = at + 1;
  skip
}

/* Global Etf Inav Message off the wire, 65 bytes from where the cursor stands */
inline decode_global_etf_inav_message(global_etf_inav_message_record) {
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 12 -> global_etf_inav_message_record.isin[global_etf_inav_message_at] = wire[at]; at = at + 1; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 6 -> global_etf_inav_message_record.time[global_etf_inav_message_at] = wire[at]; at = at + 1; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 9 -> global_etf_inav_message_record.previous_nav[global_etf_inav_message_at] = wire[at]; at = at + 1; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 9 -> global_etf_inav_message_record.during_marketfinal_nav[global_etf_inav_message_at] = wire[at]; at = at + 1; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 28 -> global_etf_inav_message_record.filler_28[global_etf_inav_message_at] = wire[at]; at = at + 1; global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Global Etf Inav Message is what was written, byte for byte */
inline equal_global_etf_inav_message(global_etf_inav_message_read, global_etf_inav_message_written) {
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 12 -> assert(global_etf_inav_message_read.isin[global_etf_inav_message_at] == global_etf_inav_message_written.isin[global_etf_inav_message_at]); global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 6 -> assert(global_etf_inav_message_read.time[global_etf_inav_message_at] == global_etf_inav_message_written.time[global_etf_inav_message_at]); global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 9 -> assert(global_etf_inav_message_read.previous_nav[global_etf_inav_message_at] == global_etf_inav_message_written.previous_nav[global_etf_inav_message_at]); global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 9 -> assert(global_etf_inav_message_read.during_marketfinal_nav[global_etf_inav_message_at] == global_etf_inav_message_written.during_marketfinal_nav[global_etf_inav_message_at]); global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  global_etf_inav_message_at = 0;
  do
  :: global_etf_inav_message_at < 28 -> assert(global_etf_inav_message_read.filler_28[global_etf_inav_message_at] == global_etf_inav_message_written.filler_28[global_etf_inav_message_at]); global_etf_inav_message_at = global_etf_inav_message_at + 1
  :: else -> break
  od;
  assert(global_etf_inav_message_read.end_keyword == global_etf_inav_message_written.end_keyword);
  skip
}

/* ---- Etf Tracking Error Message: 55 bytes ------------------------------------ */

/* ETF tracking error and signed disparate ratio per ETF. */
typedef EtfTrackingErrorMessage {
  byte isin[12];
  byte seq_number[8];
  byte date[8];
  byte tracking_error[9];
  byte disparate_ratio_sign;
  byte disparate_ratio[9];
  byte filler_7[7];
  byte end_keyword
};

int etf_tracking_error_message_at;

/* every byte of Etf Tracking Error Message set to one value */
inline fill_etf_tracking_error_message(etf_tracking_error_message_record, etf_tracking_error_message_value) {
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 12 -> etf_tracking_error_message_record.isin[etf_tracking_error_message_at] = etf_tracking_error_message_value; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 8 -> etf_tracking_error_message_record.seq_number[etf_tracking_error_message_at] = etf_tracking_error_message_value; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 8 -> etf_tracking_error_message_record.date[etf_tracking_error_message_at] = etf_tracking_error_message_value; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 9 -> etf_tracking_error_message_record.tracking_error[etf_tracking_error_message_at] = etf_tracking_error_message_value; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_record.disparate_ratio_sign = etf_tracking_error_message_value;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 9 -> etf_tracking_error_message_record.disparate_ratio[etf_tracking_error_message_at] = etf_tracking_error_message_value; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 7 -> etf_tracking_error_message_record.filler_7[etf_tracking_error_message_at] = etf_tracking_error_message_value; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_record.end_keyword = etf_tracking_error_message_value;
  skip
}

/* each byte of Etf Tracking Error Message set to where it lies, so a field read out of place says so */
inline ramp_etf_tracking_error_message(etf_tracking_error_message_record, etf_tracking_error_message_base) {
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 12 -> etf_tracking_error_message_record.isin[etf_tracking_error_message_at] = (etf_tracking_error_message_base + 0 + etf_tracking_error_message_at + 1) % 256; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 8 -> etf_tracking_error_message_record.seq_number[etf_tracking_error_message_at] = (etf_tracking_error_message_base + 12 + etf_tracking_error_message_at + 1) % 256; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 8 -> etf_tracking_error_message_record.date[etf_tracking_error_message_at] = (etf_tracking_error_message_base + 20 + etf_tracking_error_message_at + 1) % 256; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 9 -> etf_tracking_error_message_record.tracking_error[etf_tracking_error_message_at] = (etf_tracking_error_message_base + 28 + etf_tracking_error_message_at + 1) % 256; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_record.disparate_ratio_sign = (etf_tracking_error_message_base + 37 + 1) % 256;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 9 -> etf_tracking_error_message_record.disparate_ratio[etf_tracking_error_message_at] = (etf_tracking_error_message_base + 38 + etf_tracking_error_message_at + 1) % 256; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 7 -> etf_tracking_error_message_record.filler_7[etf_tracking_error_message_at] = (etf_tracking_error_message_base + 47 + etf_tracking_error_message_at + 1) % 256; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_record.end_keyword = (etf_tracking_error_message_base + 54 + 1) % 256;
  skip
}

/* Etf Tracking Error Message to the wire, 55 bytes from where the cursor stands */
inline encode_etf_tracking_error_message(etf_tracking_error_message_record) {
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 12 -> wire[at] = etf_tracking_error_message_record.isin[etf_tracking_error_message_at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 8 -> wire[at] = etf_tracking_error_message_record.seq_number[etf_tracking_error_message_at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 8 -> wire[at] = etf_tracking_error_message_record.date[etf_tracking_error_message_at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 9 -> wire[at] = etf_tracking_error_message_record.tracking_error[etf_tracking_error_message_at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  wire[at] = etf_tracking_error_message_record.disparate_ratio_sign; at = at + 1;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 9 -> wire[at] = etf_tracking_error_message_record.disparate_ratio[etf_tracking_error_message_at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 7 -> wire[at] = etf_tracking_error_message_record.filler_7[etf_tracking_error_message_at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  wire[at] = etf_tracking_error_message_record.end_keyword; at = at + 1;
  skip
}

/* Etf Tracking Error Message off the wire, 55 bytes from where the cursor stands */
inline decode_etf_tracking_error_message(etf_tracking_error_message_record) {
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 12 -> etf_tracking_error_message_record.isin[etf_tracking_error_message_at] = wire[at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 8 -> etf_tracking_error_message_record.seq_number[etf_tracking_error_message_at] = wire[at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 8 -> etf_tracking_error_message_record.date[etf_tracking_error_message_at] = wire[at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 9 -> etf_tracking_error_message_record.tracking_error[etf_tracking_error_message_at] = wire[at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_record.disparate_ratio_sign = wire[at]; at = at + 1;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 9 -> etf_tracking_error_message_record.disparate_ratio[etf_tracking_error_message_at] = wire[at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 7 -> etf_tracking_error_message_record.filler_7[etf_tracking_error_message_at] = wire[at]; at = at + 1; etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Etf Tracking Error Message is what was written, byte for byte */
inline equal_etf_tracking_error_message(etf_tracking_error_message_read, etf_tracking_error_message_written) {
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 12 -> assert(etf_tracking_error_message_read.isin[etf_tracking_error_message_at] == etf_tracking_error_message_written.isin[etf_tracking_error_message_at]); etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 8 -> assert(etf_tracking_error_message_read.seq_number[etf_tracking_error_message_at] == etf_tracking_error_message_written.seq_number[etf_tracking_error_message_at]); etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 8 -> assert(etf_tracking_error_message_read.date[etf_tracking_error_message_at] == etf_tracking_error_message_written.date[etf_tracking_error_message_at]); etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 9 -> assert(etf_tracking_error_message_read.tracking_error[etf_tracking_error_message_at] == etf_tracking_error_message_written.tracking_error[etf_tracking_error_message_at]); etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  assert(etf_tracking_error_message_read.disparate_ratio_sign == etf_tracking_error_message_written.disparate_ratio_sign);
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 9 -> assert(etf_tracking_error_message_read.disparate_ratio[etf_tracking_error_message_at] == etf_tracking_error_message_written.disparate_ratio[etf_tracking_error_message_at]); etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  etf_tracking_error_message_at = 0;
  do
  :: etf_tracking_error_message_at < 7 -> assert(etf_tracking_error_message_read.filler_7[etf_tracking_error_message_at] == etf_tracking_error_message_written.filler_7[etf_tracking_error_message_at]); etf_tracking_error_message_at = etf_tracking_error_message_at + 1
  :: else -> break
  od;
  assert(etf_tracking_error_message_read.end_keyword == etf_tracking_error_message_written.end_keyword);
  skip
}

/* ---- Global Etf Tracking Error Message: 55 bytes ----------------------------- */

/* Global ETF tracking error and signed disparate ratio. */
typedef GlobalEtfTrackingErrorMessage {
  byte isin[12];
  byte seq_number[8];
  byte date[8];
  byte tracking_error[9];
  byte disparate_ratio_sign;
  byte disparate_ratio[9];
  byte filler_7[7];
  byte end_keyword
};

int global_etf_tracking_error_message_at;

/* every byte of Global Etf Tracking Error Message set to one value */
inline fill_global_etf_tracking_error_message(global_etf_tracking_error_message_record, global_etf_tracking_error_message_value) {
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 12 -> global_etf_tracking_error_message_record.isin[global_etf_tracking_error_message_at] = global_etf_tracking_error_message_value; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 8 -> global_etf_tracking_error_message_record.seq_number[global_etf_tracking_error_message_at] = global_etf_tracking_error_message_value; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 8 -> global_etf_tracking_error_message_record.date[global_etf_tracking_error_message_at] = global_etf_tracking_error_message_value; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 9 -> global_etf_tracking_error_message_record.tracking_error[global_etf_tracking_error_message_at] = global_etf_tracking_error_message_value; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_record.disparate_ratio_sign = global_etf_tracking_error_message_value;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 9 -> global_etf_tracking_error_message_record.disparate_ratio[global_etf_tracking_error_message_at] = global_etf_tracking_error_message_value; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 7 -> global_etf_tracking_error_message_record.filler_7[global_etf_tracking_error_message_at] = global_etf_tracking_error_message_value; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_record.end_keyword = global_etf_tracking_error_message_value;
  skip
}

/* each byte of Global Etf Tracking Error Message set to where it lies, so a field read out of place says so */
inline ramp_global_etf_tracking_error_message(global_etf_tracking_error_message_record, global_etf_tracking_error_message_base) {
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 12 -> global_etf_tracking_error_message_record.isin[global_etf_tracking_error_message_at] = (global_etf_tracking_error_message_base + 0 + global_etf_tracking_error_message_at + 1) % 256; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 8 -> global_etf_tracking_error_message_record.seq_number[global_etf_tracking_error_message_at] = (global_etf_tracking_error_message_base + 12 + global_etf_tracking_error_message_at + 1) % 256; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 8 -> global_etf_tracking_error_message_record.date[global_etf_tracking_error_message_at] = (global_etf_tracking_error_message_base + 20 + global_etf_tracking_error_message_at + 1) % 256; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 9 -> global_etf_tracking_error_message_record.tracking_error[global_etf_tracking_error_message_at] = (global_etf_tracking_error_message_base + 28 + global_etf_tracking_error_message_at + 1) % 256; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_record.disparate_ratio_sign = (global_etf_tracking_error_message_base + 37 + 1) % 256;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 9 -> global_etf_tracking_error_message_record.disparate_ratio[global_etf_tracking_error_message_at] = (global_etf_tracking_error_message_base + 38 + global_etf_tracking_error_message_at + 1) % 256; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 7 -> global_etf_tracking_error_message_record.filler_7[global_etf_tracking_error_message_at] = (global_etf_tracking_error_message_base + 47 + global_etf_tracking_error_message_at + 1) % 256; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_record.end_keyword = (global_etf_tracking_error_message_base + 54 + 1) % 256;
  skip
}

/* Global Etf Tracking Error Message to the wire, 55 bytes from where the cursor stands */
inline encode_global_etf_tracking_error_message(global_etf_tracking_error_message_record) {
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 12 -> wire[at] = global_etf_tracking_error_message_record.isin[global_etf_tracking_error_message_at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 8 -> wire[at] = global_etf_tracking_error_message_record.seq_number[global_etf_tracking_error_message_at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 8 -> wire[at] = global_etf_tracking_error_message_record.date[global_etf_tracking_error_message_at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 9 -> wire[at] = global_etf_tracking_error_message_record.tracking_error[global_etf_tracking_error_message_at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  wire[at] = global_etf_tracking_error_message_record.disparate_ratio_sign; at = at + 1;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 9 -> wire[at] = global_etf_tracking_error_message_record.disparate_ratio[global_etf_tracking_error_message_at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 7 -> wire[at] = global_etf_tracking_error_message_record.filler_7[global_etf_tracking_error_message_at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  wire[at] = global_etf_tracking_error_message_record.end_keyword; at = at + 1;
  skip
}

/* Global Etf Tracking Error Message off the wire, 55 bytes from where the cursor stands */
inline decode_global_etf_tracking_error_message(global_etf_tracking_error_message_record) {
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 12 -> global_etf_tracking_error_message_record.isin[global_etf_tracking_error_message_at] = wire[at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 8 -> global_etf_tracking_error_message_record.seq_number[global_etf_tracking_error_message_at] = wire[at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 8 -> global_etf_tracking_error_message_record.date[global_etf_tracking_error_message_at] = wire[at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 9 -> global_etf_tracking_error_message_record.tracking_error[global_etf_tracking_error_message_at] = wire[at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_record.disparate_ratio_sign = wire[at]; at = at + 1;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 9 -> global_etf_tracking_error_message_record.disparate_ratio[global_etf_tracking_error_message_at] = wire[at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 7 -> global_etf_tracking_error_message_record.filler_7[global_etf_tracking_error_message_at] = wire[at]; at = at + 1; global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Global Etf Tracking Error Message is what was written, byte for byte */
inline equal_global_etf_tracking_error_message(global_etf_tracking_error_message_read, global_etf_tracking_error_message_written) {
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 12 -> assert(global_etf_tracking_error_message_read.isin[global_etf_tracking_error_message_at] == global_etf_tracking_error_message_written.isin[global_etf_tracking_error_message_at]); global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 8 -> assert(global_etf_tracking_error_message_read.seq_number[global_etf_tracking_error_message_at] == global_etf_tracking_error_message_written.seq_number[global_etf_tracking_error_message_at]); global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 8 -> assert(global_etf_tracking_error_message_read.date[global_etf_tracking_error_message_at] == global_etf_tracking_error_message_written.date[global_etf_tracking_error_message_at]); global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 9 -> assert(global_etf_tracking_error_message_read.tracking_error[global_etf_tracking_error_message_at] == global_etf_tracking_error_message_written.tracking_error[global_etf_tracking_error_message_at]); global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  assert(global_etf_tracking_error_message_read.disparate_ratio_sign == global_etf_tracking_error_message_written.disparate_ratio_sign);
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 9 -> assert(global_etf_tracking_error_message_read.disparate_ratio[global_etf_tracking_error_message_at] == global_etf_tracking_error_message_written.disparate_ratio[global_etf_tracking_error_message_at]); global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  global_etf_tracking_error_message_at = 0;
  do
  :: global_etf_tracking_error_message_at < 7 -> assert(global_etf_tracking_error_message_read.filler_7[global_etf_tracking_error_message_at] == global_etf_tracking_error_message_written.filler_7[global_etf_tracking_error_message_at]); global_etf_tracking_error_message_at = global_etf_tracking_error_message_at + 1
  :: else -> break
  od;
  assert(global_etf_tracking_error_message_read.end_keyword == global_etf_tracking_error_message_written.end_keyword);
  skip
}

/* ---- Etp Pdf Message: 155 bytes ---------------------------------------------- */

/* ETP Portfolio Deposit File. One record per composition issue: unit share, market type, issue name, par value, appraised value, profit distribution basis date. */
typedef EtpPdfMessage {
  byte isin[12];
  byte data_seq_number[8];
  byte date[8];
  byte office_consignment_companys_registration_number[3];
  byte composition_issue_number[4];
  byte composition_issue_code[12];
  byte c_u_unit_share_number_of_contract_k_r_w_cash_u_s_d_cash_converted_amount_k_r_w[18];
  byte composition_issue_market_type;
  byte composition_issue_name[40];
  byte par_value_amount_cash_amount_converted_amount_krw[18];
  byte profit_distribution_basis_date[8];
  byte appraised_value[18];
  byte filler_4[4];
  byte end_keyword
};

int etp_pdf_message_at;

/* every byte of Etp Pdf Message set to one value */
inline fill_etp_pdf_message(etp_pdf_message_record, etp_pdf_message_value) {
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 12 -> etp_pdf_message_record.isin[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> etp_pdf_message_record.data_seq_number[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> etp_pdf_message_record.date[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 3 -> etp_pdf_message_record.office_consignment_companys_registration_number[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 4 -> etp_pdf_message_record.composition_issue_number[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 12 -> etp_pdf_message_record.composition_issue_code[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> etp_pdf_message_record.c_u_unit_share_number_of_contract_k_r_w_cash_u_s_d_cash_converted_amount_k_r_w[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_record.composition_issue_market_type = etp_pdf_message_value;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 40 -> etp_pdf_message_record.composition_issue_name[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> etp_pdf_message_record.par_value_amount_cash_amount_converted_amount_krw[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> etp_pdf_message_record.profit_distribution_basis_date[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> etp_pdf_message_record.appraised_value[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 4 -> etp_pdf_message_record.filler_4[etp_pdf_message_at] = etp_pdf_message_value; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_record.end_keyword = etp_pdf_message_value;
  skip
}

/* each byte of Etp Pdf Message set to where it lies, so a field read out of place says so */
inline ramp_etp_pdf_message(etp_pdf_message_record, etp_pdf_message_base) {
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 12 -> etp_pdf_message_record.isin[etp_pdf_message_at] = (etp_pdf_message_base + 0 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> etp_pdf_message_record.data_seq_number[etp_pdf_message_at] = (etp_pdf_message_base + 12 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> etp_pdf_message_record.date[etp_pdf_message_at] = (etp_pdf_message_base + 20 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 3 -> etp_pdf_message_record.office_consignment_companys_registration_number[etp_pdf_message_at] = (etp_pdf_message_base + 28 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 4 -> etp_pdf_message_record.composition_issue_number[etp_pdf_message_at] = (etp_pdf_message_base + 31 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 12 -> etp_pdf_message_record.composition_issue_code[etp_pdf_message_at] = (etp_pdf_message_base + 35 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> etp_pdf_message_record.c_u_unit_share_number_of_contract_k_r_w_cash_u_s_d_cash_converted_amount_k_r_w[etp_pdf_message_at] = (etp_pdf_message_base + 47 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_record.composition_issue_market_type = (etp_pdf_message_base + 65 + 1) % 256;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 40 -> etp_pdf_message_record.composition_issue_name[etp_pdf_message_at] = (etp_pdf_message_base + 66 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> etp_pdf_message_record.par_value_amount_cash_amount_converted_amount_krw[etp_pdf_message_at] = (etp_pdf_message_base + 106 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> etp_pdf_message_record.profit_distribution_basis_date[etp_pdf_message_at] = (etp_pdf_message_base + 124 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> etp_pdf_message_record.appraised_value[etp_pdf_message_at] = (etp_pdf_message_base + 132 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 4 -> etp_pdf_message_record.filler_4[etp_pdf_message_at] = (etp_pdf_message_base + 150 + etp_pdf_message_at + 1) % 256; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_record.end_keyword = (etp_pdf_message_base + 154 + 1) % 256;
  skip
}

/* Etp Pdf Message to the wire, 155 bytes from where the cursor stands */
inline encode_etp_pdf_message(etp_pdf_message_record) {
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 12 -> wire[at] = etp_pdf_message_record.isin[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> wire[at] = etp_pdf_message_record.data_seq_number[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> wire[at] = etp_pdf_message_record.date[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 3 -> wire[at] = etp_pdf_message_record.office_consignment_companys_registration_number[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 4 -> wire[at] = etp_pdf_message_record.composition_issue_number[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 12 -> wire[at] = etp_pdf_message_record.composition_issue_code[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> wire[at] = etp_pdf_message_record.c_u_unit_share_number_of_contract_k_r_w_cash_u_s_d_cash_converted_amount_k_r_w[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  wire[at] = etp_pdf_message_record.composition_issue_market_type; at = at + 1;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 40 -> wire[at] = etp_pdf_message_record.composition_issue_name[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> wire[at] = etp_pdf_message_record.par_value_amount_cash_amount_converted_amount_krw[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> wire[at] = etp_pdf_message_record.profit_distribution_basis_date[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> wire[at] = etp_pdf_message_record.appraised_value[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 4 -> wire[at] = etp_pdf_message_record.filler_4[etp_pdf_message_at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  wire[at] = etp_pdf_message_record.end_keyword; at = at + 1;
  skip
}

/* Etp Pdf Message off the wire, 155 bytes from where the cursor stands */
inline decode_etp_pdf_message(etp_pdf_message_record) {
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 12 -> etp_pdf_message_record.isin[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> etp_pdf_message_record.data_seq_number[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> etp_pdf_message_record.date[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 3 -> etp_pdf_message_record.office_consignment_companys_registration_number[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 4 -> etp_pdf_message_record.composition_issue_number[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 12 -> etp_pdf_message_record.composition_issue_code[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> etp_pdf_message_record.c_u_unit_share_number_of_contract_k_r_w_cash_u_s_d_cash_converted_amount_k_r_w[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_record.composition_issue_market_type = wire[at]; at = at + 1;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 40 -> etp_pdf_message_record.composition_issue_name[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> etp_pdf_message_record.par_value_amount_cash_amount_converted_amount_krw[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> etp_pdf_message_record.profit_distribution_basis_date[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> etp_pdf_message_record.appraised_value[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 4 -> etp_pdf_message_record.filler_4[etp_pdf_message_at] = wire[at]; at = at + 1; etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Etp Pdf Message is what was written, byte for byte */
inline equal_etp_pdf_message(etp_pdf_message_read, etp_pdf_message_written) {
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 12 -> assert(etp_pdf_message_read.isin[etp_pdf_message_at] == etp_pdf_message_written.isin[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> assert(etp_pdf_message_read.data_seq_number[etp_pdf_message_at] == etp_pdf_message_written.data_seq_number[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> assert(etp_pdf_message_read.date[etp_pdf_message_at] == etp_pdf_message_written.date[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 3 -> assert(etp_pdf_message_read.office_consignment_companys_registration_number[etp_pdf_message_at] == etp_pdf_message_written.office_consignment_companys_registration_number[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 4 -> assert(etp_pdf_message_read.composition_issue_number[etp_pdf_message_at] == etp_pdf_message_written.composition_issue_number[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 12 -> assert(etp_pdf_message_read.composition_issue_code[etp_pdf_message_at] == etp_pdf_message_written.composition_issue_code[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> assert(etp_pdf_message_read.c_u_unit_share_number_of_contract_k_r_w_cash_u_s_d_cash_converted_amount_k_r_w[etp_pdf_message_at] == etp_pdf_message_written.c_u_unit_share_number_of_contract_k_r_w_cash_u_s_d_cash_converted_amount_k_r_w[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  assert(etp_pdf_message_read.composition_issue_market_type == etp_pdf_message_written.composition_issue_market_type);
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 40 -> assert(etp_pdf_message_read.composition_issue_name[etp_pdf_message_at] == etp_pdf_message_written.composition_issue_name[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> assert(etp_pdf_message_read.par_value_amount_cash_amount_converted_amount_krw[etp_pdf_message_at] == etp_pdf_message_written.par_value_amount_cash_amount_converted_amount_krw[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 8 -> assert(etp_pdf_message_read.profit_distribution_basis_date[etp_pdf_message_at] == etp_pdf_message_written.profit_distribution_basis_date[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 18 -> assert(etp_pdf_message_read.appraised_value[etp_pdf_message_at] == etp_pdf_message_written.appraised_value[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  etp_pdf_message_at = 0;
  do
  :: etp_pdf_message_at < 4 -> assert(etp_pdf_message_read.filler_4[etp_pdf_message_at] == etp_pdf_message_written.filler_4[etp_pdf_message_at]); etp_pdf_message_at = etp_pdf_message_at + 1
  :: else -> break
  od;
  assert(etp_pdf_message_read.end_keyword == etp_pdf_message_written.end_keyword);
  skip
}

/* ---- Etp Operator Information Message: 125 bytes ----------------------------- */

/* ETP/BDC operator information. Office consignment company, operator code, and abbreviated names in Korean and English. */
typedef EtpOperatorInformationMessage {
  byte isin[12];
  byte seq_number[8];
  byte office_consignment_companys_registration_number[3];
  byte operator_code[6];
  byte operator_abbreviated_name_korean[50];
  byte operator_abbreviated_name_english[40];
  byte filler_5[5];
  byte end_keyword
};

int etp_operator_information_message_at;

/* every byte of Etp Operator Information Message set to one value */
inline fill_etp_operator_information_message(etp_operator_information_message_record, etp_operator_information_message_value) {
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 12 -> etp_operator_information_message_record.isin[etp_operator_information_message_at] = etp_operator_information_message_value; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 8 -> etp_operator_information_message_record.seq_number[etp_operator_information_message_at] = etp_operator_information_message_value; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 3 -> etp_operator_information_message_record.office_consignment_companys_registration_number[etp_operator_information_message_at] = etp_operator_information_message_value; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 6 -> etp_operator_information_message_record.operator_code[etp_operator_information_message_at] = etp_operator_information_message_value; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 50 -> etp_operator_information_message_record.operator_abbreviated_name_korean[etp_operator_information_message_at] = etp_operator_information_message_value; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 40 -> etp_operator_information_message_record.operator_abbreviated_name_english[etp_operator_information_message_at] = etp_operator_information_message_value; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 5 -> etp_operator_information_message_record.filler_5[etp_operator_information_message_at] = etp_operator_information_message_value; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_record.end_keyword = etp_operator_information_message_value;
  skip
}

/* each byte of Etp Operator Information Message set to where it lies, so a field read out of place says so */
inline ramp_etp_operator_information_message(etp_operator_information_message_record, etp_operator_information_message_base) {
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 12 -> etp_operator_information_message_record.isin[etp_operator_information_message_at] = (etp_operator_information_message_base + 0 + etp_operator_information_message_at + 1) % 256; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 8 -> etp_operator_information_message_record.seq_number[etp_operator_information_message_at] = (etp_operator_information_message_base + 12 + etp_operator_information_message_at + 1) % 256; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 3 -> etp_operator_information_message_record.office_consignment_companys_registration_number[etp_operator_information_message_at] = (etp_operator_information_message_base + 20 + etp_operator_information_message_at + 1) % 256; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 6 -> etp_operator_information_message_record.operator_code[etp_operator_information_message_at] = (etp_operator_information_message_base + 23 + etp_operator_information_message_at + 1) % 256; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 50 -> etp_operator_information_message_record.operator_abbreviated_name_korean[etp_operator_information_message_at] = (etp_operator_information_message_base + 29 + etp_operator_information_message_at + 1) % 256; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 40 -> etp_operator_information_message_record.operator_abbreviated_name_english[etp_operator_information_message_at] = (etp_operator_information_message_base + 79 + etp_operator_information_message_at + 1) % 256; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 5 -> etp_operator_information_message_record.filler_5[etp_operator_information_message_at] = (etp_operator_information_message_base + 119 + etp_operator_information_message_at + 1) % 256; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_record.end_keyword = (etp_operator_information_message_base + 124 + 1) % 256;
  skip
}

/* Etp Operator Information Message to the wire, 125 bytes from where the cursor stands */
inline encode_etp_operator_information_message(etp_operator_information_message_record) {
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 12 -> wire[at] = etp_operator_information_message_record.isin[etp_operator_information_message_at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 8 -> wire[at] = etp_operator_information_message_record.seq_number[etp_operator_information_message_at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 3 -> wire[at] = etp_operator_information_message_record.office_consignment_companys_registration_number[etp_operator_information_message_at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 6 -> wire[at] = etp_operator_information_message_record.operator_code[etp_operator_information_message_at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 50 -> wire[at] = etp_operator_information_message_record.operator_abbreviated_name_korean[etp_operator_information_message_at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 40 -> wire[at] = etp_operator_information_message_record.operator_abbreviated_name_english[etp_operator_information_message_at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 5 -> wire[at] = etp_operator_information_message_record.filler_5[etp_operator_information_message_at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  wire[at] = etp_operator_information_message_record.end_keyword; at = at + 1;
  skip
}

/* Etp Operator Information Message off the wire, 125 bytes from where the cursor stands */
inline decode_etp_operator_information_message(etp_operator_information_message_record) {
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 12 -> etp_operator_information_message_record.isin[etp_operator_information_message_at] = wire[at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 8 -> etp_operator_information_message_record.seq_number[etp_operator_information_message_at] = wire[at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 3 -> etp_operator_information_message_record.office_consignment_companys_registration_number[etp_operator_information_message_at] = wire[at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 6 -> etp_operator_information_message_record.operator_code[etp_operator_information_message_at] = wire[at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 50 -> etp_operator_information_message_record.operator_abbreviated_name_korean[etp_operator_information_message_at] = wire[at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 40 -> etp_operator_information_message_record.operator_abbreviated_name_english[etp_operator_information_message_at] = wire[at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 5 -> etp_operator_information_message_record.filler_5[etp_operator_information_message_at] = wire[at]; at = at + 1; etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Etp Operator Information Message is what was written, byte for byte */
inline equal_etp_operator_information_message(etp_operator_information_message_read, etp_operator_information_message_written) {
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 12 -> assert(etp_operator_information_message_read.isin[etp_operator_information_message_at] == etp_operator_information_message_written.isin[etp_operator_information_message_at]); etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 8 -> assert(etp_operator_information_message_read.seq_number[etp_operator_information_message_at] == etp_operator_information_message_written.seq_number[etp_operator_information_message_at]); etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 3 -> assert(etp_operator_information_message_read.office_consignment_companys_registration_number[etp_operator_information_message_at] == etp_operator_information_message_written.office_consignment_companys_registration_number[etp_operator_information_message_at]); etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 6 -> assert(etp_operator_information_message_read.operator_code[etp_operator_information_message_at] == etp_operator_information_message_written.operator_code[etp_operator_information_message_at]); etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 50 -> assert(etp_operator_information_message_read.operator_abbreviated_name_korean[etp_operator_information_message_at] == etp_operator_information_message_written.operator_abbreviated_name_korean[etp_operator_information_message_at]); etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 40 -> assert(etp_operator_information_message_read.operator_abbreviated_name_english[etp_operator_information_message_at] == etp_operator_information_message_written.operator_abbreviated_name_english[etp_operator_information_message_at]); etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  etp_operator_information_message_at = 0;
  do
  :: etp_operator_information_message_at < 5 -> assert(etp_operator_information_message_read.filler_5[etp_operator_information_message_at] == etp_operator_information_message_written.filler_5[etp_operator_information_message_at]); etp_operator_information_message_at = etp_operator_information_message_at + 1
  :: else -> break
  od;
  assert(etp_operator_information_message_read.end_keyword == etp_operator_information_message_written.end_keyword);
  skip
}

/* ---- Etp Transfer Agent Batch Message: 245 bytes ----------------------------- */

/* ETP/BDC transfer agent batch data. */
typedef EtpTransferAgentBatchMessage {
  byte isin[12];
  byte data_seq_number[8];
  byte filler_10[10];
  byte etf_flow_net_asset_total_amount[15];
  byte etf_foreign_net_asset_value_amount[15];
  byte etf_net_asset_value_amount[9];
  byte etf_foreign_flow_net_asset_total_amount[15];
  byte etf_foreign_net_asset_total[15];
  byte etf_foreign_final_net_asset_value[9];
  byte etf_cu_quantity[8];
  byte previous_days_tax_base_nav[9];
  byte previous_days_tax_base_nav_before_dividend[9];
  byte previous_days_cash_dividend_amount[12];
  byte tax_base_nav_as_of_the_day_before_the_previous_day[9];
  byte previous_days_non_taxable_base_price_for_overseas_stocks[9];
  byte previous_days_non_taxable_base_price_before_dividend_for_overseas_stocks[9];
  byte day_before_previous_days_non_taxable_base_price_for_overseas_stocks[9];
  byte number_of_free_floating_etf_shares[16];
  byte filler_46[46];
  byte end_keyword
};

int etp_transfer_agent_batch_message_at;

/* every byte of Etp Transfer Agent Batch Message set to one value */
inline fill_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_record, etp_transfer_agent_batch_message_value) {
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 12 -> etp_transfer_agent_batch_message_record.isin[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 8 -> etp_transfer_agent_batch_message_record.data_seq_number[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 10 -> etp_transfer_agent_batch_message_record.filler_10[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_foreign_net_asset_value_amount[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.etf_net_asset_value_amount[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_foreign_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_foreign_net_asset_total[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.etf_foreign_final_net_asset_value[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 8 -> etp_transfer_agent_batch_message_record.etf_cu_quantity[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_tax_base_nav[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_tax_base_nav_before_dividend[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 12 -> etp_transfer_agent_batch_message_record.previous_days_cash_dividend_amount[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.tax_base_nav_as_of_the_day_before_the_previous_day[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_non_taxable_base_price_before_dividend_for_overseas_stocks[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.day_before_previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 16 -> etp_transfer_agent_batch_message_record.number_of_free_floating_etf_shares[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 46 -> etp_transfer_agent_batch_message_record.filler_46[etp_transfer_agent_batch_message_at] = etp_transfer_agent_batch_message_value; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_record.end_keyword = etp_transfer_agent_batch_message_value;
  skip
}

/* each byte of Etp Transfer Agent Batch Message set to where it lies, so a field read out of place says so */
inline ramp_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_record, etp_transfer_agent_batch_message_base) {
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 12 -> etp_transfer_agent_batch_message_record.isin[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 0 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 8 -> etp_transfer_agent_batch_message_record.data_seq_number[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 12 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 10 -> etp_transfer_agent_batch_message_record.filler_10[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 20 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 30 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_foreign_net_asset_value_amount[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 45 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.etf_net_asset_value_amount[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 60 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_foreign_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 69 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_foreign_net_asset_total[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 84 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.etf_foreign_final_net_asset_value[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 99 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 8 -> etp_transfer_agent_batch_message_record.etf_cu_quantity[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 108 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_tax_base_nav[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 116 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_tax_base_nav_before_dividend[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 125 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 12 -> etp_transfer_agent_batch_message_record.previous_days_cash_dividend_amount[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 134 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.tax_base_nav_as_of_the_day_before_the_previous_day[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 146 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 155 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_non_taxable_base_price_before_dividend_for_overseas_stocks[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 164 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.day_before_previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 173 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 16 -> etp_transfer_agent_batch_message_record.number_of_free_floating_etf_shares[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 182 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 46 -> etp_transfer_agent_batch_message_record.filler_46[etp_transfer_agent_batch_message_at] = (etp_transfer_agent_batch_message_base + 198 + etp_transfer_agent_batch_message_at + 1) % 256; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_record.end_keyword = (etp_transfer_agent_batch_message_base + 244 + 1) % 256;
  skip
}

/* Etp Transfer Agent Batch Message to the wire, 245 bytes from where the cursor stands */
inline encode_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_record) {
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 12 -> wire[at] = etp_transfer_agent_batch_message_record.isin[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 8 -> wire[at] = etp_transfer_agent_batch_message_record.data_seq_number[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 10 -> wire[at] = etp_transfer_agent_batch_message_record.filler_10[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> wire[at] = etp_transfer_agent_batch_message_record.etf_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> wire[at] = etp_transfer_agent_batch_message_record.etf_foreign_net_asset_value_amount[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> wire[at] = etp_transfer_agent_batch_message_record.etf_net_asset_value_amount[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> wire[at] = etp_transfer_agent_batch_message_record.etf_foreign_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> wire[at] = etp_transfer_agent_batch_message_record.etf_foreign_net_asset_total[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> wire[at] = etp_transfer_agent_batch_message_record.etf_foreign_final_net_asset_value[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 8 -> wire[at] = etp_transfer_agent_batch_message_record.etf_cu_quantity[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> wire[at] = etp_transfer_agent_batch_message_record.previous_days_tax_base_nav[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> wire[at] = etp_transfer_agent_batch_message_record.previous_days_tax_base_nav_before_dividend[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 12 -> wire[at] = etp_transfer_agent_batch_message_record.previous_days_cash_dividend_amount[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> wire[at] = etp_transfer_agent_batch_message_record.tax_base_nav_as_of_the_day_before_the_previous_day[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> wire[at] = etp_transfer_agent_batch_message_record.previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> wire[at] = etp_transfer_agent_batch_message_record.previous_days_non_taxable_base_price_before_dividend_for_overseas_stocks[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> wire[at] = etp_transfer_agent_batch_message_record.day_before_previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 16 -> wire[at] = etp_transfer_agent_batch_message_record.number_of_free_floating_etf_shares[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 46 -> wire[at] = etp_transfer_agent_batch_message_record.filler_46[etp_transfer_agent_batch_message_at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  wire[at] = etp_transfer_agent_batch_message_record.end_keyword; at = at + 1;
  skip
}

/* Etp Transfer Agent Batch Message off the wire, 245 bytes from where the cursor stands */
inline decode_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_record) {
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 12 -> etp_transfer_agent_batch_message_record.isin[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 8 -> etp_transfer_agent_batch_message_record.data_seq_number[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 10 -> etp_transfer_agent_batch_message_record.filler_10[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_foreign_net_asset_value_amount[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.etf_net_asset_value_amount[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_foreign_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> etp_transfer_agent_batch_message_record.etf_foreign_net_asset_total[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.etf_foreign_final_net_asset_value[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 8 -> etp_transfer_agent_batch_message_record.etf_cu_quantity[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_tax_base_nav[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_tax_base_nav_before_dividend[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 12 -> etp_transfer_agent_batch_message_record.previous_days_cash_dividend_amount[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.tax_base_nav_as_of_the_day_before_the_previous_day[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.previous_days_non_taxable_base_price_before_dividend_for_overseas_stocks[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> etp_transfer_agent_batch_message_record.day_before_previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 16 -> etp_transfer_agent_batch_message_record.number_of_free_floating_etf_shares[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 46 -> etp_transfer_agent_batch_message_record.filler_46[etp_transfer_agent_batch_message_at] = wire[at]; at = at + 1; etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Etp Transfer Agent Batch Message is what was written, byte for byte */
inline equal_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_read, etp_transfer_agent_batch_message_written) {
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 12 -> assert(etp_transfer_agent_batch_message_read.isin[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.isin[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 8 -> assert(etp_transfer_agent_batch_message_read.data_seq_number[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.data_seq_number[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 10 -> assert(etp_transfer_agent_batch_message_read.filler_10[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.filler_10[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> assert(etp_transfer_agent_batch_message_read.etf_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.etf_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> assert(etp_transfer_agent_batch_message_read.etf_foreign_net_asset_value_amount[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.etf_foreign_net_asset_value_amount[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> assert(etp_transfer_agent_batch_message_read.etf_net_asset_value_amount[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.etf_net_asset_value_amount[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> assert(etp_transfer_agent_batch_message_read.etf_foreign_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.etf_foreign_flow_net_asset_total_amount[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 15 -> assert(etp_transfer_agent_batch_message_read.etf_foreign_net_asset_total[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.etf_foreign_net_asset_total[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> assert(etp_transfer_agent_batch_message_read.etf_foreign_final_net_asset_value[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.etf_foreign_final_net_asset_value[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 8 -> assert(etp_transfer_agent_batch_message_read.etf_cu_quantity[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.etf_cu_quantity[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> assert(etp_transfer_agent_batch_message_read.previous_days_tax_base_nav[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.previous_days_tax_base_nav[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> assert(etp_transfer_agent_batch_message_read.previous_days_tax_base_nav_before_dividend[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.previous_days_tax_base_nav_before_dividend[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 12 -> assert(etp_transfer_agent_batch_message_read.previous_days_cash_dividend_amount[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.previous_days_cash_dividend_amount[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> assert(etp_transfer_agent_batch_message_read.tax_base_nav_as_of_the_day_before_the_previous_day[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.tax_base_nav_as_of_the_day_before_the_previous_day[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> assert(etp_transfer_agent_batch_message_read.previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> assert(etp_transfer_agent_batch_message_read.previous_days_non_taxable_base_price_before_dividend_for_overseas_stocks[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.previous_days_non_taxable_base_price_before_dividend_for_overseas_stocks[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 9 -> assert(etp_transfer_agent_batch_message_read.day_before_previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.day_before_previous_days_non_taxable_base_price_for_overseas_stocks[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 16 -> assert(etp_transfer_agent_batch_message_read.number_of_free_floating_etf_shares[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.number_of_free_floating_etf_shares[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  etp_transfer_agent_batch_message_at = 0;
  do
  :: etp_transfer_agent_batch_message_at < 46 -> assert(etp_transfer_agent_batch_message_read.filler_46[etp_transfer_agent_batch_message_at] == etp_transfer_agent_batch_message_written.filler_46[etp_transfer_agent_batch_message_at]); etp_transfer_agent_batch_message_at = etp_transfer_agent_batch_message_at + 1
  :: else -> break
  od;
  assert(etp_transfer_agent_batch_message_read.end_keyword == etp_transfer_agent_batch_message_written.end_keyword);
  skip
}

/* ---- Etf Risk Appraisement Message: 195 bytes -------------------------------- */

/* Synthetic ETF risk appraisement daily trading data. */
typedef EtfRiskAppraisementMessage {
  byte isin[12];
  byte data_seq_number[8];
  byte date[8];
  byte office_consignment_companys_registration_number[3];
  byte name_of_counterparty[50];
  byte otc_derivatives_type;
  byte net_assets_amount[15];
  byte total_danger_exposure_amount[15];
  byte security_appraisal_amount[15];
  byte security_rate[7];
  byte risk_appraisal_amount[15];
  byte risk_appraisal_amount_rate[7];
  byte filler_38[38];
  byte end_keyword
};

int etf_risk_appraisement_message_at;

/* every byte of Etf Risk Appraisement Message set to one value */
inline fill_etf_risk_appraisement_message(etf_risk_appraisement_message_record, etf_risk_appraisement_message_value) {
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 12 -> etf_risk_appraisement_message_record.isin[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 8 -> etf_risk_appraisement_message_record.data_seq_number[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 8 -> etf_risk_appraisement_message_record.date[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 3 -> etf_risk_appraisement_message_record.office_consignment_companys_registration_number[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 50 -> etf_risk_appraisement_message_record.name_of_counterparty[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_record.otc_derivatives_type = etf_risk_appraisement_message_value;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.net_assets_amount[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.total_danger_exposure_amount[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.security_appraisal_amount[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 7 -> etf_risk_appraisement_message_record.security_rate[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.risk_appraisal_amount[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 7 -> etf_risk_appraisement_message_record.risk_appraisal_amount_rate[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 38 -> etf_risk_appraisement_message_record.filler_38[etf_risk_appraisement_message_at] = etf_risk_appraisement_message_value; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_record.end_keyword = etf_risk_appraisement_message_value;
  skip
}

/* each byte of Etf Risk Appraisement Message set to where it lies, so a field read out of place says so */
inline ramp_etf_risk_appraisement_message(etf_risk_appraisement_message_record, etf_risk_appraisement_message_base) {
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 12 -> etf_risk_appraisement_message_record.isin[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 0 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 8 -> etf_risk_appraisement_message_record.data_seq_number[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 12 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 8 -> etf_risk_appraisement_message_record.date[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 20 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 3 -> etf_risk_appraisement_message_record.office_consignment_companys_registration_number[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 28 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 50 -> etf_risk_appraisement_message_record.name_of_counterparty[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 31 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_record.otc_derivatives_type = (etf_risk_appraisement_message_base + 81 + 1) % 256;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.net_assets_amount[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 82 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.total_danger_exposure_amount[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 97 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.security_appraisal_amount[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 112 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 7 -> etf_risk_appraisement_message_record.security_rate[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 127 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.risk_appraisal_amount[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 134 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 7 -> etf_risk_appraisement_message_record.risk_appraisal_amount_rate[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 149 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 38 -> etf_risk_appraisement_message_record.filler_38[etf_risk_appraisement_message_at] = (etf_risk_appraisement_message_base + 156 + etf_risk_appraisement_message_at + 1) % 256; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_record.end_keyword = (etf_risk_appraisement_message_base + 194 + 1) % 256;
  skip
}

/* Etf Risk Appraisement Message to the wire, 195 bytes from where the cursor stands */
inline encode_etf_risk_appraisement_message(etf_risk_appraisement_message_record) {
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 12 -> wire[at] = etf_risk_appraisement_message_record.isin[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 8 -> wire[at] = etf_risk_appraisement_message_record.data_seq_number[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 8 -> wire[at] = etf_risk_appraisement_message_record.date[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 3 -> wire[at] = etf_risk_appraisement_message_record.office_consignment_companys_registration_number[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 50 -> wire[at] = etf_risk_appraisement_message_record.name_of_counterparty[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  wire[at] = etf_risk_appraisement_message_record.otc_derivatives_type; at = at + 1;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> wire[at] = etf_risk_appraisement_message_record.net_assets_amount[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> wire[at] = etf_risk_appraisement_message_record.total_danger_exposure_amount[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> wire[at] = etf_risk_appraisement_message_record.security_appraisal_amount[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 7 -> wire[at] = etf_risk_appraisement_message_record.security_rate[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> wire[at] = etf_risk_appraisement_message_record.risk_appraisal_amount[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 7 -> wire[at] = etf_risk_appraisement_message_record.risk_appraisal_amount_rate[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 38 -> wire[at] = etf_risk_appraisement_message_record.filler_38[etf_risk_appraisement_message_at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  wire[at] = etf_risk_appraisement_message_record.end_keyword; at = at + 1;
  skip
}

/* Etf Risk Appraisement Message off the wire, 195 bytes from where the cursor stands */
inline decode_etf_risk_appraisement_message(etf_risk_appraisement_message_record) {
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 12 -> etf_risk_appraisement_message_record.isin[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 8 -> etf_risk_appraisement_message_record.data_seq_number[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 8 -> etf_risk_appraisement_message_record.date[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 3 -> etf_risk_appraisement_message_record.office_consignment_companys_registration_number[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 50 -> etf_risk_appraisement_message_record.name_of_counterparty[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_record.otc_derivatives_type = wire[at]; at = at + 1;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.net_assets_amount[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.total_danger_exposure_amount[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.security_appraisal_amount[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 7 -> etf_risk_appraisement_message_record.security_rate[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> etf_risk_appraisement_message_record.risk_appraisal_amount[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 7 -> etf_risk_appraisement_message_record.risk_appraisal_amount_rate[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 38 -> etf_risk_appraisement_message_record.filler_38[etf_risk_appraisement_message_at] = wire[at]; at = at + 1; etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Etf Risk Appraisement Message is what was written, byte for byte */
inline equal_etf_risk_appraisement_message(etf_risk_appraisement_message_read, etf_risk_appraisement_message_written) {
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 12 -> assert(etf_risk_appraisement_message_read.isin[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.isin[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 8 -> assert(etf_risk_appraisement_message_read.data_seq_number[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.data_seq_number[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 8 -> assert(etf_risk_appraisement_message_read.date[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.date[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 3 -> assert(etf_risk_appraisement_message_read.office_consignment_companys_registration_number[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.office_consignment_companys_registration_number[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 50 -> assert(etf_risk_appraisement_message_read.name_of_counterparty[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.name_of_counterparty[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  assert(etf_risk_appraisement_message_read.otc_derivatives_type == etf_risk_appraisement_message_written.otc_derivatives_type);
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> assert(etf_risk_appraisement_message_read.net_assets_amount[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.net_assets_amount[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> assert(etf_risk_appraisement_message_read.total_danger_exposure_amount[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.total_danger_exposure_amount[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> assert(etf_risk_appraisement_message_read.security_appraisal_amount[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.security_appraisal_amount[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 7 -> assert(etf_risk_appraisement_message_read.security_rate[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.security_rate[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 15 -> assert(etf_risk_appraisement_message_read.risk_appraisal_amount[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.risk_appraisal_amount[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 7 -> assert(etf_risk_appraisement_message_read.risk_appraisal_amount_rate[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.risk_appraisal_amount_rate[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  etf_risk_appraisement_message_at = 0;
  do
  :: etf_risk_appraisement_message_at < 38 -> assert(etf_risk_appraisement_message_read.filler_38[etf_risk_appraisement_message_at] == etf_risk_appraisement_message_written.filler_38[etf_risk_appraisement_message_at]); etf_risk_appraisement_message_at = etf_risk_appraisement_message_at + 1
  :: else -> break
  od;
  assert(etf_risk_appraisement_message_read.end_keyword == etf_risk_appraisement_message_written.end_keyword);
  skip
}

/* ---- Synthetic Etf Constituents Message: 195 bytes --------------------------- */

/* Synthetic ETF basic index composition constituents. */
typedef SyntheticEtfConstituentsMessage {
  byte isin[12];
  byte data_seq_number[8];
  byte date[8];
  byte office_consignment_companys_registration_number[3];
  byte composition_constituents_number[4];
  byte composition_constituents_code[12];
  byte composition_constituents_name[80];
  byte composition_ratio[7];
  byte filler_60[60];
  byte end_keyword
};

int synthetic_etf_constituents_message_at;

/* every byte of Synthetic Etf Constituents Message set to one value */
inline fill_synthetic_etf_constituents_message(synthetic_etf_constituents_message_record, synthetic_etf_constituents_message_value) {
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 12 -> synthetic_etf_constituents_message_record.isin[synthetic_etf_constituents_message_at] = synthetic_etf_constituents_message_value; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 8 -> synthetic_etf_constituents_message_record.data_seq_number[synthetic_etf_constituents_message_at] = synthetic_etf_constituents_message_value; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 8 -> synthetic_etf_constituents_message_record.date[synthetic_etf_constituents_message_at] = synthetic_etf_constituents_message_value; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 3 -> synthetic_etf_constituents_message_record.office_consignment_companys_registration_number[synthetic_etf_constituents_message_at] = synthetic_etf_constituents_message_value; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 4 -> synthetic_etf_constituents_message_record.composition_constituents_number[synthetic_etf_constituents_message_at] = synthetic_etf_constituents_message_value; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 12 -> synthetic_etf_constituents_message_record.composition_constituents_code[synthetic_etf_constituents_message_at] = synthetic_etf_constituents_message_value; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 80 -> synthetic_etf_constituents_message_record.composition_constituents_name[synthetic_etf_constituents_message_at] = synthetic_etf_constituents_message_value; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 7 -> synthetic_etf_constituents_message_record.composition_ratio[synthetic_etf_constituents_message_at] = synthetic_etf_constituents_message_value; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 60 -> synthetic_etf_constituents_message_record.filler_60[synthetic_etf_constituents_message_at] = synthetic_etf_constituents_message_value; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_record.end_keyword = synthetic_etf_constituents_message_value;
  skip
}

/* each byte of Synthetic Etf Constituents Message set to where it lies, so a field read out of place says so */
inline ramp_synthetic_etf_constituents_message(synthetic_etf_constituents_message_record, synthetic_etf_constituents_message_base) {
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 12 -> synthetic_etf_constituents_message_record.isin[synthetic_etf_constituents_message_at] = (synthetic_etf_constituents_message_base + 0 + synthetic_etf_constituents_message_at + 1) % 256; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 8 -> synthetic_etf_constituents_message_record.data_seq_number[synthetic_etf_constituents_message_at] = (synthetic_etf_constituents_message_base + 12 + synthetic_etf_constituents_message_at + 1) % 256; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 8 -> synthetic_etf_constituents_message_record.date[synthetic_etf_constituents_message_at] = (synthetic_etf_constituents_message_base + 20 + synthetic_etf_constituents_message_at + 1) % 256; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 3 -> synthetic_etf_constituents_message_record.office_consignment_companys_registration_number[synthetic_etf_constituents_message_at] = (synthetic_etf_constituents_message_base + 28 + synthetic_etf_constituents_message_at + 1) % 256; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 4 -> synthetic_etf_constituents_message_record.composition_constituents_number[synthetic_etf_constituents_message_at] = (synthetic_etf_constituents_message_base + 31 + synthetic_etf_constituents_message_at + 1) % 256; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 12 -> synthetic_etf_constituents_message_record.composition_constituents_code[synthetic_etf_constituents_message_at] = (synthetic_etf_constituents_message_base + 35 + synthetic_etf_constituents_message_at + 1) % 256; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 80 -> synthetic_etf_constituents_message_record.composition_constituents_name[synthetic_etf_constituents_message_at] = (synthetic_etf_constituents_message_base + 47 + synthetic_etf_constituents_message_at + 1) % 256; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 7 -> synthetic_etf_constituents_message_record.composition_ratio[synthetic_etf_constituents_message_at] = (synthetic_etf_constituents_message_base + 127 + synthetic_etf_constituents_message_at + 1) % 256; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 60 -> synthetic_etf_constituents_message_record.filler_60[synthetic_etf_constituents_message_at] = (synthetic_etf_constituents_message_base + 134 + synthetic_etf_constituents_message_at + 1) % 256; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_record.end_keyword = (synthetic_etf_constituents_message_base + 194 + 1) % 256;
  skip
}

/* Synthetic Etf Constituents Message to the wire, 195 bytes from where the cursor stands */
inline encode_synthetic_etf_constituents_message(synthetic_etf_constituents_message_record) {
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 12 -> wire[at] = synthetic_etf_constituents_message_record.isin[synthetic_etf_constituents_message_at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 8 -> wire[at] = synthetic_etf_constituents_message_record.data_seq_number[synthetic_etf_constituents_message_at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 8 -> wire[at] = synthetic_etf_constituents_message_record.date[synthetic_etf_constituents_message_at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 3 -> wire[at] = synthetic_etf_constituents_message_record.office_consignment_companys_registration_number[synthetic_etf_constituents_message_at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 4 -> wire[at] = synthetic_etf_constituents_message_record.composition_constituents_number[synthetic_etf_constituents_message_at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 12 -> wire[at] = synthetic_etf_constituents_message_record.composition_constituents_code[synthetic_etf_constituents_message_at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 80 -> wire[at] = synthetic_etf_constituents_message_record.composition_constituents_name[synthetic_etf_constituents_message_at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 7 -> wire[at] = synthetic_etf_constituents_message_record.composition_ratio[synthetic_etf_constituents_message_at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 60 -> wire[at] = synthetic_etf_constituents_message_record.filler_60[synthetic_etf_constituents_message_at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  wire[at] = synthetic_etf_constituents_message_record.end_keyword; at = at + 1;
  skip
}

/* Synthetic Etf Constituents Message off the wire, 195 bytes from where the cursor stands */
inline decode_synthetic_etf_constituents_message(synthetic_etf_constituents_message_record) {
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 12 -> synthetic_etf_constituents_message_record.isin[synthetic_etf_constituents_message_at] = wire[at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 8 -> synthetic_etf_constituents_message_record.data_seq_number[synthetic_etf_constituents_message_at] = wire[at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 8 -> synthetic_etf_constituents_message_record.date[synthetic_etf_constituents_message_at] = wire[at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 3 -> synthetic_etf_constituents_message_record.office_consignment_companys_registration_number[synthetic_etf_constituents_message_at] = wire[at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 4 -> synthetic_etf_constituents_message_record.composition_constituents_number[synthetic_etf_constituents_message_at] = wire[at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 12 -> synthetic_etf_constituents_message_record.composition_constituents_code[synthetic_etf_constituents_message_at] = wire[at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 80 -> synthetic_etf_constituents_message_record.composition_constituents_name[synthetic_etf_constituents_message_at] = wire[at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 7 -> synthetic_etf_constituents_message_record.composition_ratio[synthetic_etf_constituents_message_at] = wire[at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 60 -> synthetic_etf_constituents_message_record.filler_60[synthetic_etf_constituents_message_at] = wire[at]; at = at + 1; synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Synthetic Etf Constituents Message is what was written, byte for byte */
inline equal_synthetic_etf_constituents_message(synthetic_etf_constituents_message_read, synthetic_etf_constituents_message_written) {
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 12 -> assert(synthetic_etf_constituents_message_read.isin[synthetic_etf_constituents_message_at] == synthetic_etf_constituents_message_written.isin[synthetic_etf_constituents_message_at]); synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 8 -> assert(synthetic_etf_constituents_message_read.data_seq_number[synthetic_etf_constituents_message_at] == synthetic_etf_constituents_message_written.data_seq_number[synthetic_etf_constituents_message_at]); synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 8 -> assert(synthetic_etf_constituents_message_read.date[synthetic_etf_constituents_message_at] == synthetic_etf_constituents_message_written.date[synthetic_etf_constituents_message_at]); synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 3 -> assert(synthetic_etf_constituents_message_read.office_consignment_companys_registration_number[synthetic_etf_constituents_message_at] == synthetic_etf_constituents_message_written.office_consignment_companys_registration_number[synthetic_etf_constituents_message_at]); synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 4 -> assert(synthetic_etf_constituents_message_read.composition_constituents_number[synthetic_etf_constituents_message_at] == synthetic_etf_constituents_message_written.composition_constituents_number[synthetic_etf_constituents_message_at]); synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 12 -> assert(synthetic_etf_constituents_message_read.composition_constituents_code[synthetic_etf_constituents_message_at] == synthetic_etf_constituents_message_written.composition_constituents_code[synthetic_etf_constituents_message_at]); synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 80 -> assert(synthetic_etf_constituents_message_read.composition_constituents_name[synthetic_etf_constituents_message_at] == synthetic_etf_constituents_message_written.composition_constituents_name[synthetic_etf_constituents_message_at]); synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 7 -> assert(synthetic_etf_constituents_message_read.composition_ratio[synthetic_etf_constituents_message_at] == synthetic_etf_constituents_message_written.composition_ratio[synthetic_etf_constituents_message_at]); synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  synthetic_etf_constituents_message_at = 0;
  do
  :: synthetic_etf_constituents_message_at < 60 -> assert(synthetic_etf_constituents_message_read.filler_60[synthetic_etf_constituents_message_at] == synthetic_etf_constituents_message_written.filler_60[synthetic_etf_constituents_message_at]); synthetic_etf_constituents_message_at = synthetic_etf_constituents_message_at + 1
  :: else -> break
  od;
  assert(synthetic_etf_constituents_message_read.end_keyword == synthetic_etf_constituents_message_written.end_keyword);
  skip
}

/* ---- Elw Investment Indicator Sensitivity Message: 105 bytes ----------------- */

/* ELW Investment Indicator Sensitivity. Theoretical warrant price plus signed Delta/Gamma/Theta/Vega/Rho sensitivities, intrinsic volatility, and prerequisite cost. */
typedef ElwInvestmentIndicatorSensitivityMessage {
  byte isin[12];
  byte time[6];
  byte theoretical_warrant_price[10];
  byte sensitivity_delta_sign;
  byte sensitivity_delta[7];
  byte sensitivity_gamma_sign;
  byte sensitivity_gamma[7];
  byte sensitivity_theta_sign;
  byte sensitivity_theta[12];
  byte sensitivity_vega_sign;
  byte sensitivity_vega[12];
  byte sensitivity_rho_sign;
  byte sensitivity_rho[12];
  byte intrinsic_volatility[5];
  byte prerequisite_cost[10];
  byte filler_6[6];
  byte end_keyword
};

int elw_investment_indicator_sensitivity_message_at;

/* every byte of Elw Investment Indicator Sensitivity Message set to one value */
inline fill_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_record, elw_investment_indicator_sensitivity_message_value) {
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.isin[elw_investment_indicator_sensitivity_message_at] = elw_investment_indicator_sensitivity_message_value; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 6 -> elw_investment_indicator_sensitivity_message_record.time[elw_investment_indicator_sensitivity_message_at] = elw_investment_indicator_sensitivity_message_value; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 10 -> elw_investment_indicator_sensitivity_message_record.theoretical_warrant_price[elw_investment_indicator_sensitivity_message_at] = elw_investment_indicator_sensitivity_message_value; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_delta_sign = elw_investment_indicator_sensitivity_message_value;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 7 -> elw_investment_indicator_sensitivity_message_record.sensitivity_delta[elw_investment_indicator_sensitivity_message_at] = elw_investment_indicator_sensitivity_message_value; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_gamma_sign = elw_investment_indicator_sensitivity_message_value;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 7 -> elw_investment_indicator_sensitivity_message_record.sensitivity_gamma[elw_investment_indicator_sensitivity_message_at] = elw_investment_indicator_sensitivity_message_value; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_theta_sign = elw_investment_indicator_sensitivity_message_value;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.sensitivity_theta[elw_investment_indicator_sensitivity_message_at] = elw_investment_indicator_sensitivity_message_value; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_vega_sign = elw_investment_indicator_sensitivity_message_value;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.sensitivity_vega[elw_investment_indicator_sensitivity_message_at] = elw_investment_indicator_sensitivity_message_value; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_rho_sign = elw_investment_indicator_sensitivity_message_value;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.sensitivity_rho[elw_investment_indicator_sensitivity_message_at] = elw_investment_indicator_sensitivity_message_value; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 5 -> elw_investment_indicator_sensitivity_message_record.intrinsic_volatility[elw_investment_indicator_sensitivity_message_at] = elw_investment_indicator_sensitivity_message_value; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 10 -> elw_investment_indicator_sensitivity_message_record.prerequisite_cost[elw_investment_indicator_sensitivity_message_at] = elw_investment_indicator_sensitivity_message_value; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 6 -> elw_investment_indicator_sensitivity_message_record.filler_6[elw_investment_indicator_sensitivity_message_at] = elw_investment_indicator_sensitivity_message_value; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.end_keyword = elw_investment_indicator_sensitivity_message_value;
  skip
}

/* each byte of Elw Investment Indicator Sensitivity Message set to where it lies, so a field read out of place says so */
inline ramp_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_record, elw_investment_indicator_sensitivity_message_base) {
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.isin[elw_investment_indicator_sensitivity_message_at] = (elw_investment_indicator_sensitivity_message_base + 0 + elw_investment_indicator_sensitivity_message_at + 1) % 256; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 6 -> elw_investment_indicator_sensitivity_message_record.time[elw_investment_indicator_sensitivity_message_at] = (elw_investment_indicator_sensitivity_message_base + 12 + elw_investment_indicator_sensitivity_message_at + 1) % 256; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 10 -> elw_investment_indicator_sensitivity_message_record.theoretical_warrant_price[elw_investment_indicator_sensitivity_message_at] = (elw_investment_indicator_sensitivity_message_base + 18 + elw_investment_indicator_sensitivity_message_at + 1) % 256; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_delta_sign = (elw_investment_indicator_sensitivity_message_base + 28 + 1) % 256;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 7 -> elw_investment_indicator_sensitivity_message_record.sensitivity_delta[elw_investment_indicator_sensitivity_message_at] = (elw_investment_indicator_sensitivity_message_base + 29 + elw_investment_indicator_sensitivity_message_at + 1) % 256; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_gamma_sign = (elw_investment_indicator_sensitivity_message_base + 36 + 1) % 256;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 7 -> elw_investment_indicator_sensitivity_message_record.sensitivity_gamma[elw_investment_indicator_sensitivity_message_at] = (elw_investment_indicator_sensitivity_message_base + 37 + elw_investment_indicator_sensitivity_message_at + 1) % 256; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_theta_sign = (elw_investment_indicator_sensitivity_message_base + 44 + 1) % 256;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.sensitivity_theta[elw_investment_indicator_sensitivity_message_at] = (elw_investment_indicator_sensitivity_message_base + 45 + elw_investment_indicator_sensitivity_message_at + 1) % 256; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_vega_sign = (elw_investment_indicator_sensitivity_message_base + 57 + 1) % 256;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.sensitivity_vega[elw_investment_indicator_sensitivity_message_at] = (elw_investment_indicator_sensitivity_message_base + 58 + elw_investment_indicator_sensitivity_message_at + 1) % 256; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_rho_sign = (elw_investment_indicator_sensitivity_message_base + 70 + 1) % 256;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.sensitivity_rho[elw_investment_indicator_sensitivity_message_at] = (elw_investment_indicator_sensitivity_message_base + 71 + elw_investment_indicator_sensitivity_message_at + 1) % 256; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 5 -> elw_investment_indicator_sensitivity_message_record.intrinsic_volatility[elw_investment_indicator_sensitivity_message_at] = (elw_investment_indicator_sensitivity_message_base + 83 + elw_investment_indicator_sensitivity_message_at + 1) % 256; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 10 -> elw_investment_indicator_sensitivity_message_record.prerequisite_cost[elw_investment_indicator_sensitivity_message_at] = (elw_investment_indicator_sensitivity_message_base + 88 + elw_investment_indicator_sensitivity_message_at + 1) % 256; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 6 -> elw_investment_indicator_sensitivity_message_record.filler_6[elw_investment_indicator_sensitivity_message_at] = (elw_investment_indicator_sensitivity_message_base + 98 + elw_investment_indicator_sensitivity_message_at + 1) % 256; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.end_keyword = (elw_investment_indicator_sensitivity_message_base + 104 + 1) % 256;
  skip
}

/* Elw Investment Indicator Sensitivity Message to the wire, 105 bytes from where the cursor stands */
inline encode_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_record) {
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> wire[at] = elw_investment_indicator_sensitivity_message_record.isin[elw_investment_indicator_sensitivity_message_at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 6 -> wire[at] = elw_investment_indicator_sensitivity_message_record.time[elw_investment_indicator_sensitivity_message_at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 10 -> wire[at] = elw_investment_indicator_sensitivity_message_record.theoretical_warrant_price[elw_investment_indicator_sensitivity_message_at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  wire[at] = elw_investment_indicator_sensitivity_message_record.sensitivity_delta_sign; at = at + 1;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 7 -> wire[at] = elw_investment_indicator_sensitivity_message_record.sensitivity_delta[elw_investment_indicator_sensitivity_message_at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  wire[at] = elw_investment_indicator_sensitivity_message_record.sensitivity_gamma_sign; at = at + 1;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 7 -> wire[at] = elw_investment_indicator_sensitivity_message_record.sensitivity_gamma[elw_investment_indicator_sensitivity_message_at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  wire[at] = elw_investment_indicator_sensitivity_message_record.sensitivity_theta_sign; at = at + 1;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> wire[at] = elw_investment_indicator_sensitivity_message_record.sensitivity_theta[elw_investment_indicator_sensitivity_message_at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  wire[at] = elw_investment_indicator_sensitivity_message_record.sensitivity_vega_sign; at = at + 1;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> wire[at] = elw_investment_indicator_sensitivity_message_record.sensitivity_vega[elw_investment_indicator_sensitivity_message_at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  wire[at] = elw_investment_indicator_sensitivity_message_record.sensitivity_rho_sign; at = at + 1;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> wire[at] = elw_investment_indicator_sensitivity_message_record.sensitivity_rho[elw_investment_indicator_sensitivity_message_at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 5 -> wire[at] = elw_investment_indicator_sensitivity_message_record.intrinsic_volatility[elw_investment_indicator_sensitivity_message_at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 10 -> wire[at] = elw_investment_indicator_sensitivity_message_record.prerequisite_cost[elw_investment_indicator_sensitivity_message_at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 6 -> wire[at] = elw_investment_indicator_sensitivity_message_record.filler_6[elw_investment_indicator_sensitivity_message_at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  wire[at] = elw_investment_indicator_sensitivity_message_record.end_keyword; at = at + 1;
  skip
}

/* Elw Investment Indicator Sensitivity Message off the wire, 105 bytes from where the cursor stands */
inline decode_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_record) {
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.isin[elw_investment_indicator_sensitivity_message_at] = wire[at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 6 -> elw_investment_indicator_sensitivity_message_record.time[elw_investment_indicator_sensitivity_message_at] = wire[at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 10 -> elw_investment_indicator_sensitivity_message_record.theoretical_warrant_price[elw_investment_indicator_sensitivity_message_at] = wire[at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_delta_sign = wire[at]; at = at + 1;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 7 -> elw_investment_indicator_sensitivity_message_record.sensitivity_delta[elw_investment_indicator_sensitivity_message_at] = wire[at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_gamma_sign = wire[at]; at = at + 1;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 7 -> elw_investment_indicator_sensitivity_message_record.sensitivity_gamma[elw_investment_indicator_sensitivity_message_at] = wire[at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_theta_sign = wire[at]; at = at + 1;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.sensitivity_theta[elw_investment_indicator_sensitivity_message_at] = wire[at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_vega_sign = wire[at]; at = at + 1;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.sensitivity_vega[elw_investment_indicator_sensitivity_message_at] = wire[at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.sensitivity_rho_sign = wire[at]; at = at + 1;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> elw_investment_indicator_sensitivity_message_record.sensitivity_rho[elw_investment_indicator_sensitivity_message_at] = wire[at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 5 -> elw_investment_indicator_sensitivity_message_record.intrinsic_volatility[elw_investment_indicator_sensitivity_message_at] = wire[at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 10 -> elw_investment_indicator_sensitivity_message_record.prerequisite_cost[elw_investment_indicator_sensitivity_message_at] = wire[at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 6 -> elw_investment_indicator_sensitivity_message_record.filler_6[elw_investment_indicator_sensitivity_message_at] = wire[at]; at = at + 1; elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Elw Investment Indicator Sensitivity Message is what was written, byte for byte */
inline equal_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_read, elw_investment_indicator_sensitivity_message_written) {
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> assert(elw_investment_indicator_sensitivity_message_read.isin[elw_investment_indicator_sensitivity_message_at] == elw_investment_indicator_sensitivity_message_written.isin[elw_investment_indicator_sensitivity_message_at]); elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 6 -> assert(elw_investment_indicator_sensitivity_message_read.time[elw_investment_indicator_sensitivity_message_at] == elw_investment_indicator_sensitivity_message_written.time[elw_investment_indicator_sensitivity_message_at]); elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 10 -> assert(elw_investment_indicator_sensitivity_message_read.theoretical_warrant_price[elw_investment_indicator_sensitivity_message_at] == elw_investment_indicator_sensitivity_message_written.theoretical_warrant_price[elw_investment_indicator_sensitivity_message_at]); elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  assert(elw_investment_indicator_sensitivity_message_read.sensitivity_delta_sign == elw_investment_indicator_sensitivity_message_written.sensitivity_delta_sign);
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 7 -> assert(elw_investment_indicator_sensitivity_message_read.sensitivity_delta[elw_investment_indicator_sensitivity_message_at] == elw_investment_indicator_sensitivity_message_written.sensitivity_delta[elw_investment_indicator_sensitivity_message_at]); elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  assert(elw_investment_indicator_sensitivity_message_read.sensitivity_gamma_sign == elw_investment_indicator_sensitivity_message_written.sensitivity_gamma_sign);
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 7 -> assert(elw_investment_indicator_sensitivity_message_read.sensitivity_gamma[elw_investment_indicator_sensitivity_message_at] == elw_investment_indicator_sensitivity_message_written.sensitivity_gamma[elw_investment_indicator_sensitivity_message_at]); elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  assert(elw_investment_indicator_sensitivity_message_read.sensitivity_theta_sign == elw_investment_indicator_sensitivity_message_written.sensitivity_theta_sign);
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> assert(elw_investment_indicator_sensitivity_message_read.sensitivity_theta[elw_investment_indicator_sensitivity_message_at] == elw_investment_indicator_sensitivity_message_written.sensitivity_theta[elw_investment_indicator_sensitivity_message_at]); elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  assert(elw_investment_indicator_sensitivity_message_read.sensitivity_vega_sign == elw_investment_indicator_sensitivity_message_written.sensitivity_vega_sign);
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> assert(elw_investment_indicator_sensitivity_message_read.sensitivity_vega[elw_investment_indicator_sensitivity_message_at] == elw_investment_indicator_sensitivity_message_written.sensitivity_vega[elw_investment_indicator_sensitivity_message_at]); elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  assert(elw_investment_indicator_sensitivity_message_read.sensitivity_rho_sign == elw_investment_indicator_sensitivity_message_written.sensitivity_rho_sign);
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 12 -> assert(elw_investment_indicator_sensitivity_message_read.sensitivity_rho[elw_investment_indicator_sensitivity_message_at] == elw_investment_indicator_sensitivity_message_written.sensitivity_rho[elw_investment_indicator_sensitivity_message_at]); elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 5 -> assert(elw_investment_indicator_sensitivity_message_read.intrinsic_volatility[elw_investment_indicator_sensitivity_message_at] == elw_investment_indicator_sensitivity_message_written.intrinsic_volatility[elw_investment_indicator_sensitivity_message_at]); elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 10 -> assert(elw_investment_indicator_sensitivity_message_read.prerequisite_cost[elw_investment_indicator_sensitivity_message_at] == elw_investment_indicator_sensitivity_message_written.prerequisite_cost[elw_investment_indicator_sensitivity_message_at]); elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  elw_investment_indicator_sensitivity_message_at = 0;
  do
  :: elw_investment_indicator_sensitivity_message_at < 6 -> assert(elw_investment_indicator_sensitivity_message_read.filler_6[elw_investment_indicator_sensitivity_message_at] == elw_investment_indicator_sensitivity_message_written.filler_6[elw_investment_indicator_sensitivity_message_at]); elw_investment_indicator_sensitivity_message_at = elw_investment_indicator_sensitivity_message_at + 1
  :: else -> break
  od;
  assert(elw_investment_indicator_sensitivity_message_read.end_keyword == elw_investment_indicator_sensitivity_message_written.end_keyword);
  skip
}

/* ---- Etn Iiv Message: 65 bytes ----------------------------------------------- */

/* ETN intraday indicative value. Previous-day and during-market/final iIV per ETN. */
typedef EtnIivMessage {
  byte isin[12];
  byte hours[6];
  byte previous_days_iv[9];
  byte during_market_hours_final_iv[9];
  byte filler_28[28];
  byte end_keyword
};

int etn_iiv_message_at;

/* every byte of Etn Iiv Message set to one value */
inline fill_etn_iiv_message(etn_iiv_message_record, etn_iiv_message_value) {
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 12 -> etn_iiv_message_record.isin[etn_iiv_message_at] = etn_iiv_message_value; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 6 -> etn_iiv_message_record.hours[etn_iiv_message_at] = etn_iiv_message_value; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 9 -> etn_iiv_message_record.previous_days_iv[etn_iiv_message_at] = etn_iiv_message_value; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 9 -> etn_iiv_message_record.during_market_hours_final_iv[etn_iiv_message_at] = etn_iiv_message_value; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 28 -> etn_iiv_message_record.filler_28[etn_iiv_message_at] = etn_iiv_message_value; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_record.end_keyword = etn_iiv_message_value;
  skip
}

/* each byte of Etn Iiv Message set to where it lies, so a field read out of place says so */
inline ramp_etn_iiv_message(etn_iiv_message_record, etn_iiv_message_base) {
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 12 -> etn_iiv_message_record.isin[etn_iiv_message_at] = (etn_iiv_message_base + 0 + etn_iiv_message_at + 1) % 256; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 6 -> etn_iiv_message_record.hours[etn_iiv_message_at] = (etn_iiv_message_base + 12 + etn_iiv_message_at + 1) % 256; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 9 -> etn_iiv_message_record.previous_days_iv[etn_iiv_message_at] = (etn_iiv_message_base + 18 + etn_iiv_message_at + 1) % 256; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 9 -> etn_iiv_message_record.during_market_hours_final_iv[etn_iiv_message_at] = (etn_iiv_message_base + 27 + etn_iiv_message_at + 1) % 256; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 28 -> etn_iiv_message_record.filler_28[etn_iiv_message_at] = (etn_iiv_message_base + 36 + etn_iiv_message_at + 1) % 256; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_record.end_keyword = (etn_iiv_message_base + 64 + 1) % 256;
  skip
}

/* Etn Iiv Message to the wire, 65 bytes from where the cursor stands */
inline encode_etn_iiv_message(etn_iiv_message_record) {
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 12 -> wire[at] = etn_iiv_message_record.isin[etn_iiv_message_at]; at = at + 1; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 6 -> wire[at] = etn_iiv_message_record.hours[etn_iiv_message_at]; at = at + 1; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 9 -> wire[at] = etn_iiv_message_record.previous_days_iv[etn_iiv_message_at]; at = at + 1; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 9 -> wire[at] = etn_iiv_message_record.during_market_hours_final_iv[etn_iiv_message_at]; at = at + 1; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 28 -> wire[at] = etn_iiv_message_record.filler_28[etn_iiv_message_at]; at = at + 1; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  wire[at] = etn_iiv_message_record.end_keyword; at = at + 1;
  skip
}

/* Etn Iiv Message off the wire, 65 bytes from where the cursor stands */
inline decode_etn_iiv_message(etn_iiv_message_record) {
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 12 -> etn_iiv_message_record.isin[etn_iiv_message_at] = wire[at]; at = at + 1; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 6 -> etn_iiv_message_record.hours[etn_iiv_message_at] = wire[at]; at = at + 1; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 9 -> etn_iiv_message_record.previous_days_iv[etn_iiv_message_at] = wire[at]; at = at + 1; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 9 -> etn_iiv_message_record.during_market_hours_final_iv[etn_iiv_message_at] = wire[at]; at = at + 1; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 28 -> etn_iiv_message_record.filler_28[etn_iiv_message_at] = wire[at]; at = at + 1; etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Etn Iiv Message is what was written, byte for byte */
inline equal_etn_iiv_message(etn_iiv_message_read, etn_iiv_message_written) {
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 12 -> assert(etn_iiv_message_read.isin[etn_iiv_message_at] == etn_iiv_message_written.isin[etn_iiv_message_at]); etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 6 -> assert(etn_iiv_message_read.hours[etn_iiv_message_at] == etn_iiv_message_written.hours[etn_iiv_message_at]); etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 9 -> assert(etn_iiv_message_read.previous_days_iv[etn_iiv_message_at] == etn_iiv_message_written.previous_days_iv[etn_iiv_message_at]); etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 9 -> assert(etn_iiv_message_read.during_market_hours_final_iv[etn_iiv_message_at] == etn_iiv_message_written.during_market_hours_final_iv[etn_iiv_message_at]); etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  etn_iiv_message_at = 0;
  do
  :: etn_iiv_message_at < 28 -> assert(etn_iiv_message_read.filler_28[etn_iiv_message_at] == etn_iiv_message_written.filler_28[etn_iiv_message_at]); etn_iiv_message_at = etn_iiv_message_at + 1
  :: else -> break
  od;
  assert(etn_iiv_message_read.end_keyword == etn_iiv_message_written.end_keyword);
  skip
}

/* ---- Etn Disparate Ratio Message: 95 bytes ----------------------------------- */

/* ETN signed disparate ratio per ETN. */
typedef EtnDisparateRatioMessage {
  byte isin[12];
  byte seq_number[8];
  byte date[8];
  byte disparate_ratio_sign;
  byte disparate_ratio[9];
  byte filler_56[56];
  byte end_keyword
};

int etn_disparate_ratio_message_at;

/* every byte of Etn Disparate Ratio Message set to one value */
inline fill_etn_disparate_ratio_message(etn_disparate_ratio_message_record, etn_disparate_ratio_message_value) {
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 12 -> etn_disparate_ratio_message_record.isin[etn_disparate_ratio_message_at] = etn_disparate_ratio_message_value; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 8 -> etn_disparate_ratio_message_record.seq_number[etn_disparate_ratio_message_at] = etn_disparate_ratio_message_value; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 8 -> etn_disparate_ratio_message_record.date[etn_disparate_ratio_message_at] = etn_disparate_ratio_message_value; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_record.disparate_ratio_sign = etn_disparate_ratio_message_value;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 9 -> etn_disparate_ratio_message_record.disparate_ratio[etn_disparate_ratio_message_at] = etn_disparate_ratio_message_value; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 56 -> etn_disparate_ratio_message_record.filler_56[etn_disparate_ratio_message_at] = etn_disparate_ratio_message_value; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_record.end_keyword = etn_disparate_ratio_message_value;
  skip
}

/* each byte of Etn Disparate Ratio Message set to where it lies, so a field read out of place says so */
inline ramp_etn_disparate_ratio_message(etn_disparate_ratio_message_record, etn_disparate_ratio_message_base) {
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 12 -> etn_disparate_ratio_message_record.isin[etn_disparate_ratio_message_at] = (etn_disparate_ratio_message_base + 0 + etn_disparate_ratio_message_at + 1) % 256; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 8 -> etn_disparate_ratio_message_record.seq_number[etn_disparate_ratio_message_at] = (etn_disparate_ratio_message_base + 12 + etn_disparate_ratio_message_at + 1) % 256; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 8 -> etn_disparate_ratio_message_record.date[etn_disparate_ratio_message_at] = (etn_disparate_ratio_message_base + 20 + etn_disparate_ratio_message_at + 1) % 256; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_record.disparate_ratio_sign = (etn_disparate_ratio_message_base + 28 + 1) % 256;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 9 -> etn_disparate_ratio_message_record.disparate_ratio[etn_disparate_ratio_message_at] = (etn_disparate_ratio_message_base + 29 + etn_disparate_ratio_message_at + 1) % 256; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 56 -> etn_disparate_ratio_message_record.filler_56[etn_disparate_ratio_message_at] = (etn_disparate_ratio_message_base + 38 + etn_disparate_ratio_message_at + 1) % 256; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_record.end_keyword = (etn_disparate_ratio_message_base + 94 + 1) % 256;
  skip
}

/* Etn Disparate Ratio Message to the wire, 95 bytes from where the cursor stands */
inline encode_etn_disparate_ratio_message(etn_disparate_ratio_message_record) {
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 12 -> wire[at] = etn_disparate_ratio_message_record.isin[etn_disparate_ratio_message_at]; at = at + 1; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 8 -> wire[at] = etn_disparate_ratio_message_record.seq_number[etn_disparate_ratio_message_at]; at = at + 1; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 8 -> wire[at] = etn_disparate_ratio_message_record.date[etn_disparate_ratio_message_at]; at = at + 1; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  wire[at] = etn_disparate_ratio_message_record.disparate_ratio_sign; at = at + 1;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 9 -> wire[at] = etn_disparate_ratio_message_record.disparate_ratio[etn_disparate_ratio_message_at]; at = at + 1; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 56 -> wire[at] = etn_disparate_ratio_message_record.filler_56[etn_disparate_ratio_message_at]; at = at + 1; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  wire[at] = etn_disparate_ratio_message_record.end_keyword; at = at + 1;
  skip
}

/* Etn Disparate Ratio Message off the wire, 95 bytes from where the cursor stands */
inline decode_etn_disparate_ratio_message(etn_disparate_ratio_message_record) {
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 12 -> etn_disparate_ratio_message_record.isin[etn_disparate_ratio_message_at] = wire[at]; at = at + 1; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 8 -> etn_disparate_ratio_message_record.seq_number[etn_disparate_ratio_message_at] = wire[at]; at = at + 1; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 8 -> etn_disparate_ratio_message_record.date[etn_disparate_ratio_message_at] = wire[at]; at = at + 1; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_record.disparate_ratio_sign = wire[at]; at = at + 1;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 9 -> etn_disparate_ratio_message_record.disparate_ratio[etn_disparate_ratio_message_at] = wire[at]; at = at + 1; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 56 -> etn_disparate_ratio_message_record.filler_56[etn_disparate_ratio_message_at] = wire[at]; at = at + 1; etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Etn Disparate Ratio Message is what was written, byte for byte */
inline equal_etn_disparate_ratio_message(etn_disparate_ratio_message_read, etn_disparate_ratio_message_written) {
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 12 -> assert(etn_disparate_ratio_message_read.isin[etn_disparate_ratio_message_at] == etn_disparate_ratio_message_written.isin[etn_disparate_ratio_message_at]); etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 8 -> assert(etn_disparate_ratio_message_read.seq_number[etn_disparate_ratio_message_at] == etn_disparate_ratio_message_written.seq_number[etn_disparate_ratio_message_at]); etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 8 -> assert(etn_disparate_ratio_message_read.date[etn_disparate_ratio_message_at] == etn_disparate_ratio_message_written.date[etn_disparate_ratio_message_at]); etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  assert(etn_disparate_ratio_message_read.disparate_ratio_sign == etn_disparate_ratio_message_written.disparate_ratio_sign);
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 9 -> assert(etn_disparate_ratio_message_read.disparate_ratio[etn_disparate_ratio_message_at] == etn_disparate_ratio_message_written.disparate_ratio[etn_disparate_ratio_message_at]); etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  etn_disparate_ratio_message_at = 0;
  do
  :: etn_disparate_ratio_message_at < 56 -> assert(etn_disparate_ratio_message_read.filler_56[etn_disparate_ratio_message_at] == etn_disparate_ratio_message_written.filler_56[etn_disparate_ratio_message_at]); etn_disparate_ratio_message_at = etn_disparate_ratio_message_at + 1
  :: else -> break
  od;
  assert(etn_disparate_ratio_message_read.end_keyword == etn_disparate_ratio_message_written.end_keyword);
  skip
}

/* ---- Loan Transaction Available Quantity Message: 45 bytes ------------------- */

/* Loan transaction available quantity public disclosure. Reports the available stock lending quantity for one issue (ISIN) in shares. */
typedef LoanTransactionAvailableQuantityMessage {
  byte issue_code[12];
  byte business_code[3];
  byte available_lending_quantity[10];
  byte filler_19[19];
  byte end_keyword
};

int loan_transaction_available_quantity_message_at;

/* every byte of Loan Transaction Available Quantity Message set to one value */
inline fill_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_record, loan_transaction_available_quantity_message_value) {
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 12 -> loan_transaction_available_quantity_message_record.issue_code[loan_transaction_available_quantity_message_at] = loan_transaction_available_quantity_message_value; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 3 -> loan_transaction_available_quantity_message_record.business_code[loan_transaction_available_quantity_message_at] = loan_transaction_available_quantity_message_value; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 10 -> loan_transaction_available_quantity_message_record.available_lending_quantity[loan_transaction_available_quantity_message_at] = loan_transaction_available_quantity_message_value; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 19 -> loan_transaction_available_quantity_message_record.filler_19[loan_transaction_available_quantity_message_at] = loan_transaction_available_quantity_message_value; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_record.end_keyword = loan_transaction_available_quantity_message_value;
  skip
}

/* each byte of Loan Transaction Available Quantity Message set to where it lies, so a field read out of place says so */
inline ramp_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_record, loan_transaction_available_quantity_message_base) {
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 12 -> loan_transaction_available_quantity_message_record.issue_code[loan_transaction_available_quantity_message_at] = (loan_transaction_available_quantity_message_base + 0 + loan_transaction_available_quantity_message_at + 1) % 256; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 3 -> loan_transaction_available_quantity_message_record.business_code[loan_transaction_available_quantity_message_at] = (loan_transaction_available_quantity_message_base + 12 + loan_transaction_available_quantity_message_at + 1) % 256; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 10 -> loan_transaction_available_quantity_message_record.available_lending_quantity[loan_transaction_available_quantity_message_at] = (loan_transaction_available_quantity_message_base + 15 + loan_transaction_available_quantity_message_at + 1) % 256; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 19 -> loan_transaction_available_quantity_message_record.filler_19[loan_transaction_available_quantity_message_at] = (loan_transaction_available_quantity_message_base + 25 + loan_transaction_available_quantity_message_at + 1) % 256; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_record.end_keyword = (loan_transaction_available_quantity_message_base + 44 + 1) % 256;
  skip
}

/* Loan Transaction Available Quantity Message to the wire, 45 bytes from where the cursor stands */
inline encode_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_record) {
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 12 -> wire[at] = loan_transaction_available_quantity_message_record.issue_code[loan_transaction_available_quantity_message_at]; at = at + 1; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 3 -> wire[at] = loan_transaction_available_quantity_message_record.business_code[loan_transaction_available_quantity_message_at]; at = at + 1; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 10 -> wire[at] = loan_transaction_available_quantity_message_record.available_lending_quantity[loan_transaction_available_quantity_message_at]; at = at + 1; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 19 -> wire[at] = loan_transaction_available_quantity_message_record.filler_19[loan_transaction_available_quantity_message_at]; at = at + 1; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  wire[at] = loan_transaction_available_quantity_message_record.end_keyword; at = at + 1;
  skip
}

/* Loan Transaction Available Quantity Message off the wire, 45 bytes from where the cursor stands */
inline decode_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_record) {
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 12 -> loan_transaction_available_quantity_message_record.issue_code[loan_transaction_available_quantity_message_at] = wire[at]; at = at + 1; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 3 -> loan_transaction_available_quantity_message_record.business_code[loan_transaction_available_quantity_message_at] = wire[at]; at = at + 1; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 10 -> loan_transaction_available_quantity_message_record.available_lending_quantity[loan_transaction_available_quantity_message_at] = wire[at]; at = at + 1; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 19 -> loan_transaction_available_quantity_message_record.filler_19[loan_transaction_available_quantity_message_at] = wire[at]; at = at + 1; loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_record.end_keyword = wire[at]; at = at + 1;
  skip
}

/* what was read of Loan Transaction Available Quantity Message is what was written, byte for byte */
inline equal_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_read, loan_transaction_available_quantity_message_written) {
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 12 -> assert(loan_transaction_available_quantity_message_read.issue_code[loan_transaction_available_quantity_message_at] == loan_transaction_available_quantity_message_written.issue_code[loan_transaction_available_quantity_message_at]); loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 3 -> assert(loan_transaction_available_quantity_message_read.business_code[loan_transaction_available_quantity_message_at] == loan_transaction_available_quantity_message_written.business_code[loan_transaction_available_quantity_message_at]); loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 10 -> assert(loan_transaction_available_quantity_message_read.available_lending_quantity[loan_transaction_available_quantity_message_at] == loan_transaction_available_quantity_message_written.available_lending_quantity[loan_transaction_available_quantity_message_at]); loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  loan_transaction_available_quantity_message_at = 0;
  do
  :: loan_transaction_available_quantity_message_at < 19 -> assert(loan_transaction_available_quantity_message_read.filler_19[loan_transaction_available_quantity_message_at] == loan_transaction_available_quantity_message_written.filler_19[loan_transaction_available_quantity_message_at]); loan_transaction_available_quantity_message_at = loan_transaction_available_quantity_message_at + 1
  :: else -> break
  od;
  assert(loan_transaction_available_quantity_message_read.end_keyword == loan_transaction_available_quantity_message_written.end_keyword);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* K Otc Issue Closing Message: encoded, read back, and compared */
proctype check_k_otc_issue_closing_message() {
  KOtcIssueClosingMessage k_otc_issue_closing_message_sent;
  KOtcIssueClosingMessage k_otc_issue_closing_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_k_otc_issue_closing_message(k_otc_issue_closing_message_sent, 0)
  :: pattern == 1 -> fill_k_otc_issue_closing_message(k_otc_issue_closing_message_sent, 32)
  :: pattern == 2 -> fill_k_otc_issue_closing_message(k_otc_issue_closing_message_sent, 255)
  :: else -> ramp_k_otc_issue_closing_message(k_otc_issue_closing_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_k_otc_issue_closing_message(k_otc_issue_closing_message_sent);
    assert(at == 35);
    at = 0;
    decode_k_otc_issue_closing_message(k_otc_issue_closing_message_got);
    assert(at == 35);
    equal_k_otc_issue_closing_message(k_otc_issue_closing_message_got, k_otc_issue_closing_message_sent)
  }
}

/* K Otc Market Operation Message: encoded, read back, and compared */
proctype check_k_otc_market_operation_message() {
  KOtcMarketOperationMessage k_otc_market_operation_message_sent;
  KOtcMarketOperationMessage k_otc_market_operation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_k_otc_market_operation_message(k_otc_market_operation_message_sent, 0)
  :: pattern == 1 -> fill_k_otc_market_operation_message(k_otc_market_operation_message_sent, 32)
  :: pattern == 2 -> fill_k_otc_market_operation_message(k_otc_market_operation_message_sent, 255)
  :: else -> ramp_k_otc_market_operation_message(k_otc_market_operation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_k_otc_market_operation_message(k_otc_market_operation_message_sent);
    assert(at == 25);
    at = 0;
    decode_k_otc_market_operation_message(k_otc_market_operation_message_got);
    assert(at == 25);
    equal_k_otc_market_operation_message(k_otc_market_operation_message_got, k_otc_market_operation_message_sent)
  }
}

/* K Otc Market Action Message: encoded, read back, and compared */
proctype check_k_otc_market_action_message() {
  KOtcMarketActionMessage k_otc_market_action_message_sent;
  KOtcMarketActionMessage k_otc_market_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_k_otc_market_action_message(k_otc_market_action_message_sent, 0)
  :: pattern == 1 -> fill_k_otc_market_action_message(k_otc_market_action_message_sent, 32)
  :: pattern == 2 -> fill_k_otc_market_action_message(k_otc_market_action_message_sent, 255)
  :: else -> ramp_k_otc_market_action_message(k_otc_market_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_k_otc_market_action_message(k_otc_market_action_message_sent);
    assert(at == 95);
    at = 0;
    decode_k_otc_market_action_message(k_otc_market_action_message_got);
    assert(at == 95);
    equal_k_otc_market_action_message(k_otc_market_action_message_got, k_otc_market_action_message_sent)
  }
}

/* K Otc Quote Message: encoded, read back, and compared */
proctype check_k_otc_quote_message() {
  KOtcQuoteMessage k_otc_quote_message_sent;
  KOtcQuoteMessage k_otc_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_k_otc_quote_message(k_otc_quote_message_sent, 0)
  :: pattern == 1 -> fill_k_otc_quote_message(k_otc_quote_message_sent, 32)
  :: pattern == 2 -> fill_k_otc_quote_message(k_otc_quote_message_sent, 255)
  :: else -> ramp_k_otc_quote_message(k_otc_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_k_otc_quote_message(k_otc_quote_message_sent);
    assert(at == 195);
    at = 0;
    decode_k_otc_quote_message(k_otc_quote_message_got);
    assert(at == 195);
    equal_k_otc_quote_message(k_otc_quote_message_got, k_otc_quote_message_sent)
  }
}

/* K Otc Order Filled Message: encoded, read back, and compared */
proctype check_k_otc_order_filled_message() {
  KOtcOrderFilledMessage k_otc_order_filled_message_sent;
  KOtcOrderFilledMessage k_otc_order_filled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_k_otc_order_filled_message(k_otc_order_filled_message_sent, 0)
  :: pattern == 1 -> fill_k_otc_order_filled_message(k_otc_order_filled_message_sent, 32)
  :: pattern == 2 -> fill_k_otc_order_filled_message(k_otc_order_filled_message_sent, 255)
  :: else -> ramp_k_otc_order_filled_message(k_otc_order_filled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_k_otc_order_filled_message(k_otc_order_filled_message_sent);
    assert(at == 247);
    at = 0;
    decode_k_otc_order_filled_message(k_otc_order_filled_message_got);
    assert(at == 247);
    equal_k_otc_order_filled_message(k_otc_order_filled_message_got, k_otc_order_filled_message_sent)
  }
}

/* Otc Bond Traded Info Message: encoded, read back, and compared */
proctype check_otc_bond_traded_info_message() {
  OtcBondTradedInfoMessage otc_bond_traded_info_message_sent;
  OtcBondTradedInfoMessage otc_bond_traded_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_otc_bond_traded_info_message(otc_bond_traded_info_message_sent, 0)
  :: pattern == 1 -> fill_otc_bond_traded_info_message(otc_bond_traded_info_message_sent, 32)
  :: pattern == 2 -> fill_otc_bond_traded_info_message(otc_bond_traded_info_message_sent, 255)
  :: else -> ramp_otc_bond_traded_info_message(otc_bond_traded_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_otc_bond_traded_info_message(otc_bond_traded_info_message_sent);
    assert(at == 105);
    at = 0;
    decode_otc_bond_traded_info_message(otc_bond_traded_info_message_got);
    assert(at == 105);
    equal_otc_bond_traded_info_message(otc_bond_traded_info_message_got, otc_bond_traded_info_message_sent)
  }
}

/* Otc Bond Trades Per Institution Message: encoded, read back, and compared */
proctype check_otc_bond_trades_per_institution_message() {
  OtcBondTradesPerInstitutionMessage otc_bond_trades_per_institution_message_sent;
  OtcBondTradesPerInstitutionMessage otc_bond_trades_per_institution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_sent, 0)
  :: pattern == 1 -> fill_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_sent, 32)
  :: pattern == 2 -> fill_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_sent, 255)
  :: else -> ramp_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_sent);
    assert(at == 105);
    at = 0;
    decode_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_got);
    assert(at == 105);
    equal_otc_bond_trades_per_institution_message(otc_bond_trades_per_institution_message_got, otc_bond_trades_per_institution_message_sent)
  }
}

/* Otc Bond Types Per Investor Message: encoded, read back, and compared */
proctype check_otc_bond_types_per_investor_message() {
  OtcBondTypesPerInvestorMessage otc_bond_types_per_investor_message_sent;
  OtcBondTypesPerInvestorMessage otc_bond_types_per_investor_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_sent, 0)
  :: pattern == 1 -> fill_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_sent, 32)
  :: pattern == 2 -> fill_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_sent, 255)
  :: else -> ramp_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_sent);
    assert(at == 135);
    at = 0;
    decode_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_got);
    assert(at == 135);
    equal_otc_bond_types_per_investor_message(otc_bond_types_per_investor_message_got, otc_bond_types_per_investor_message_sent)
  }
}

/* K Bond Message: encoded, read back, and compared */
proctype check_k_bond_message() {
  KBondMessage k_bond_message_sent;
  KBondMessage k_bond_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_k_bond_message(k_bond_message_sent, 0)
  :: pattern == 1 -> fill_k_bond_message(k_bond_message_sent, 32)
  :: pattern == 2 -> fill_k_bond_message(k_bond_message_sent, 255)
  :: else -> ramp_k_bond_message(k_bond_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_k_bond_message(k_bond_message_sent);
    assert(at == 145);
    at = 0;
    decode_k_bond_message(k_bond_message_got);
    assert(at == 145);
    equal_k_bond_message(k_bond_message_got, k_bond_message_sent)
  }
}

/* Mkf Index Message: encoded, read back, and compared */
proctype check_mkf_index_message() {
  MkfIndexMessage mkf_index_message_sent;
  MkfIndexMessage mkf_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mkf_index_message(mkf_index_message_sent, 0)
  :: pattern == 1 -> fill_mkf_index_message(mkf_index_message_sent, 32)
  :: pattern == 2 -> fill_mkf_index_message(mkf_index_message_sent, 255)
  :: else -> ramp_mkf_index_message(mkf_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mkf_index_message(mkf_index_message_sent);
    assert(at == 72);
    at = 0;
    decode_mkf_index_message(mkf_index_message_got);
    assert(at == 72);
    equal_mkf_index_message(mkf_index_message_got, mkf_index_message_sent)
  }
}

/* Mkf Index Jpy Message: encoded, read back, and compared */
proctype check_mkf_index_jpy_message() {
  MkfIndexJpyMessage mkf_index_jpy_message_sent;
  MkfIndexJpyMessage mkf_index_jpy_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mkf_index_jpy_message(mkf_index_jpy_message_sent, 0)
  :: pattern == 1 -> fill_mkf_index_jpy_message(mkf_index_jpy_message_sent, 32)
  :: pattern == 2 -> fill_mkf_index_jpy_message(mkf_index_jpy_message_sent, 255)
  :: else -> ramp_mkf_index_jpy_message(mkf_index_jpy_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mkf_index_jpy_message(mkf_index_jpy_message_sent);
    assert(at == 72);
    at = 0;
    decode_mkf_index_jpy_message(mkf_index_jpy_message_got);
    assert(at == 72);
    equal_mkf_index_jpy_message(mkf_index_jpy_message_got, mkf_index_jpy_message_sent)
  }
}

/* Wisefn Index Message: encoded, read back, and compared */
proctype check_wisefn_index_message() {
  WisefnIndexMessage wisefn_index_message_sent;
  WisefnIndexMessage wisefn_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_wisefn_index_message(wisefn_index_message_sent, 0)
  :: pattern == 1 -> fill_wisefn_index_message(wisefn_index_message_sent, 32)
  :: pattern == 2 -> fill_wisefn_index_message(wisefn_index_message_sent, 255)
  :: else -> ramp_wisefn_index_message(wisefn_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_wisefn_index_message(wisefn_index_message_sent);
    assert(at == 72);
    at = 0;
    decode_wisefn_index_message(wisefn_index_message_got);
    assert(at == 72);
    equal_wisefn_index_message(wisefn_index_message_got, wisefn_index_message_sent)
  }
}

/* Kis Index Message: encoded, read back, and compared */
proctype check_kis_index_message() {
  KisIndexMessage kis_index_message_sent;
  KisIndexMessage kis_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_kis_index_message(kis_index_message_sent, 0)
  :: pattern == 1 -> fill_kis_index_message(kis_index_message_sent, 32)
  :: pattern == 2 -> fill_kis_index_message(kis_index_message_sent, 255)
  :: else -> ramp_kis_index_message(kis_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_kis_index_message(kis_index_message_sent);
    assert(at == 72);
    at = 0;
    decode_kis_index_message(kis_index_message_got);
    assert(at == 72);
    equal_kis_index_message(kis_index_message_got, kis_index_message_sent)
  }
}

/* Mkf Bond Index Message: encoded, read back, and compared */
proctype check_mkf_bond_index_message() {
  MkfBondIndexMessage mkf_bond_index_message_sent;
  MkfBondIndexMessage mkf_bond_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mkf_bond_index_message(mkf_bond_index_message_sent, 0)
  :: pattern == 1 -> fill_mkf_bond_index_message(mkf_bond_index_message_sent, 32)
  :: pattern == 2 -> fill_mkf_bond_index_message(mkf_bond_index_message_sent, 255)
  :: else -> ramp_mkf_bond_index_message(mkf_bond_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mkf_bond_index_message(mkf_bond_index_message_sent);
    assert(at == 109);
    at = 0;
    decode_mkf_bond_index_message(mkf_bond_index_message_got);
    assert(at == 109);
    equal_mkf_bond_index_message(mkf_bond_index_message_got, mkf_bond_index_message_sent)
  }
}

/* Kis Bond Index Message: encoded, read back, and compared */
proctype check_kis_bond_index_message() {
  KisBondIndexMessage kis_bond_index_message_sent;
  KisBondIndexMessage kis_bond_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_kis_bond_index_message(kis_bond_index_message_sent, 0)
  :: pattern == 1 -> fill_kis_bond_index_message(kis_bond_index_message_sent, 32)
  :: pattern == 2 -> fill_kis_bond_index_message(kis_bond_index_message_sent, 255)
  :: else -> ramp_kis_bond_index_message(kis_bond_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_kis_bond_index_message(kis_bond_index_message_sent);
    assert(at == 109);
    at = 0;
    decode_kis_bond_index_message(kis_bond_index_message_got);
    assert(at == 109);
    equal_kis_bond_index_message(kis_bond_index_message_got, kis_bond_index_message_sent)
  }
}

/* Kebi Bond Index Message: encoded, read back, and compared */
proctype check_kebi_bond_index_message() {
  KebiBondIndexMessage kebi_bond_index_message_sent;
  KebiBondIndexMessage kebi_bond_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_kebi_bond_index_message(kebi_bond_index_message_sent, 0)
  :: pattern == 1 -> fill_kebi_bond_index_message(kebi_bond_index_message_sent, 32)
  :: pattern == 2 -> fill_kebi_bond_index_message(kebi_bond_index_message_sent, 255)
  :: else -> ramp_kebi_bond_index_message(kebi_bond_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_kebi_bond_index_message(kebi_bond_index_message_sent);
    assert(at == 109);
    at = 0;
    decode_kebi_bond_index_message(kebi_bond_index_message_got);
    assert(at == 109);
    equal_kebi_bond_index_message(kebi_bond_index_message_got, kebi_bond_index_message_sent)
  }
}

/* Kabi Bond Index Message: encoded, read back, and compared */
proctype check_kabi_bond_index_message() {
  KabiBondIndexMessage kabi_bond_index_message_sent;
  KabiBondIndexMessage kabi_bond_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_kabi_bond_index_message(kabi_bond_index_message_sent, 0)
  :: pattern == 1 -> fill_kabi_bond_index_message(kabi_bond_index_message_sent, 32)
  :: pattern == 2 -> fill_kabi_bond_index_message(kabi_bond_index_message_sent, 255)
  :: else -> ramp_kabi_bond_index_message(kabi_bond_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_kabi_bond_index_message(kabi_bond_index_message_sent);
    assert(at == 109);
    at = 0;
    decode_kabi_bond_index_message(kabi_bond_index_message_got);
    assert(at == 109);
    equal_kabi_bond_index_message(kabi_bond_index_message_got, kabi_bond_index_message_sent)
  }
}

/* Nicepni Bond Index Message: encoded, read back, and compared */
proctype check_nicepni_bond_index_message() {
  NicepniBondIndexMessage nicepni_bond_index_message_sent;
  NicepniBondIndexMessage nicepni_bond_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_nicepni_bond_index_message(nicepni_bond_index_message_sent, 0)
  :: pattern == 1 -> fill_nicepni_bond_index_message(nicepni_bond_index_message_sent, 32)
  :: pattern == 2 -> fill_nicepni_bond_index_message(nicepni_bond_index_message_sent, 255)
  :: else -> ramp_nicepni_bond_index_message(nicepni_bond_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_nicepni_bond_index_message(nicepni_bond_index_message_sent);
    assert(at == 109);
    at = 0;
    decode_nicepni_bond_index_message(nicepni_bond_index_message_got);
    assert(at == 109);
    equal_nicepni_bond_index_message(nicepni_bond_index_message_got, nicepni_bond_index_message_sent)
  }
}

/* Domestic Etf Inav Message: encoded, read back, and compared */
proctype check_domestic_etf_inav_message() {
  DomesticEtfInavMessage domestic_etf_inav_message_sent;
  DomesticEtfInavMessage domestic_etf_inav_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_domestic_etf_inav_message(domestic_etf_inav_message_sent, 0)
  :: pattern == 1 -> fill_domestic_etf_inav_message(domestic_etf_inav_message_sent, 32)
  :: pattern == 2 -> fill_domestic_etf_inav_message(domestic_etf_inav_message_sent, 255)
  :: else -> ramp_domestic_etf_inav_message(domestic_etf_inav_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_domestic_etf_inav_message(domestic_etf_inav_message_sent);
    assert(at == 65);
    at = 0;
    decode_domestic_etf_inav_message(domestic_etf_inav_message_got);
    assert(at == 65);
    equal_domestic_etf_inav_message(domestic_etf_inav_message_got, domestic_etf_inav_message_sent)
  }
}

/* Domestic Etf Estimated Inav Message: encoded, read back, and compared */
proctype check_domestic_etf_estimated_inav_message() {
  DomesticEtfEstimatedInavMessage domestic_etf_estimated_inav_message_sent;
  DomesticEtfEstimatedInavMessage domestic_etf_estimated_inav_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_sent, 0)
  :: pattern == 1 -> fill_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_sent, 32)
  :: pattern == 2 -> fill_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_sent, 255)
  :: else -> ramp_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_sent);
    assert(at == 45);
    at = 0;
    decode_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_got);
    assert(at == 45);
    equal_domestic_etf_estimated_inav_message(domestic_etf_estimated_inav_message_got, domestic_etf_estimated_inav_message_sent)
  }
}

/* Global Etf Inav Message: encoded, read back, and compared */
proctype check_global_etf_inav_message() {
  GlobalEtfInavMessage global_etf_inav_message_sent;
  GlobalEtfInavMessage global_etf_inav_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_global_etf_inav_message(global_etf_inav_message_sent, 0)
  :: pattern == 1 -> fill_global_etf_inav_message(global_etf_inav_message_sent, 32)
  :: pattern == 2 -> fill_global_etf_inav_message(global_etf_inav_message_sent, 255)
  :: else -> ramp_global_etf_inav_message(global_etf_inav_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_global_etf_inav_message(global_etf_inav_message_sent);
    assert(at == 65);
    at = 0;
    decode_global_etf_inav_message(global_etf_inav_message_got);
    assert(at == 65);
    equal_global_etf_inav_message(global_etf_inav_message_got, global_etf_inav_message_sent)
  }
}

/* Etf Tracking Error Message: encoded, read back, and compared */
proctype check_etf_tracking_error_message() {
  EtfTrackingErrorMessage etf_tracking_error_message_sent;
  EtfTrackingErrorMessage etf_tracking_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_etf_tracking_error_message(etf_tracking_error_message_sent, 0)
  :: pattern == 1 -> fill_etf_tracking_error_message(etf_tracking_error_message_sent, 32)
  :: pattern == 2 -> fill_etf_tracking_error_message(etf_tracking_error_message_sent, 255)
  :: else -> ramp_etf_tracking_error_message(etf_tracking_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_etf_tracking_error_message(etf_tracking_error_message_sent);
    assert(at == 55);
    at = 0;
    decode_etf_tracking_error_message(etf_tracking_error_message_got);
    assert(at == 55);
    equal_etf_tracking_error_message(etf_tracking_error_message_got, etf_tracking_error_message_sent)
  }
}

/* Global Etf Tracking Error Message: encoded, read back, and compared */
proctype check_global_etf_tracking_error_message() {
  GlobalEtfTrackingErrorMessage global_etf_tracking_error_message_sent;
  GlobalEtfTrackingErrorMessage global_etf_tracking_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_global_etf_tracking_error_message(global_etf_tracking_error_message_sent, 0)
  :: pattern == 1 -> fill_global_etf_tracking_error_message(global_etf_tracking_error_message_sent, 32)
  :: pattern == 2 -> fill_global_etf_tracking_error_message(global_etf_tracking_error_message_sent, 255)
  :: else -> ramp_global_etf_tracking_error_message(global_etf_tracking_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_global_etf_tracking_error_message(global_etf_tracking_error_message_sent);
    assert(at == 55);
    at = 0;
    decode_global_etf_tracking_error_message(global_etf_tracking_error_message_got);
    assert(at == 55);
    equal_global_etf_tracking_error_message(global_etf_tracking_error_message_got, global_etf_tracking_error_message_sent)
  }
}

/* Etp Pdf Message: encoded, read back, and compared */
proctype check_etp_pdf_message() {
  EtpPdfMessage etp_pdf_message_sent;
  EtpPdfMessage etp_pdf_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_etp_pdf_message(etp_pdf_message_sent, 0)
  :: pattern == 1 -> fill_etp_pdf_message(etp_pdf_message_sent, 32)
  :: pattern == 2 -> fill_etp_pdf_message(etp_pdf_message_sent, 255)
  :: else -> ramp_etp_pdf_message(etp_pdf_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_etp_pdf_message(etp_pdf_message_sent);
    assert(at == 155);
    at = 0;
    decode_etp_pdf_message(etp_pdf_message_got);
    assert(at == 155);
    equal_etp_pdf_message(etp_pdf_message_got, etp_pdf_message_sent)
  }
}

/* Etp Operator Information Message: encoded, read back, and compared */
proctype check_etp_operator_information_message() {
  EtpOperatorInformationMessage etp_operator_information_message_sent;
  EtpOperatorInformationMessage etp_operator_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_etp_operator_information_message(etp_operator_information_message_sent, 0)
  :: pattern == 1 -> fill_etp_operator_information_message(etp_operator_information_message_sent, 32)
  :: pattern == 2 -> fill_etp_operator_information_message(etp_operator_information_message_sent, 255)
  :: else -> ramp_etp_operator_information_message(etp_operator_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_etp_operator_information_message(etp_operator_information_message_sent);
    assert(at == 125);
    at = 0;
    decode_etp_operator_information_message(etp_operator_information_message_got);
    assert(at == 125);
    equal_etp_operator_information_message(etp_operator_information_message_got, etp_operator_information_message_sent)
  }
}

/* Etp Transfer Agent Batch Message: encoded, read back, and compared */
proctype check_etp_transfer_agent_batch_message() {
  EtpTransferAgentBatchMessage etp_transfer_agent_batch_message_sent;
  EtpTransferAgentBatchMessage etp_transfer_agent_batch_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_sent, 0)
  :: pattern == 1 -> fill_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_sent, 32)
  :: pattern == 2 -> fill_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_sent, 255)
  :: else -> ramp_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_sent);
    assert(at == 245);
    at = 0;
    decode_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_got);
    assert(at == 245);
    equal_etp_transfer_agent_batch_message(etp_transfer_agent_batch_message_got, etp_transfer_agent_batch_message_sent)
  }
}

/* Etf Risk Appraisement Message: encoded, read back, and compared */
proctype check_etf_risk_appraisement_message() {
  EtfRiskAppraisementMessage etf_risk_appraisement_message_sent;
  EtfRiskAppraisementMessage etf_risk_appraisement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_etf_risk_appraisement_message(etf_risk_appraisement_message_sent, 0)
  :: pattern == 1 -> fill_etf_risk_appraisement_message(etf_risk_appraisement_message_sent, 32)
  :: pattern == 2 -> fill_etf_risk_appraisement_message(etf_risk_appraisement_message_sent, 255)
  :: else -> ramp_etf_risk_appraisement_message(etf_risk_appraisement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_etf_risk_appraisement_message(etf_risk_appraisement_message_sent);
    assert(at == 195);
    at = 0;
    decode_etf_risk_appraisement_message(etf_risk_appraisement_message_got);
    assert(at == 195);
    equal_etf_risk_appraisement_message(etf_risk_appraisement_message_got, etf_risk_appraisement_message_sent)
  }
}

/* Synthetic Etf Constituents Message: encoded, read back, and compared */
proctype check_synthetic_etf_constituents_message() {
  SyntheticEtfConstituentsMessage synthetic_etf_constituents_message_sent;
  SyntheticEtfConstituentsMessage synthetic_etf_constituents_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_synthetic_etf_constituents_message(synthetic_etf_constituents_message_sent, 0)
  :: pattern == 1 -> fill_synthetic_etf_constituents_message(synthetic_etf_constituents_message_sent, 32)
  :: pattern == 2 -> fill_synthetic_etf_constituents_message(synthetic_etf_constituents_message_sent, 255)
  :: else -> ramp_synthetic_etf_constituents_message(synthetic_etf_constituents_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_synthetic_etf_constituents_message(synthetic_etf_constituents_message_sent);
    assert(at == 195);
    at = 0;
    decode_synthetic_etf_constituents_message(synthetic_etf_constituents_message_got);
    assert(at == 195);
    equal_synthetic_etf_constituents_message(synthetic_etf_constituents_message_got, synthetic_etf_constituents_message_sent)
  }
}

/* Elw Investment Indicator Sensitivity Message: encoded, read back, and compared */
proctype check_elw_investment_indicator_sensitivity_message() {
  ElwInvestmentIndicatorSensitivityMessage elw_investment_indicator_sensitivity_message_sent;
  ElwInvestmentIndicatorSensitivityMessage elw_investment_indicator_sensitivity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_sent, 0)
  :: pattern == 1 -> fill_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_sent, 32)
  :: pattern == 2 -> fill_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_sent, 255)
  :: else -> ramp_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_sent);
    assert(at == 105);
    at = 0;
    decode_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_got);
    assert(at == 105);
    equal_elw_investment_indicator_sensitivity_message(elw_investment_indicator_sensitivity_message_got, elw_investment_indicator_sensitivity_message_sent)
  }
}

/* Etn Iiv Message: encoded, read back, and compared */
proctype check_etn_iiv_message() {
  EtnIivMessage etn_iiv_message_sent;
  EtnIivMessage etn_iiv_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_etn_iiv_message(etn_iiv_message_sent, 0)
  :: pattern == 1 -> fill_etn_iiv_message(etn_iiv_message_sent, 32)
  :: pattern == 2 -> fill_etn_iiv_message(etn_iiv_message_sent, 255)
  :: else -> ramp_etn_iiv_message(etn_iiv_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_etn_iiv_message(etn_iiv_message_sent);
    assert(at == 65);
    at = 0;
    decode_etn_iiv_message(etn_iiv_message_got);
    assert(at == 65);
    equal_etn_iiv_message(etn_iiv_message_got, etn_iiv_message_sent)
  }
}

/* Etn Disparate Ratio Message: encoded, read back, and compared */
proctype check_etn_disparate_ratio_message() {
  EtnDisparateRatioMessage etn_disparate_ratio_message_sent;
  EtnDisparateRatioMessage etn_disparate_ratio_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_etn_disparate_ratio_message(etn_disparate_ratio_message_sent, 0)
  :: pattern == 1 -> fill_etn_disparate_ratio_message(etn_disparate_ratio_message_sent, 32)
  :: pattern == 2 -> fill_etn_disparate_ratio_message(etn_disparate_ratio_message_sent, 255)
  :: else -> ramp_etn_disparate_ratio_message(etn_disparate_ratio_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_etn_disparate_ratio_message(etn_disparate_ratio_message_sent);
    assert(at == 95);
    at = 0;
    decode_etn_disparate_ratio_message(etn_disparate_ratio_message_got);
    assert(at == 95);
    equal_etn_disparate_ratio_message(etn_disparate_ratio_message_got, etn_disparate_ratio_message_sent)
  }
}

/* Loan Transaction Available Quantity Message: encoded, read back, and compared */
proctype check_loan_transaction_available_quantity_message() {
  LoanTransactionAvailableQuantityMessage loan_transaction_available_quantity_message_sent;
  LoanTransactionAvailableQuantityMessage loan_transaction_available_quantity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_sent, 0)
  :: pattern == 1 -> fill_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_sent, 32)
  :: pattern == 2 -> fill_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_sent, 255)
  :: else -> ramp_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_sent);
    assert(at == 45);
    at = 0;
    decode_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_got);
    assert(at == 45);
    equal_loan_transaction_available_quantity_message(loan_transaction_available_quantity_message_got, loan_transaction_available_quantity_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_k_otc_issue_closing_message()
  :: run check_k_otc_market_operation_message()
  :: run check_k_otc_market_action_message()
  :: run check_k_otc_quote_message()
  :: run check_k_otc_order_filled_message()
  :: run check_otc_bond_traded_info_message()
  :: run check_otc_bond_trades_per_institution_message()
  :: run check_otc_bond_types_per_investor_message()
  :: run check_k_bond_message()
  :: run check_mkf_index_message()
  :: run check_mkf_index_jpy_message()
  :: run check_wisefn_index_message()
  :: run check_kis_index_message()
  :: run check_mkf_bond_index_message()
  :: run check_kis_bond_index_message()
  :: run check_kebi_bond_index_message()
  :: run check_kabi_bond_index_message()
  :: run check_nicepni_bond_index_message()
  :: run check_domestic_etf_inav_message()
  :: run check_domestic_etf_estimated_inav_message()
  :: run check_global_etf_inav_message()
  :: run check_etf_tracking_error_message()
  :: run check_global_etf_tracking_error_message()
  :: run check_etp_pdf_message()
  :: run check_etp_operator_information_message()
  :: run check_etp_transfer_agent_batch_message()
  :: run check_etf_risk_appraisement_message()
  :: run check_synthetic_etf_constituents_message()
  :: run check_elw_investment_indicator_sensitivity_message()
  :: run check_etn_iiv_message()
  :: run check_etn_disparate_ratio_message()
  :: run check_loan_transaction_available_quantity_message()
  fi
}
