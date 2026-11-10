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
#define WIRE 44

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

/* ---- Participant Master Change Message: 44 bytes ----------------------------- */

/* Sent whenever there is any participant change */
typedef ParticipantMasterChangeMessage {
  byte participant_id[12];
  byte participant_name[25];
  byte participant_status;
  byte participant_update_date_time[4];
  byte delete_flag;
  byte reserved_1
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
  participant_master_change_message_record.reserved_1 = participant_master_change_message_value;
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
  participant_master_change_message_record.reserved_1 = (participant_master_change_message_base + 43 + 1) % 256;
  skip
}

/* Participant Master Change Message to the wire, 44 bytes from where the cursor stands */
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
  wire[at] = participant_master_change_message_record.reserved_1; at = at + 1;
  skip
}

/* Participant Master Change Message off the wire, 44 bytes from where the cursor stands */
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
  participant_master_change_message_record.reserved_1 = wire[at]; at = at + 1;
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
  assert(participant_master_change_message_read.reserved_1 == participant_master_change_message_written.reserved_1);
  skip
}

/* ---- Turnover Exceeded Message: 37 bytes ------------------------------------- */

/* Sent when a broker turnover is about to exceed or has already exceeded the limit, deactivating the broker */
typedef TurnoverExceededMessage {
  byte broker_code[5];
  byte counter_broker_code[5];
  byte warning_type[2];
  SecInfo sec_info;
  byte trade_number[4];
  byte trade_price[4];
  byte trade_volume[4];
  byte final
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
  fill_sec_info(turnover_exceeded_message_record.sec_info, turnover_exceeded_message_value);
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
  ramp_sec_info(turnover_exceeded_message_record.sec_info, turnover_exceeded_message_base + 12);
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_number[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 24 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_price[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 28 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_at = 0;
  do
  :: turnover_exceeded_message_at < 4 -> turnover_exceeded_message_record.trade_volume[turnover_exceeded_message_at] = (turnover_exceeded_message_base + 32 + turnover_exceeded_message_at + 1) % 256; turnover_exceeded_message_at = turnover_exceeded_message_at + 1
  :: else -> break
  od;
  turnover_exceeded_message_record.final = (turnover_exceeded_message_base + 36 + 1) % 256;
  skip
}

/* Turnover Exceeded Message to the wire, 37 bytes from where the cursor stands */
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
  encode_sec_info(turnover_exceeded_message_record.sec_info);
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
  skip
}

/* Turnover Exceeded Message off the wire, 37 bytes from where the cursor stands */
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
  decode_sec_info(turnover_exceeded_message_record.sec_info);
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
  equal_sec_info(turnover_exceeded_message_read.sec_info, turnover_exceeded_message_written.sec_info);
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
  skip
}

/* ---- Broker Reactivated Message: 37 bytes ------------------------------------ */

/* Sent when a broker is reactivated after being deactivated */
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
  byte auction_status_short_2[2];
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
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.auction_status_short_2[st_auction_inq_info_at] = st_auction_inq_info_value; st_auction_inq_info_at = st_auction_inq_info_at + 1
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
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.auction_status_short_2[st_auction_inq_info_at] = (st_auction_inq_info_base + 6 + st_auction_inq_info_at + 1) % 256; st_auction_inq_info_at = st_auction_inq_info_at + 1
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
  :: st_auction_inq_info_at < 2 -> wire[at] = st_auction_inq_info_record.auction_status_short_2[st_auction_inq_info_at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
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
  :: st_auction_inq_info_at < 2 -> st_auction_inq_info_record.auction_status_short_2[st_auction_inq_info_at] = wire[at]; at = at + 1; st_auction_inq_info_at = st_auction_inq_info_at + 1
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
  :: st_auction_inq_info_at < 2 -> assert(st_auction_inq_info_read.auction_status_short_2[st_auction_inq_info_at] == st_auction_inq_info_written.auction_status_short_2[st_auction_inq_info_at]); st_auction_inq_info_at = st_auction_inq_info_at + 1
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

/* ---- Auction Inquiry Message: 36 bytes --------------------------------------- */

/* Sent whenever there is any auction related activity, including a change in the auction market by order */
typedef AuctionInquiryMessage {
  StAuctionInqInfo st_auction_inq_info
};

/* every byte of Auction Inquiry Message set to one value */
inline fill_auction_inquiry_message(auction_inquiry_message_record, auction_inquiry_message_value) {
  fill_st_auction_inq_info(auction_inquiry_message_record.st_auction_inq_info, auction_inquiry_message_value);
  skip
}

/* each byte of Auction Inquiry Message set to where it lies, so a field read out of place says so */
inline ramp_auction_inquiry_message(auction_inquiry_message_record, auction_inquiry_message_base) {
  ramp_st_auction_inq_info(auction_inquiry_message_record.st_auction_inq_info, auction_inquiry_message_base + 0);
  skip
}

/* Auction Inquiry Message to the wire, 36 bytes from where the cursor stands */
inline encode_auction_inquiry_message(auction_inquiry_message_record) {
  encode_st_auction_inq_info(auction_inquiry_message_record.st_auction_inq_info);
  skip
}

/* Auction Inquiry Message off the wire, 36 bytes from where the cursor stands */
inline decode_auction_inquiry_message(auction_inquiry_message_record) {
  decode_st_auction_inq_info(auction_inquiry_message_record.st_auction_inq_info);
  skip
}

/* what was read of Auction Inquiry Message is what was written, byte for byte */
inline equal_auction_inquiry_message(auction_inquiry_message_read, auction_inquiry_message_written) {
  equal_st_auction_inq_info(auction_inquiry_message_read.st_auction_inq_info, auction_inquiry_message_written.st_auction_inq_info);
  skip
}

/* ---- Symbol Status Change Action Message: 18 bytes --------------------------- */

/* Carries a security level trading or market status change */
typedef SymbolStatusChangeActionMessage {
  SecInfo sec_info;
  byte market_type[2];
  byte reserved_2[2];
  byte action_code_short_2[2]
};

int symbol_status_change_action_message_at;

/* every byte of Symbol Status Change Action Message set to one value */
inline fill_symbol_status_change_action_message(symbol_status_change_action_message_record, symbol_status_change_action_message_value) {
  fill_sec_info(symbol_status_change_action_message_record.sec_info, symbol_status_change_action_message_value);
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> symbol_status_change_action_message_record.market_type[symbol_status_change_action_message_at] = symbol_status_change_action_message_value; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> symbol_status_change_action_message_record.reserved_2[symbol_status_change_action_message_at] = symbol_status_change_action_message_value; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> symbol_status_change_action_message_record.action_code_short_2[symbol_status_change_action_message_at] = symbol_status_change_action_message_value; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Status Change Action Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_status_change_action_message(symbol_status_change_action_message_record, symbol_status_change_action_message_base) {
  ramp_sec_info(symbol_status_change_action_message_record.sec_info, symbol_status_change_action_message_base + 0);
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> symbol_status_change_action_message_record.market_type[symbol_status_change_action_message_at] = (symbol_status_change_action_message_base + 12 + symbol_status_change_action_message_at + 1) % 256; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> symbol_status_change_action_message_record.reserved_2[symbol_status_change_action_message_at] = (symbol_status_change_action_message_base + 14 + symbol_status_change_action_message_at + 1) % 256; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> symbol_status_change_action_message_record.action_code_short_2[symbol_status_change_action_message_at] = (symbol_status_change_action_message_base + 16 + symbol_status_change_action_message_at + 1) % 256; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Status Change Action Message to the wire, 18 bytes from where the cursor stands */
inline encode_symbol_status_change_action_message(symbol_status_change_action_message_record) {
  encode_sec_info(symbol_status_change_action_message_record.sec_info);
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> wire[at] = symbol_status_change_action_message_record.market_type[symbol_status_change_action_message_at]; at = at + 1; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> wire[at] = symbol_status_change_action_message_record.reserved_2[symbol_status_change_action_message_at]; at = at + 1; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> wire[at] = symbol_status_change_action_message_record.action_code_short_2[symbol_status_change_action_message_at]; at = at + 1; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Status Change Action Message off the wire, 18 bytes from where the cursor stands */
inline decode_symbol_status_change_action_message(symbol_status_change_action_message_record) {
  decode_sec_info(symbol_status_change_action_message_record.sec_info);
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> symbol_status_change_action_message_record.market_type[symbol_status_change_action_message_at] = wire[at]; at = at + 1; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> symbol_status_change_action_message_record.reserved_2[symbol_status_change_action_message_at] = wire[at]; at = at + 1; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> symbol_status_change_action_message_record.action_code_short_2[symbol_status_change_action_message_at] = wire[at]; at = at + 1; symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Status Change Action Message is what was written, byte for byte */
inline equal_symbol_status_change_action_message(symbol_status_change_action_message_read, symbol_status_change_action_message_written) {
  equal_sec_info(symbol_status_change_action_message_read.sec_info, symbol_status_change_action_message_written.sec_info);
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> assert(symbol_status_change_action_message_read.market_type[symbol_status_change_action_message_at] == symbol_status_change_action_message_written.market_type[symbol_status_change_action_message_at]); symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> assert(symbol_status_change_action_message_read.reserved_2[symbol_status_change_action_message_at] == symbol_status_change_action_message_written.reserved_2[symbol_status_change_action_message_at]); symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  symbol_status_change_action_message_at = 0;
  do
  :: symbol_status_change_action_message_at < 2 -> assert(symbol_status_change_action_message_read.action_code_short_2[symbol_status_change_action_message_at] == symbol_status_change_action_message_written.action_code_short_2[symbol_status_change_action_message_at]); symbol_status_change_action_message_at = symbol_status_change_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Security Open Price Message: 18 bytes ----------------------------------- */

/* Carries the open price of a security when the market opens. The document states this transaction code is not sent by the exchange */
typedef SecurityOpenPriceMessage {
  SecInfo sec_info;
  byte token_short_2[2];
  byte opening_price[4]
};

int security_open_price_message_at;

/* every byte of Security Open Price Message set to one value */
inline fill_security_open_price_message(security_open_price_message_record, security_open_price_message_value) {
  fill_sec_info(security_open_price_message_record.sec_info, security_open_price_message_value);
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 2 -> security_open_price_message_record.token_short_2[security_open_price_message_at] = security_open_price_message_value; security_open_price_message_at = security_open_price_message_at + 1
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
  ramp_sec_info(security_open_price_message_record.sec_info, security_open_price_message_base + 0);
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 2 -> security_open_price_message_record.token_short_2[security_open_price_message_at] = (security_open_price_message_base + 12 + security_open_price_message_at + 1) % 256; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> security_open_price_message_record.opening_price[security_open_price_message_at] = (security_open_price_message_base + 14 + security_open_price_message_at + 1) % 256; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Open Price Message to the wire, 18 bytes from where the cursor stands */
inline encode_security_open_price_message(security_open_price_message_record) {
  encode_sec_info(security_open_price_message_record.sec_info);
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 2 -> wire[at] = security_open_price_message_record.token_short_2[security_open_price_message_at]; at = at + 1; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> wire[at] = security_open_price_message_record.opening_price[security_open_price_message_at]; at = at + 1; security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Open Price Message off the wire, 18 bytes from where the cursor stands */
inline decode_security_open_price_message(security_open_price_message_record) {
  decode_sec_info(security_open_price_message_record.sec_info);
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 2 -> security_open_price_message_record.token_short_2[security_open_price_message_at] = wire[at]; at = at + 1; security_open_price_message_at = security_open_price_message_at + 1
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
  equal_sec_info(security_open_price_message_read.sec_info, security_open_price_message_written.sec_info);
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 2 -> assert(security_open_price_message_read.token_short_2[security_open_price_message_at] == security_open_price_message_written.token_short_2[security_open_price_message_at]); security_open_price_message_at = security_open_price_message_at + 1
  :: else -> break
  od;
  security_open_price_message_at = 0;
  do
  :: security_open_price_message_at < 4 -> assert(security_open_price_message_read.opening_price[security_open_price_message_at] == security_open_price_message_written.opening_price[security_open_price_message_at]); security_open_price_message_at = security_open_price_message_at + 1
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
    assert(at == 44);
    at = 0;
    decode_participant_master_change_message(participant_master_change_message_got);
    assert(at == 44);
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
    assert(at == 37);
    at = 0;
    decode_turnover_exceeded_message(turnover_exceeded_message_got);
    assert(at == 37);
    equal_turnover_exceeded_message(turnover_exceeded_message_got, turnover_exceeded_message_sent)
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

/* Auction Inquiry Message: encoded, read back, and compared */
proctype check_auction_inquiry_message() {
  AuctionInquiryMessage auction_inquiry_message_sent;
  AuctionInquiryMessage auction_inquiry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_inquiry_message(auction_inquiry_message_sent, 0)
  :: pattern == 1 -> fill_auction_inquiry_message(auction_inquiry_message_sent, 32)
  :: pattern == 2 -> fill_auction_inquiry_message(auction_inquiry_message_sent, 255)
  :: else -> ramp_auction_inquiry_message(auction_inquiry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_inquiry_message(auction_inquiry_message_sent);
    assert(at == 36);
    at = 0;
    decode_auction_inquiry_message(auction_inquiry_message_got);
    assert(at == 36);
    equal_auction_inquiry_message(auction_inquiry_message_got, auction_inquiry_message_sent)
  }
}

/* Symbol Status Change Action Message: encoded, read back, and compared */
proctype check_symbol_status_change_action_message() {
  SymbolStatusChangeActionMessage symbol_status_change_action_message_sent;
  SymbolStatusChangeActionMessage symbol_status_change_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_status_change_action_message(symbol_status_change_action_message_sent, 0)
  :: pattern == 1 -> fill_symbol_status_change_action_message(symbol_status_change_action_message_sent, 32)
  :: pattern == 2 -> fill_symbol_status_change_action_message(symbol_status_change_action_message_sent, 255)
  :: else -> ramp_symbol_status_change_action_message(symbol_status_change_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_status_change_action_message(symbol_status_change_action_message_sent);
    assert(at == 18);
    at = 0;
    decode_symbol_status_change_action_message(symbol_status_change_action_message_got);
    assert(at == 18);
    equal_symbol_status_change_action_message(symbol_status_change_action_message_got, symbol_status_change_action_message_sent)
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
    assert(at == 18);
    at = 0;
    decode_security_open_price_message(security_open_price_message_got);
    assert(at == 18);
    equal_security_open_price_message(security_open_price_message_got, security_open_price_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_bcast_header()
  :: run check_sec_info()
  :: run check_participant_master_change_message()
  :: run check_turnover_exceeded_message()
  :: run check_broker_reactivated_message()
  :: run check_st_auction_inq_info()
  :: run check_auction_inquiry_message()
  :: run check_symbol_status_change_action_message()
  :: run check_security_open_price_message()
  fi
}
