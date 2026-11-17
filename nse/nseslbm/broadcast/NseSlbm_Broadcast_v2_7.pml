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
#define WIRE 204

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

/* ---- Change Participant Status Message: 43 bytes ----------------------------- */

/* Sent as BCAST_PART_MSTR_CHG whenever there is a participant change */
typedef ChangeParticipantStatusMessage {
  byte participant_id[12];
  byte participant_name[25];
  byte participant_status;
  byte participant_update_date_time[4];
  byte delete_flag
};

int change_participant_status_message_at;

/* every byte of Change Participant Status Message set to one value */
inline fill_change_participant_status_message(change_participant_status_message_record, change_participant_status_message_value) {
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 12 -> change_participant_status_message_record.participant_id[change_participant_status_message_at] = change_participant_status_message_value; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 25 -> change_participant_status_message_record.participant_name[change_participant_status_message_at] = change_participant_status_message_value; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  change_participant_status_message_record.participant_status = change_participant_status_message_value;
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 4 -> change_participant_status_message_record.participant_update_date_time[change_participant_status_message_at] = change_participant_status_message_value; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  change_participant_status_message_record.delete_flag = change_participant_status_message_value;
  skip
}

/* each byte of Change Participant Status Message set to where it lies, so a field read out of place says so */
inline ramp_change_participant_status_message(change_participant_status_message_record, change_participant_status_message_base) {
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 12 -> change_participant_status_message_record.participant_id[change_participant_status_message_at] = (change_participant_status_message_base + 0 + change_participant_status_message_at + 1) % 256; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 25 -> change_participant_status_message_record.participant_name[change_participant_status_message_at] = (change_participant_status_message_base + 12 + change_participant_status_message_at + 1) % 256; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  change_participant_status_message_record.participant_status = (change_participant_status_message_base + 37 + 1) % 256;
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 4 -> change_participant_status_message_record.participant_update_date_time[change_participant_status_message_at] = (change_participant_status_message_base + 38 + change_participant_status_message_at + 1) % 256; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  change_participant_status_message_record.delete_flag = (change_participant_status_message_base + 42 + 1) % 256;
  skip
}

/* Change Participant Status Message to the wire, 43 bytes from where the cursor stands */
inline encode_change_participant_status_message(change_participant_status_message_record) {
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 12 -> wire[at] = change_participant_status_message_record.participant_id[change_participant_status_message_at]; at = at + 1; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 25 -> wire[at] = change_participant_status_message_record.participant_name[change_participant_status_message_at]; at = at + 1; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  wire[at] = change_participant_status_message_record.participant_status; at = at + 1;
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 4 -> wire[at] = change_participant_status_message_record.participant_update_date_time[change_participant_status_message_at]; at = at + 1; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  wire[at] = change_participant_status_message_record.delete_flag; at = at + 1;
  skip
}

/* Change Participant Status Message off the wire, 43 bytes from where the cursor stands */
inline decode_change_participant_status_message(change_participant_status_message_record) {
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 12 -> change_participant_status_message_record.participant_id[change_participant_status_message_at] = wire[at]; at = at + 1; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 25 -> change_participant_status_message_record.participant_name[change_participant_status_message_at] = wire[at]; at = at + 1; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  change_participant_status_message_record.participant_status = wire[at]; at = at + 1;
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 4 -> change_participant_status_message_record.participant_update_date_time[change_participant_status_message_at] = wire[at]; at = at + 1; change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  change_participant_status_message_record.delete_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Change Participant Status Message is what was written, byte for byte */
inline equal_change_participant_status_message(change_participant_status_message_read, change_participant_status_message_written) {
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 12 -> assert(change_participant_status_message_read.participant_id[change_participant_status_message_at] == change_participant_status_message_written.participant_id[change_participant_status_message_at]); change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 25 -> assert(change_participant_status_message_read.participant_name[change_participant_status_message_at] == change_participant_status_message_written.participant_name[change_participant_status_message_at]); change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  assert(change_participant_status_message_read.participant_status == change_participant_status_message_written.participant_status);
  change_participant_status_message_at = 0;
  do
  :: change_participant_status_message_at < 4 -> assert(change_participant_status_message_read.participant_update_date_time[change_participant_status_message_at] == change_participant_status_message_written.participant_update_date_time[change_participant_status_message_at]); change_participant_status_message_at = change_participant_status_message_at + 1
  :: else -> break
  od;
  assert(change_participant_status_message_read.delete_flag == change_participant_status_message_written.delete_flag);
  skip
}

/* ---- Turnover Limit Exceeded Message: 37 bytes ------------------------------- */

/* Sent as BCAST_TURNOVER_EXCEEDED when a broker's turnover is about to exceed or has exceeded its limit */
typedef TurnoverLimitExceededMessage {
  byte broker_code[5];
  byte counter_broker_code[5];
  byte warning_type[2];
  SecInfo sec_info;
  byte trade_number[4];
  byte trade_price[4];
  byte trade_volume[4];
  byte final
};

int turnover_limit_exceeded_message_at;

/* every byte of Turnover Limit Exceeded Message set to one value */
inline fill_turnover_limit_exceeded_message(turnover_limit_exceeded_message_record, turnover_limit_exceeded_message_value) {
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 5 -> turnover_limit_exceeded_message_record.broker_code[turnover_limit_exceeded_message_at] = turnover_limit_exceeded_message_value; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 5 -> turnover_limit_exceeded_message_record.counter_broker_code[turnover_limit_exceeded_message_at] = turnover_limit_exceeded_message_value; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 2 -> turnover_limit_exceeded_message_record.warning_type[turnover_limit_exceeded_message_at] = turnover_limit_exceeded_message_value; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  fill_sec_info(turnover_limit_exceeded_message_record.sec_info, turnover_limit_exceeded_message_value);
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> turnover_limit_exceeded_message_record.trade_number[turnover_limit_exceeded_message_at] = turnover_limit_exceeded_message_value; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> turnover_limit_exceeded_message_record.trade_price[turnover_limit_exceeded_message_at] = turnover_limit_exceeded_message_value; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> turnover_limit_exceeded_message_record.trade_volume[turnover_limit_exceeded_message_at] = turnover_limit_exceeded_message_value; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_record.final = turnover_limit_exceeded_message_value;
  skip
}

/* each byte of Turnover Limit Exceeded Message set to where it lies, so a field read out of place says so */
inline ramp_turnover_limit_exceeded_message(turnover_limit_exceeded_message_record, turnover_limit_exceeded_message_base) {
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 5 -> turnover_limit_exceeded_message_record.broker_code[turnover_limit_exceeded_message_at] = (turnover_limit_exceeded_message_base + 0 + turnover_limit_exceeded_message_at + 1) % 256; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 5 -> turnover_limit_exceeded_message_record.counter_broker_code[turnover_limit_exceeded_message_at] = (turnover_limit_exceeded_message_base + 5 + turnover_limit_exceeded_message_at + 1) % 256; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 2 -> turnover_limit_exceeded_message_record.warning_type[turnover_limit_exceeded_message_at] = (turnover_limit_exceeded_message_base + 10 + turnover_limit_exceeded_message_at + 1) % 256; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  ramp_sec_info(turnover_limit_exceeded_message_record.sec_info, turnover_limit_exceeded_message_base + 12);
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> turnover_limit_exceeded_message_record.trade_number[turnover_limit_exceeded_message_at] = (turnover_limit_exceeded_message_base + 24 + turnover_limit_exceeded_message_at + 1) % 256; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> turnover_limit_exceeded_message_record.trade_price[turnover_limit_exceeded_message_at] = (turnover_limit_exceeded_message_base + 28 + turnover_limit_exceeded_message_at + 1) % 256; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> turnover_limit_exceeded_message_record.trade_volume[turnover_limit_exceeded_message_at] = (turnover_limit_exceeded_message_base + 32 + turnover_limit_exceeded_message_at + 1) % 256; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_record.final = (turnover_limit_exceeded_message_base + 36 + 1) % 256;
  skip
}

/* Turnover Limit Exceeded Message to the wire, 37 bytes from where the cursor stands */
inline encode_turnover_limit_exceeded_message(turnover_limit_exceeded_message_record) {
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 5 -> wire[at] = turnover_limit_exceeded_message_record.broker_code[turnover_limit_exceeded_message_at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 5 -> wire[at] = turnover_limit_exceeded_message_record.counter_broker_code[turnover_limit_exceeded_message_at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 2 -> wire[at] = turnover_limit_exceeded_message_record.warning_type[turnover_limit_exceeded_message_at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  encode_sec_info(turnover_limit_exceeded_message_record.sec_info);
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> wire[at] = turnover_limit_exceeded_message_record.trade_number[turnover_limit_exceeded_message_at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> wire[at] = turnover_limit_exceeded_message_record.trade_price[turnover_limit_exceeded_message_at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> wire[at] = turnover_limit_exceeded_message_record.trade_volume[turnover_limit_exceeded_message_at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  wire[at] = turnover_limit_exceeded_message_record.final; at = at + 1;
  skip
}

/* Turnover Limit Exceeded Message off the wire, 37 bytes from where the cursor stands */
inline decode_turnover_limit_exceeded_message(turnover_limit_exceeded_message_record) {
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 5 -> turnover_limit_exceeded_message_record.broker_code[turnover_limit_exceeded_message_at] = wire[at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 5 -> turnover_limit_exceeded_message_record.counter_broker_code[turnover_limit_exceeded_message_at] = wire[at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 2 -> turnover_limit_exceeded_message_record.warning_type[turnover_limit_exceeded_message_at] = wire[at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  decode_sec_info(turnover_limit_exceeded_message_record.sec_info);
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> turnover_limit_exceeded_message_record.trade_number[turnover_limit_exceeded_message_at] = wire[at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> turnover_limit_exceeded_message_record.trade_price[turnover_limit_exceeded_message_at] = wire[at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> turnover_limit_exceeded_message_record.trade_volume[turnover_limit_exceeded_message_at] = wire[at]; at = at + 1; turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_record.final = wire[at]; at = at + 1;
  skip
}

/* what was read of Turnover Limit Exceeded Message is what was written, byte for byte */
inline equal_turnover_limit_exceeded_message(turnover_limit_exceeded_message_read, turnover_limit_exceeded_message_written) {
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 5 -> assert(turnover_limit_exceeded_message_read.broker_code[turnover_limit_exceeded_message_at] == turnover_limit_exceeded_message_written.broker_code[turnover_limit_exceeded_message_at]); turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 5 -> assert(turnover_limit_exceeded_message_read.counter_broker_code[turnover_limit_exceeded_message_at] == turnover_limit_exceeded_message_written.counter_broker_code[turnover_limit_exceeded_message_at]); turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 2 -> assert(turnover_limit_exceeded_message_read.warning_type[turnover_limit_exceeded_message_at] == turnover_limit_exceeded_message_written.warning_type[turnover_limit_exceeded_message_at]); turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  equal_sec_info(turnover_limit_exceeded_message_read.sec_info, turnover_limit_exceeded_message_written.sec_info);
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> assert(turnover_limit_exceeded_message_read.trade_number[turnover_limit_exceeded_message_at] == turnover_limit_exceeded_message_written.trade_number[turnover_limit_exceeded_message_at]); turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> assert(turnover_limit_exceeded_message_read.trade_price[turnover_limit_exceeded_message_at] == turnover_limit_exceeded_message_written.trade_price[turnover_limit_exceeded_message_at]); turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_limit_exceeded_message_at = 0;
  do
  :: turnover_limit_exceeded_message_at < 4 -> assert(turnover_limit_exceeded_message_read.trade_volume[turnover_limit_exceeded_message_at] == turnover_limit_exceeded_message_written.trade_volume[turnover_limit_exceeded_message_at]); turnover_limit_exceeded_message_at = turnover_limit_exceeded_message_at + 1
  :: else -> break
  od;
  assert(turnover_limit_exceeded_message_read.final == turnover_limit_exceeded_message_written.final);
  skip
}

/* ---- Broker Reactivated Message: 37 bytes ------------------------------------ */

/* Sent as BROADCAST_BROKER_ACTIVATED when a deactivated broker is reactivated */
typedef BrokerReactivatedMessage {
  byte broker_code[5];
  byte counter_broker_code[5];
  byte warning_type[2];
  SecInfo sec_info;
  byte trade_number[4];
  byte trade_price[4];
  byte trade_volume[4];
  byte final
};

int broker_reactivated_message_at;

/* every byte of Broker Reactivated Message set to one value */
inline fill_broker_reactivated_message(broker_reactivated_message_record, broker_reactivated_message_value) {
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 5 -> broker_reactivated_message_record.broker_code[broker_reactivated_message_at] = broker_reactivated_message_value; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 5 -> broker_reactivated_message_record.counter_broker_code[broker_reactivated_message_at] = broker_reactivated_message_value; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 2 -> broker_reactivated_message_record.warning_type[broker_reactivated_message_at] = broker_reactivated_message_value; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  fill_sec_info(broker_reactivated_message_record.sec_info, broker_reactivated_message_value);
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> broker_reactivated_message_record.trade_number[broker_reactivated_message_at] = broker_reactivated_message_value; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> broker_reactivated_message_record.trade_price[broker_reactivated_message_at] = broker_reactivated_message_value; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> broker_reactivated_message_record.trade_volume[broker_reactivated_message_at] = broker_reactivated_message_value; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_record.final = broker_reactivated_message_value;
  skip
}

/* each byte of Broker Reactivated Message set to where it lies, so a field read out of place says so */
inline ramp_broker_reactivated_message(broker_reactivated_message_record, broker_reactivated_message_base) {
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 5 -> broker_reactivated_message_record.broker_code[broker_reactivated_message_at] = (broker_reactivated_message_base + 0 + broker_reactivated_message_at + 1) % 256; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 5 -> broker_reactivated_message_record.counter_broker_code[broker_reactivated_message_at] = (broker_reactivated_message_base + 5 + broker_reactivated_message_at + 1) % 256; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 2 -> broker_reactivated_message_record.warning_type[broker_reactivated_message_at] = (broker_reactivated_message_base + 10 + broker_reactivated_message_at + 1) % 256; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  ramp_sec_info(broker_reactivated_message_record.sec_info, broker_reactivated_message_base + 12);
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> broker_reactivated_message_record.trade_number[broker_reactivated_message_at] = (broker_reactivated_message_base + 24 + broker_reactivated_message_at + 1) % 256; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> broker_reactivated_message_record.trade_price[broker_reactivated_message_at] = (broker_reactivated_message_base + 28 + broker_reactivated_message_at + 1) % 256; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> broker_reactivated_message_record.trade_volume[broker_reactivated_message_at] = (broker_reactivated_message_base + 32 + broker_reactivated_message_at + 1) % 256; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_record.final = (broker_reactivated_message_base + 36 + 1) % 256;
  skip
}

/* Broker Reactivated Message to the wire, 37 bytes from where the cursor stands */
inline encode_broker_reactivated_message(broker_reactivated_message_record) {
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 5 -> wire[at] = broker_reactivated_message_record.broker_code[broker_reactivated_message_at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 5 -> wire[at] = broker_reactivated_message_record.counter_broker_code[broker_reactivated_message_at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 2 -> wire[at] = broker_reactivated_message_record.warning_type[broker_reactivated_message_at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  encode_sec_info(broker_reactivated_message_record.sec_info);
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> wire[at] = broker_reactivated_message_record.trade_number[broker_reactivated_message_at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> wire[at] = broker_reactivated_message_record.trade_price[broker_reactivated_message_at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> wire[at] = broker_reactivated_message_record.trade_volume[broker_reactivated_message_at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  wire[at] = broker_reactivated_message_record.final; at = at + 1;
  skip
}

/* Broker Reactivated Message off the wire, 37 bytes from where the cursor stands */
inline decode_broker_reactivated_message(broker_reactivated_message_record) {
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 5 -> broker_reactivated_message_record.broker_code[broker_reactivated_message_at] = wire[at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 5 -> broker_reactivated_message_record.counter_broker_code[broker_reactivated_message_at] = wire[at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 2 -> broker_reactivated_message_record.warning_type[broker_reactivated_message_at] = wire[at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  decode_sec_info(broker_reactivated_message_record.sec_info);
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> broker_reactivated_message_record.trade_number[broker_reactivated_message_at] = wire[at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> broker_reactivated_message_record.trade_price[broker_reactivated_message_at] = wire[at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> broker_reactivated_message_record.trade_volume[broker_reactivated_message_at] = wire[at]; at = at + 1; broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_record.final = wire[at]; at = at + 1;
  skip
}

/* what was read of Broker Reactivated Message is what was written, byte for byte */
inline equal_broker_reactivated_message(broker_reactivated_message_read, broker_reactivated_message_written) {
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 5 -> assert(broker_reactivated_message_read.broker_code[broker_reactivated_message_at] == broker_reactivated_message_written.broker_code[broker_reactivated_message_at]); broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 5 -> assert(broker_reactivated_message_read.counter_broker_code[broker_reactivated_message_at] == broker_reactivated_message_written.counter_broker_code[broker_reactivated_message_at]); broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 2 -> assert(broker_reactivated_message_read.warning_type[broker_reactivated_message_at] == broker_reactivated_message_written.warning_type[broker_reactivated_message_at]); broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  equal_sec_info(broker_reactivated_message_read.sec_info, broker_reactivated_message_written.sec_info);
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> assert(broker_reactivated_message_read.trade_number[broker_reactivated_message_at] == broker_reactivated_message_written.trade_number[broker_reactivated_message_at]); broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> assert(broker_reactivated_message_read.trade_price[broker_reactivated_message_at] == broker_reactivated_message_written.trade_price[broker_reactivated_message_at]); broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  broker_reactivated_message_at = 0;
  do
  :: broker_reactivated_message_at < 4 -> assert(broker_reactivated_message_read.trade_volume[broker_reactivated_message_at] == broker_reactivated_message_written.trade_volume[broker_reactivated_message_at]); broker_reactivated_message_at = broker_reactivated_message_at + 1
  :: else -> break
  od;
  assert(broker_reactivated_message_read.final == broker_reactivated_message_written.final);
  skip
}

/* ---- St Auction Inq Info: 36 bytes ------------------------------------------- */

/* ST_AUCTION_INQ_INFO */
typedef StAuctionInqInfo {
  byte token_long_4[4];
  byte auction_number[2];
  byte auction_status[2];
  byte initiator_type[2];
  byte total_buy_qty[4];
  byte best_buy_price[4];
  byte total_sell_qty[4];
  byte best_sell_price[4];
  byte auction_price[4];
  byte auction_qty[4];
  byte settlement_period[2]
};

int st_auction_inq_info_at;

/* every byte of St Auction Inq Info set to one value */
inline fill_st_auction_inq_info(st_auction_inq_info_record, st_auction_inq_info_value) {
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.token_long_4[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.auction_number[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.auction_status[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.initiator_type[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.total_buy_qty[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.best_buy_price[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.total_sell_qty[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.best_sell_price[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.auction_price[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.auction_qty[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.settlement_period[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of St Auction Inq Info set to where it lies, so a field read out of place says so */
inline ramp_st_auction_inq_info(st_auction_inq_info_record, st_auction_inq_info_base) {
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.token_long_4[st_auction_inq_info_at] = (st_auction_inq_info_base + 0 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.auction_number[st_auction_inq_info_at] = (st_auction_inq_info_base + 4 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.auction_status[st_auction_inq_info_at] = (st_auction_inq_info_base + 6 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.initiator_type[st_auction_inq_info_at] = (st_auction_inq_info_base + 8 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.total_buy_qty[st_auction_inq_info_at] = (st_auction_inq_info_base + 10 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.best_buy_price[st_auction_inq_info_at] = (st_auction_inq_info_base + 14 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.total_sell_qty[st_auction_inq_info_at] = (st_auction_inq_info_base + 18 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.best_sell_price[st_auction_inq_info_at] = (st_auction_inq_info_base + 22 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.auction_price[st_auction_inq_info_at] = (st_auction_inq_info_base + 26 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.auction_qty[st_auction_inq_info_at] = (st_auction_inq_info_base + 30 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.settlement_period[st_auction_inq_info_at] = (st_auction_inq_info_base + 34 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  skip
}

/* St Auction Inq Info to the wire, 36 bytes from where the cursor stands */
inline encode_st_auction_inq_info(st_auction_inq_info_record) {
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> wire[at] = st_auction_inq_info_record.token_long_4[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> wire[at] = st_auction_inq_info_record.auction_number[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> wire[at] = st_auction_inq_info_record.auction_status[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> wire[at] = st_auction_inq_info_record.initiator_type[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> wire[at] = st_auction_inq_info_record.total_buy_qty[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> wire[at] = st_auction_inq_info_record.best_buy_price[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> wire[at] = st_auction_inq_info_record.total_sell_qty[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> wire[at] = st_auction_inq_info_record.best_sell_price[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> wire[at] = st_auction_inq_info_record.auction_price[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> wire[at] = st_auction_inq_info_record.auction_qty[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> wire[at] = st_auction_inq_info_record.settlement_period[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  skip
}

/* St Auction Inq Info off the wire, 36 bytes from where the cursor stands */
inline decode_st_auction_inq_info(st_auction_inq_info_record) {
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.token_long_4[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.auction_number[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.auction_status[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.initiator_type[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.total_buy_qty[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.best_buy_price[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.total_sell_qty[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.best_sell_price[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.auction_price[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> st_auction_inq_info_record.auction_qty[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.settlement_period[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of St Auction Inq Info is what was written, byte for byte */
inline equal_st_auction_inq_info(st_auction_inq_info_read, st_auction_inq_info_written) {
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> assert(st_auction_inq_info_read.token_long_4[st_auction_inq_info_at] == st_auction_inq_info_written.token_long_4[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> assert(st_auction_inq_info_read.auction_number[st_auction_inq_info_at] == st_auction_inq_info_written.auction_number[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> assert(st_auction_inq_info_read.auction_status[st_auction_inq_info_at] == st_auction_inq_info_written.auction_status[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> assert(st_auction_inq_info_read.initiator_type[st_auction_inq_info_at] == st_auction_inq_info_written.initiator_type[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> assert(st_auction_inq_info_read.total_buy_qty[st_auction_inq_info_at] == st_auction_inq_info_written.total_buy_qty[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> assert(st_auction_inq_info_read.best_buy_price[st_auction_inq_info_at] == st_auction_inq_info_written.best_buy_price[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> assert(st_auction_inq_info_read.total_sell_qty[st_auction_inq_info_at] == st_auction_inq_info_written.total_sell_qty[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> assert(st_auction_inq_info_read.best_sell_price[st_auction_inq_info_at] == st_auction_inq_info_written.best_sell_price[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> assert(st_auction_inq_info_read.auction_price[st_auction_inq_info_at] == st_auction_inq_info_written.auction_price[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 4 -> assert(st_auction_inq_info_read.auction_qty[st_auction_inq_info_at] == st_auction_inq_info_written.auction_qty[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  st_auction_inq_info_at = 0;
  do
  :: st_auction_inq_info_at < 2 -> assert(st_auction_inq_info_read.settlement_period[st_auction_inq_info_at] == st_auction_inq_info_written.settlement_period[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Activity Message: 36 bytes -------------------------------------- */

/* Sent as BCAST_AUCTION_INQUIRY_OUT for any auction related activity in CM */
typedef AuctionActivityMessage {
  StAuctionInqInfo st_auction_inq_info
};

/* every byte of Auction Activity Message set to one value */
inline fill_auction_activity_message(auction_activity_message_record, auction_activity_message_value) {
  fill_st_auction_inq_info(auction_activity_message_record.st_auction_inq_info, auction_activity_message_value);
  skip
}

/* each byte of Auction Activity Message set to where it lies, so a field read out of place says so */
inline ramp_auction_activity_message(auction_activity_message_record, auction_activity_message_base) {
  ramp_st_auction_inq_info(auction_activity_message_record.st_auction_inq_info, auction_activity_message_base + 0);
  skip
}

/* Auction Activity Message to the wire, 36 bytes from where the cursor stands */
inline encode_auction_activity_message(auction_activity_message_record) {
  encode_st_auction_inq_info(auction_activity_message_record.st_auction_inq_info);
  skip
}

/* Auction Activity Message off the wire, 36 bytes from where the cursor stands */
inline decode_auction_activity_message(auction_activity_message_record) {
  decode_st_auction_inq_info(auction_activity_message_record.st_auction_inq_info);
  skip
}

/* what was read of Auction Activity Message is what was written, byte for byte */
inline equal_auction_activity_message(auction_activity_message_read, auction_activity_message_written) {
  equal_st_auction_inq_info(auction_activity_message_read.st_auction_inq_info, auction_activity_message_written.st_auction_inq_info);
  skip
}

/* ---- Security Open Message: 20 bytes ----------------------------------------- */

/* Sent as SECURITY_OPEN_PRICE with the open price of a security when the market opens */
typedef SecurityOpenMessage {
  SecInfo sec_info;
  byte token_long_4[4];
  byte opening_price[4]
};

int security_open_message_at;

/* every byte of Security Open Message set to one value */
inline fill_security_open_message(security_open_message_record, security_open_message_value) {
  fill_sec_info(security_open_message_record.sec_info, security_open_message_value);
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.token_long_4[security_open_message_at] = security_open_message_value; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.opening_price[security_open_message_at] = security_open_message_value; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Open Message set to where it lies, so a field read out of place says so */
inline ramp_security_open_message(security_open_message_record, security_open_message_base) {
  ramp_sec_info(security_open_message_record.sec_info, security_open_message_base + 0);
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.token_long_4[security_open_message_at] = (security_open_message_base + 12 + security_open_message_at + 1) % 256; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.opening_price[security_open_message_at] = (security_open_message_base + 16 + security_open_message_at + 1) % 256; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Open Message to the wire, 20 bytes from where the cursor stands */
inline encode_security_open_message(security_open_message_record) {
  encode_sec_info(security_open_message_record.sec_info);
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> wire[at] = security_open_message_record.token_long_4[security_open_message_at]; at = at + 1; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> wire[at] = security_open_message_record.opening_price[security_open_message_at]; at = at + 1; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Open Message off the wire, 20 bytes from where the cursor stands */
inline decode_security_open_message(security_open_message_record) {
  decode_sec_info(security_open_message_record.sec_info);
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.token_long_4[security_open_message_at] = wire[at]; at = at + 1; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> security_open_message_record.opening_price[security_open_message_at] = wire[at]; at = at + 1; security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Open Message is what was written, byte for byte */
inline equal_security_open_message(security_open_message_read, security_open_message_written) {
  equal_sec_info(security_open_message_read.sec_info, security_open_message_written.sec_info);
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> assert(security_open_message_read.token_long_4[security_open_message_at] == security_open_message_written.token_long_4[security_open_message_at]); security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  security_open_message_at = 0;
  do
  :: security_open_message_at < 4 -> assert(security_open_message_read.opening_price[security_open_message_at] == security_open_message_written.opening_price[security_open_message_at]); security_open_message_at = security_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Report Header Body: 67 bytes -------------------------------------------- */

/* Report Header Body */
typedef ReportHeaderBody {
  byte reserved_1;
  byte report_date[4];
  byte user_type[2];
  byte broker_id[5];
  byte broker_name[25];
  byte trader_number[4];
  byte trader_name[26]
};

int report_header_body_at;

/* every byte of Report Header Body set to one value */
inline fill_report_header_body(report_header_body_record, report_header_body_value) {
  report_header_body_record.reserved_1 = report_header_body_value;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.report_date[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> report_header_body_record.user_type[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> report_header_body_record.broker_id[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> report_header_body_record.broker_name[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.trader_number[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> report_header_body_record.trader_name[report_header_body_at] = report_header_body_value; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Report Header Body set to where it lies, so a field read out of place says so */
inline ramp_report_header_body(report_header_body_record, report_header_body_base) {
  report_header_body_record.reserved_1 = (report_header_body_base + 0 + 1) % 256;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.report_date[report_header_body_at] = (report_header_body_base + 1 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> report_header_body_record.user_type[report_header_body_at] = (report_header_body_base + 5 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> report_header_body_record.broker_id[report_header_body_at] = (report_header_body_base + 7 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> report_header_body_record.broker_name[report_header_body_at] = (report_header_body_base + 12 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.trader_number[report_header_body_at] = (report_header_body_base + 37 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> report_header_body_record.trader_name[report_header_body_at] = (report_header_body_base + 41 + report_header_body_at + 1) % 256; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* Report Header Body to the wire, 67 bytes from where the cursor stands */
inline encode_report_header_body(report_header_body_record) {
  wire[at] = report_header_body_record.reserved_1; at = at + 1;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> wire[at] = report_header_body_record.report_date[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> wire[at] = report_header_body_record.user_type[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> wire[at] = report_header_body_record.broker_id[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> wire[at] = report_header_body_record.broker_name[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> wire[at] = report_header_body_record.trader_number[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> wire[at] = report_header_body_record.trader_name[report_header_body_at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* Report Header Body off the wire, 67 bytes from where the cursor stands */
inline decode_report_header_body(report_header_body_record) {
  report_header_body_record.reserved_1 = wire[at]; at = at + 1;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.report_date[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> report_header_body_record.user_type[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> report_header_body_record.broker_id[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> report_header_body_record.broker_name[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> report_header_body_record.trader_number[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> report_header_body_record.trader_name[report_header_body_at] = wire[at]; at = at + 1; report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Report Header Body is what was written, byte for byte */
inline equal_report_header_body(report_header_body_read, report_header_body_written) {
  assert(report_header_body_read.reserved_1 == report_header_body_written.reserved_1);
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> assert(report_header_body_read.report_date[report_header_body_at] == report_header_body_written.report_date[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 2 -> assert(report_header_body_read.user_type[report_header_body_at] == report_header_body_written.user_type[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 5 -> assert(report_header_body_read.broker_id[report_header_body_at] == report_header_body_written.broker_id[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 25 -> assert(report_header_body_read.broker_name[report_header_body_at] == report_header_body_written.broker_name[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 4 -> assert(report_header_body_read.trader_number[report_header_body_at] == report_header_body_written.trader_number[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  report_header_body_at = 0;
  do
  :: report_header_body_at < 26 -> assert(report_header_body_read.trader_name[report_header_body_at] == report_header_body_written.trader_name[report_header_body_at]); report_header_body_at = report_header_body_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Report Trailer Body: 5 bytes -------------------------------------------- */

/* Report Trailer Body */
typedef ReportTrailerBody {
  byte number_of_records_long_4[4];
  byte reserved_1
};

int report_trailer_body_at;

/* every byte of Report Trailer Body set to one value */
inline fill_report_trailer_body(report_trailer_body_record, report_trailer_body_value) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> report_trailer_body_record.number_of_records_long_4[report_trailer_body_at] = report_trailer_body_value; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  report_trailer_body_record.reserved_1 = report_trailer_body_value;
  skip
}

/* each byte of Report Trailer Body set to where it lies, so a field read out of place says so */
inline ramp_report_trailer_body(report_trailer_body_record, report_trailer_body_base) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> report_trailer_body_record.number_of_records_long_4[report_trailer_body_at] = (report_trailer_body_base + 0 + report_trailer_body_at + 1) % 256; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  report_trailer_body_record.reserved_1 = (report_trailer_body_base + 4 + 1) % 256;
  skip
}

/* Report Trailer Body to the wire, 5 bytes from where the cursor stands */
inline encode_report_trailer_body(report_trailer_body_record) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> wire[at] = report_trailer_body_record.number_of_records_long_4[report_trailer_body_at]; at = at + 1; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  wire[at] = report_trailer_body_record.reserved_1; at = at + 1;
  skip
}

/* Report Trailer Body off the wire, 5 bytes from where the cursor stands */
inline decode_report_trailer_body(report_trailer_body_record) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> report_trailer_body_record.number_of_records_long_4[report_trailer_body_at] = wire[at]; at = at + 1; report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  report_trailer_body_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Report Trailer Body is what was written, byte for byte */
inline equal_report_trailer_body(report_trailer_body_read, report_trailer_body_written) {
  report_trailer_body_at = 0;
  do
  :: report_trailer_body_at < 4 -> assert(report_trailer_body_read.number_of_records_long_4[report_trailer_body_at] == report_trailer_body_written.number_of_records_long_4[report_trailer_body_at]); report_trailer_body_at = report_trailer_body_at + 1
  :: else -> break
  od;
  assert(report_trailer_body_read.reserved_1 == report_trailer_body_written.reserved_1);
  skip
}

/* ---- Contingency Broadcast Message: 204 bytes -------------------------------- */

/* Sent as BCAST_CONTI_MSG at the start and the end of an outage of one or more streams */
typedef ContingencyBroadcastMessage {
  byte stream_number[2];
  byte outage_status[2];
  byte reserved_200[200]
};

int contingency_broadcast_message_at;

/* every byte of Contingency Broadcast Message set to one value */
inline fill_contingency_broadcast_message(contingency_broadcast_message_record, contingency_broadcast_message_value) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at] = contingency_broadcast_message_value; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.outage_status[contingency_broadcast_message_at] = contingency_broadcast_message_value; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at] = contingency_broadcast_message_value; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Contingency Broadcast Message set to where it lies, so a field read out of place says so */
inline ramp_contingency_broadcast_message(contingency_broadcast_message_record, contingency_broadcast_message_base) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at] = (contingency_broadcast_message_base + 0 + contingency_broadcast_message_at + 1) % 256; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.outage_status[contingency_broadcast_message_at] = (contingency_broadcast_message_base + 2 + contingency_broadcast_message_at + 1) % 256; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at] = (contingency_broadcast_message_base + 4 + contingency_broadcast_message_at + 1) % 256; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* Contingency Broadcast Message to the wire, 204 bytes from where the cursor stands */
inline encode_contingency_broadcast_message(contingency_broadcast_message_record) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> wire[at] = contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> wire[at] = contingency_broadcast_message_record.outage_status[contingency_broadcast_message_at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> wire[at] = contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* Contingency Broadcast Message off the wire, 204 bytes from where the cursor stands */
inline decode_contingency_broadcast_message(contingency_broadcast_message_record) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.stream_number[contingency_broadcast_message_at] = wire[at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> contingency_broadcast_message_record.outage_status[contingency_broadcast_message_at] = wire[at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> contingency_broadcast_message_record.reserved_200[contingency_broadcast_message_at] = wire[at]; at = at + 1; contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Contingency Broadcast Message is what was written, byte for byte */
inline equal_contingency_broadcast_message(contingency_broadcast_message_read, contingency_broadcast_message_written) {
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> assert(contingency_broadcast_message_read.stream_number[contingency_broadcast_message_at] == contingency_broadcast_message_written.stream_number[contingency_broadcast_message_at]); contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 2 -> assert(contingency_broadcast_message_read.outage_status[contingency_broadcast_message_at] == contingency_broadcast_message_written.outage_status[contingency_broadcast_message_at]); contingency_broadcast_message_at = contingency_broadcast_message_at + 1
  :: else -> break
  od;
  contingency_broadcast_message_at = 0;
  do
  :: contingency_broadcast_message_at < 200 -> assert(contingency_broadcast_message_read.reserved_200[contingency_broadcast_message_at] == contingency_broadcast_message_written.reserved_200[contingency_broadcast_message_at]); contingency_broadcast_message_at = contingency_broadcast_message_at + 1
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
    assert(at == 12);
    at = 0;
    decode_sec_info(sec_info_got);
    assert(at == 12);
    equal_sec_info(sec_info_got, sec_info_sent)
  }
}

/* Change Participant Status Message: encoded, read back, and compared */
proctype check_change_participant_status_message() {
  ChangeParticipantStatusMessage change_participant_status_message_sent;
  ChangeParticipantStatusMessage change_participant_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_change_participant_status_message(change_participant_status_message_sent, 0)
  :: pattern == 1 -> fill_change_participant_status_message(change_participant_status_message_sent, 32)
  :: pattern == 2 -> fill_change_participant_status_message(change_participant_status_message_sent, 255)
  :: else -> ramp_change_participant_status_message(change_participant_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_change_participant_status_message(change_participant_status_message_sent);
    assert(at == 43);
    at = 0;
    decode_change_participant_status_message(change_participant_status_message_got);
    assert(at == 43);
    equal_change_participant_status_message(change_participant_status_message_got, change_participant_status_message_sent)
  }
}

/* Turnover Limit Exceeded Message: encoded, read back, and compared */
proctype check_turnover_limit_exceeded_message() {
  TurnoverLimitExceededMessage turnover_limit_exceeded_message_sent;
  TurnoverLimitExceededMessage turnover_limit_exceeded_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_turnover_limit_exceeded_message(turnover_limit_exceeded_message_sent, 0)
  :: pattern == 1 -> fill_turnover_limit_exceeded_message(turnover_limit_exceeded_message_sent, 32)
  :: pattern == 2 -> fill_turnover_limit_exceeded_message(turnover_limit_exceeded_message_sent, 255)
  :: else -> ramp_turnover_limit_exceeded_message(turnover_limit_exceeded_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_turnover_limit_exceeded_message(turnover_limit_exceeded_message_sent);
    assert(at == 37);
    at = 0;
    decode_turnover_limit_exceeded_message(turnover_limit_exceeded_message_got);
    assert(at == 37);
    equal_turnover_limit_exceeded_message(turnover_limit_exceeded_message_got, turnover_limit_exceeded_message_sent)
  }
}

/* Broker Reactivated Message: encoded, read back, and compared */
proctype check_broker_reactivated_message() {
  BrokerReactivatedMessage broker_reactivated_message_sent;
  BrokerReactivatedMessage broker_reactivated_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_broker_reactivated_message(broker_reactivated_message_sent, 0)
  :: pattern == 1 -> fill_broker_reactivated_message(broker_reactivated_message_sent, 32)
  :: pattern == 2 -> fill_broker_reactivated_message(broker_reactivated_message_sent, 255)
  :: else -> ramp_broker_reactivated_message(broker_reactivated_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_broker_reactivated_message(broker_reactivated_message_sent);
    assert(at == 37);
    at = 0;
    decode_broker_reactivated_message(broker_reactivated_message_got);
    assert(at == 37);
    equal_broker_reactivated_message(broker_reactivated_message_got, broker_reactivated_message_sent)
  }
}

/* St Auction Inq Info: encoded, read back, and compared */
proctype check_st_auction_inq_info() {
  StAuctionInqInfo st_auction_inq_info_sent;
  StAuctionInqInfo st_auction_inq_info_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_st_auction_inq_info(st_auction_inq_info_sent, 0)
  :: pattern == 1 -> fill_st_auction_inq_info(st_auction_inq_info_sent, 32)
  :: pattern == 2 -> fill_st_auction_inq_info(st_auction_inq_info_sent, 255)
  :: else -> ramp_st_auction_inq_info(st_auction_inq_info_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_st_auction_inq_info(st_auction_inq_info_sent);
    assert(at == 36);
    at = 0;
    decode_st_auction_inq_info(st_auction_inq_info_got);
    assert(at == 36);
    equal_st_auction_inq_info(st_auction_inq_info_got, st_auction_inq_info_sent)
  }
}

/* Auction Activity Message: encoded, read back, and compared */
proctype check_auction_activity_message() {
  AuctionActivityMessage auction_activity_message_sent;
  AuctionActivityMessage auction_activity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_activity_message(auction_activity_message_sent, 0)
  :: pattern == 1 -> fill_auction_activity_message(auction_activity_message_sent, 32)
  :: pattern == 2 -> fill_auction_activity_message(auction_activity_message_sent, 255)
  :: else -> ramp_auction_activity_message(auction_activity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_activity_message(auction_activity_message_sent);
    assert(at == 36);
    at = 0;
    decode_auction_activity_message(auction_activity_message_got);
    assert(at == 36);
    equal_auction_activity_message(auction_activity_message_got, auction_activity_message_sent)
  }
}

/* Security Open Message: encoded, read back, and compared */
proctype check_security_open_message() {
  SecurityOpenMessage security_open_message_sent;
  SecurityOpenMessage security_open_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_open_message(security_open_message_sent, 0)
  :: pattern == 1 -> fill_security_open_message(security_open_message_sent, 32)
  :: pattern == 2 -> fill_security_open_message(security_open_message_sent, 255)
  :: else -> ramp_security_open_message(security_open_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_open_message(security_open_message_sent);
    assert(at == 20);
    at = 0;
    decode_security_open_message(security_open_message_got);
    assert(at == 20);
    equal_security_open_message(security_open_message_got, security_open_message_sent)
  }
}

/* Report Header Body: encoded, read back, and compared */
proctype check_report_header_body() {
  ReportHeaderBody report_header_body_sent;
  ReportHeaderBody report_header_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_report_header_body(report_header_body_sent, 0)
  :: pattern == 1 -> fill_report_header_body(report_header_body_sent, 32)
  :: pattern == 2 -> fill_report_header_body(report_header_body_sent, 255)
  :: else -> ramp_report_header_body(report_header_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_report_header_body(report_header_body_sent);
    assert(at == 67);
    at = 0;
    decode_report_header_body(report_header_body_got);
    assert(at == 67);
    equal_report_header_body(report_header_body_got, report_header_body_sent)
  }
}

/* Report Trailer Body: encoded, read back, and compared */
proctype check_report_trailer_body() {
  ReportTrailerBody report_trailer_body_sent;
  ReportTrailerBody report_trailer_body_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_report_trailer_body(report_trailer_body_sent, 0)
  :: pattern == 1 -> fill_report_trailer_body(report_trailer_body_sent, 32)
  :: pattern == 2 -> fill_report_trailer_body(report_trailer_body_sent, 255)
  :: else -> ramp_report_trailer_body(report_trailer_body_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_report_trailer_body(report_trailer_body_sent);
    assert(at == 5);
    at = 0;
    decode_report_trailer_body(report_trailer_body_got);
    assert(at == 5);
    equal_report_trailer_body(report_trailer_body_got, report_trailer_body_sent)
  }
}

/* Contingency Broadcast Message: encoded, read back, and compared */
proctype check_contingency_broadcast_message() {
  ContingencyBroadcastMessage contingency_broadcast_message_sent;
  ContingencyBroadcastMessage contingency_broadcast_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_contingency_broadcast_message(contingency_broadcast_message_sent, 0)
  :: pattern == 1 -> fill_contingency_broadcast_message(contingency_broadcast_message_sent, 32)
  :: pattern == 2 -> fill_contingency_broadcast_message(contingency_broadcast_message_sent, 255)
  :: else -> ramp_contingency_broadcast_message(contingency_broadcast_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_contingency_broadcast_message(contingency_broadcast_message_sent);
    assert(at == 204);
    at = 0;
    decode_contingency_broadcast_message(contingency_broadcast_message_got);
    assert(at == 204);
    equal_contingency_broadcast_message(contingency_broadcast_message_got, contingency_broadcast_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_bcast_header()
  :: run check_sec_info()
  :: run check_change_participant_status_message()
  :: run check_turnover_limit_exceeded_message()
  :: run check_broker_reactivated_message()
  :: run check_st_auction_inq_info()
  :: run check_auction_activity_message()
  :: run check_security_open_message()
  :: run check_report_header_body()
  :: run check_report_trailer_body()
  :: run check_contingency_broadcast_message()
  fi
}
