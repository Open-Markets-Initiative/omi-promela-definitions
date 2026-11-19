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

/* ---- Instrument Master Change Message: 39 bytes ------------------------------ */

/* Broadcasts a change to the instrument master */
typedef InstrumentMasterChangeMessage {
  byte instrument_id[2];
  byte instrument_name[6];
  byte instrument_description[26];
  byte instrument_update_date_time[4];
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
  :: instrument_master_change_message_at < 26 -> instrument_master_change_message_record.instrument_description[instrument_master_change_message_at] = instrument_master_change_message_value; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 4 -> instrument_master_change_message_record.instrument_update_date_time[instrument_master_change_message_at] = instrument_master_change_message_value; instrument_master_change_message_at = instrument_master_change_message_at + 1
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
  :: instrument_master_change_message_at < 26 -> instrument_master_change_message_record.instrument_description[instrument_master_change_message_at] = (instrument_master_change_message_base + 8 + instrument_master_change_message_at + 1) % 256; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 4 -> instrument_master_change_message_record.instrument_update_date_time[instrument_master_change_message_at] = (instrument_master_change_message_base + 34 + instrument_master_change_message_at + 1) % 256; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_record.delete_flag = (instrument_master_change_message_base + 38 + 1) % 256;
  skip
}

/* Instrument Master Change Message to the wire, 39 bytes from where the cursor stands */
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
  :: instrument_master_change_message_at < 26 -> wire[at] = instrument_master_change_message_record.instrument_description[instrument_master_change_message_at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 4 -> wire[at] = instrument_master_change_message_record.instrument_update_date_time[instrument_master_change_message_at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_master_change_message_record.delete_flag; at = at + 1;
  skip
}

/* Instrument Master Change Message off the wire, 39 bytes from where the cursor stands */
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
  :: instrument_master_change_message_at < 26 -> instrument_master_change_message_record.instrument_description[instrument_master_change_message_at] = wire[at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 4 -> instrument_master_change_message_record.instrument_update_date_time[instrument_master_change_message_at] = wire[at]; at = at + 1; instrument_master_change_message_at = instrument_master_change_message_at + 1
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
  :: instrument_master_change_message_at < 26 -> assert(instrument_master_change_message_read.instrument_description[instrument_master_change_message_at] == instrument_master_change_message_written.instrument_description[instrument_master_change_message_at]); instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  instrument_master_change_message_at = 0;
  do
  :: instrument_master_change_message_at < 4 -> assert(instrument_master_change_message_read.instrument_update_date_time[instrument_master_change_message_at] == instrument_master_change_message_written.instrument_update_date_time[instrument_master_change_message_at]); instrument_master_change_message_at = instrument_master_change_message_at + 1
  :: else -> break
  od;
  assert(instrument_master_change_message_read.delete_flag == instrument_master_change_message_written.delete_flag);
  skip
}

/* ---- Participant Master Change Message: 43 bytes ----------------------------- */

/* Broadcasts a change to a participant */
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

/* ---- Turnover Exceeded Message: 58 bytes ------------------------------------- */

/* Broadcast when a broker's turnover limit is about to exceed or has exceeded, or when the broker is reactivated */
typedef TurnoverExceededMessage {
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
  byte c_filler
};

int turnover_exceeded_message_at;

/* every byte of Turnover Exceeded Message set to one value */
inline fill_turnover_exceeded_message(turnover_exceeded_message_record, turnover_exceeded_message_value) {
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 5 -> turnover_exceeded_message_record.broker_code[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 5 -> turnover_exceeded_message_record.counter_broker_code[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> turnover_exceeded_message_record.warning_type[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.token[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 6 -> turnover_exceeded_message_record.instrument_name[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 10 -> turnover_exceeded_message_record.symbol[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.expiry_date[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.strike_price[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> turnover_exceeded_message_record.option_type[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> turnover_exceeded_message_record.ca_level[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_number[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_price[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_volume[turnover_exceeded_message_at] = turnover_exceeded_message_value; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_record.final = turnover_exceeded_message_value;
  turnover_exceeded_message_record.c_filler = turnover_exceeded_message_value;
  skip
}

/* each byte of Turnover Exceeded Message set to where it lies, so a field read out of place says so */
inline ramp_turnover_exceeded_message(turnover_exceeded_message_record, turnover_exceeded_message_base) {
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 5 -> turnover_exceeded_message_record.broker_code[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 0 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 5 -> turnover_exceeded_message_record.counter_broker_code[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 5 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> turnover_exceeded_message_record.warning_type[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 10 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.token[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 12 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 6 -> turnover_exceeded_message_record.instrument_name[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 16 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 10 -> turnover_exceeded_message_record.symbol[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 22 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.expiry_date[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 32 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.strike_price[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 36 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> turnover_exceeded_message_record.option_type[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 40 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> turnover_exceeded_message_record.ca_level[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 42 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_number[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 44 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_price[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 48 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_volume[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 52 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_record.final = (turnover_exceeded_message_base + 56 + 1) % 256;
  turnover_exceeded_message_record.c_filler = (turnover_exceeded_message_base + 57 + 1) % 256;
  skip
}

/* Turnover Exceeded Message to the wire, 58 bytes from where the cursor stands */
inline encode_turnover_exceeded_message(turnover_exceeded_message_record) {
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 5 -> wire[at] = turnover_exceeded_message_record.broker_code[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 5 -> wire[at] = turnover_exceeded_message_record.counter_broker_code[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> wire[at] = turnover_exceeded_message_record.warning_type[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> wire[at] = turnover_exceeded_message_record.token[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 6 -> wire[at] = turnover_exceeded_message_record.instrument_name[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 10 -> wire[at] = turnover_exceeded_message_record.symbol[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> wire[at] = turnover_exceeded_message_record.expiry_date[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> wire[at] = turnover_exceeded_message_record.strike_price[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> wire[at] = turnover_exceeded_message_record.option_type[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> wire[at] = turnover_exceeded_message_record.ca_level[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> wire[at] = turnover_exceeded_message_record.trade_number[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> wire[at] = turnover_exceeded_message_record.trade_price[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> wire[at] = turnover_exceeded_message_record.trade_volume[turnover_exceeded_message_at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  wire[at] = turnover_exceeded_message_record.final; at = at + 1;
  wire[at] = turnover_exceeded_message_record.c_filler; at = at + 1;
  skip
}

/* Turnover Exceeded Message off the wire, 58 bytes from where the cursor stands */
inline decode_turnover_exceeded_message(turnover_exceeded_message_record) {
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 5 -> turnover_exceeded_message_record.broker_code[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 5 -> turnover_exceeded_message_record.counter_broker_code[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> turnover_exceeded_message_record.warning_type[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.token[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 6 -> turnover_exceeded_message_record.instrument_name[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 10 -> turnover_exceeded_message_record.symbol[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.expiry_date[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.strike_price[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> turnover_exceeded_message_record.option_type[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> turnover_exceeded_message_record.ca_level[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_number[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_price[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_volume[turnover_exceeded_message_at] = wire[at]; at = at + 1; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_record.final = wire[at]; at = at + 1;
  turnover_exceeded_message_record.c_filler = wire[at]; at = at + 1;
  skip
}

/* what was read of Turnover Exceeded Message is what was written, byte for byte */
inline equal_turnover_exceeded_message(turnover_exceeded_message_read, turnover_exceeded_message_written) {
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 5 -> assert(turnover_exceeded_message_read.broker_code[turnover_exceeded_message_at] == turnover_exceeded_message_written.broker_code[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 5 -> assert(turnover_exceeded_message_read.counter_broker_code[turnover_exceeded_message_at] == turnover_exceeded_message_written.counter_broker_code[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> assert(turnover_exceeded_message_read.warning_type[turnover_exceeded_message_at] == turnover_exceeded_message_written.warning_type[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> assert(turnover_exceeded_message_read.token[turnover_exceeded_message_at] == turnover_exceeded_message_written.token[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 6 -> assert(turnover_exceeded_message_read.instrument_name[turnover_exceeded_message_at] == turnover_exceeded_message_written.instrument_name[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 10 -> assert(turnover_exceeded_message_read.symbol[turnover_exceeded_message_at] == turnover_exceeded_message_written.symbol[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> assert(turnover_exceeded_message_read.expiry_date[turnover_exceeded_message_at] == turnover_exceeded_message_written.expiry_date[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> assert(turnover_exceeded_message_read.strike_price[turnover_exceeded_message_at] == turnover_exceeded_message_written.strike_price[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> assert(turnover_exceeded_message_read.option_type[turnover_exceeded_message_at] == turnover_exceeded_message_written.option_type[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 2 -> assert(turnover_exceeded_message_read.ca_level[turnover_exceeded_message_at] == turnover_exceeded_message_written.ca_level[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> assert(turnover_exceeded_message_read.trade_number[turnover_exceeded_message_at] == turnover_exceeded_message_written.trade_number[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> assert(turnover_exceeded_message_read.trade_price[turnover_exceeded_message_at] == turnover_exceeded_message_written.trade_price[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> assert(turnover_exceeded_message_read.trade_volume[turnover_exceeded_message_at] == turnover_exceeded_message_written.trade_volume[turnover_exceeded_message_at]); turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  assert(turnover_exceeded_message_read.final == turnover_exceeded_message_written.final);
  assert(turnover_exceeded_message_read.c_filler == turnover_exceeded_message_written.c_filler);
  skip
}

/* ---- Currency Assets Message: 36 bytes --------------------------------------- */

/* Broadcasts the price details of an asset */
typedef CurrencyAssetsMessage {
  byte token[4];
  byte bid_price[4];
  byte ask_price[4];
  byte deal_price[4];
  byte symbol[10];
  byte instrument[6];
  byte closing_price[4]
};

int currency_assets_message_at;

/* every byte of Currency Assets Message set to one value */
inline fill_currency_assets_message(currency_assets_message_record, currency_assets_message_value) {
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.token[currency_assets_message_at] = currency_assets_message_value; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.bid_price[currency_assets_message_at] = currency_assets_message_value; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.ask_price[currency_assets_message_at] = currency_assets_message_value; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.deal_price[currency_assets_message_at] = currency_assets_message_value; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 10 -> currency_assets_message_record.symbol[currency_assets_message_at] = currency_assets_message_value; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 6 -> currency_assets_message_record.instrument[currency_assets_message_at] = currency_assets_message_value; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.closing_price[currency_assets_message_at] = currency_assets_message_value; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Currency Assets Message set to where it lies, so a field read out of place says so */
inline ramp_currency_assets_message(currency_assets_message_record, currency_assets_message_base) {
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.token[currency_assets_message_at] = (currency_assets_message_base + 0 + currency_assets_message_at + 1) % 256; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.bid_price[currency_assets_message_at] = (currency_assets_message_base + 4 + currency_assets_message_at + 1) % 256; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.ask_price[currency_assets_message_at] = (currency_assets_message_base + 8 + currency_assets_message_at + 1) % 256; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.deal_price[currency_assets_message_at] = (currency_assets_message_base + 12 + currency_assets_message_at + 1) % 256; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 10 -> currency_assets_message_record.symbol[currency_assets_message_at] = (currency_assets_message_base + 16 + currency_assets_message_at + 1) % 256; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 6 -> currency_assets_message_record.instrument[currency_assets_message_at] = (currency_assets_message_base + 26 + currency_assets_message_at + 1) % 256; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.closing_price[currency_assets_message_at] = (currency_assets_message_base + 32 + currency_assets_message_at + 1) % 256; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  skip
}

/* Currency Assets Message to the wire, 36 bytes from where the cursor stands */
inline encode_currency_assets_message(currency_assets_message_record) {
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> wire[at] = currency_assets_message_record.token[currency_assets_message_at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> wire[at] = currency_assets_message_record.bid_price[currency_assets_message_at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> wire[at] = currency_assets_message_record.ask_price[currency_assets_message_at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> wire[at] = currency_assets_message_record.deal_price[currency_assets_message_at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 10 -> wire[at] = currency_assets_message_record.symbol[currency_assets_message_at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 6 -> wire[at] = currency_assets_message_record.instrument[currency_assets_message_at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> wire[at] = currency_assets_message_record.closing_price[currency_assets_message_at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  skip
}

/* Currency Assets Message off the wire, 36 bytes from where the cursor stands */
inline decode_currency_assets_message(currency_assets_message_record) {
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.token[currency_assets_message_at] = wire[at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.bid_price[currency_assets_message_at] = wire[at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.ask_price[currency_assets_message_at] = wire[at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.deal_price[currency_assets_message_at] = wire[at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 10 -> currency_assets_message_record.symbol[currency_assets_message_at] = wire[at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 6 -> currency_assets_message_record.instrument[currency_assets_message_at] = wire[at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> currency_assets_message_record.closing_price[currency_assets_message_at] = wire[at]; at = at + 1; currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Currency Assets Message is what was written, byte for byte */
inline equal_currency_assets_message(currency_assets_message_read, currency_assets_message_written) {
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> assert(currency_assets_message_read.token[currency_assets_message_at] == currency_assets_message_written.token[currency_assets_message_at]); currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> assert(currency_assets_message_read.bid_price[currency_assets_message_at] == currency_assets_message_written.bid_price[currency_assets_message_at]); currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> assert(currency_assets_message_read.ask_price[currency_assets_message_at] == currency_assets_message_written.ask_price[currency_assets_message_at]); currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> assert(currency_assets_message_read.deal_price[currency_assets_message_at] == currency_assets_message_written.deal_price[currency_assets_message_at]); currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 10 -> assert(currency_assets_message_read.symbol[currency_assets_message_at] == currency_assets_message_written.symbol[currency_assets_message_at]); currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 6 -> assert(currency_assets_message_read.instrument[currency_assets_message_at] == currency_assets_message_written.instrument[currency_assets_message_at]); currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  currency_assets_message_at = 0;
  do
  :: currency_assets_message_at < 4 -> assert(currency_assets_message_read.closing_price[currency_assets_message_at] == currency_assets_message_written.closing_price[currency_assets_message_at]); currency_assets_message_at = currency_assets_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Asset Interest Rate Change Message: 12 bytes ---------------------------- */

/* Broadcast when the interest rates or volatility of an asset change */
typedef AssetInterestRateChangeMessage {
  byte token[4];
  byte foreign_interest_rate[2];
  byte volatility[4];
  byte domestic_interest_rate[2]
};

int asset_interest_rate_change_message_at;

/* every byte of Asset Interest Rate Change Message set to one value */
inline fill_asset_interest_rate_change_message(asset_interest_rate_change_message_record, asset_interest_rate_change_message_value) {
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 4 -> asset_interest_rate_change_message_record.token[asset_interest_rate_change_message_at] = asset_interest_rate_change_message_value; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 2 -> asset_interest_rate_change_message_record.foreign_interest_rate[asset_interest_rate_change_message_at] = asset_interest_rate_change_message_value; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 4 -> asset_interest_rate_change_message_record.volatility[asset_interest_rate_change_message_at] = asset_interest_rate_change_message_value; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 2 -> asset_interest_rate_change_message_record.domestic_interest_rate[asset_interest_rate_change_message_at] = asset_interest_rate_change_message_value; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Asset Interest Rate Change Message set to where it lies, so a field read out of place says so */
inline ramp_asset_interest_rate_change_message(asset_interest_rate_change_message_record, asset_interest_rate_change_message_base) {
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 4 -> asset_interest_rate_change_message_record.token[asset_interest_rate_change_message_at] = (asset_interest_rate_change_message_base + 0 + asset_interest_rate_change_message_at + 1) % 256; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 2 -> asset_interest_rate_change_message_record.foreign_interest_rate[asset_interest_rate_change_message_at] = (asset_interest_rate_change_message_base + 4 + asset_interest_rate_change_message_at + 1) % 256; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 4 -> asset_interest_rate_change_message_record.volatility[asset_interest_rate_change_message_at] = (asset_interest_rate_change_message_base + 6 + asset_interest_rate_change_message_at + 1) % 256; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 2 -> asset_interest_rate_change_message_record.domestic_interest_rate[asset_interest_rate_change_message_at] = (asset_interest_rate_change_message_base + 10 + asset_interest_rate_change_message_at + 1) % 256; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Asset Interest Rate Change Message to the wire, 12 bytes from where the cursor stands */
inline encode_asset_interest_rate_change_message(asset_interest_rate_change_message_record) {
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 4 -> wire[at] = asset_interest_rate_change_message_record.token[asset_interest_rate_change_message_at]; at = at + 1; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 2 -> wire[at] = asset_interest_rate_change_message_record.foreign_interest_rate[asset_interest_rate_change_message_at]; at = at + 1; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 4 -> wire[at] = asset_interest_rate_change_message_record.volatility[asset_interest_rate_change_message_at]; at = at + 1; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 2 -> wire[at] = asset_interest_rate_change_message_record.domestic_interest_rate[asset_interest_rate_change_message_at]; at = at + 1; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Asset Interest Rate Change Message off the wire, 12 bytes from where the cursor stands */
inline decode_asset_interest_rate_change_message(asset_interest_rate_change_message_record) {
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 4 -> asset_interest_rate_change_message_record.token[asset_interest_rate_change_message_at] = wire[at]; at = at + 1; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 2 -> asset_interest_rate_change_message_record.foreign_interest_rate[asset_interest_rate_change_message_at] = wire[at]; at = at + 1; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 4 -> asset_interest_rate_change_message_record.volatility[asset_interest_rate_change_message_at] = wire[at]; at = at + 1; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 2 -> asset_interest_rate_change_message_record.domestic_interest_rate[asset_interest_rate_change_message_at] = wire[at]; at = at + 1; asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Asset Interest Rate Change Message is what was written, byte for byte */
inline equal_asset_interest_rate_change_message(asset_interest_rate_change_message_read, asset_interest_rate_change_message_written) {
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 4 -> assert(asset_interest_rate_change_message_read.token[asset_interest_rate_change_message_at] == asset_interest_rate_change_message_written.token[asset_interest_rate_change_message_at]); asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 2 -> assert(asset_interest_rate_change_message_read.foreign_interest_rate[asset_interest_rate_change_message_at] == asset_interest_rate_change_message_written.foreign_interest_rate[asset_interest_rate_change_message_at]); asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 4 -> assert(asset_interest_rate_change_message_read.volatility[asset_interest_rate_change_message_at] == asset_interest_rate_change_message_written.volatility[asset_interest_rate_change_message_at]); asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  asset_interest_rate_change_message_at = 0;
  do
  :: asset_interest_rate_change_message_at < 2 -> assert(asset_interest_rate_change_message_read.domestic_interest_rate[asset_interest_rate_change_message_at] == asset_interest_rate_change_message_written.domestic_interest_rate[asset_interest_rate_change_message_at]); asset_interest_rate_change_message_at = asset_interest_rate_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sec Info 1: 30 bytes ---------------------------------------------------- */

/* SecInfo1 */
typedef SecInfo1 {
  byte instrument_name[6];
  byte symbol[10];
  byte series[2];
  byte expiry_date[4];
  byte strike_price[4];
  byte option_type[2];
  byte ca_level[2]
};

int sec_info1_at;

/* every byte of Sec Info 1 set to one value */
inline fill_sec_info1(sec_info1_record, sec_info1_value) {
  sec_info1_at = 0;
  do
  :: sec_info1_at < 6 -> sec_info1_record.instrument_name[sec_info1_at] = sec_info1_value; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 10 -> sec_info1_record.symbol[sec_info1_at] = sec_info1_value; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> sec_info1_record.series[sec_info1_at] = sec_info1_value; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 4 -> sec_info1_record.expiry_date[sec_info1_at] = sec_info1_value; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 4 -> sec_info1_record.strike_price[sec_info1_at] = sec_info1_value; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> sec_info1_record.option_type[sec_info1_at] = sec_info1_value; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> sec_info1_record.ca_level[sec_info1_at] = sec_info1_value; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sec Info 1 set to where it lies, so a field read out of place says so */
inline ramp_sec_info1(sec_info1_record, sec_info1_base) {
  sec_info1_at = 0;
  do
  :: sec_info1_at < 6 -> sec_info1_record.instrument_name[sec_info1_at] = (sec_info1_base + 0 + sec_info1_at + 1) % 256; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 10 -> sec_info1_record.symbol[sec_info1_at] = (sec_info1_base + 6 + sec_info1_at + 1) % 256; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> sec_info1_record.series[sec_info1_at] = (sec_info1_base + 16 + sec_info1_at + 1) % 256; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 4 -> sec_info1_record.expiry_date[sec_info1_at] = (sec_info1_base + 18 + sec_info1_at + 1) % 256; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 4 -> sec_info1_record.strike_price[sec_info1_at] = (sec_info1_base + 22 + sec_info1_at + 1) % 256; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> sec_info1_record.option_type[sec_info1_at] = (sec_info1_base + 26 + sec_info1_at + 1) % 256; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> sec_info1_record.ca_level[sec_info1_at] = (sec_info1_base + 28 + sec_info1_at + 1) % 256; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info 1 to the wire, 30 bytes from where the cursor stands */
inline encode_sec_info1(sec_info1_record) {
  sec_info1_at = 0;
  do
  :: sec_info1_at < 6 -> wire[at] = sec_info1_record.instrument_name[sec_info1_at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 10 -> wire[at] = sec_info1_record.symbol[sec_info1_at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> wire[at] = sec_info1_record.series[sec_info1_at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 4 -> wire[at] = sec_info1_record.expiry_date[sec_info1_at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 4 -> wire[at] = sec_info1_record.strike_price[sec_info1_at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> wire[at] = sec_info1_record.option_type[sec_info1_at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> wire[at] = sec_info1_record.ca_level[sec_info1_at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info 1 off the wire, 30 bytes from where the cursor stands */
inline decode_sec_info1(sec_info1_record) {
  sec_info1_at = 0;
  do
  :: sec_info1_at < 6 -> sec_info1_record.instrument_name[sec_info1_at] = wire[at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 10 -> sec_info1_record.symbol[sec_info1_at] = wire[at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> sec_info1_record.series[sec_info1_at] = wire[at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 4 -> sec_info1_record.expiry_date[sec_info1_at] = wire[at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 4 -> sec_info1_record.strike_price[sec_info1_at] = wire[at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> sec_info1_record.option_type[sec_info1_at] = wire[at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> sec_info1_record.ca_level[sec_info1_at] = wire[at]; at = at + 1; sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sec Info 1 is what was written, byte for byte */
inline equal_sec_info1(sec_info1_read, sec_info1_written) {
  sec_info1_at = 0;
  do
  :: sec_info1_at < 6 -> assert(sec_info1_read.instrument_name[sec_info1_at] == sec_info1_written.instrument_name[sec_info1_at]); sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 10 -> assert(sec_info1_read.symbol[sec_info1_at] == sec_info1_written.symbol[sec_info1_at]); sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> assert(sec_info1_read.series[sec_info1_at] == sec_info1_written.series[sec_info1_at]); sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 4 -> assert(sec_info1_read.expiry_date[sec_info1_at] == sec_info1_written.expiry_date[sec_info1_at]); sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 4 -> assert(sec_info1_read.strike_price[sec_info1_at] == sec_info1_written.strike_price[sec_info1_at]); sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> assert(sec_info1_read.option_type[sec_info1_at] == sec_info1_written.option_type[sec_info1_at]); sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  sec_info1_at = 0;
  do
  :: sec_info1_at < 2 -> assert(sec_info1_read.ca_level[sec_info1_at] == sec_info1_written.ca_level[sec_info1_at]); sec_info1_at = sec_info1_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Sec Info 2: 30 bytes ---------------------------------------------------- */

/* SecInfo2 */
typedef SecInfo2 {
  byte instrument_name[6];
  byte symbol[10];
  byte series[2];
  byte expiry_date[4];
  byte strike_price[4];
  byte option_type[2];
  byte ca_level[2]
};

int sec_info2_at;

/* every byte of Sec Info 2 set to one value */
inline fill_sec_info2(sec_info2_record, sec_info2_value) {
  sec_info2_at = 0;
  do
  :: sec_info2_at < 6 -> sec_info2_record.instrument_name[sec_info2_at] = sec_info2_value; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 10 -> sec_info2_record.symbol[sec_info2_at] = sec_info2_value; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> sec_info2_record.series[sec_info2_at] = sec_info2_value; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 4 -> sec_info2_record.expiry_date[sec_info2_at] = sec_info2_value; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 4 -> sec_info2_record.strike_price[sec_info2_at] = sec_info2_value; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> sec_info2_record.option_type[sec_info2_at] = sec_info2_value; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> sec_info2_record.ca_level[sec_info2_at] = sec_info2_value; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sec Info 2 set to where it lies, so a field read out of place says so */
inline ramp_sec_info2(sec_info2_record, sec_info2_base) {
  sec_info2_at = 0;
  do
  :: sec_info2_at < 6 -> sec_info2_record.instrument_name[sec_info2_at] = (sec_info2_base + 0 + sec_info2_at + 1) % 256; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 10 -> sec_info2_record.symbol[sec_info2_at] = (sec_info2_base + 6 + sec_info2_at + 1) % 256; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> sec_info2_record.series[sec_info2_at] = (sec_info2_base + 16 + sec_info2_at + 1) % 256; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 4 -> sec_info2_record.expiry_date[sec_info2_at] = (sec_info2_base + 18 + sec_info2_at + 1) % 256; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 4 -> sec_info2_record.strike_price[sec_info2_at] = (sec_info2_base + 22 + sec_info2_at + 1) % 256; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> sec_info2_record.option_type[sec_info2_at] = (sec_info2_base + 26 + sec_info2_at + 1) % 256; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> sec_info2_record.ca_level[sec_info2_at] = (sec_info2_base + 28 + sec_info2_at + 1) % 256; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info 2 to the wire, 30 bytes from where the cursor stands */
inline encode_sec_info2(sec_info2_record) {
  sec_info2_at = 0;
  do
  :: sec_info2_at < 6 -> wire[at] = sec_info2_record.instrument_name[sec_info2_at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 10 -> wire[at] = sec_info2_record.symbol[sec_info2_at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> wire[at] = sec_info2_record.series[sec_info2_at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 4 -> wire[at] = sec_info2_record.expiry_date[sec_info2_at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 4 -> wire[at] = sec_info2_record.strike_price[sec_info2_at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> wire[at] = sec_info2_record.option_type[sec_info2_at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> wire[at] = sec_info2_record.ca_level[sec_info2_at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  skip
}

/* Sec Info 2 off the wire, 30 bytes from where the cursor stands */
inline decode_sec_info2(sec_info2_record) {
  sec_info2_at = 0;
  do
  :: sec_info2_at < 6 -> sec_info2_record.instrument_name[sec_info2_at] = wire[at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 10 -> sec_info2_record.symbol[sec_info2_at] = wire[at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> sec_info2_record.series[sec_info2_at] = wire[at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 4 -> sec_info2_record.expiry_date[sec_info2_at] = wire[at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 4 -> sec_info2_record.strike_price[sec_info2_at] = wire[at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> sec_info2_record.option_type[sec_info2_at] = wire[at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> sec_info2_record.ca_level[sec_info2_at] = wire[at]; at = at + 1; sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sec Info 2 is what was written, byte for byte */
inline equal_sec_info2(sec_info2_read, sec_info2_written) {
  sec_info2_at = 0;
  do
  :: sec_info2_at < 6 -> assert(sec_info2_read.instrument_name[sec_info2_at] == sec_info2_written.instrument_name[sec_info2_at]); sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 10 -> assert(sec_info2_read.symbol[sec_info2_at] == sec_info2_written.symbol[sec_info2_at]); sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> assert(sec_info2_read.series[sec_info2_at] == sec_info2_written.series[sec_info2_at]); sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 4 -> assert(sec_info2_read.expiry_date[sec_info2_at] == sec_info2_written.expiry_date[sec_info2_at]); sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 4 -> assert(sec_info2_read.strike_price[sec_info2_at] == sec_info2_written.strike_price[sec_info2_at]); sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> assert(sec_info2_read.option_type[sec_info2_at] == sec_info2_written.option_type[sec_info2_at]); sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
  sec_info2_at = 0;
  do
  :: sec_info2_at < 2 -> assert(sec_info2_read.ca_level[sec_info2_at] == sec_info2_written.ca_level[sec_info2_at]); sec_info2_at = sec_info2_at + 1
  :: else -> break
  od;
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
    assert(at == 39);
    at = 0;
    decode_instrument_master_change_message(instrument_master_change_message_got);
    assert(at == 39);
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

/* Turnover Exceeded Message: encoded, read back, and compared */
proctype check_turnover_exceeded_message() {
  TurnoverExceededMessage turnover_exceeded_message_sent;
  TurnoverExceededMessage turnover_exceeded_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_turnover_exceeded_message(turnover_exceeded_message_sent, 0)
  :: pattern == 1 -> fill_turnover_exceeded_message(turnover_exceeded_message_sent, 32)
  :: pattern == 2 -> fill_turnover_exceeded_message(turnover_exceeded_message_sent, 255)
  :: else -> ramp_turnover_exceeded_message(turnover_exceeded_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_turnover_exceeded_message(turnover_exceeded_message_sent);
    assert(at == 58);
    at = 0;
    decode_turnover_exceeded_message(turnover_exceeded_message_got);
    assert(at == 58);
    equal_turnover_exceeded_message(turnover_exceeded_message_got, turnover_exceeded_message_sent)
  }
}

/* Currency Assets Message: encoded, read back, and compared */
proctype check_currency_assets_message() {
  CurrencyAssetsMessage currency_assets_message_sent;
  CurrencyAssetsMessage currency_assets_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_currency_assets_message(currency_assets_message_sent, 0)
  :: pattern == 1 -> fill_currency_assets_message(currency_assets_message_sent, 32)
  :: pattern == 2 -> fill_currency_assets_message(currency_assets_message_sent, 255)
  :: else -> ramp_currency_assets_message(currency_assets_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_currency_assets_message(currency_assets_message_sent);
    assert(at == 36);
    at = 0;
    decode_currency_assets_message(currency_assets_message_got);
    assert(at == 36);
    equal_currency_assets_message(currency_assets_message_got, currency_assets_message_sent)
  }
}

/* Asset Interest Rate Change Message: encoded, read back, and compared */
proctype check_asset_interest_rate_change_message() {
  AssetInterestRateChangeMessage asset_interest_rate_change_message_sent;
  AssetInterestRateChangeMessage asset_interest_rate_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_asset_interest_rate_change_message(asset_interest_rate_change_message_sent, 0)
  :: pattern == 1 -> fill_asset_interest_rate_change_message(asset_interest_rate_change_message_sent, 32)
  :: pattern == 2 -> fill_asset_interest_rate_change_message(asset_interest_rate_change_message_sent, 255)
  :: else -> ramp_asset_interest_rate_change_message(asset_interest_rate_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_asset_interest_rate_change_message(asset_interest_rate_change_message_sent);
    assert(at == 12);
    at = 0;
    decode_asset_interest_rate_change_message(asset_interest_rate_change_message_got);
    assert(at == 12);
    equal_asset_interest_rate_change_message(asset_interest_rate_change_message_got, asset_interest_rate_change_message_sent)
  }
}

/* Sec Info 1: encoded, read back, and compared */
proctype check_sec_info1() {
  SecInfo1 sec_info1_sent;
  SecInfo1 sec_info1_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sec_info1(sec_info1_sent, 0)
  :: pattern == 1 -> fill_sec_info1(sec_info1_sent, 32)
  :: pattern == 2 -> fill_sec_info1(sec_info1_sent, 255)
  :: else -> ramp_sec_info1(sec_info1_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sec_info1(sec_info1_sent);
    assert(at == 30);
    at = 0;
    decode_sec_info1(sec_info1_got);
    assert(at == 30);
    equal_sec_info1(sec_info1_got, sec_info1_sent)
  }
}

/* Sec Info 2: encoded, read back, and compared */
proctype check_sec_info2() {
  SecInfo2 sec_info2_sent;
  SecInfo2 sec_info2_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sec_info2(sec_info2_sent, 0)
  :: pattern == 1 -> fill_sec_info2(sec_info2_sent, 32)
  :: pattern == 2 -> fill_sec_info2(sec_info2_sent, 255)
  :: else -> ramp_sec_info2(sec_info2_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sec_info2(sec_info2_sent);
    assert(at == 30);
    at = 0;
    decode_sec_info2(sec_info2_got);
    assert(at == 30);
    equal_sec_info2(sec_info2_got, sec_info2_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_bcast_header()
  :: run check_sec_info()
  :: run check_instrument_master_change_message()
  :: run check_participant_master_change_message()
  :: run check_turnover_exceeded_message()
  :: run check_currency_assets_message()
  :: run check_asset_interest_rate_change_message()
  :: run check_sec_info1()
  :: run check_sec_info2()
  fi
}
