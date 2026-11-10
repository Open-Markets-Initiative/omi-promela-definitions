/*
 * National Stock Exchange of India Ltd 
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
 *   - a run counted by a field
 *   - a Conversion rule
 *   - a field read in bits
 *   - a Composite rule
 *   - a run of a stated number of entries
 *   - the dispatch that chooses a message by its type
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 58

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Bcast Header: 40 bytes -------------------------------------------------- */

/* BCAST_HEADER */
typedef BcastHeader {
  byte reserved_0[2];
  byte reserved_2[2];
  byte log_time[4];
  byte alpha_char[2];
  byte transaction_code[2];
  byte error_code[2];
  byte bc_seq_no[4];
  byte reserved_18;
  byte reserved_19[3];
  byte time_stamp_2[8];
  byte filler_2[8];
  byte message_length[2]
};

int bcast_header_at;

/* every byte of Bcast Header set to one value */
inline fill_bcast_header(bcast_header_record, bcast_header_value) {
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.reserved_0[bcast_header_at] = bcast_header_value; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.reserved_2[bcast_header_at] = bcast_header_value; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 4 -> bcast_header_record.log_time[bcast_header_at] = bcast_header_value; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.alpha_char[bcast_header_at] = bcast_header_value; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.transaction_code[bcast_header_at] = bcast_header_value; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.error_code[bcast_header_at] = bcast_header_value; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 4 -> bcast_header_record.bc_seq_no[bcast_header_at] = bcast_header_value; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_record.reserved_18 = bcast_header_value;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 3 -> bcast_header_record.reserved_19[bcast_header_at] = bcast_header_value; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 8 -> bcast_header_record.time_stamp_2[bcast_header_at] = bcast_header_value; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 8 -> bcast_header_record.filler_2[bcast_header_at] = bcast_header_value; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.message_length[bcast_header_at] = bcast_header_value; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bcast Header set to where it lies, so a field read out of place says so */
inline ramp_bcast_header(bcast_header_record, bcast_header_base) {
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.reserved_0[bcast_header_at] = (bcast_header_base + 0 + bcast_header_at + 1) % 256; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.reserved_2[bcast_header_at] = (bcast_header_base + 2 + bcast_header_at + 1) % 256; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 4 -> bcast_header_record.log_time[bcast_header_at] = (bcast_header_base + 4 + bcast_header_at + 1) % 256; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.alpha_char[bcast_header_at] = (bcast_header_base + 8 + bcast_header_at + 1) % 256; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.transaction_code[bcast_header_at] = (bcast_header_base + 10 + bcast_header_at + 1) % 256; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.error_code[bcast_header_at] = (bcast_header_base + 12 + bcast_header_at + 1) % 256; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 4 -> bcast_header_record.bc_seq_no[bcast_header_at] = (bcast_header_base + 14 + bcast_header_at + 1) % 256; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_record.reserved_18 = (bcast_header_base + 18 + 1) % 256;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 3 -> bcast_header_record.reserved_19[bcast_header_at] = (bcast_header_base + 19 + bcast_header_at + 1) % 256; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 8 -> bcast_header_record.time_stamp_2[bcast_header_at] = (bcast_header_base + 22 + bcast_header_at + 1) % 256; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 8 -> bcast_header_record.filler_2[bcast_header_at] = (bcast_header_base + 30 + bcast_header_at + 1) % 256; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.message_length[bcast_header_at] = (bcast_header_base + 38 + bcast_header_at + 1) % 256; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  skip
}

/* Bcast Header to the wire, 40 bytes from where the cursor stands */
inline encode_bcast_header(bcast_header_record) {
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> wire[at] = bcast_header_record.reserved_0[bcast_header_at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> wire[at] = bcast_header_record.reserved_2[bcast_header_at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 4 -> wire[at] = bcast_header_record.log_time[bcast_header_at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> wire[at] = bcast_header_record.alpha_char[bcast_header_at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> wire[at] = bcast_header_record.transaction_code[bcast_header_at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> wire[at] = bcast_header_record.error_code[bcast_header_at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 4 -> wire[at] = bcast_header_record.bc_seq_no[bcast_header_at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  wire[at] = bcast_header_record.reserved_18; at = at + 1;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 3 -> wire[at] = bcast_header_record.reserved_19[bcast_header_at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 8 -> wire[at] = bcast_header_record.time_stamp_2[bcast_header_at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 8 -> wire[at] = bcast_header_record.filler_2[bcast_header_at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> wire[at] = bcast_header_record.message_length[bcast_header_at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  skip
}

/* Bcast Header off the wire, 40 bytes from where the cursor stands */
inline decode_bcast_header(bcast_header_record) {
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.reserved_0[bcast_header_at] = wire[at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.reserved_2[bcast_header_at] = wire[at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 4 -> bcast_header_record.log_time[bcast_header_at] = wire[at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.alpha_char[bcast_header_at] = wire[at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.transaction_code[bcast_header_at] = wire[at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.error_code[bcast_header_at] = wire[at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 4 -> bcast_header_record.bc_seq_no[bcast_header_at] = wire[at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_record.reserved_18 = wire[at]; at = at + 1;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 3 -> bcast_header_record.reserved_19[bcast_header_at] = wire[at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 8 -> bcast_header_record.time_stamp_2[bcast_header_at] = wire[at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 8 -> bcast_header_record.filler_2[bcast_header_at] = wire[at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> bcast_header_record.message_length[bcast_header_at] = wire[at]; at = at + 1; bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bcast Header is what was written, byte for byte */
inline equal_bcast_header(bcast_header_read, bcast_header_written) {
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> assert(bcast_header_read.reserved_0[bcast_header_at] == bcast_header_written.reserved_0[bcast_header_at]); bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> assert(bcast_header_read.reserved_2[bcast_header_at] == bcast_header_written.reserved_2[bcast_header_at]); bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 4 -> assert(bcast_header_read.log_time[bcast_header_at] == bcast_header_written.log_time[bcast_header_at]); bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> assert(bcast_header_read.alpha_char[bcast_header_at] == bcast_header_written.alpha_char[bcast_header_at]); bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> assert(bcast_header_read.transaction_code[bcast_header_at] == bcast_header_written.transaction_code[bcast_header_at]); bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> assert(bcast_header_read.error_code[bcast_header_at] == bcast_header_written.error_code[bcast_header_at]); bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 4 -> assert(bcast_header_read.bc_seq_no[bcast_header_at] == bcast_header_written.bc_seq_no[bcast_header_at]); bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  assert(bcast_header_read.reserved_18 == bcast_header_written.reserved_18);
  bcast_header_at = 0;
  do
  :: bcast_header_at < 3 -> assert(bcast_header_read.reserved_19[bcast_header_at] == bcast_header_written.reserved_19[bcast_header_at]); bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 8 -> assert(bcast_header_read.time_stamp_2[bcast_header_at] == bcast_header_written.time_stamp_2[bcast_header_at]); bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 8 -> assert(bcast_header_read.filler_2[bcast_header_at] == bcast_header_written.filler_2[bcast_header_at]); bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  bcast_header_at = 0;
  do
  :: bcast_header_at < 2 -> assert(bcast_header_read.message_length[bcast_header_at] == bcast_header_written.message_length[bcast_header_at]); bcast_header_at = bcast_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Open Price Message: 20 bytes ----------------------------------- */

/* Carries the open price of a security once it opens */
typedef SecurityOpenPriceMessage {
  byte symbol[10];
  byte series[2];
  byte token[4];
  byte opening_price[4]
};

int security_open_price_message_at;

/* every byte of Security Open Price Message set to one value */
inline fill_security_open_price_message(security_open_price_message_record, security_open_price_message_value) {
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 10 -> security_open_price_message_record.symbol[security_open_price_message_at] = security_open_price_message_value; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 2 -> security_open_price_message_record.series[security_open_price_message_at] = security_open_price_message_value; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> security_open_price_message_record.token[security_open_price_message_at] = security_open_price_message_value; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> security_open_price_message_record.opening_price[security_open_price_message_at] = security_open_price_message_value; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Open Price Message set to where it lies, so a field read out of place says so */
inline ramp_security_open_price_message(security_open_price_message_record, security_open_price_message_base) {
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 10 -> security_open_price_message_record.symbol[security_open_price_message_at] = (security_open_price_message_base + 0 + security_open_price_message_at + 1) % 256; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 2 -> security_open_price_message_record.series[security_open_price_message_at] = (security_open_price_message_base + 10 + security_open_price_message_at + 1) % 256; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> security_open_price_message_record.token[security_open_price_message_at] = (security_open_price_message_base + 12 + security_open_price_message_at + 1) % 256; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> security_open_price_message_record.opening_price[security_open_price_message_at] = (security_open_price_message_base + 16 + security_open_price_message_at + 1) % 256; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Open Price Message to the wire, 20 bytes from where the cursor stands */
inline encode_security_open_price_message(security_open_price_message_record) {
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 10 -> wire[at] = security_open_price_message_record.symbol[security_open_price_message_at]; at = at + 1; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 2 -> wire[at] = security_open_price_message_record.series[security_open_price_message_at]; at = at + 1; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> wire[at] = security_open_price_message_record.token[security_open_price_message_at]; at = at + 1; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> wire[at] = security_open_price_message_record.opening_price[security_open_price_message_at]; at = at + 1; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Open Price Message off the wire, 20 bytes from where the cursor stands */
inline decode_security_open_price_message(security_open_price_message_record) {
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 10 -> security_open_price_message_record.symbol[security_open_price_message_at] = wire[at]; at = at + 1; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 2 -> security_open_price_message_record.series[security_open_price_message_at] = wire[at]; at = at + 1; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> security_open_price_message_record.token[security_open_price_message_at] = wire[at]; at = at + 1; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> security_open_price_message_record.opening_price[security_open_price_message_at] = wire[at]; at = at + 1; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Open Price Message is what was written, byte for byte */
inline equal_security_open_price_message(security_open_price_message_read, security_open_price_message_written) {
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 10 -> assert(security_open_price_message_read.symbol[security_open_price_message_at] == security_open_price_message_written.symbol[security_open_price_message_at]); security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 2 -> assert(security_open_price_message_read.series[security_open_price_message_at] == security_open_price_message_written.series[security_open_price_message_at]); security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> assert(security_open_price_message_read.token[security_open_price_message_at] == security_open_price_message_written.token[security_open_price_message_at]); security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> assert(security_open_price_message_read.opening_price[security_open_price_message_at] == security_open_price_message_written.opening_price[security_open_price_message_at]); security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sec Info: 30 bytes ------------------------------------------------------ */

/* SEC_INFO */
typedef SecInfo {
  byte instrument_name[6];
  byte symbol[10];
  byte series[2];
  byte expiry_date[4];
  byte strike_price[4];
  byte option_type[2];
  byte ca_level[2]
};

int sec_info_at;

/* every byte of Sec Info set to one value */
inline fill_sec_info(sec_info_record, sec_info_value) {
  sec_info_at = 0;
  do
  :: sec_info_at < 6 -> sec_info_record.instrument_name[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
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
  sec_info_at = 0;
  do
  :: sec_info_at < 4 -> sec_info_record.expiry_date[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 4 -> sec_info_record.strike_price[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.option_type[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.ca_level[sec_info_at] = sec_info_value; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sec Info set to where it lies, so a field read out of place says so */
inline ramp_sec_info(sec_info_record, sec_info_base) {
  sec_info_at = 0;
  do
  :: sec_info_at < 6 -> sec_info_record.instrument_name[sec_info_at] = (sec_info_base + 0 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 10 -> sec_info_record.symbol[sec_info_at] = (sec_info_base + 6 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.series[sec_info_at] = (sec_info_base + 16 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 4 -> sec_info_record.expiry_date[sec_info_at] = (sec_info_base + 18 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 4 -> sec_info_record.strike_price[sec_info_at] = (sec_info_base + 22 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.option_type[sec_info_at] = (sec_info_base + 26 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.ca_level[sec_info_at] = (sec_info_base + 28 + sec_info_at + 1) % 256; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info to the wire, 30 bytes from where the cursor stands */
inline encode_sec_info(sec_info_record) {
  sec_info_at = 0;
  do
  :: sec_info_at < 6 -> wire[at] = sec_info_record.instrument_name[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
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
  sec_info_at = 0;
  do
  :: sec_info_at < 4 -> wire[at] = sec_info_record.expiry_date[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 4 -> wire[at] = sec_info_record.strike_price[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> wire[at] = sec_info_record.option_type[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> wire[at] = sec_info_record.ca_level[sec_info_at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info off the wire, 30 bytes from where the cursor stands */
inline decode_sec_info(sec_info_record) {
  sec_info_at = 0;
  do
  :: sec_info_at < 6 -> sec_info_record.instrument_name[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
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
  sec_info_at = 0;
  do
  :: sec_info_at < 4 -> sec_info_record.expiry_date[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 4 -> sec_info_record.strike_price[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.option_type[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> sec_info_record.ca_level[sec_info_at] = wire[at]; at = at + 1; sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sec Info is what was written, byte for byte */
inline equal_sec_info(sec_info_read, sec_info_written) {
  sec_info_at = 0;
  do
  :: sec_info_at < 6 -> assert(sec_info_read.instrument_name[sec_info_at] == sec_info_written.instrument_name[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
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
  sec_info_at = 0;
  do
  :: sec_info_at < 4 -> assert(sec_info_read.expiry_date[sec_info_at] == sec_info_written.expiry_date[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 4 -> assert(sec_info_read.strike_price[sec_info_at] == sec_info_written.strike_price[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> assert(sec_info_read.option_type[sec_info_at] == sec_info_written.option_type[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  sec_info_at = 0;
  do
  :: sec_info_at < 2 -> assert(sec_info_read.ca_level[sec_info_at] == sec_info_written.ca_level[sec_info_at]); sec_info_at = sec_info_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Master Change Message: 38 bytes ------------------------------ */

/* Broadcasts a change to the instrument master */
typedef InstrumentMasterChangeMessage {
  byte instrument_id[2];
  byte instrument_name[6];
  byte instrument_description[25];
  byte instrument_update_time[4];
  byte delete_flag
};

int instrument_master_change_message_at;

/* every byte of Instrument Master Change Message set to one value */
inline fill_instrument_master_change_message(instrument_master_change_message_record, instrument_master_change_message_value) {
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 2 -> instrument_master_change_message_record.instrument_id[instrument_master_change_message_at] = instrument_master_change_message_value; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 6 -> instrument_master_change_message_record.instrument_name[instrument_master_change_message_at] = instrument_master_change_message_value; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 25 -> instrument_master_change_message_record.instrument_description[instrument_master_change_message_at] = instrument_master_change_message_value; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 4 -> instrument_master_change_message_record.instrument_update_time[instrument_master_change_message_at] = instrument_master_change_message_value; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_record.delete_flag = instrument_master_change_message_value;
  skip
}

/* each byte of Instrument Master Change Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_master_change_message(instrument_master_change_message_record, instrument_master_change_message_base) {
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 2 -> instrument_master_change_message_record.instrument_id[instrument_master_change_message_at] = (instrument_master_change_message_base + 0 + instrument_master_change_message_at + 1) % 256; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 6 -> instrument_master_change_message_record.instrument_name[instrument_master_change_message_at] = (instrument_master_change_message_base + 2 + instrument_master_change_message_at + 1) % 256; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 25 -> instrument_master_change_message_record.instrument_description[instrument_master_change_message_at] = (instrument_master_change_message_base + 8 + instrument_master_change_message_at + 1) % 256; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 4 -> instrument_master_change_message_record.instrument_update_time[instrument_master_change_message_at] = (instrument_master_change_message_base + 33 + instrument_master_change_message_at + 1) % 256; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_record.delete_flag = (instrument_master_change_message_base + 37 + 1) % 256;
  skip
}

/* Instrument Master Change Message to the wire, 38 bytes from where the cursor stands */
inline encode_instrument_master_change_message(instrument_master_change_message_record) {
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 2 -> wire[at] = instrument_master_change_message_record.instrument_id[instrument_master_change_message_at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 6 -> wire[at] = instrument_master_change_message_record.instrument_name[instrument_master_change_message_at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 25 -> wire[at] = instrument_master_change_message_record.instrument_description[instrument_master_change_message_at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 4 -> wire[at] = instrument_master_change_message_record.instrument_update_time[instrument_master_change_message_at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_master_change_message_record.delete_flag; at = at + 1;
  skip
}

/* Instrument Master Change Message off the wire, 38 bytes from where the cursor stands */
inline decode_instrument_master_change_message(instrument_master_change_message_record) {
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 2 -> instrument_master_change_message_record.instrument_id[instrument_master_change_message_at] = wire[at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 6 -> instrument_master_change_message_record.instrument_name[instrument_master_change_message_at] = wire[at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 25 -> instrument_master_change_message_record.instrument_description[instrument_master_change_message_at] = wire[at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 4 -> instrument_master_change_message_record.instrument_update_time[instrument_master_change_message_at] = wire[at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_record.delete_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Master Change Message is what was written, byte for byte */
inline equal_instrument_master_change_message(instrument_master_change_message_read, instrument_master_change_message_written) {
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 2 -> assert(instrument_master_change_message_read.instrument_id[instrument_master_change_message_at] == instrument_master_change_message_written.instrument_id[instrument_master_change_message_at]); instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 6 -> assert(instrument_master_change_message_read.instrument_name[instrument_master_change_message_at] == instrument_master_change_message_written.instrument_name[instrument_master_change_message_at]); instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 25 -> assert(instrument_master_change_message_read.instrument_description[instrument_master_change_message_at] == instrument_master_change_message_written.instrument_description[instrument_master_change_message_at]); instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 4 -> assert(instrument_master_change_message_read.instrument_update_time[instrument_master_change_message_at] == instrument_master_change_message_written.instrument_update_time[instrument_master_change_message_at]); instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  assert(instrument_master_change_message_read.delete_flag == instrument_master_change_message_written.delete_flag);
  skip
}

/* ---- Participant Master Change Message: 43 bytes ----------------------------- */

/* Broadcasts a change to the participant master */
typedef ParticipantMasterChangeMessage {
  byte participant_id[12];
  byte participant_name[25];
  byte participant_status;
  byte participant_update_date_time[4];
  byte delete_flag
};

int participant_master_change_message_at;

/* every byte of Participant Master Change Message set to one value */
inline fill_participant_master_change_message(participant_master_change_message_record, participant_master_change_message_value) {
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 12 -> participant_master_change_message_record.participant_id[participant_master_change_message_at] = participant_master_change_message_value; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 25 -> participant_master_change_message_record.participant_name[participant_master_change_message_at] = participant_master_change_message_value; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  participant_master_change_message_record.participant_status = participant_master_change_message_value;
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 4 -> participant_master_change_message_record.participant_update_date_time[participant_master_change_message_at] = participant_master_change_message_value; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  participant_master_change_message_record.delete_flag = participant_master_change_message_value;
  skip
}

/* each byte of Participant Master Change Message set to where it lies, so a field read out of place says so */
inline ramp_participant_master_change_message(participant_master_change_message_record, participant_master_change_message_base) {
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 12 -> participant_master_change_message_record.participant_id[participant_master_change_message_at] = (participant_master_change_message_base + 0 + participant_master_change_message_at + 1) % 256; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 25 -> participant_master_change_message_record.participant_name[participant_master_change_message_at] = (participant_master_change_message_base + 12 + participant_master_change_message_at + 1) % 256; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  participant_master_change_message_record.participant_status = (participant_master_change_message_base + 37 + 1) % 256;
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 4 -> participant_master_change_message_record.participant_update_date_time[participant_master_change_message_at] = (participant_master_change_message_base + 38 + participant_master_change_message_at + 1) % 256; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  participant_master_change_message_record.delete_flag = (participant_master_change_message_base + 42 + 1) % 256;
  skip
}

/* Participant Master Change Message to the wire, 43 bytes from where the cursor stands */
inline encode_participant_master_change_message(participant_master_change_message_record) {
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 12 -> wire[at] = participant_master_change_message_record.participant_id[participant_master_change_message_at]; at = at + 1; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 25 -> wire[at] = participant_master_change_message_record.participant_name[participant_master_change_message_at]; at = at + 1; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  wire[at] = participant_master_change_message_record.participant_status; at = at + 1;
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 4 -> wire[at] = participant_master_change_message_record.participant_update_date_time[participant_master_change_message_at]; at = at + 1; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  wire[at] = participant_master_change_message_record.delete_flag; at = at + 1;
  skip
}

/* Participant Master Change Message off the wire, 43 bytes from where the cursor stands */
inline decode_participant_master_change_message(participant_master_change_message_record) {
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 12 -> participant_master_change_message_record.participant_id[participant_master_change_message_at] = wire[at]; at = at + 1; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 25 -> participant_master_change_message_record.participant_name[participant_master_change_message_at] = wire[at]; at = at + 1; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  participant_master_change_message_record.participant_status = wire[at]; at = at + 1;
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 4 -> participant_master_change_message_record.participant_update_date_time[participant_master_change_message_at] = wire[at]; at = at + 1; participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  participant_master_change_message_record.delete_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Participant Master Change Message is what was written, byte for byte */
inline equal_participant_master_change_message(participant_master_change_message_read, participant_master_change_message_written) {
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 12 -> assert(participant_master_change_message_read.participant_id[participant_master_change_message_at] == participant_master_change_message_written.participant_id[participant_master_change_message_at]); participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 25 -> assert(participant_master_change_message_read.participant_name[participant_master_change_message_at] == participant_master_change_message_written.participant_name[participant_master_change_message_at]); participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  assert(participant_master_change_message_read.participant_status == participant_master_change_message_written.participant_status);
  participant_master_change_message_at = 0;
  do
  :: participant_master_change_message_at < 4 -> assert(participant_master_change_message_read.participant_update_date_time[participant_master_change_message_at] == participant_master_change_message_written.participant_update_date_time[participant_master_change_message_at]); participant_master_change_message_at = participant_master_change_message_at + 1
  :: else -> break
  od;
  assert(participant_master_change_message_read.delete_flag == participant_master_change_message_written.delete_flag);
  skip
}

/* ---- Turnover Limit Exceeded Body: 58 bytes ---------------------------------- */

/* Turnover Limit Exceeded Body */
typedef TurnoverLimitExceededBody {
  byte broker_code[5];
  byte counter_broker_code[5];
  byte warning_type[2];
  byte token[4];
  byte instrument_name[6];
  byte symbol[10];
  byte expiry_date[4];
  byte strike_price[4];
  byte option_type[2];
  byte ca_level[2];
  byte trade_number[4];
  byte trade_price[4];
  byte trade_volume[4];
  byte final;
  byte filler
};

int turnover_limit_exceeded_body_at;

/* every byte of Turnover Limit Exceeded Body set to one value */
inline fill_turnover_limit_exceeded_body(turnover_limit_exceeded_body_record, turnover_limit_exceeded_body_value) {
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 5 -> turnover_limit_exceeded_body_record.broker_code[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 5 -> turnover_limit_exceeded_body_record.counter_broker_code[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> turnover_limit_exceeded_body_record.warning_type[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.token[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 6 -> turnover_limit_exceeded_body_record.instrument_name[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 10 -> turnover_limit_exceeded_body_record.symbol[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.expiry_date[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.strike_price[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> turnover_limit_exceeded_body_record.option_type[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> turnover_limit_exceeded_body_record.ca_level[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.trade_number[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.trade_price[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.trade_volume[turnover_limit_exceeded_body_at] = turnover_limit_exceeded_body_value; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_record.final = turnover_limit_exceeded_body_value;
  turnover_limit_exceeded_body_record.filler = turnover_limit_exceeded_body_value;
  skip
}

/* each byte of Turnover Limit Exceeded Body set to where it lies, so a field read out of place says so */
inline ramp_turnover_limit_exceeded_body(turnover_limit_exceeded_body_record, turnover_limit_exceeded_body_base) {
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 5 -> turnover_limit_exceeded_body_record.broker_code[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 0 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 5 -> turnover_limit_exceeded_body_record.counter_broker_code[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 5 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> turnover_limit_exceeded_body_record.warning_type[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 10 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.token[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 12 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 6 -> turnover_limit_exceeded_body_record.instrument_name[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 16 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 10 -> turnover_limit_exceeded_body_record.symbol[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 22 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.expiry_date[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 32 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.strike_price[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 36 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> turnover_limit_exceeded_body_record.option_type[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 40 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> turnover_limit_exceeded_body_record.ca_level[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 42 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.trade_number[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 44 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.trade_price[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 48 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.trade_volume[turnover_limit_exceeded_body_at] = (turnover_limit_exceeded_body_base + 52 + turnover_limit_exceeded_body_at + 1) % 256; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_record.final = (turnover_limit_exceeded_body_base + 56 + 1) % 256;
  turnover_limit_exceeded_body_record.filler = (turnover_limit_exceeded_body_base + 57 + 1) % 256;
  skip
}

/* Turnover Limit Exceeded Body to the wire, 58 bytes from where the cursor stands */
inline encode_turnover_limit_exceeded_body(turnover_limit_exceeded_body_record) {
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 5 -> wire[at] = turnover_limit_exceeded_body_record.broker_code[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 5 -> wire[at] = turnover_limit_exceeded_body_record.counter_broker_code[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> wire[at] = turnover_limit_exceeded_body_record.warning_type[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> wire[at] = turnover_limit_exceeded_body_record.token[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 6 -> wire[at] = turnover_limit_exceeded_body_record.instrument_name[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 10 -> wire[at] = turnover_limit_exceeded_body_record.symbol[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> wire[at] = turnover_limit_exceeded_body_record.expiry_date[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> wire[at] = turnover_limit_exceeded_body_record.strike_price[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> wire[at] = turnover_limit_exceeded_body_record.option_type[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> wire[at] = turnover_limit_exceeded_body_record.ca_level[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> wire[at] = turnover_limit_exceeded_body_record.trade_number[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> wire[at] = turnover_limit_exceeded_body_record.trade_price[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> wire[at] = turnover_limit_exceeded_body_record.trade_volume[turnover_limit_exceeded_body_at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  wire[at] = turnover_limit_exceeded_body_record.final; at = at + 1;
  wire[at] = turnover_limit_exceeded_body_record.filler; at = at + 1;
  skip
}

/* Turnover Limit Exceeded Body off the wire, 58 bytes from where the cursor stands */
inline decode_turnover_limit_exceeded_body(turnover_limit_exceeded_body_record) {
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 5 -> turnover_limit_exceeded_body_record.broker_code[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 5 -> turnover_limit_exceeded_body_record.counter_broker_code[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> turnover_limit_exceeded_body_record.warning_type[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.token[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 6 -> turnover_limit_exceeded_body_record.instrument_name[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 10 -> turnover_limit_exceeded_body_record.symbol[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.expiry_date[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.strike_price[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> turnover_limit_exceeded_body_record.option_type[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> turnover_limit_exceeded_body_record.ca_level[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.trade_number[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.trade_price[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> turnover_limit_exceeded_body_record.trade_volume[turnover_limit_exceeded_body_at] = wire[at]; at = at + 1; turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_record.final = wire[at]; at = at + 1;
  turnover_limit_exceeded_body_record.filler = wire[at]; at = at + 1;
  skip
}

/* what was read of Turnover Limit Exceeded Body is what was written, byte for byte */
inline equal_turnover_limit_exceeded_body(turnover_limit_exceeded_body_read, turnover_limit_exceeded_body_written) {
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 5 -> assert(turnover_limit_exceeded_body_read.broker_code[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.broker_code[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 5 -> assert(turnover_limit_exceeded_body_read.counter_broker_code[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.counter_broker_code[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> assert(turnover_limit_exceeded_body_read.warning_type[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.warning_type[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> assert(turnover_limit_exceeded_body_read.token[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.token[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 6 -> assert(turnover_limit_exceeded_body_read.instrument_name[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.instrument_name[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 10 -> assert(turnover_limit_exceeded_body_read.symbol[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.symbol[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> assert(turnover_limit_exceeded_body_read.expiry_date[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.expiry_date[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> assert(turnover_limit_exceeded_body_read.strike_price[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.strike_price[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> assert(turnover_limit_exceeded_body_read.option_type[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.option_type[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 2 -> assert(turnover_limit_exceeded_body_read.ca_level[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.ca_level[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> assert(turnover_limit_exceeded_body_read.trade_number[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.trade_number[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> assert(turnover_limit_exceeded_body_read.trade_price[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.trade_price[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_body_at = 0;
  do
  :: turnover_limit_exceeded_body_at < 4 -> assert(turnover_limit_exceeded_body_read.trade_volume[turnover_limit_exceeded_body_at] == turnover_limit_exceeded_body_written.trade_volume[turnover_limit_exceeded_body_at]); turnover_limit_exceeded_body_at = turnover_limit_exceeded_body_at + 1
  :: else -> break
  od;
  assert(turnover_limit_exceeded_body_read.final == turnover_limit_exceeded_body_written.final);
  assert(turnover_limit_exceeded_body_read.filler == turnover_limit_exceeded_body_written.filler);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Bcast Header: encoded, read back, and compared */
proctype check_bcast_header() {
  BcastHeader bcast_header_sent;
  BcastHeader bcast_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bcast_header(bcast_header_sent, 0)
  :: pattern == 1 -> fill_bcast_header(bcast_header_sent, 32)
  :: pattern == 2 -> fill_bcast_header(bcast_header_sent, 255)
  :: else -> ramp_bcast_header(bcast_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bcast_header(bcast_header_sent);
    assert(at == 40);
    at = 0;
    decode_bcast_header(bcast_header_got);
    assert(at == 40);
    equal_bcast_header(bcast_header_got, bcast_header_sent)
  }
}

/* Security Open Price Message: encoded, read back, and compared */
proctype check_security_open_price_message() {
  SecurityOpenPriceMessage security_open_price_message_sent;
  SecurityOpenPriceMessage security_open_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_open_price_message(security_open_price_message_sent, 0)
  :: pattern == 1 -> fill_security_open_price_message(security_open_price_message_sent, 32)
  :: pattern == 2 -> fill_security_open_price_message(security_open_price_message_sent, 255)
  :: else -> ramp_security_open_price_message(security_open_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_open_price_message(security_open_price_message_sent);
    assert(at == 20);
    at = 0;
    decode_security_open_price_message(security_open_price_message_got);
    assert(at == 20);
    equal_security_open_price_message(security_open_price_message_got, security_open_price_message_sent)
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
    assert(at == 30);
    at = 0;
    decode_sec_info(sec_info_got);
    assert(at == 30);
    equal_sec_info(sec_info_got, sec_info_sent)
  }
}

/* Instrument Master Change Message: encoded, read back, and compared */
proctype check_instrument_master_change_message() {
  InstrumentMasterChangeMessage instrument_master_change_message_sent;
  InstrumentMasterChangeMessage instrument_master_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_master_change_message(instrument_master_change_message_sent, 0)
  :: pattern == 1 -> fill_instrument_master_change_message(instrument_master_change_message_sent, 32)
  :: pattern == 2 -> fill_instrument_master_change_message(instrument_master_change_message_sent, 255)
  :: else -> ramp_instrument_master_change_message(instrument_master_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_master_change_message(instrument_master_change_message_sent);
    assert(at == 38);
    at = 0;
    decode_instrument_master_change_message(instrument_master_change_message_got);
    assert(at == 38);
    equal_instrument_master_change_message(instrument_master_change_message_got, instrument_master_change_message_sent)
  }
}

/* Participant Master Change Message: encoded, read back, and compared */
proctype check_participant_master_change_message() {
  ParticipantMasterChangeMessage participant_master_change_message_sent;
  ParticipantMasterChangeMessage participant_master_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_participant_master_change_message(participant_master_change_message_sent, 0)
  :: pattern == 1 -> fill_participant_master_change_message(participant_master_change_message_sent, 32)
  :: pattern == 2 -> fill_participant_master_change_message(participant_master_change_message_sent, 255)
  :: else -> ramp_participant_master_change_message(participant_master_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_participant_master_change_message(participant_master_change_message_sent);
    assert(at == 43);
    at = 0;
    decode_participant_master_change_message(participant_master_change_message_got);
    assert(at == 43);
    equal_participant_master_change_message(participant_master_change_message_got, participant_master_change_message_sent)
  }
}

/* Turnover Limit Exceeded Body: encoded, read back, and compared */
proctype check_turnover_limit_exceeded_body() {
  TurnoverLimitExceededBody turnover_limit_exceeded_body_sent;
  TurnoverLimitExceededBody turnover_limit_exceeded_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_turnover_limit_exceeded_body(turnover_limit_exceeded_body_sent, 0)
  :: pattern == 1 -> fill_turnover_limit_exceeded_body(turnover_limit_exceeded_body_sent, 32)
  :: pattern == 2 -> fill_turnover_limit_exceeded_body(turnover_limit_exceeded_body_sent, 255)
  :: else -> ramp_turnover_limit_exceeded_body(turnover_limit_exceeded_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_turnover_limit_exceeded_body(turnover_limit_exceeded_body_sent);
    assert(at == 58);
    at = 0;
    decode_turnover_limit_exceeded_body(turnover_limit_exceeded_body_got);
    assert(at == 58);
    equal_turnover_limit_exceeded_body(turnover_limit_exceeded_body_got, turnover_limit_exceeded_body_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_bcast_header()
  :: run check_security_open_price_message()
  :: run check_sec_info()
  :: run check_instrument_master_change_message()
  :: run check_participant_master_change_message()
  :: run check_turnover_limit_exceeded_body()
  fi
}
