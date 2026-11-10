/*
 * Box Options Market Sola Order Entry
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
 *   - a Reassemble rule
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 358

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Outgoing Header: 30 bytes ----------------------------------------------- */

/* The header on all outgoing exchange messages */
typedef OutgoingHeader {
  byte message_type[2];
  byte message_timestamp[6];
  byte user_sequence_i_d[8];
  byte exchange_message_id[6];
  byte gap_sequence_i_d[2];
  byte system_sequence_i_d[6]
};

int outgoing_header_at;

/* every byte of Outgoing Header set to one value */
inline fill_outgoing_header(outgoing_header_record, outgoing_header_value) {
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 2 -> outgoing_header_record.message_type[outgoing_header_at] = outgoing_header_value; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> outgoing_header_record.message_timestamp[outgoing_header_at] = outgoing_header_value; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 8 -> outgoing_header_record.user_sequence_i_d[outgoing_header_at] = outgoing_header_value; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> outgoing_header_record.exchange_message_id[outgoing_header_at] = outgoing_header_value; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 2 -> outgoing_header_record.gap_sequence_i_d[outgoing_header_at] = outgoing_header_value; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> outgoing_header_record.system_sequence_i_d[outgoing_header_at] = outgoing_header_value; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outgoing Header set to where it lies, so a field read out of place says so */
inline ramp_outgoing_header(outgoing_header_record, outgoing_header_base) {
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 2 -> outgoing_header_record.message_type[outgoing_header_at] = (outgoing_header_base + 0 + outgoing_header_at + 1) % 256; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> outgoing_header_record.message_timestamp[outgoing_header_at] = (outgoing_header_base + 2 + outgoing_header_at + 1) % 256; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 8 -> outgoing_header_record.user_sequence_i_d[outgoing_header_at] = (outgoing_header_base + 8 + outgoing_header_at + 1) % 256; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> outgoing_header_record.exchange_message_id[outgoing_header_at] = (outgoing_header_base + 16 + outgoing_header_at + 1) % 256; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 2 -> outgoing_header_record.gap_sequence_i_d[outgoing_header_at] = (outgoing_header_base + 22 + outgoing_header_at + 1) % 256; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> outgoing_header_record.system_sequence_i_d[outgoing_header_at] = (outgoing_header_base + 24 + outgoing_header_at + 1) % 256; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  skip
}

/* Outgoing Header to the wire, 30 bytes from where the cursor stands */
inline encode_outgoing_header(outgoing_header_record) {
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 2 -> wire[at] = outgoing_header_record.message_type[outgoing_header_at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> wire[at] = outgoing_header_record.message_timestamp[outgoing_header_at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 8 -> wire[at] = outgoing_header_record.user_sequence_i_d[outgoing_header_at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> wire[at] = outgoing_header_record.exchange_message_id[outgoing_header_at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 2 -> wire[at] = outgoing_header_record.gap_sequence_i_d[outgoing_header_at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> wire[at] = outgoing_header_record.system_sequence_i_d[outgoing_header_at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  skip
}

/* Outgoing Header off the wire, 30 bytes from where the cursor stands */
inline decode_outgoing_header(outgoing_header_record) {
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 2 -> outgoing_header_record.message_type[outgoing_header_at] = wire[at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> outgoing_header_record.message_timestamp[outgoing_header_at] = wire[at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 8 -> outgoing_header_record.user_sequence_i_d[outgoing_header_at] = wire[at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> outgoing_header_record.exchange_message_id[outgoing_header_at] = wire[at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 2 -> outgoing_header_record.gap_sequence_i_d[outgoing_header_at] = wire[at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> outgoing_header_record.system_sequence_i_d[outgoing_header_at] = wire[at]; at = at + 1; outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outgoing Header is what was written, byte for byte */
inline equal_outgoing_header(outgoing_header_read, outgoing_header_written) {
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 2 -> assert(outgoing_header_read.message_type[outgoing_header_at] == outgoing_header_written.message_type[outgoing_header_at]); outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> assert(outgoing_header_read.message_timestamp[outgoing_header_at] == outgoing_header_written.message_timestamp[outgoing_header_at]); outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 8 -> assert(outgoing_header_read.user_sequence_i_d[outgoing_header_at] == outgoing_header_written.user_sequence_i_d[outgoing_header_at]); outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> assert(outgoing_header_read.exchange_message_id[outgoing_header_at] == outgoing_header_written.exchange_message_id[outgoing_header_at]); outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 2 -> assert(outgoing_header_read.gap_sequence_i_d[outgoing_header_at] == outgoing_header_written.gap_sequence_i_d[outgoing_header_at]); outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  outgoing_header_at = 0;
  do
  :: outgoing_header_at < 6 -> assert(outgoing_header_read.system_sequence_i_d[outgoing_header_at] == outgoing_header_written.system_sequence_i_d[outgoing_header_at]); outgoing_header_at = outgoing_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heartbeat Question: 20 bytes -------------------------------------------- */

typedef HeartbeatQuestion {
  byte first_user_sequence_i_d[8];
  byte last_exchange_message_id_sent_to_participant[6];
  byte time_local[6]
};

int heartbeat_question_at;

/* every byte of Heartbeat Question set to one value */
inline fill_heartbeat_question(heartbeat_question_record, heartbeat_question_value) {
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 8 -> heartbeat_question_record.first_user_sequence_i_d[heartbeat_question_at] = heartbeat_question_value; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.last_exchange_message_id_sent_to_participant[heartbeat_question_at] = heartbeat_question_value; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.time_local[heartbeat_question_at] = heartbeat_question_value; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Question set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_question(heartbeat_question_record, heartbeat_question_base) {
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 8 -> heartbeat_question_record.first_user_sequence_i_d[heartbeat_question_at] = (heartbeat_question_base + 0 + heartbeat_question_at + 1) % 256; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.last_exchange_message_id_sent_to_participant[heartbeat_question_at] = (heartbeat_question_base + 8 + heartbeat_question_at + 1) % 256; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.time_local[heartbeat_question_at] = (heartbeat_question_base + 14 + heartbeat_question_at + 1) % 256; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Question to the wire, 20 bytes from where the cursor stands */
inline encode_heartbeat_question(heartbeat_question_record) {
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 8 -> wire[at] = heartbeat_question_record.first_user_sequence_i_d[heartbeat_question_at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> wire[at] = heartbeat_question_record.last_exchange_message_id_sent_to_participant[heartbeat_question_at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> wire[at] = heartbeat_question_record.time_local[heartbeat_question_at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Question off the wire, 20 bytes from where the cursor stands */
inline decode_heartbeat_question(heartbeat_question_record) {
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 8 -> heartbeat_question_record.first_user_sequence_i_d[heartbeat_question_at] = wire[at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.last_exchange_message_id_sent_to_participant[heartbeat_question_at] = wire[at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.time_local[heartbeat_question_at] = wire[at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Question is what was written, byte for byte */
inline equal_heartbeat_question(heartbeat_question_read, heartbeat_question_written) {
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 8 -> assert(heartbeat_question_read.first_user_sequence_i_d[heartbeat_question_at] == heartbeat_question_written.first_user_sequence_i_d[heartbeat_question_at]); heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> assert(heartbeat_question_read.last_exchange_message_id_sent_to_participant[heartbeat_question_at] == heartbeat_question_written.last_exchange_message_id_sent_to_participant[heartbeat_question_at]); heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> assert(heartbeat_question_read.time_local[heartbeat_question_at] == heartbeat_question_written.time_local[heartbeat_question_at]); heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Out Of Sequence: 22 bytes ----------------------------------------------- */

typedef OutOfSequence {
  byte received_user_sequence_id[8];
  byte expected_last_user_sequence_id[8];
  byte message_time_local[6]
};

int out_of_sequence_at;

/* every byte of Out Of Sequence set to one value */
inline fill_out_of_sequence(out_of_sequence_record, out_of_sequence_value) {
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 8 -> out_of_sequence_record.received_user_sequence_id[out_of_sequence_at] = out_of_sequence_value; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 8 -> out_of_sequence_record.expected_last_user_sequence_id[out_of_sequence_at] = out_of_sequence_value; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 6 -> out_of_sequence_record.message_time_local[out_of_sequence_at] = out_of_sequence_value; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Out Of Sequence set to where it lies, so a field read out of place says so */
inline ramp_out_of_sequence(out_of_sequence_record, out_of_sequence_base) {
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 8 -> out_of_sequence_record.received_user_sequence_id[out_of_sequence_at] = (out_of_sequence_base + 0 + out_of_sequence_at + 1) % 256; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 8 -> out_of_sequence_record.expected_last_user_sequence_id[out_of_sequence_at] = (out_of_sequence_base + 8 + out_of_sequence_at + 1) % 256; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 6 -> out_of_sequence_record.message_time_local[out_of_sequence_at] = (out_of_sequence_base + 16 + out_of_sequence_at + 1) % 256; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  skip
}

/* Out Of Sequence to the wire, 22 bytes from where the cursor stands */
inline encode_out_of_sequence(out_of_sequence_record) {
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 8 -> wire[at] = out_of_sequence_record.received_user_sequence_id[out_of_sequence_at]; at = at + 1; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 8 -> wire[at] = out_of_sequence_record.expected_last_user_sequence_id[out_of_sequence_at]; at = at + 1; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 6 -> wire[at] = out_of_sequence_record.message_time_local[out_of_sequence_at]; at = at + 1; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  skip
}

/* Out Of Sequence off the wire, 22 bytes from where the cursor stands */
inline decode_out_of_sequence(out_of_sequence_record) {
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 8 -> out_of_sequence_record.received_user_sequence_id[out_of_sequence_at] = wire[at]; at = at + 1; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 8 -> out_of_sequence_record.expected_last_user_sequence_id[out_of_sequence_at] = wire[at]; at = at + 1; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 6 -> out_of_sequence_record.message_time_local[out_of_sequence_at] = wire[at]; at = at + 1; out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Out Of Sequence is what was written, byte for byte */
inline equal_out_of_sequence(out_of_sequence_read, out_of_sequence_written) {
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 8 -> assert(out_of_sequence_read.received_user_sequence_id[out_of_sequence_at] == out_of_sequence_written.received_user_sequence_id[out_of_sequence_at]); out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 8 -> assert(out_of_sequence_read.expected_last_user_sequence_id[out_of_sequence_at] == out_of_sequence_written.expected_last_user_sequence_id[out_of_sequence_at]); out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  out_of_sequence_at = 0;
  do
  :: out_of_sequence_at < 6 -> assert(out_of_sequence_read.message_time_local[out_of_sequence_at] == out_of_sequence_written.message_time_local[out_of_sequence_at]); out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Technical Error Notice: 218 bytes --------------------------------------- */

typedef TechnicalErrorNotice {
  byte received_message_type[2];
  byte preceding_user_sequence_i_d_received[8];
  byte error_code[4];
  byte error_position[4];
  byte error_message[100];
  byte start_of_message_in_error[100]
};

int technical_error_notice_at;

/* every byte of Technical Error Notice set to one value */
inline fill_technical_error_notice(technical_error_notice_record, technical_error_notice_value) {
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 2 -> technical_error_notice_record.received_message_type[technical_error_notice_at] = technical_error_notice_value; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 8 -> technical_error_notice_record.preceding_user_sequence_i_d_received[technical_error_notice_at] = technical_error_notice_value; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 4 -> technical_error_notice_record.error_code[technical_error_notice_at] = technical_error_notice_value; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 4 -> technical_error_notice_record.error_position[technical_error_notice_at] = technical_error_notice_value; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 100 -> technical_error_notice_record.error_message[technical_error_notice_at] = technical_error_notice_value; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 100 -> technical_error_notice_record.start_of_message_in_error[technical_error_notice_at] = technical_error_notice_value; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Technical Error Notice set to where it lies, so a field read out of place says so */
inline ramp_technical_error_notice(technical_error_notice_record, technical_error_notice_base) {
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 2 -> technical_error_notice_record.received_message_type[technical_error_notice_at] = (technical_error_notice_base + 0 + technical_error_notice_at + 1) % 256; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 8 -> technical_error_notice_record.preceding_user_sequence_i_d_received[technical_error_notice_at] = (technical_error_notice_base + 2 + technical_error_notice_at + 1) % 256; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 4 -> technical_error_notice_record.error_code[technical_error_notice_at] = (technical_error_notice_base + 10 + technical_error_notice_at + 1) % 256; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 4 -> technical_error_notice_record.error_position[technical_error_notice_at] = (technical_error_notice_base + 14 + technical_error_notice_at + 1) % 256; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 100 -> technical_error_notice_record.error_message[technical_error_notice_at] = (technical_error_notice_base + 18 + technical_error_notice_at + 1) % 256; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 100 -> technical_error_notice_record.start_of_message_in_error[technical_error_notice_at] = (technical_error_notice_base + 118 + technical_error_notice_at + 1) % 256; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Technical Error Notice to the wire, 218 bytes from where the cursor stands */
inline encode_technical_error_notice(technical_error_notice_record) {
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 2 -> wire[at] = technical_error_notice_record.received_message_type[technical_error_notice_at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 8 -> wire[at] = technical_error_notice_record.preceding_user_sequence_i_d_received[technical_error_notice_at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 4 -> wire[at] = technical_error_notice_record.error_code[technical_error_notice_at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 4 -> wire[at] = technical_error_notice_record.error_position[technical_error_notice_at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 100 -> wire[at] = technical_error_notice_record.error_message[technical_error_notice_at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 100 -> wire[at] = technical_error_notice_record.start_of_message_in_error[technical_error_notice_at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Technical Error Notice off the wire, 218 bytes from where the cursor stands */
inline decode_technical_error_notice(technical_error_notice_record) {
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 2 -> technical_error_notice_record.received_message_type[technical_error_notice_at] = wire[at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 8 -> technical_error_notice_record.preceding_user_sequence_i_d_received[technical_error_notice_at] = wire[at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 4 -> technical_error_notice_record.error_code[technical_error_notice_at] = wire[at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 4 -> technical_error_notice_record.error_position[technical_error_notice_at] = wire[at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 100 -> technical_error_notice_record.error_message[technical_error_notice_at] = wire[at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 100 -> technical_error_notice_record.start_of_message_in_error[technical_error_notice_at] = wire[at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Technical Error Notice is what was written, byte for byte */
inline equal_technical_error_notice(technical_error_notice_read, technical_error_notice_written) {
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 2 -> assert(technical_error_notice_read.received_message_type[technical_error_notice_at] == technical_error_notice_written.received_message_type[technical_error_notice_at]); technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 8 -> assert(technical_error_notice_read.preceding_user_sequence_i_d_received[technical_error_notice_at] == technical_error_notice_written.preceding_user_sequence_i_d_received[technical_error_notice_at]); technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 4 -> assert(technical_error_notice_read.error_code[technical_error_notice_at] == technical_error_notice_written.error_code[technical_error_notice_at]); technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 4 -> assert(technical_error_notice_read.error_position[technical_error_notice_at] == technical_error_notice_written.error_position[technical_error_notice_at]); technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 100 -> assert(technical_error_notice_read.error_message[technical_error_notice_at] == technical_error_notice_written.error_message[technical_error_notice_at]); technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  technical_error_notice_at = 0;
  do
  :: technical_error_notice_at < 100 -> assert(technical_error_notice_read.start_of_message_in_error[technical_error_notice_at] == technical_error_notice_written.start_of_message_in_error[technical_error_notice_at]); technical_error_notice_at = technical_error_notice_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Disconnection Instruction Acknowledgement: 12 bytes --------------------- */

typedef DisconnectionInstructionAcknowledgement {
  byte current_session_id[4];
  byte last_user_sequence_id_received[8]
};

int disconnection_instruction_acknowledgement_at;

/* every byte of Disconnection Instruction Acknowledgement set to one value */
inline fill_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_record, disconnection_instruction_acknowledgement_value) {
  disconnection_instruction_acknowledgement_at = 0;
  do
  :: disconnection_instruction_acknowledgement_at < 4 -> disconnection_instruction_acknowledgement_record.current_session_id[disconnection_instruction_acknowledgement_at] = disconnection_instruction_acknowledgement_value; disconnection_instruction_acknowledgement_at = disconnection_instruction_acknowledgement_at + 1
  :: else -> break
  od;
  disconnection_instruction_acknowledgement_at = 0;
  do
  :: disconnection_instruction_acknowledgement_at < 8 -> disconnection_instruction_acknowledgement_record.last_user_sequence_id_received[disconnection_instruction_acknowledgement_at] = disconnection_instruction_acknowledgement_value; disconnection_instruction_acknowledgement_at = disconnection_instruction_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Disconnection Instruction Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_record, disconnection_instruction_acknowledgement_base) {
  disconnection_instruction_acknowledgement_at = 0;
  do
  :: disconnection_instruction_acknowledgement_at < 4 -> disconnection_instruction_acknowledgement_record.current_session_id[disconnection_instruction_acknowledgement_at] = (disconnection_instruction_acknowledgement_base + 0 + disconnection_instruction_acknowledgement_at + 1) % 256; disconnection_instruction_acknowledgement_at = disconnection_instruction_acknowledgement_at + 1
  :: else -> break
  od;
  disconnection_instruction_acknowledgement_at = 0;
  do
  :: disconnection_instruction_acknowledgement_at < 8 -> disconnection_instruction_acknowledgement_record.last_user_sequence_id_received[disconnection_instruction_acknowledgement_at] = (disconnection_instruction_acknowledgement_base + 4 + disconnection_instruction_acknowledgement_at + 1) % 256; disconnection_instruction_acknowledgement_at = disconnection_instruction_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Disconnection Instruction Acknowledgement to the wire, 12 bytes from where the cursor stands */
inline encode_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_record) {
  disconnection_instruction_acknowledgement_at = 0;
  do
  :: disconnection_instruction_acknowledgement_at < 4 -> wire[at] = disconnection_instruction_acknowledgement_record.current_session_id[disconnection_instruction_acknowledgement_at]; at = at + 1; disconnection_instruction_acknowledgement_at = disconnection_instruction_acknowledgement_at + 1
  :: else -> break
  od;
  disconnection_instruction_acknowledgement_at = 0;
  do
  :: disconnection_instruction_acknowledgement_at < 8 -> wire[at] = disconnection_instruction_acknowledgement_record.last_user_sequence_id_received[disconnection_instruction_acknowledgement_at]; at = at + 1; disconnection_instruction_acknowledgement_at = disconnection_instruction_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Disconnection Instruction Acknowledgement off the wire, 12 bytes from where the cursor stands */
inline decode_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_record) {
  disconnection_instruction_acknowledgement_at = 0;
  do
  :: disconnection_instruction_acknowledgement_at < 4 -> disconnection_instruction_acknowledgement_record.current_session_id[disconnection_instruction_acknowledgement_at] = wire[at]; at = at + 1; disconnection_instruction_acknowledgement_at = disconnection_instruction_acknowledgement_at + 1
  :: else -> break
  od;
  disconnection_instruction_acknowledgement_at = 0;
  do
  :: disconnection_instruction_acknowledgement_at < 8 -> disconnection_instruction_acknowledgement_record.last_user_sequence_id_received[disconnection_instruction_acknowledgement_at] = wire[at]; at = at + 1; disconnection_instruction_acknowledgement_at = disconnection_instruction_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Disconnection Instruction Acknowledgement is what was written, byte for byte */
inline equal_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_read, disconnection_instruction_acknowledgement_written) {
  disconnection_instruction_acknowledgement_at = 0;
  do
  :: disconnection_instruction_acknowledgement_at < 4 -> assert(disconnection_instruction_acknowledgement_read.current_session_id[disconnection_instruction_acknowledgement_at] == disconnection_instruction_acknowledgement_written.current_session_id[disconnection_instruction_acknowledgement_at]); disconnection_instruction_acknowledgement_at = disconnection_instruction_acknowledgement_at + 1
  :: else -> break
  od;
  disconnection_instruction_acknowledgement_at = 0;
  do
  :: disconnection_instruction_acknowledgement_at < 8 -> assert(disconnection_instruction_acknowledgement_read.last_user_sequence_id_received[disconnection_instruction_acknowledgement_at] == disconnection_instruction_acknowledgement_written.last_user_sequence_id_received[disconnection_instruction_acknowledgement_at]); disconnection_instruction_acknowledgement_at = disconnection_instruction_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Connection Acknowledgement: 12 bytes ------------------------------------ */

/* Stated by the guide as having the same number of bytes and format as TM, whose fields are written out here. */
typedef ConnectionAcknowledgement {
  byte current_session_id[4];
  byte last_user_sequence_id_received[8]
};

int connection_acknowledgement_at;

/* every byte of Connection Acknowledgement set to one value */
inline fill_connection_acknowledgement(connection_acknowledgement_record, connection_acknowledgement_value) {
  connection_acknowledgement_at = 0;
  do
  :: connection_acknowledgement_at < 4 -> connection_acknowledgement_record.current_session_id[connection_acknowledgement_at] = connection_acknowledgement_value; connection_acknowledgement_at = connection_acknowledgement_at + 1
  :: else -> break
  od;
  connection_acknowledgement_at = 0;
  do
  :: connection_acknowledgement_at < 8 -> connection_acknowledgement_record.last_user_sequence_id_received[connection_acknowledgement_at] = connection_acknowledgement_value; connection_acknowledgement_at = connection_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Connection Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_connection_acknowledgement(connection_acknowledgement_record, connection_acknowledgement_base) {
  connection_acknowledgement_at = 0;
  do
  :: connection_acknowledgement_at < 4 -> connection_acknowledgement_record.current_session_id[connection_acknowledgement_at] = (connection_acknowledgement_base + 0 + connection_acknowledgement_at + 1) % 256; connection_acknowledgement_at = connection_acknowledgement_at + 1
  :: else -> break
  od;
  connection_acknowledgement_at = 0;
  do
  :: connection_acknowledgement_at < 8 -> connection_acknowledgement_record.last_user_sequence_id_received[connection_acknowledgement_at] = (connection_acknowledgement_base + 4 + connection_acknowledgement_at + 1) % 256; connection_acknowledgement_at = connection_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Connection Acknowledgement to the wire, 12 bytes from where the cursor stands */
inline encode_connection_acknowledgement(connection_acknowledgement_record) {
  connection_acknowledgement_at = 0;
  do
  :: connection_acknowledgement_at < 4 -> wire[at] = connection_acknowledgement_record.current_session_id[connection_acknowledgement_at]; at = at + 1; connection_acknowledgement_at = connection_acknowledgement_at + 1
  :: else -> break
  od;
  connection_acknowledgement_at = 0;
  do
  :: connection_acknowledgement_at < 8 -> wire[at] = connection_acknowledgement_record.last_user_sequence_id_received[connection_acknowledgement_at]; at = at + 1; connection_acknowledgement_at = connection_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Connection Acknowledgement off the wire, 12 bytes from where the cursor stands */
inline decode_connection_acknowledgement(connection_acknowledgement_record) {
  connection_acknowledgement_at = 0;
  do
  :: connection_acknowledgement_at < 4 -> connection_acknowledgement_record.current_session_id[connection_acknowledgement_at] = wire[at]; at = at + 1; connection_acknowledgement_at = connection_acknowledgement_at + 1
  :: else -> break
  od;
  connection_acknowledgement_at = 0;
  do
  :: connection_acknowledgement_at < 8 -> connection_acknowledgement_record.last_user_sequence_id_received[connection_acknowledgement_at] = wire[at]; at = at + 1; connection_acknowledgement_at = connection_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Connection Acknowledgement is what was written, byte for byte */
inline equal_connection_acknowledgement(connection_acknowledgement_read, connection_acknowledgement_written) {
  connection_acknowledgement_at = 0;
  do
  :: connection_acknowledgement_at < 4 -> assert(connection_acknowledgement_read.current_session_id[connection_acknowledgement_at] == connection_acknowledgement_written.current_session_id[connection_acknowledgement_at]); connection_acknowledgement_at = connection_acknowledgement_at + 1
  :: else -> break
  od;
  connection_acknowledgement_at = 0;
  do
  :: connection_acknowledgement_at < 8 -> assert(connection_acknowledgement_read.last_user_sequence_id_received[connection_acknowledgement_at] == connection_acknowledgement_written.last_user_sequence_id_received[connection_acknowledgement_at]); connection_acknowledgement_at = connection_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Disconnection Acknowledgement: 12 bytes --------------------------------- */

/* Stated by the guide as having the same number of bytes and format as TM, whose fields are written out here. */
typedef DisconnectionAcknowledgement {
  byte current_session_id[4];
  byte last_user_sequence_id_received[8]
};

int disconnection_acknowledgement_at;

/* every byte of Disconnection Acknowledgement set to one value */
inline fill_disconnection_acknowledgement(disconnection_acknowledgement_record, disconnection_acknowledgement_value) {
  disconnection_acknowledgement_at = 0;
  do
  :: disconnection_acknowledgement_at < 4 -> disconnection_acknowledgement_record.current_session_id[disconnection_acknowledgement_at] = disconnection_acknowledgement_value; disconnection_acknowledgement_at = disconnection_acknowledgement_at + 1
  :: else -> break
  od;
  disconnection_acknowledgement_at = 0;
  do
  :: disconnection_acknowledgement_at < 8 -> disconnection_acknowledgement_record.last_user_sequence_id_received[disconnection_acknowledgement_at] = disconnection_acknowledgement_value; disconnection_acknowledgement_at = disconnection_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Disconnection Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_disconnection_acknowledgement(disconnection_acknowledgement_record, disconnection_acknowledgement_base) {
  disconnection_acknowledgement_at = 0;
  do
  :: disconnection_acknowledgement_at < 4 -> disconnection_acknowledgement_record.current_session_id[disconnection_acknowledgement_at] = (disconnection_acknowledgement_base + 0 + disconnection_acknowledgement_at + 1) % 256; disconnection_acknowledgement_at = disconnection_acknowledgement_at + 1
  :: else -> break
  od;
  disconnection_acknowledgement_at = 0;
  do
  :: disconnection_acknowledgement_at < 8 -> disconnection_acknowledgement_record.last_user_sequence_id_received[disconnection_acknowledgement_at] = (disconnection_acknowledgement_base + 4 + disconnection_acknowledgement_at + 1) % 256; disconnection_acknowledgement_at = disconnection_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Disconnection Acknowledgement to the wire, 12 bytes from where the cursor stands */
inline encode_disconnection_acknowledgement(disconnection_acknowledgement_record) {
  disconnection_acknowledgement_at = 0;
  do
  :: disconnection_acknowledgement_at < 4 -> wire[at] = disconnection_acknowledgement_record.current_session_id[disconnection_acknowledgement_at]; at = at + 1; disconnection_acknowledgement_at = disconnection_acknowledgement_at + 1
  :: else -> break
  od;
  disconnection_acknowledgement_at = 0;
  do
  :: disconnection_acknowledgement_at < 8 -> wire[at] = disconnection_acknowledgement_record.last_user_sequence_id_received[disconnection_acknowledgement_at]; at = at + 1; disconnection_acknowledgement_at = disconnection_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Disconnection Acknowledgement off the wire, 12 bytes from where the cursor stands */
inline decode_disconnection_acknowledgement(disconnection_acknowledgement_record) {
  disconnection_acknowledgement_at = 0;
  do
  :: disconnection_acknowledgement_at < 4 -> disconnection_acknowledgement_record.current_session_id[disconnection_acknowledgement_at] = wire[at]; at = at + 1; disconnection_acknowledgement_at = disconnection_acknowledgement_at + 1
  :: else -> break
  od;
  disconnection_acknowledgement_at = 0;
  do
  :: disconnection_acknowledgement_at < 8 -> disconnection_acknowledgement_record.last_user_sequence_id_received[disconnection_acknowledgement_at] = wire[at]; at = at + 1; disconnection_acknowledgement_at = disconnection_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Disconnection Acknowledgement is what was written, byte for byte */
inline equal_disconnection_acknowledgement(disconnection_acknowledgement_read, disconnection_acknowledgement_written) {
  disconnection_acknowledgement_at = 0;
  do
  :: disconnection_acknowledgement_at < 4 -> assert(disconnection_acknowledgement_read.current_session_id[disconnection_acknowledgement_at] == disconnection_acknowledgement_written.current_session_id[disconnection_acknowledgement_at]); disconnection_acknowledgement_at = disconnection_acknowledgement_at + 1
  :: else -> break
  od;
  disconnection_acknowledgement_at = 0;
  do
  :: disconnection_acknowledgement_at < 8 -> assert(disconnection_acknowledgement_read.last_user_sequence_id_received[disconnection_acknowledgement_at] == disconnection_acknowledgement_written.last_user_sequence_id_received[disconnection_acknowledgement_at]); disconnection_acknowledgement_at = disconnection_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Transmission: 18 bytes ------------------------------------------- */

typedef EndOfTransmission {
  byte ended_session_id[4];
  byte last_user_sequence_id_received[8];
  byte time[6]
};

int end_of_transmission_at;

/* every byte of End Of Transmission set to one value */
inline fill_end_of_transmission(end_of_transmission_record, end_of_transmission_value) {
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 4 -> end_of_transmission_record.ended_session_id[end_of_transmission_at] = end_of_transmission_value; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 8 -> end_of_transmission_record.last_user_sequence_id_received[end_of_transmission_at] = end_of_transmission_value; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 6 -> end_of_transmission_record.time[end_of_transmission_at] = end_of_transmission_value; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Transmission set to where it lies, so a field read out of place says so */
inline ramp_end_of_transmission(end_of_transmission_record, end_of_transmission_base) {
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 4 -> end_of_transmission_record.ended_session_id[end_of_transmission_at] = (end_of_transmission_base + 0 + end_of_transmission_at + 1) % 256; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 8 -> end_of_transmission_record.last_user_sequence_id_received[end_of_transmission_at] = (end_of_transmission_base + 4 + end_of_transmission_at + 1) % 256; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 6 -> end_of_transmission_record.time[end_of_transmission_at] = (end_of_transmission_base + 12 + end_of_transmission_at + 1) % 256; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Transmission to the wire, 18 bytes from where the cursor stands */
inline encode_end_of_transmission(end_of_transmission_record) {
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 4 -> wire[at] = end_of_transmission_record.ended_session_id[end_of_transmission_at]; at = at + 1; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 8 -> wire[at] = end_of_transmission_record.last_user_sequence_id_received[end_of_transmission_at]; at = at + 1; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 6 -> wire[at] = end_of_transmission_record.time[end_of_transmission_at]; at = at + 1; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Transmission off the wire, 18 bytes from where the cursor stands */
inline decode_end_of_transmission(end_of_transmission_record) {
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 4 -> end_of_transmission_record.ended_session_id[end_of_transmission_at] = wire[at]; at = at + 1; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 8 -> end_of_transmission_record.last_user_sequence_id_received[end_of_transmission_at] = wire[at]; at = at + 1; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 6 -> end_of_transmission_record.time[end_of_transmission_at] = wire[at]; at = at + 1; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Transmission is what was written, byte for byte */
inline equal_end_of_transmission(end_of_transmission_read, end_of_transmission_written) {
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 4 -> assert(end_of_transmission_read.ended_session_id[end_of_transmission_at] == end_of_transmission_written.ended_session_id[end_of_transmission_at]); end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 8 -> assert(end_of_transmission_read.last_user_sequence_id_received[end_of_transmission_at] == end_of_transmission_written.last_user_sequence_id_received[end_of_transmission_at]); end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 6 -> assert(end_of_transmission_read.time[end_of_transmission_at] == end_of_transmission_written.time[end_of_transmission_at]); end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Error Notice: 358 bytes ------------------------------------------------- */

typedef ErrorNotice {
  byte error_code[4];
  byte error_description[100];
  byte group[2];
  byte instrument_optional[4];
  byte order_id_error_notice[20];
  byte auction_i_d_optional[6];
  byte original_message_type[2];
  byte error_detail[200];
  byte client_order_id[20]
};

int error_notice_at;

/* every byte of Error Notice set to one value */
inline fill_error_notice(error_notice_record, error_notice_value) {
  error_notice_at = 0;
  do
  :: error_notice_at < 4 -> error_notice_record.error_code[error_notice_at] = error_notice_value; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 100 -> error_notice_record.error_description[error_notice_at] = error_notice_value; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 2 -> error_notice_record.group[error_notice_at] = error_notice_value; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 4 -> error_notice_record.instrument_optional[error_notice_at] = error_notice_value; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 20 -> error_notice_record.order_id_error_notice[error_notice_at] = error_notice_value; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 6 -> error_notice_record.auction_i_d_optional[error_notice_at] = error_notice_value; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 2 -> error_notice_record.original_message_type[error_notice_at] = error_notice_value; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 200 -> error_notice_record.error_detail[error_notice_at] = error_notice_value; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 20 -> error_notice_record.client_order_id[error_notice_at] = error_notice_value; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Error Notice set to where it lies, so a field read out of place says so */
inline ramp_error_notice(error_notice_record, error_notice_base) {
  error_notice_at = 0;
  do
  :: error_notice_at < 4 -> error_notice_record.error_code[error_notice_at] = (error_notice_base + 0 + error_notice_at + 1) % 256; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 100 -> error_notice_record.error_description[error_notice_at] = (error_notice_base + 4 + error_notice_at + 1) % 256; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 2 -> error_notice_record.group[error_notice_at] = (error_notice_base + 104 + error_notice_at + 1) % 256; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 4 -> error_notice_record.instrument_optional[error_notice_at] = (error_notice_base + 106 + error_notice_at + 1) % 256; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 20 -> error_notice_record.order_id_error_notice[error_notice_at] = (error_notice_base + 110 + error_notice_at + 1) % 256; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 6 -> error_notice_record.auction_i_d_optional[error_notice_at] = (error_notice_base + 130 + error_notice_at + 1) % 256; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 2 -> error_notice_record.original_message_type[error_notice_at] = (error_notice_base + 136 + error_notice_at + 1) % 256; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 200 -> error_notice_record.error_detail[error_notice_at] = (error_notice_base + 138 + error_notice_at + 1) % 256; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 20 -> error_notice_record.client_order_id[error_notice_at] = (error_notice_base + 338 + error_notice_at + 1) % 256; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Error Notice to the wire, 358 bytes from where the cursor stands */
inline encode_error_notice(error_notice_record) {
  error_notice_at = 0;
  do
  :: error_notice_at < 4 -> wire[at] = error_notice_record.error_code[error_notice_at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 100 -> wire[at] = error_notice_record.error_description[error_notice_at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 2 -> wire[at] = error_notice_record.group[error_notice_at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 4 -> wire[at] = error_notice_record.instrument_optional[error_notice_at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 20 -> wire[at] = error_notice_record.order_id_error_notice[error_notice_at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 6 -> wire[at] = error_notice_record.auction_i_d_optional[error_notice_at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 2 -> wire[at] = error_notice_record.original_message_type[error_notice_at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 200 -> wire[at] = error_notice_record.error_detail[error_notice_at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 20 -> wire[at] = error_notice_record.client_order_id[error_notice_at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Error Notice off the wire, 358 bytes from where the cursor stands */
inline decode_error_notice(error_notice_record) {
  error_notice_at = 0;
  do
  :: error_notice_at < 4 -> error_notice_record.error_code[error_notice_at] = wire[at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 100 -> error_notice_record.error_description[error_notice_at] = wire[at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 2 -> error_notice_record.group[error_notice_at] = wire[at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 4 -> error_notice_record.instrument_optional[error_notice_at] = wire[at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 20 -> error_notice_record.order_id_error_notice[error_notice_at] = wire[at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 6 -> error_notice_record.auction_i_d_optional[error_notice_at] = wire[at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 2 -> error_notice_record.original_message_type[error_notice_at] = wire[at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 200 -> error_notice_record.error_detail[error_notice_at] = wire[at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 20 -> error_notice_record.client_order_id[error_notice_at] = wire[at]; at = at + 1; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Error Notice is what was written, byte for byte */
inline equal_error_notice(error_notice_read, error_notice_written) {
  error_notice_at = 0;
  do
  :: error_notice_at < 4 -> assert(error_notice_read.error_code[error_notice_at] == error_notice_written.error_code[error_notice_at]); error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 100 -> assert(error_notice_read.error_description[error_notice_at] == error_notice_written.error_description[error_notice_at]); error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 2 -> assert(error_notice_read.group[error_notice_at] == error_notice_written.group[error_notice_at]); error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 4 -> assert(error_notice_read.instrument_optional[error_notice_at] == error_notice_written.instrument_optional[error_notice_at]); error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 20 -> assert(error_notice_read.order_id_error_notice[error_notice_at] == error_notice_written.order_id_error_notice[error_notice_at]); error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 6 -> assert(error_notice_read.auction_i_d_optional[error_notice_at] == error_notice_written.auction_i_d_optional[error_notice_at]); error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 2 -> assert(error_notice_read.original_message_type[error_notice_at] == error_notice_written.original_message_type[error_notice_at]); error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 200 -> assert(error_notice_read.error_detail[error_notice_at] == error_notice_written.error_detail[error_notice_at]); error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 20 -> assert(error_notice_read.client_order_id[error_notice_at] == error_notice_written.client_order_id[error_notice_at]); error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bulk Quote Data Acknowledgement: 18 bytes ------------------------------- */

typedef BulkQuoteDataAcknowledgement {
  byte group[2];
  byte trader_id[8];
  byte quote_i_d[8]
};

int bulk_quote_data_acknowledgement_at;

/* every byte of Bulk Quote Data Acknowledgement set to one value */
inline fill_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_record, bulk_quote_data_acknowledgement_value) {
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 2 -> bulk_quote_data_acknowledgement_record.group[bulk_quote_data_acknowledgement_at] = bulk_quote_data_acknowledgement_value; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> bulk_quote_data_acknowledgement_record.trader_id[bulk_quote_data_acknowledgement_at] = bulk_quote_data_acknowledgement_value; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> bulk_quote_data_acknowledgement_record.quote_i_d[bulk_quote_data_acknowledgement_at] = bulk_quote_data_acknowledgement_value; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bulk Quote Data Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_record, bulk_quote_data_acknowledgement_base) {
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 2 -> bulk_quote_data_acknowledgement_record.group[bulk_quote_data_acknowledgement_at] = (bulk_quote_data_acknowledgement_base + 0 + bulk_quote_data_acknowledgement_at + 1) % 256; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> bulk_quote_data_acknowledgement_record.trader_id[bulk_quote_data_acknowledgement_at] = (bulk_quote_data_acknowledgement_base + 2 + bulk_quote_data_acknowledgement_at + 1) % 256; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> bulk_quote_data_acknowledgement_record.quote_i_d[bulk_quote_data_acknowledgement_at] = (bulk_quote_data_acknowledgement_base + 10 + bulk_quote_data_acknowledgement_at + 1) % 256; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Bulk Quote Data Acknowledgement to the wire, 18 bytes from where the cursor stands */
inline encode_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_record) {
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 2 -> wire[at] = bulk_quote_data_acknowledgement_record.group[bulk_quote_data_acknowledgement_at]; at = at + 1; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> wire[at] = bulk_quote_data_acknowledgement_record.trader_id[bulk_quote_data_acknowledgement_at]; at = at + 1; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> wire[at] = bulk_quote_data_acknowledgement_record.quote_i_d[bulk_quote_data_acknowledgement_at]; at = at + 1; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Bulk Quote Data Acknowledgement off the wire, 18 bytes from where the cursor stands */
inline decode_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_record) {
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 2 -> bulk_quote_data_acknowledgement_record.group[bulk_quote_data_acknowledgement_at] = wire[at]; at = at + 1; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> bulk_quote_data_acknowledgement_record.trader_id[bulk_quote_data_acknowledgement_at] = wire[at]; at = at + 1; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> bulk_quote_data_acknowledgement_record.quote_i_d[bulk_quote_data_acknowledgement_at] = wire[at]; at = at + 1; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bulk Quote Data Acknowledgement is what was written, byte for byte */
inline equal_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_read, bulk_quote_data_acknowledgement_written) {
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 2 -> assert(bulk_quote_data_acknowledgement_read.group[bulk_quote_data_acknowledgement_at] == bulk_quote_data_acknowledgement_written.group[bulk_quote_data_acknowledgement_at]); bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> assert(bulk_quote_data_acknowledgement_read.trader_id[bulk_quote_data_acknowledgement_at] == bulk_quote_data_acknowledgement_written.trader_id[bulk_quote_data_acknowledgement_at]); bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> assert(bulk_quote_data_acknowledgement_read.quote_i_d[bulk_quote_data_acknowledgement_at] == bulk_quote_data_acknowledgement_written.quote_i_d[bulk_quote_data_acknowledgement_at]); bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Clearing Data: 20 bytes ------------------------------------------------- */

/* The guide states these fields once, as Clearing Data, for every message that carries them. */
typedef ClearingData {
  byte clearing_instruction[12];
  byte account_type;
  byte open_close;
  byte hedge_spec;
  byte clearing_operation_mode;
  byte clearing_destination[4]
};

int clearing_data_at;

/* every byte of Clearing Data set to one value */
inline fill_clearing_data(clearing_data_record, clearing_data_value) {
  clearing_data_at = 0;
  do
  :: clearing_data_at < 12 -> clearing_data_record.clearing_instruction[clearing_data_at] = clearing_data_value; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  clearing_data_record.account_type = clearing_data_value;
  clearing_data_record.open_close = clearing_data_value;
  clearing_data_record.hedge_spec = clearing_data_value;
  clearing_data_record.clearing_operation_mode = clearing_data_value;
  clearing_data_at = 0;
  do
  :: clearing_data_at < 4 -> clearing_data_record.clearing_destination[clearing_data_at] = clearing_data_value; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Clearing Data set to where it lies, so a field read out of place says so */
inline ramp_clearing_data(clearing_data_record, clearing_data_base) {
  clearing_data_at = 0;
  do
  :: clearing_data_at < 12 -> clearing_data_record.clearing_instruction[clearing_data_at] = (clearing_data_base + 0 + clearing_data_at + 1) % 256; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  clearing_data_record.account_type = (clearing_data_base + 12 + 1) % 256;
  clearing_data_record.open_close = (clearing_data_base + 13 + 1) % 256;
  clearing_data_record.hedge_spec = (clearing_data_base + 14 + 1) % 256;
  clearing_data_record.clearing_operation_mode = (clearing_data_base + 15 + 1) % 256;
  clearing_data_at = 0;
  do
  :: clearing_data_at < 4 -> clearing_data_record.clearing_destination[clearing_data_at] = (clearing_data_base + 16 + clearing_data_at + 1) % 256; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Data to the wire, 20 bytes from where the cursor stands */
inline encode_clearing_data(clearing_data_record) {
  clearing_data_at = 0;
  do
  :: clearing_data_at < 12 -> wire[at] = clearing_data_record.clearing_instruction[clearing_data_at]; at = at + 1; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  wire[at] = clearing_data_record.account_type; at = at + 1;
  wire[at] = clearing_data_record.open_close; at = at + 1;
  wire[at] = clearing_data_record.hedge_spec; at = at + 1;
  wire[at] = clearing_data_record.clearing_operation_mode; at = at + 1;
  clearing_data_at = 0;
  do
  :: clearing_data_at < 4 -> wire[at] = clearing_data_record.clearing_destination[clearing_data_at]; at = at + 1; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* Clearing Data off the wire, 20 bytes from where the cursor stands */
inline decode_clearing_data(clearing_data_record) {
  clearing_data_at = 0;
  do
  :: clearing_data_at < 12 -> clearing_data_record.clearing_instruction[clearing_data_at] = wire[at]; at = at + 1; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  clearing_data_record.account_type = wire[at]; at = at + 1;
  clearing_data_record.open_close = wire[at]; at = at + 1;
  clearing_data_record.hedge_spec = wire[at]; at = at + 1;
  clearing_data_record.clearing_operation_mode = wire[at]; at = at + 1;
  clearing_data_at = 0;
  do
  :: clearing_data_at < 4 -> clearing_data_record.clearing_destination[clearing_data_at] = wire[at]; at = at + 1; clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Clearing Data is what was written, byte for byte */
inline equal_clearing_data(clearing_data_read, clearing_data_written) {
  clearing_data_at = 0;
  do
  :: clearing_data_at < 12 -> assert(clearing_data_read.clearing_instruction[clearing_data_at] == clearing_data_written.clearing_instruction[clearing_data_at]); clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  assert(clearing_data_read.account_type == clearing_data_written.account_type);
  assert(clearing_data_read.open_close == clearing_data_written.open_close);
  assert(clearing_data_read.hedge_spec == clearing_data_written.hedge_spec);
  assert(clearing_data_read.clearing_operation_mode == clearing_data_written.clearing_operation_mode);
  clearing_data_at = 0;
  do
  :: clearing_data_at < 4 -> assert(clearing_data_read.clearing_destination[clearing_data_at] == clearing_data_written.clearing_destination[clearing_data_at]); clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Owner Data: 71 bytes ---------------------------------------------------- */

/* The guide states these fields once, as Owner Data, for every message that carries them. */
typedef OwnerData {
  byte client_order_id[20];
  byte pound_sign;
  byte memo[50]
};

int owner_data_at;

/* every byte of Owner Data set to one value */
inline fill_owner_data(owner_data_record, owner_data_value) {
  owner_data_at = 0;
  do
  :: owner_data_at < 20 -> owner_data_record.client_order_id[owner_data_at] = owner_data_value; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  owner_data_record.pound_sign = owner_data_value;
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> owner_data_record.memo[owner_data_at] = owner_data_value; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Owner Data set to where it lies, so a field read out of place says so */
inline ramp_owner_data(owner_data_record, owner_data_base) {
  owner_data_at = 0;
  do
  :: owner_data_at < 20 -> owner_data_record.client_order_id[owner_data_at] = (owner_data_base + 0 + owner_data_at + 1) % 256; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  owner_data_record.pound_sign = (owner_data_base + 20 + 1) % 256;
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> owner_data_record.memo[owner_data_at] = (owner_data_base + 21 + owner_data_at + 1) % 256; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Owner Data to the wire, 71 bytes from where the cursor stands */
inline encode_owner_data(owner_data_record) {
  owner_data_at = 0;
  do
  :: owner_data_at < 20 -> wire[at] = owner_data_record.client_order_id[owner_data_at]; at = at + 1; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  wire[at] = owner_data_record.pound_sign; at = at + 1;
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> wire[at] = owner_data_record.memo[owner_data_at]; at = at + 1; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Owner Data off the wire, 71 bytes from where the cursor stands */
inline decode_owner_data(owner_data_record) {
  owner_data_at = 0;
  do
  :: owner_data_at < 20 -> owner_data_record.client_order_id[owner_data_at] = wire[at]; at = at + 1; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  owner_data_record.pound_sign = wire[at]; at = at + 1;
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> owner_data_record.memo[owner_data_at] = wire[at]; at = at + 1; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Owner Data is what was written, byte for byte */
inline equal_owner_data(owner_data_read, owner_data_written) {
  owner_data_at = 0;
  do
  :: owner_data_at < 20 -> assert(owner_data_read.client_order_id[owner_data_at] == owner_data_written.client_order_id[owner_data_at]); owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  assert(owner_data_read.pound_sign == owner_data_written.pound_sign);
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> assert(owner_data_read.memo[owner_data_at] == owner_data_written.memo[owner_data_at]); owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Acknowledgement: 167 bytes ---------------------------------------- */

typedef OrderAcknowledgement {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte original_order_id[8];
  byte reserved_6[6];
  byte additional_client_memo[16];
  byte reserved_4[4]
};

int order_acknowledgement_at;

/* every byte of Order Acknowledgement set to one value */
inline fill_order_acknowledgement(order_acknowledgement_record, order_acknowledgement_value) {
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 2 -> order_acknowledgement_record.group[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.instrument_optional[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.trader_id[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.order_id[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.status = order_acknowledgement_value;
  order_acknowledgement_record.verb_side = order_acknowledgement_value;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.quantity[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 10 -> order_acknowledgement_record.assigned_price[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  fill_clearing_data(order_acknowledgement_record.clearing_data, order_acknowledgement_value);
  fill_owner_data(order_acknowledgement_record.owner_data, order_acknowledgement_value);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.original_order_id[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 6 -> order_acknowledgement_record.reserved_6[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 16 -> order_acknowledgement_record.additional_client_memo[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.reserved_4[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_order_acknowledgement(order_acknowledgement_record, order_acknowledgement_base) {
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 2 -> order_acknowledgement_record.group[order_acknowledgement_at] = (order_acknowledgement_base + 0 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.instrument_optional[order_acknowledgement_at] = (order_acknowledgement_base + 2 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.trader_id[order_acknowledgement_at] = (order_acknowledgement_base + 6 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.order_id[order_acknowledgement_at] = (order_acknowledgement_base + 14 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.status = (order_acknowledgement_base + 22 + 1) % 256;
  order_acknowledgement_record.verb_side = (order_acknowledgement_base + 23 + 1) % 256;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.quantity[order_acknowledgement_at] = (order_acknowledgement_base + 24 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 10 -> order_acknowledgement_record.assigned_price[order_acknowledgement_at] = (order_acknowledgement_base + 32 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  ramp_clearing_data(order_acknowledgement_record.clearing_data, order_acknowledgement_base + 42);
  ramp_owner_data(order_acknowledgement_record.owner_data, order_acknowledgement_base + 62);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.original_order_id[order_acknowledgement_at] = (order_acknowledgement_base + 133 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 6 -> order_acknowledgement_record.reserved_6[order_acknowledgement_at] = (order_acknowledgement_base + 141 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 16 -> order_acknowledgement_record.additional_client_memo[order_acknowledgement_at] = (order_acknowledgement_base + 147 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.reserved_4[order_acknowledgement_at] = (order_acknowledgement_base + 163 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement to the wire, 167 bytes from where the cursor stands */
inline encode_order_acknowledgement(order_acknowledgement_record) {
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 2 -> wire[at] = order_acknowledgement_record.group[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> wire[at] = order_acknowledgement_record.instrument_optional[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> wire[at] = order_acknowledgement_record.trader_id[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> wire[at] = order_acknowledgement_record.order_id[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = order_acknowledgement_record.status; at = at + 1;
  wire[at] = order_acknowledgement_record.verb_side; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> wire[at] = order_acknowledgement_record.quantity[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 10 -> wire[at] = order_acknowledgement_record.assigned_price[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  encode_clearing_data(order_acknowledgement_record.clearing_data);
  encode_owner_data(order_acknowledgement_record.owner_data);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> wire[at] = order_acknowledgement_record.original_order_id[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 6 -> wire[at] = order_acknowledgement_record.reserved_6[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 16 -> wire[at] = order_acknowledgement_record.additional_client_memo[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> wire[at] = order_acknowledgement_record.reserved_4[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement off the wire, 167 bytes from where the cursor stands */
inline decode_order_acknowledgement(order_acknowledgement_record) {
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 2 -> order_acknowledgement_record.group[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.instrument_optional[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.trader_id[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.order_id[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.status = wire[at]; at = at + 1;
  order_acknowledgement_record.verb_side = wire[at]; at = at + 1;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.quantity[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 10 -> order_acknowledgement_record.assigned_price[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  decode_clearing_data(order_acknowledgement_record.clearing_data);
  decode_owner_data(order_acknowledgement_record.owner_data);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.original_order_id[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 6 -> order_acknowledgement_record.reserved_6[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 16 -> order_acknowledgement_record.additional_client_memo[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.reserved_4[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Acknowledgement is what was written, byte for byte */
inline equal_order_acknowledgement(order_acknowledgement_read, order_acknowledgement_written) {
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 2 -> assert(order_acknowledgement_read.group[order_acknowledgement_at] == order_acknowledgement_written.group[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> assert(order_acknowledgement_read.instrument_optional[order_acknowledgement_at] == order_acknowledgement_written.instrument_optional[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> assert(order_acknowledgement_read.trader_id[order_acknowledgement_at] == order_acknowledgement_written.trader_id[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> assert(order_acknowledgement_read.order_id[order_acknowledgement_at] == order_acknowledgement_written.order_id[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  assert(order_acknowledgement_read.status == order_acknowledgement_written.status);
  assert(order_acknowledgement_read.verb_side == order_acknowledgement_written.verb_side);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> assert(order_acknowledgement_read.quantity[order_acknowledgement_at] == order_acknowledgement_written.quantity[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 10 -> assert(order_acknowledgement_read.assigned_price[order_acknowledgement_at] == order_acknowledgement_written.assigned_price[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  equal_clearing_data(order_acknowledgement_read.clearing_data, order_acknowledgement_written.clearing_data);
  equal_owner_data(order_acknowledgement_read.owner_data, order_acknowledgement_written.owner_data);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> assert(order_acknowledgement_read.original_order_id[order_acknowledgement_at] == order_acknowledgement_written.original_order_id[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 6 -> assert(order_acknowledgement_read.reserved_6[order_acknowledgement_at] == order_acknowledgement_written.reserved_6[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 16 -> assert(order_acknowledgement_read.additional_client_memo[order_acknowledgement_at] == order_acknowledgement_written.additional_client_memo[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> assert(order_acknowledgement_read.reserved_4[order_acknowledgement_at] == order_acknowledgement_written.reserved_4[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Global Cancellation Confirmation: 11 bytes ------------------------------ */

typedef GlobalCancellationConfirmation {
  byte group[2];
  byte trader_id[8];
  byte type_of_cancellation
};

int global_cancellation_confirmation_at;

/* every byte of Global Cancellation Confirmation set to one value */
inline fill_global_cancellation_confirmation(global_cancellation_confirmation_record, global_cancellation_confirmation_value) {
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 2 -> global_cancellation_confirmation_record.group[global_cancellation_confirmation_at] = global_cancellation_confirmation_value; global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 8 -> global_cancellation_confirmation_record.trader_id[global_cancellation_confirmation_at] = global_cancellation_confirmation_value; global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  global_cancellation_confirmation_record.type_of_cancellation = global_cancellation_confirmation_value;
  skip
}

/* each byte of Global Cancellation Confirmation set to where it lies, so a field read out of place says so */
inline ramp_global_cancellation_confirmation(global_cancellation_confirmation_record, global_cancellation_confirmation_base) {
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 2 -> global_cancellation_confirmation_record.group[global_cancellation_confirmation_at] = (global_cancellation_confirmation_base + 0 + global_cancellation_confirmation_at + 1) % 256; global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 8 -> global_cancellation_confirmation_record.trader_id[global_cancellation_confirmation_at] = (global_cancellation_confirmation_base + 2 + global_cancellation_confirmation_at + 1) % 256; global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  global_cancellation_confirmation_record.type_of_cancellation = (global_cancellation_confirmation_base + 10 + 1) % 256;
  skip
}

/* Global Cancellation Confirmation to the wire, 11 bytes from where the cursor stands */
inline encode_global_cancellation_confirmation(global_cancellation_confirmation_record) {
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 2 -> wire[at] = global_cancellation_confirmation_record.group[global_cancellation_confirmation_at]; at = at + 1; global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 8 -> wire[at] = global_cancellation_confirmation_record.trader_id[global_cancellation_confirmation_at]; at = at + 1; global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  wire[at] = global_cancellation_confirmation_record.type_of_cancellation; at = at + 1;
  skip
}

/* Global Cancellation Confirmation off the wire, 11 bytes from where the cursor stands */
inline decode_global_cancellation_confirmation(global_cancellation_confirmation_record) {
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 2 -> global_cancellation_confirmation_record.group[global_cancellation_confirmation_at] = wire[at]; at = at + 1; global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 8 -> global_cancellation_confirmation_record.trader_id[global_cancellation_confirmation_at] = wire[at]; at = at + 1; global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  global_cancellation_confirmation_record.type_of_cancellation = wire[at]; at = at + 1;
  skip
}

/* what was read of Global Cancellation Confirmation is what was written, byte for byte */
inline equal_global_cancellation_confirmation(global_cancellation_confirmation_read, global_cancellation_confirmation_written) {
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 2 -> assert(global_cancellation_confirmation_read.group[global_cancellation_confirmation_at] == global_cancellation_confirmation_written.group[global_cancellation_confirmation_at]); global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 8 -> assert(global_cancellation_confirmation_read.trader_id[global_cancellation_confirmation_at] == global_cancellation_confirmation_written.trader_id[global_cancellation_confirmation_at]); global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  assert(global_cancellation_confirmation_read.type_of_cancellation == global_cancellation_confirmation_written.type_of_cancellation);
  skip
}

/* ---- Improvement Order Acknowlegment: 167 bytes ------------------------------ */

typedef ImprovementOrderAcknowlegment {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte original_order_id[8];
  byte auction_i_d[6];
  byte additional_client_memo[16];
  byte reserved_4[4]
};

int improvement_order_acknowlegment_at;

/* every byte of Improvement Order Acknowlegment set to one value */
inline fill_improvement_order_acknowlegment(improvement_order_acknowlegment_record, improvement_order_acknowlegment_value) {
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 2 -> improvement_order_acknowlegment_record.group[improvement_order_acknowlegment_at] = improvement_order_acknowlegment_value; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 4 -> improvement_order_acknowlegment_record.instrument_optional[improvement_order_acknowlegment_at] = improvement_order_acknowlegment_value; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.trader_id[improvement_order_acknowlegment_at] = improvement_order_acknowlegment_value; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.order_id[improvement_order_acknowlegment_at] = improvement_order_acknowlegment_value; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_record.status = improvement_order_acknowlegment_value;
  improvement_order_acknowlegment_record.verb_side = improvement_order_acknowlegment_value;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.quantity[improvement_order_acknowlegment_at] = improvement_order_acknowlegment_value; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 10 -> improvement_order_acknowlegment_record.assigned_price[improvement_order_acknowlegment_at] = improvement_order_acknowlegment_value; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  fill_clearing_data(improvement_order_acknowlegment_record.clearing_data, improvement_order_acknowlegment_value);
  fill_owner_data(improvement_order_acknowlegment_record.owner_data, improvement_order_acknowlegment_value);
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.original_order_id[improvement_order_acknowlegment_at] = improvement_order_acknowlegment_value; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 6 -> improvement_order_acknowlegment_record.auction_i_d[improvement_order_acknowlegment_at] = improvement_order_acknowlegment_value; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 16 -> improvement_order_acknowlegment_record.additional_client_memo[improvement_order_acknowlegment_at] = improvement_order_acknowlegment_value; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 4 -> improvement_order_acknowlegment_record.reserved_4[improvement_order_acknowlegment_at] = improvement_order_acknowlegment_value; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Improvement Order Acknowlegment set to where it lies, so a field read out of place says so */
inline ramp_improvement_order_acknowlegment(improvement_order_acknowlegment_record, improvement_order_acknowlegment_base) {
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 2 -> improvement_order_acknowlegment_record.group[improvement_order_acknowlegment_at] = (improvement_order_acknowlegment_base + 0 + improvement_order_acknowlegment_at + 1) % 256; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 4 -> improvement_order_acknowlegment_record.instrument_optional[improvement_order_acknowlegment_at] = (improvement_order_acknowlegment_base + 2 + improvement_order_acknowlegment_at + 1) % 256; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.trader_id[improvement_order_acknowlegment_at] = (improvement_order_acknowlegment_base + 6 + improvement_order_acknowlegment_at + 1) % 256; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.order_id[improvement_order_acknowlegment_at] = (improvement_order_acknowlegment_base + 14 + improvement_order_acknowlegment_at + 1) % 256; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_record.status = (improvement_order_acknowlegment_base + 22 + 1) % 256;
  improvement_order_acknowlegment_record.verb_side = (improvement_order_acknowlegment_base + 23 + 1) % 256;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.quantity[improvement_order_acknowlegment_at] = (improvement_order_acknowlegment_base + 24 + improvement_order_acknowlegment_at + 1) % 256; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 10 -> improvement_order_acknowlegment_record.assigned_price[improvement_order_acknowlegment_at] = (improvement_order_acknowlegment_base + 32 + improvement_order_acknowlegment_at + 1) % 256; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  ramp_clearing_data(improvement_order_acknowlegment_record.clearing_data, improvement_order_acknowlegment_base + 42);
  ramp_owner_data(improvement_order_acknowlegment_record.owner_data, improvement_order_acknowlegment_base + 62);
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.original_order_id[improvement_order_acknowlegment_at] = (improvement_order_acknowlegment_base + 133 + improvement_order_acknowlegment_at + 1) % 256; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 6 -> improvement_order_acknowlegment_record.auction_i_d[improvement_order_acknowlegment_at] = (improvement_order_acknowlegment_base + 141 + improvement_order_acknowlegment_at + 1) % 256; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 16 -> improvement_order_acknowlegment_record.additional_client_memo[improvement_order_acknowlegment_at] = (improvement_order_acknowlegment_base + 147 + improvement_order_acknowlegment_at + 1) % 256; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 4 -> improvement_order_acknowlegment_record.reserved_4[improvement_order_acknowlegment_at] = (improvement_order_acknowlegment_base + 163 + improvement_order_acknowlegment_at + 1) % 256; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  skip
}

/* Improvement Order Acknowlegment to the wire, 167 bytes from where the cursor stands */
inline encode_improvement_order_acknowlegment(improvement_order_acknowlegment_record) {
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 2 -> wire[at] = improvement_order_acknowlegment_record.group[improvement_order_acknowlegment_at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 4 -> wire[at] = improvement_order_acknowlegment_record.instrument_optional[improvement_order_acknowlegment_at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> wire[at] = improvement_order_acknowlegment_record.trader_id[improvement_order_acknowlegment_at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> wire[at] = improvement_order_acknowlegment_record.order_id[improvement_order_acknowlegment_at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  wire[at] = improvement_order_acknowlegment_record.status; at = at + 1;
  wire[at] = improvement_order_acknowlegment_record.verb_side; at = at + 1;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> wire[at] = improvement_order_acknowlegment_record.quantity[improvement_order_acknowlegment_at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 10 -> wire[at] = improvement_order_acknowlegment_record.assigned_price[improvement_order_acknowlegment_at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  encode_clearing_data(improvement_order_acknowlegment_record.clearing_data);
  encode_owner_data(improvement_order_acknowlegment_record.owner_data);
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> wire[at] = improvement_order_acknowlegment_record.original_order_id[improvement_order_acknowlegment_at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 6 -> wire[at] = improvement_order_acknowlegment_record.auction_i_d[improvement_order_acknowlegment_at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 16 -> wire[at] = improvement_order_acknowlegment_record.additional_client_memo[improvement_order_acknowlegment_at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 4 -> wire[at] = improvement_order_acknowlegment_record.reserved_4[improvement_order_acknowlegment_at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  skip
}

/* Improvement Order Acknowlegment off the wire, 167 bytes from where the cursor stands */
inline decode_improvement_order_acknowlegment(improvement_order_acknowlegment_record) {
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 2 -> improvement_order_acknowlegment_record.group[improvement_order_acknowlegment_at] = wire[at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 4 -> improvement_order_acknowlegment_record.instrument_optional[improvement_order_acknowlegment_at] = wire[at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.trader_id[improvement_order_acknowlegment_at] = wire[at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.order_id[improvement_order_acknowlegment_at] = wire[at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_record.status = wire[at]; at = at + 1;
  improvement_order_acknowlegment_record.verb_side = wire[at]; at = at + 1;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.quantity[improvement_order_acknowlegment_at] = wire[at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 10 -> improvement_order_acknowlegment_record.assigned_price[improvement_order_acknowlegment_at] = wire[at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  decode_clearing_data(improvement_order_acknowlegment_record.clearing_data);
  decode_owner_data(improvement_order_acknowlegment_record.owner_data);
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> improvement_order_acknowlegment_record.original_order_id[improvement_order_acknowlegment_at] = wire[at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 6 -> improvement_order_acknowlegment_record.auction_i_d[improvement_order_acknowlegment_at] = wire[at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 16 -> improvement_order_acknowlegment_record.additional_client_memo[improvement_order_acknowlegment_at] = wire[at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 4 -> improvement_order_acknowlegment_record.reserved_4[improvement_order_acknowlegment_at] = wire[at]; at = at + 1; improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Improvement Order Acknowlegment is what was written, byte for byte */
inline equal_improvement_order_acknowlegment(improvement_order_acknowlegment_read, improvement_order_acknowlegment_written) {
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 2 -> assert(improvement_order_acknowlegment_read.group[improvement_order_acknowlegment_at] == improvement_order_acknowlegment_written.group[improvement_order_acknowlegment_at]); improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 4 -> assert(improvement_order_acknowlegment_read.instrument_optional[improvement_order_acknowlegment_at] == improvement_order_acknowlegment_written.instrument_optional[improvement_order_acknowlegment_at]); improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> assert(improvement_order_acknowlegment_read.trader_id[improvement_order_acknowlegment_at] == improvement_order_acknowlegment_written.trader_id[improvement_order_acknowlegment_at]); improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> assert(improvement_order_acknowlegment_read.order_id[improvement_order_acknowlegment_at] == improvement_order_acknowlegment_written.order_id[improvement_order_acknowlegment_at]); improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  assert(improvement_order_acknowlegment_read.status == improvement_order_acknowlegment_written.status);
  assert(improvement_order_acknowlegment_read.verb_side == improvement_order_acknowlegment_written.verb_side);
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> assert(improvement_order_acknowlegment_read.quantity[improvement_order_acknowlegment_at] == improvement_order_acknowlegment_written.quantity[improvement_order_acknowlegment_at]); improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 10 -> assert(improvement_order_acknowlegment_read.assigned_price[improvement_order_acknowlegment_at] == improvement_order_acknowlegment_written.assigned_price[improvement_order_acknowlegment_at]); improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  equal_clearing_data(improvement_order_acknowlegment_read.clearing_data, improvement_order_acknowlegment_written.clearing_data);
  equal_owner_data(improvement_order_acknowlegment_read.owner_data, improvement_order_acknowlegment_written.owner_data);
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 8 -> assert(improvement_order_acknowlegment_read.original_order_id[improvement_order_acknowlegment_at] == improvement_order_acknowlegment_written.original_order_id[improvement_order_acknowlegment_at]); improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 6 -> assert(improvement_order_acknowlegment_read.auction_i_d[improvement_order_acknowlegment_at] == improvement_order_acknowlegment_written.auction_i_d[improvement_order_acknowlegment_at]); improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 16 -> assert(improvement_order_acknowlegment_read.additional_client_memo[improvement_order_acknowlegment_at] == improvement_order_acknowlegment_written.additional_client_memo[improvement_order_acknowlegment_at]); improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  improvement_order_acknowlegment_at = 0;
  do
  :: improvement_order_acknowlegment_at < 4 -> assert(improvement_order_acknowlegment_read.reserved_4[improvement_order_acknowlegment_at] == improvement_order_acknowlegment_written.reserved_4[improvement_order_acknowlegment_at]); improvement_order_acknowlegment_at = improvement_order_acknowlegment_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Modification Acknowledgement: 167 bytes --------------------------- */

typedef OrderModificationAcknowledgement {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte original_order_id[8];
  byte reserved_6[6];
  byte additional_client_memo[16];
  byte reserved_4[4]
};

int order_modification_acknowledgement_at;

/* every byte of Order Modification Acknowledgement set to one value */
inline fill_order_modification_acknowledgement(order_modification_acknowledgement_record, order_modification_acknowledgement_value) {
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 2 -> order_modification_acknowledgement_record.group[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> order_modification_acknowledgement_record.instrument_optional[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.trader_id[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.order_id[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_record.status = order_modification_acknowledgement_value;
  order_modification_acknowledgement_record.verb_side = order_modification_acknowledgement_value;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.quantity[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 10 -> order_modification_acknowledgement_record.assigned_price[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  fill_clearing_data(order_modification_acknowledgement_record.clearing_data, order_modification_acknowledgement_value);
  fill_owner_data(order_modification_acknowledgement_record.owner_data, order_modification_acknowledgement_value);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.original_order_id[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 6 -> order_modification_acknowledgement_record.reserved_6[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 16 -> order_modification_acknowledgement_record.additional_client_memo[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> order_modification_acknowledgement_record.reserved_4[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modification Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_order_modification_acknowledgement(order_modification_acknowledgement_record, order_modification_acknowledgement_base) {
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 2 -> order_modification_acknowledgement_record.group[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 0 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> order_modification_acknowledgement_record.instrument_optional[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 2 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.trader_id[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 6 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.order_id[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 14 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_record.status = (order_modification_acknowledgement_base + 22 + 1) % 256;
  order_modification_acknowledgement_record.verb_side = (order_modification_acknowledgement_base + 23 + 1) % 256;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.quantity[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 24 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 10 -> order_modification_acknowledgement_record.assigned_price[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 32 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  ramp_clearing_data(order_modification_acknowledgement_record.clearing_data, order_modification_acknowledgement_base + 42);
  ramp_owner_data(order_modification_acknowledgement_record.owner_data, order_modification_acknowledgement_base + 62);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.original_order_id[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 133 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 6 -> order_modification_acknowledgement_record.reserved_6[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 141 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 16 -> order_modification_acknowledgement_record.additional_client_memo[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 147 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> order_modification_acknowledgement_record.reserved_4[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 163 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modification Acknowledgement to the wire, 167 bytes from where the cursor stands */
inline encode_order_modification_acknowledgement(order_modification_acknowledgement_record) {
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 2 -> wire[at] = order_modification_acknowledgement_record.group[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> wire[at] = order_modification_acknowledgement_record.instrument_optional[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> wire[at] = order_modification_acknowledgement_record.trader_id[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> wire[at] = order_modification_acknowledgement_record.order_id[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = order_modification_acknowledgement_record.status; at = at + 1;
  wire[at] = order_modification_acknowledgement_record.verb_side; at = at + 1;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> wire[at] = order_modification_acknowledgement_record.quantity[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 10 -> wire[at] = order_modification_acknowledgement_record.assigned_price[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  encode_clearing_data(order_modification_acknowledgement_record.clearing_data);
  encode_owner_data(order_modification_acknowledgement_record.owner_data);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> wire[at] = order_modification_acknowledgement_record.original_order_id[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 6 -> wire[at] = order_modification_acknowledgement_record.reserved_6[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 16 -> wire[at] = order_modification_acknowledgement_record.additional_client_memo[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> wire[at] = order_modification_acknowledgement_record.reserved_4[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modification Acknowledgement off the wire, 167 bytes from where the cursor stands */
inline decode_order_modification_acknowledgement(order_modification_acknowledgement_record) {
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 2 -> order_modification_acknowledgement_record.group[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> order_modification_acknowledgement_record.instrument_optional[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.trader_id[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.order_id[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_record.status = wire[at]; at = at + 1;
  order_modification_acknowledgement_record.verb_side = wire[at]; at = at + 1;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.quantity[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 10 -> order_modification_acknowledgement_record.assigned_price[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  decode_clearing_data(order_modification_acknowledgement_record.clearing_data);
  decode_owner_data(order_modification_acknowledgement_record.owner_data);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.original_order_id[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 6 -> order_modification_acknowledgement_record.reserved_6[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 16 -> order_modification_acknowledgement_record.additional_client_memo[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> order_modification_acknowledgement_record.reserved_4[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modification Acknowledgement is what was written, byte for byte */
inline equal_order_modification_acknowledgement(order_modification_acknowledgement_read, order_modification_acknowledgement_written) {
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 2 -> assert(order_modification_acknowledgement_read.group[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.group[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> assert(order_modification_acknowledgement_read.instrument_optional[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.instrument_optional[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> assert(order_modification_acknowledgement_read.trader_id[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.trader_id[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> assert(order_modification_acknowledgement_read.order_id[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.order_id[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  assert(order_modification_acknowledgement_read.status == order_modification_acknowledgement_written.status);
  assert(order_modification_acknowledgement_read.verb_side == order_modification_acknowledgement_written.verb_side);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> assert(order_modification_acknowledgement_read.quantity[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.quantity[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 10 -> assert(order_modification_acknowledgement_read.assigned_price[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.assigned_price[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  equal_clearing_data(order_modification_acknowledgement_read.clearing_data, order_modification_acknowledgement_written.clearing_data);
  equal_owner_data(order_modification_acknowledgement_read.owner_data, order_modification_acknowledgement_written.owner_data);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> assert(order_modification_acknowledgement_read.original_order_id[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.original_order_id[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 6 -> assert(order_modification_acknowledgement_read.reserved_6[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.reserved_6[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 16 -> assert(order_modification_acknowledgement_read.additional_client_memo[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.additional_client_memo[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> assert(order_modification_acknowledgement_read.reserved_4[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.reserved_4[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Standard Acknowledgement: 10 bytes -------------------------------------- */

typedef StandardAcknowledgement {
  byte trader_id[8];
  byte original_message_type[2]
};

int standard_acknowledgement_at;

/* every byte of Standard Acknowledgement set to one value */
inline fill_standard_acknowledgement(standard_acknowledgement_record, standard_acknowledgement_value) {
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 8 -> standard_acknowledgement_record.trader_id[standard_acknowledgement_at] = standard_acknowledgement_value; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 2 -> standard_acknowledgement_record.original_message_type[standard_acknowledgement_at] = standard_acknowledgement_value; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Standard Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_standard_acknowledgement(standard_acknowledgement_record, standard_acknowledgement_base) {
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 8 -> standard_acknowledgement_record.trader_id[standard_acknowledgement_at] = (standard_acknowledgement_base + 0 + standard_acknowledgement_at + 1) % 256; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 2 -> standard_acknowledgement_record.original_message_type[standard_acknowledgement_at] = (standard_acknowledgement_base + 8 + standard_acknowledgement_at + 1) % 256; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Standard Acknowledgement to the wire, 10 bytes from where the cursor stands */
inline encode_standard_acknowledgement(standard_acknowledgement_record) {
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 8 -> wire[at] = standard_acknowledgement_record.trader_id[standard_acknowledgement_at]; at = at + 1; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 2 -> wire[at] = standard_acknowledgement_record.original_message_type[standard_acknowledgement_at]; at = at + 1; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Standard Acknowledgement off the wire, 10 bytes from where the cursor stands */
inline decode_standard_acknowledgement(standard_acknowledgement_record) {
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 8 -> standard_acknowledgement_record.trader_id[standard_acknowledgement_at] = wire[at]; at = at + 1; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 2 -> standard_acknowledgement_record.original_message_type[standard_acknowledgement_at] = wire[at]; at = at + 1; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Standard Acknowledgement is what was written, byte for byte */
inline equal_standard_acknowledgement(standard_acknowledgement_read, standard_acknowledgement_written) {
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 8 -> assert(standard_acknowledgement_read.trader_id[standard_acknowledgement_at] == standard_acknowledgement_written.trader_id[standard_acknowledgement_at]); standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 2 -> assert(standard_acknowledgement_read.original_message_type[standard_acknowledgement_at] == standard_acknowledgement_written.original_message_type[standard_acknowledgement_at]); standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Complex Order Auction Acknowledgement: 167 bytes ------------------------ */

typedef ComplexOrderAuctionAcknowledgement {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte original_order_id[8];
  byte auction_i_d_optional[6];
  byte additional_client_memo[16];
  byte reserved_4[4]
};

int complex_order_auction_acknowledgement_at;

/* every byte of Complex Order Auction Acknowledgement set to one value */
inline fill_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_record, complex_order_auction_acknowledgement_value) {
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 2 -> complex_order_auction_acknowledgement_record.group[complex_order_auction_acknowledgement_at] = complex_order_auction_acknowledgement_value; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 4 -> complex_order_auction_acknowledgement_record.instrument_optional[complex_order_auction_acknowledgement_at] = complex_order_auction_acknowledgement_value; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.trader_id[complex_order_auction_acknowledgement_at] = complex_order_auction_acknowledgement_value; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.order_id[complex_order_auction_acknowledgement_at] = complex_order_auction_acknowledgement_value; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_record.status = complex_order_auction_acknowledgement_value;
  complex_order_auction_acknowledgement_record.verb_side = complex_order_auction_acknowledgement_value;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.quantity[complex_order_auction_acknowledgement_at] = complex_order_auction_acknowledgement_value; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 10 -> complex_order_auction_acknowledgement_record.assigned_price[complex_order_auction_acknowledgement_at] = complex_order_auction_acknowledgement_value; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  fill_clearing_data(complex_order_auction_acknowledgement_record.clearing_data, complex_order_auction_acknowledgement_value);
  fill_owner_data(complex_order_auction_acknowledgement_record.owner_data, complex_order_auction_acknowledgement_value);
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.original_order_id[complex_order_auction_acknowledgement_at] = complex_order_auction_acknowledgement_value; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 6 -> complex_order_auction_acknowledgement_record.auction_i_d_optional[complex_order_auction_acknowledgement_at] = complex_order_auction_acknowledgement_value; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 16 -> complex_order_auction_acknowledgement_record.additional_client_memo[complex_order_auction_acknowledgement_at] = complex_order_auction_acknowledgement_value; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 4 -> complex_order_auction_acknowledgement_record.reserved_4[complex_order_auction_acknowledgement_at] = complex_order_auction_acknowledgement_value; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Order Auction Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_record, complex_order_auction_acknowledgement_base) {
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 2 -> complex_order_auction_acknowledgement_record.group[complex_order_auction_acknowledgement_at] = (complex_order_auction_acknowledgement_base + 0 + complex_order_auction_acknowledgement_at + 1) % 256; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 4 -> complex_order_auction_acknowledgement_record.instrument_optional[complex_order_auction_acknowledgement_at] = (complex_order_auction_acknowledgement_base + 2 + complex_order_auction_acknowledgement_at + 1) % 256; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.trader_id[complex_order_auction_acknowledgement_at] = (complex_order_auction_acknowledgement_base + 6 + complex_order_auction_acknowledgement_at + 1) % 256; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.order_id[complex_order_auction_acknowledgement_at] = (complex_order_auction_acknowledgement_base + 14 + complex_order_auction_acknowledgement_at + 1) % 256; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_record.status = (complex_order_auction_acknowledgement_base + 22 + 1) % 256;
  complex_order_auction_acknowledgement_record.verb_side = (complex_order_auction_acknowledgement_base + 23 + 1) % 256;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.quantity[complex_order_auction_acknowledgement_at] = (complex_order_auction_acknowledgement_base + 24 + complex_order_auction_acknowledgement_at + 1) % 256; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 10 -> complex_order_auction_acknowledgement_record.assigned_price[complex_order_auction_acknowledgement_at] = (complex_order_auction_acknowledgement_base + 32 + complex_order_auction_acknowledgement_at + 1) % 256; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  ramp_clearing_data(complex_order_auction_acknowledgement_record.clearing_data, complex_order_auction_acknowledgement_base + 42);
  ramp_owner_data(complex_order_auction_acknowledgement_record.owner_data, complex_order_auction_acknowledgement_base + 62);
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.original_order_id[complex_order_auction_acknowledgement_at] = (complex_order_auction_acknowledgement_base + 133 + complex_order_auction_acknowledgement_at + 1) % 256; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 6 -> complex_order_auction_acknowledgement_record.auction_i_d_optional[complex_order_auction_acknowledgement_at] = (complex_order_auction_acknowledgement_base + 141 + complex_order_auction_acknowledgement_at + 1) % 256; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 16 -> complex_order_auction_acknowledgement_record.additional_client_memo[complex_order_auction_acknowledgement_at] = (complex_order_auction_acknowledgement_base + 147 + complex_order_auction_acknowledgement_at + 1) % 256; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 4 -> complex_order_auction_acknowledgement_record.reserved_4[complex_order_auction_acknowledgement_at] = (complex_order_auction_acknowledgement_base + 163 + complex_order_auction_acknowledgement_at + 1) % 256; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Order Auction Acknowledgement to the wire, 167 bytes from where the cursor stands */
inline encode_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_record) {
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 2 -> wire[at] = complex_order_auction_acknowledgement_record.group[complex_order_auction_acknowledgement_at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 4 -> wire[at] = complex_order_auction_acknowledgement_record.instrument_optional[complex_order_auction_acknowledgement_at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> wire[at] = complex_order_auction_acknowledgement_record.trader_id[complex_order_auction_acknowledgement_at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> wire[at] = complex_order_auction_acknowledgement_record.order_id[complex_order_auction_acknowledgement_at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = complex_order_auction_acknowledgement_record.status; at = at + 1;
  wire[at] = complex_order_auction_acknowledgement_record.verb_side; at = at + 1;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> wire[at] = complex_order_auction_acknowledgement_record.quantity[complex_order_auction_acknowledgement_at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 10 -> wire[at] = complex_order_auction_acknowledgement_record.assigned_price[complex_order_auction_acknowledgement_at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  encode_clearing_data(complex_order_auction_acknowledgement_record.clearing_data);
  encode_owner_data(complex_order_auction_acknowledgement_record.owner_data);
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> wire[at] = complex_order_auction_acknowledgement_record.original_order_id[complex_order_auction_acknowledgement_at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 6 -> wire[at] = complex_order_auction_acknowledgement_record.auction_i_d_optional[complex_order_auction_acknowledgement_at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 16 -> wire[at] = complex_order_auction_acknowledgement_record.additional_client_memo[complex_order_auction_acknowledgement_at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 4 -> wire[at] = complex_order_auction_acknowledgement_record.reserved_4[complex_order_auction_acknowledgement_at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Order Auction Acknowledgement off the wire, 167 bytes from where the cursor stands */
inline decode_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_record) {
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 2 -> complex_order_auction_acknowledgement_record.group[complex_order_auction_acknowledgement_at] = wire[at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 4 -> complex_order_auction_acknowledgement_record.instrument_optional[complex_order_auction_acknowledgement_at] = wire[at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.trader_id[complex_order_auction_acknowledgement_at] = wire[at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.order_id[complex_order_auction_acknowledgement_at] = wire[at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_record.status = wire[at]; at = at + 1;
  complex_order_auction_acknowledgement_record.verb_side = wire[at]; at = at + 1;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.quantity[complex_order_auction_acknowledgement_at] = wire[at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 10 -> complex_order_auction_acknowledgement_record.assigned_price[complex_order_auction_acknowledgement_at] = wire[at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  decode_clearing_data(complex_order_auction_acknowledgement_record.clearing_data);
  decode_owner_data(complex_order_auction_acknowledgement_record.owner_data);
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> complex_order_auction_acknowledgement_record.original_order_id[complex_order_auction_acknowledgement_at] = wire[at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 6 -> complex_order_auction_acknowledgement_record.auction_i_d_optional[complex_order_auction_acknowledgement_at] = wire[at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 16 -> complex_order_auction_acknowledgement_record.additional_client_memo[complex_order_auction_acknowledgement_at] = wire[at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 4 -> complex_order_auction_acknowledgement_record.reserved_4[complex_order_auction_acknowledgement_at] = wire[at]; at = at + 1; complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Order Auction Acknowledgement is what was written, byte for byte */
inline equal_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_read, complex_order_auction_acknowledgement_written) {
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 2 -> assert(complex_order_auction_acknowledgement_read.group[complex_order_auction_acknowledgement_at] == complex_order_auction_acknowledgement_written.group[complex_order_auction_acknowledgement_at]); complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 4 -> assert(complex_order_auction_acknowledgement_read.instrument_optional[complex_order_auction_acknowledgement_at] == complex_order_auction_acknowledgement_written.instrument_optional[complex_order_auction_acknowledgement_at]); complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> assert(complex_order_auction_acknowledgement_read.trader_id[complex_order_auction_acknowledgement_at] == complex_order_auction_acknowledgement_written.trader_id[complex_order_auction_acknowledgement_at]); complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> assert(complex_order_auction_acknowledgement_read.order_id[complex_order_auction_acknowledgement_at] == complex_order_auction_acknowledgement_written.order_id[complex_order_auction_acknowledgement_at]); complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  assert(complex_order_auction_acknowledgement_read.status == complex_order_auction_acknowledgement_written.status);
  assert(complex_order_auction_acknowledgement_read.verb_side == complex_order_auction_acknowledgement_written.verb_side);
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> assert(complex_order_auction_acknowledgement_read.quantity[complex_order_auction_acknowledgement_at] == complex_order_auction_acknowledgement_written.quantity[complex_order_auction_acknowledgement_at]); complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 10 -> assert(complex_order_auction_acknowledgement_read.assigned_price[complex_order_auction_acknowledgement_at] == complex_order_auction_acknowledgement_written.assigned_price[complex_order_auction_acknowledgement_at]); complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  equal_clearing_data(complex_order_auction_acknowledgement_read.clearing_data, complex_order_auction_acknowledgement_written.clearing_data);
  equal_owner_data(complex_order_auction_acknowledgement_read.owner_data, complex_order_auction_acknowledgement_written.owner_data);
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 8 -> assert(complex_order_auction_acknowledgement_read.original_order_id[complex_order_auction_acknowledgement_at] == complex_order_auction_acknowledgement_written.original_order_id[complex_order_auction_acknowledgement_at]); complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 6 -> assert(complex_order_auction_acknowledgement_read.auction_i_d_optional[complex_order_auction_acknowledgement_at] == complex_order_auction_acknowledgement_written.auction_i_d_optional[complex_order_auction_acknowledgement_at]); complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 16 -> assert(complex_order_auction_acknowledgement_read.additional_client_memo[complex_order_auction_acknowledgement_at] == complex_order_auction_acknowledgement_written.additional_client_memo[complex_order_auction_acknowledgement_at]); complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  complex_order_auction_acknowledgement_at = 0;
  do
  :: complex_order_auction_acknowledgement_at < 4 -> assert(complex_order_auction_acknowledgement_read.reserved_4[complex_order_auction_acknowledgement_at] == complex_order_auction_acknowledgement_written.reserved_4[complex_order_auction_acknowledgement_at]); complex_order_auction_acknowledgement_at = complex_order_auction_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Or Improvement Cancellation Acknowledgement: 147 bytes ---------- */

typedef AuctionOrImprovementCancellationAcknowledgement {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte original_order_id[8];
  byte auction_i_d[6]
};

int auction_or_improvement_cancellation_acknowledgement_at;

/* every byte of Auction Or Improvement Cancellation Acknowledgement set to one value */
inline fill_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_record, auction_or_improvement_cancellation_acknowledgement_value) {
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 2 -> auction_or_improvement_cancellation_acknowledgement_record.group[auction_or_improvement_cancellation_acknowledgement_at] = auction_or_improvement_cancellation_acknowledgement_value; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 4 -> auction_or_improvement_cancellation_acknowledgement_record.instrument_optional[auction_or_improvement_cancellation_acknowledgement_at] = auction_or_improvement_cancellation_acknowledgement_value; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.trader_id[auction_or_improvement_cancellation_acknowledgement_at] = auction_or_improvement_cancellation_acknowledgement_value; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.order_id[auction_or_improvement_cancellation_acknowledgement_at] = auction_or_improvement_cancellation_acknowledgement_value; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_record.status = auction_or_improvement_cancellation_acknowledgement_value;
  auction_or_improvement_cancellation_acknowledgement_record.verb_side = auction_or_improvement_cancellation_acknowledgement_value;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.quantity[auction_or_improvement_cancellation_acknowledgement_at] = auction_or_improvement_cancellation_acknowledgement_value; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 10 -> auction_or_improvement_cancellation_acknowledgement_record.assigned_price[auction_or_improvement_cancellation_acknowledgement_at] = auction_or_improvement_cancellation_acknowledgement_value; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  fill_clearing_data(auction_or_improvement_cancellation_acknowledgement_record.clearing_data, auction_or_improvement_cancellation_acknowledgement_value);
  fill_owner_data(auction_or_improvement_cancellation_acknowledgement_record.owner_data, auction_or_improvement_cancellation_acknowledgement_value);
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.original_order_id[auction_or_improvement_cancellation_acknowledgement_at] = auction_or_improvement_cancellation_acknowledgement_value; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 6 -> auction_or_improvement_cancellation_acknowledgement_record.auction_i_d[auction_or_improvement_cancellation_acknowledgement_at] = auction_or_improvement_cancellation_acknowledgement_value; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Or Improvement Cancellation Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_record, auction_or_improvement_cancellation_acknowledgement_base) {
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 2 -> auction_or_improvement_cancellation_acknowledgement_record.group[auction_or_improvement_cancellation_acknowledgement_at] = (auction_or_improvement_cancellation_acknowledgement_base + 0 + auction_or_improvement_cancellation_acknowledgement_at + 1) % 256; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 4 -> auction_or_improvement_cancellation_acknowledgement_record.instrument_optional[auction_or_improvement_cancellation_acknowledgement_at] = (auction_or_improvement_cancellation_acknowledgement_base + 2 + auction_or_improvement_cancellation_acknowledgement_at + 1) % 256; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.trader_id[auction_or_improvement_cancellation_acknowledgement_at] = (auction_or_improvement_cancellation_acknowledgement_base + 6 + auction_or_improvement_cancellation_acknowledgement_at + 1) % 256; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.order_id[auction_or_improvement_cancellation_acknowledgement_at] = (auction_or_improvement_cancellation_acknowledgement_base + 14 + auction_or_improvement_cancellation_acknowledgement_at + 1) % 256; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_record.status = (auction_or_improvement_cancellation_acknowledgement_base + 22 + 1) % 256;
  auction_or_improvement_cancellation_acknowledgement_record.verb_side = (auction_or_improvement_cancellation_acknowledgement_base + 23 + 1) % 256;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.quantity[auction_or_improvement_cancellation_acknowledgement_at] = (auction_or_improvement_cancellation_acknowledgement_base + 24 + auction_or_improvement_cancellation_acknowledgement_at + 1) % 256; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 10 -> auction_or_improvement_cancellation_acknowledgement_record.assigned_price[auction_or_improvement_cancellation_acknowledgement_at] = (auction_or_improvement_cancellation_acknowledgement_base + 32 + auction_or_improvement_cancellation_acknowledgement_at + 1) % 256; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  ramp_clearing_data(auction_or_improvement_cancellation_acknowledgement_record.clearing_data, auction_or_improvement_cancellation_acknowledgement_base + 42);
  ramp_owner_data(auction_or_improvement_cancellation_acknowledgement_record.owner_data, auction_or_improvement_cancellation_acknowledgement_base + 62);
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.original_order_id[auction_or_improvement_cancellation_acknowledgement_at] = (auction_or_improvement_cancellation_acknowledgement_base + 133 + auction_or_improvement_cancellation_acknowledgement_at + 1) % 256; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 6 -> auction_or_improvement_cancellation_acknowledgement_record.auction_i_d[auction_or_improvement_cancellation_acknowledgement_at] = (auction_or_improvement_cancellation_acknowledgement_base + 141 + auction_or_improvement_cancellation_acknowledgement_at + 1) % 256; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Or Improvement Cancellation Acknowledgement to the wire, 147 bytes from where the cursor stands */
inline encode_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_record) {
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 2 -> wire[at] = auction_or_improvement_cancellation_acknowledgement_record.group[auction_or_improvement_cancellation_acknowledgement_at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 4 -> wire[at] = auction_or_improvement_cancellation_acknowledgement_record.instrument_optional[auction_or_improvement_cancellation_acknowledgement_at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> wire[at] = auction_or_improvement_cancellation_acknowledgement_record.trader_id[auction_or_improvement_cancellation_acknowledgement_at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> wire[at] = auction_or_improvement_cancellation_acknowledgement_record.order_id[auction_or_improvement_cancellation_acknowledgement_at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = auction_or_improvement_cancellation_acknowledgement_record.status; at = at + 1;
  wire[at] = auction_or_improvement_cancellation_acknowledgement_record.verb_side; at = at + 1;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> wire[at] = auction_or_improvement_cancellation_acknowledgement_record.quantity[auction_or_improvement_cancellation_acknowledgement_at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 10 -> wire[at] = auction_or_improvement_cancellation_acknowledgement_record.assigned_price[auction_or_improvement_cancellation_acknowledgement_at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  encode_clearing_data(auction_or_improvement_cancellation_acknowledgement_record.clearing_data);
  encode_owner_data(auction_or_improvement_cancellation_acknowledgement_record.owner_data);
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> wire[at] = auction_or_improvement_cancellation_acknowledgement_record.original_order_id[auction_or_improvement_cancellation_acknowledgement_at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 6 -> wire[at] = auction_or_improvement_cancellation_acknowledgement_record.auction_i_d[auction_or_improvement_cancellation_acknowledgement_at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Or Improvement Cancellation Acknowledgement off the wire, 147 bytes from where the cursor stands */
inline decode_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_record) {
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 2 -> auction_or_improvement_cancellation_acknowledgement_record.group[auction_or_improvement_cancellation_acknowledgement_at] = wire[at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 4 -> auction_or_improvement_cancellation_acknowledgement_record.instrument_optional[auction_or_improvement_cancellation_acknowledgement_at] = wire[at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.trader_id[auction_or_improvement_cancellation_acknowledgement_at] = wire[at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.order_id[auction_or_improvement_cancellation_acknowledgement_at] = wire[at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_record.status = wire[at]; at = at + 1;
  auction_or_improvement_cancellation_acknowledgement_record.verb_side = wire[at]; at = at + 1;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.quantity[auction_or_improvement_cancellation_acknowledgement_at] = wire[at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 10 -> auction_or_improvement_cancellation_acknowledgement_record.assigned_price[auction_or_improvement_cancellation_acknowledgement_at] = wire[at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  decode_clearing_data(auction_or_improvement_cancellation_acknowledgement_record.clearing_data);
  decode_owner_data(auction_or_improvement_cancellation_acknowledgement_record.owner_data);
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> auction_or_improvement_cancellation_acknowledgement_record.original_order_id[auction_or_improvement_cancellation_acknowledgement_at] = wire[at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 6 -> auction_or_improvement_cancellation_acknowledgement_record.auction_i_d[auction_or_improvement_cancellation_acknowledgement_at] = wire[at]; at = at + 1; auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Or Improvement Cancellation Acknowledgement is what was written, byte for byte */
inline equal_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_read, auction_or_improvement_cancellation_acknowledgement_written) {
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 2 -> assert(auction_or_improvement_cancellation_acknowledgement_read.group[auction_or_improvement_cancellation_acknowledgement_at] == auction_or_improvement_cancellation_acknowledgement_written.group[auction_or_improvement_cancellation_acknowledgement_at]); auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 4 -> assert(auction_or_improvement_cancellation_acknowledgement_read.instrument_optional[auction_or_improvement_cancellation_acknowledgement_at] == auction_or_improvement_cancellation_acknowledgement_written.instrument_optional[auction_or_improvement_cancellation_acknowledgement_at]); auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> assert(auction_or_improvement_cancellation_acknowledgement_read.trader_id[auction_or_improvement_cancellation_acknowledgement_at] == auction_or_improvement_cancellation_acknowledgement_written.trader_id[auction_or_improvement_cancellation_acknowledgement_at]); auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> assert(auction_or_improvement_cancellation_acknowledgement_read.order_id[auction_or_improvement_cancellation_acknowledgement_at] == auction_or_improvement_cancellation_acknowledgement_written.order_id[auction_or_improvement_cancellation_acknowledgement_at]); auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  assert(auction_or_improvement_cancellation_acknowledgement_read.status == auction_or_improvement_cancellation_acknowledgement_written.status);
  assert(auction_or_improvement_cancellation_acknowledgement_read.verb_side == auction_or_improvement_cancellation_acknowledgement_written.verb_side);
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> assert(auction_or_improvement_cancellation_acknowledgement_read.quantity[auction_or_improvement_cancellation_acknowledgement_at] == auction_or_improvement_cancellation_acknowledgement_written.quantity[auction_or_improvement_cancellation_acknowledgement_at]); auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 10 -> assert(auction_or_improvement_cancellation_acknowledgement_read.assigned_price[auction_or_improvement_cancellation_acknowledgement_at] == auction_or_improvement_cancellation_acknowledgement_written.assigned_price[auction_or_improvement_cancellation_acknowledgement_at]); auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  equal_clearing_data(auction_or_improvement_cancellation_acknowledgement_read.clearing_data, auction_or_improvement_cancellation_acknowledgement_written.clearing_data);
  equal_owner_data(auction_or_improvement_cancellation_acknowledgement_read.owner_data, auction_or_improvement_cancellation_acknowledgement_written.owner_data);
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 8 -> assert(auction_or_improvement_cancellation_acknowledgement_read.original_order_id[auction_or_improvement_cancellation_acknowledgement_at] == auction_or_improvement_cancellation_acknowledgement_written.original_order_id[auction_or_improvement_cancellation_acknowledgement_at]); auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  auction_or_improvement_cancellation_acknowledgement_at = 0;
  do
  :: auction_or_improvement_cancellation_acknowledgement_at < 6 -> assert(auction_or_improvement_cancellation_acknowledgement_read.auction_i_d[auction_or_improvement_cancellation_acknowledgement_at] == auction_or_improvement_cancellation_acknowledgement_written.auction_i_d[auction_or_improvement_cancellation_acknowledgement_at]); auction_or_improvement_cancellation_acknowledgement_at = auction_or_improvement_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancellation Acknowledgement: 167 bytes --------------------------- */

typedef OrderCancellationAcknowledgement {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte original_order_id[8];
  byte auction_i_d[6];
  byte additional_client_memo[16];
  byte reserved_4[4]
};

int order_cancellation_acknowledgement_at;

/* every byte of Order Cancellation Acknowledgement set to one value */
inline fill_order_cancellation_acknowledgement(order_cancellation_acknowledgement_record, order_cancellation_acknowledgement_value) {
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 2 -> order_cancellation_acknowledgement_record.group[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> order_cancellation_acknowledgement_record.instrument_optional[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.trader_id[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.order_id[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_record.status = order_cancellation_acknowledgement_value;
  order_cancellation_acknowledgement_record.verb_side = order_cancellation_acknowledgement_value;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.quantity[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 10 -> order_cancellation_acknowledgement_record.assigned_price[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  fill_clearing_data(order_cancellation_acknowledgement_record.clearing_data, order_cancellation_acknowledgement_value);
  fill_owner_data(order_cancellation_acknowledgement_record.owner_data, order_cancellation_acknowledgement_value);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.original_order_id[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 6 -> order_cancellation_acknowledgement_record.auction_i_d[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 16 -> order_cancellation_acknowledgement_record.additional_client_memo[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> order_cancellation_acknowledgement_record.reserved_4[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancellation Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_order_cancellation_acknowledgement(order_cancellation_acknowledgement_record, order_cancellation_acknowledgement_base) {
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 2 -> order_cancellation_acknowledgement_record.group[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 0 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> order_cancellation_acknowledgement_record.instrument_optional[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 2 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.trader_id[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 6 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.order_id[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 14 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_record.status = (order_cancellation_acknowledgement_base + 22 + 1) % 256;
  order_cancellation_acknowledgement_record.verb_side = (order_cancellation_acknowledgement_base + 23 + 1) % 256;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.quantity[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 24 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 10 -> order_cancellation_acknowledgement_record.assigned_price[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 32 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  ramp_clearing_data(order_cancellation_acknowledgement_record.clearing_data, order_cancellation_acknowledgement_base + 42);
  ramp_owner_data(order_cancellation_acknowledgement_record.owner_data, order_cancellation_acknowledgement_base + 62);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.original_order_id[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 133 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 6 -> order_cancellation_acknowledgement_record.auction_i_d[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 141 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 16 -> order_cancellation_acknowledgement_record.additional_client_memo[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 147 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> order_cancellation_acknowledgement_record.reserved_4[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 163 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Acknowledgement to the wire, 167 bytes from where the cursor stands */
inline encode_order_cancellation_acknowledgement(order_cancellation_acknowledgement_record) {
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 2 -> wire[at] = order_cancellation_acknowledgement_record.group[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> wire[at] = order_cancellation_acknowledgement_record.instrument_optional[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> wire[at] = order_cancellation_acknowledgement_record.trader_id[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> wire[at] = order_cancellation_acknowledgement_record.order_id[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = order_cancellation_acknowledgement_record.status; at = at + 1;
  wire[at] = order_cancellation_acknowledgement_record.verb_side; at = at + 1;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> wire[at] = order_cancellation_acknowledgement_record.quantity[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 10 -> wire[at] = order_cancellation_acknowledgement_record.assigned_price[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  encode_clearing_data(order_cancellation_acknowledgement_record.clearing_data);
  encode_owner_data(order_cancellation_acknowledgement_record.owner_data);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> wire[at] = order_cancellation_acknowledgement_record.original_order_id[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 6 -> wire[at] = order_cancellation_acknowledgement_record.auction_i_d[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 16 -> wire[at] = order_cancellation_acknowledgement_record.additional_client_memo[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> wire[at] = order_cancellation_acknowledgement_record.reserved_4[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Acknowledgement off the wire, 167 bytes from where the cursor stands */
inline decode_order_cancellation_acknowledgement(order_cancellation_acknowledgement_record) {
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 2 -> order_cancellation_acknowledgement_record.group[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> order_cancellation_acknowledgement_record.instrument_optional[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.trader_id[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.order_id[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_record.status = wire[at]; at = at + 1;
  order_cancellation_acknowledgement_record.verb_side = wire[at]; at = at + 1;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.quantity[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 10 -> order_cancellation_acknowledgement_record.assigned_price[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  decode_clearing_data(order_cancellation_acknowledgement_record.clearing_data);
  decode_owner_data(order_cancellation_acknowledgement_record.owner_data);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.original_order_id[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 6 -> order_cancellation_acknowledgement_record.auction_i_d[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 16 -> order_cancellation_acknowledgement_record.additional_client_memo[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> order_cancellation_acknowledgement_record.reserved_4[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancellation Acknowledgement is what was written, byte for byte */
inline equal_order_cancellation_acknowledgement(order_cancellation_acknowledgement_read, order_cancellation_acknowledgement_written) {
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 2 -> assert(order_cancellation_acknowledgement_read.group[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.group[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> assert(order_cancellation_acknowledgement_read.instrument_optional[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.instrument_optional[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> assert(order_cancellation_acknowledgement_read.trader_id[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.trader_id[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> assert(order_cancellation_acknowledgement_read.order_id[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.order_id[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  assert(order_cancellation_acknowledgement_read.status == order_cancellation_acknowledgement_written.status);
  assert(order_cancellation_acknowledgement_read.verb_side == order_cancellation_acknowledgement_written.verb_side);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> assert(order_cancellation_acknowledgement_read.quantity[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.quantity[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 10 -> assert(order_cancellation_acknowledgement_read.assigned_price[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.assigned_price[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  equal_clearing_data(order_cancellation_acknowledgement_read.clearing_data, order_cancellation_acknowledgement_written.clearing_data);
  equal_owner_data(order_cancellation_acknowledgement_read.owner_data, order_cancellation_acknowledgement_written.owner_data);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> assert(order_cancellation_acknowledgement_read.original_order_id[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.original_order_id[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 6 -> assert(order_cancellation_acknowledgement_read.auction_i_d[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.auction_i_d[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 16 -> assert(order_cancellation_acknowledgement_read.additional_client_memo[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.additional_client_memo[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> assert(order_cancellation_acknowledgement_read.reserved_4[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.reserved_4[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trader Status: 10 bytes ------------------------------------------------- */

typedef TraderStatus {
  byte trader_id[8];
  byte trader_lock_out;
  byte risk_team_lock_out
};

int trader_status_at;

/* every byte of Trader Status set to one value */
inline fill_trader_status(trader_status_record, trader_status_value) {
  trader_status_at = 0;
  do
  :: trader_status_at < 8 -> trader_status_record.trader_id[trader_status_at] = trader_status_value; trader_status_at = trader_status_at + 1
  :: else -> break
  od;
  trader_status_record.trader_lock_out = trader_status_value;
  trader_status_record.risk_team_lock_out = trader_status_value;
  skip
}

/* each byte of Trader Status set to where it lies, so a field read out of place says so */
inline ramp_trader_status(trader_status_record, trader_status_base) {
  trader_status_at = 0;
  do
  :: trader_status_at < 8 -> trader_status_record.trader_id[trader_status_at] = (trader_status_base + 0 + trader_status_at + 1) % 256; trader_status_at = trader_status_at + 1
  :: else -> break
  od;
  trader_status_record.trader_lock_out = (trader_status_base + 8 + 1) % 256;
  trader_status_record.risk_team_lock_out = (trader_status_base + 9 + 1) % 256;
  skip
}

/* Trader Status to the wire, 10 bytes from where the cursor stands */
inline encode_trader_status(trader_status_record) {
  trader_status_at = 0;
  do
  :: trader_status_at < 8 -> wire[at] = trader_status_record.trader_id[trader_status_at]; at = at + 1; trader_status_at = trader_status_at + 1
  :: else -> break
  od;
  wire[at] = trader_status_record.trader_lock_out; at = at + 1;
  wire[at] = trader_status_record.risk_team_lock_out; at = at + 1;
  skip
}

/* Trader Status off the wire, 10 bytes from where the cursor stands */
inline decode_trader_status(trader_status_record) {
  trader_status_at = 0;
  do
  :: trader_status_at < 8 -> trader_status_record.trader_id[trader_status_at] = wire[at]; at = at + 1; trader_status_at = trader_status_at + 1
  :: else -> break
  od;
  trader_status_record.trader_lock_out = wire[at]; at = at + 1;
  trader_status_record.risk_team_lock_out = wire[at]; at = at + 1;
  skip
}

/* what was read of Trader Status is what was written, byte for byte */
inline equal_trader_status(trader_status_read, trader_status_written) {
  trader_status_at = 0;
  do
  :: trader_status_at < 8 -> assert(trader_status_read.trader_id[trader_status_at] == trader_status_written.trader_id[trader_status_at]); trader_status_at = trader_status_at + 1
  :: else -> break
  od;
  assert(trader_status_read.trader_lock_out == trader_status_written.trader_lock_out);
  assert(trader_status_read.risk_team_lock_out == trader_status_written.risk_team_lock_out);
  skip
}

/* ---- Directed Order Cancellation Notice: 41 bytes ---------------------------- */

typedef DirectedOrderCancellationNotice {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte verb_side;
  byte quantity[8];
  byte price[10];
  byte referenced_order_id[8]
};

int directed_order_cancellation_notice_at;

/* every byte of Directed Order Cancellation Notice set to one value */
inline fill_directed_order_cancellation_notice(directed_order_cancellation_notice_record, directed_order_cancellation_notice_value) {
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 2 -> directed_order_cancellation_notice_record.group[directed_order_cancellation_notice_at] = directed_order_cancellation_notice_value; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 4 -> directed_order_cancellation_notice_record.instrument_optional[directed_order_cancellation_notice_at] = directed_order_cancellation_notice_value; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> directed_order_cancellation_notice_record.trader_id[directed_order_cancellation_notice_at] = directed_order_cancellation_notice_value; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_record.verb_side = directed_order_cancellation_notice_value;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> directed_order_cancellation_notice_record.quantity[directed_order_cancellation_notice_at] = directed_order_cancellation_notice_value; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 10 -> directed_order_cancellation_notice_record.price[directed_order_cancellation_notice_at] = directed_order_cancellation_notice_value; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> directed_order_cancellation_notice_record.referenced_order_id[directed_order_cancellation_notice_at] = directed_order_cancellation_notice_value; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Directed Order Cancellation Notice set to where it lies, so a field read out of place says so */
inline ramp_directed_order_cancellation_notice(directed_order_cancellation_notice_record, directed_order_cancellation_notice_base) {
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 2 -> directed_order_cancellation_notice_record.group[directed_order_cancellation_notice_at] = (directed_order_cancellation_notice_base + 0 + directed_order_cancellation_notice_at + 1) % 256; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 4 -> directed_order_cancellation_notice_record.instrument_optional[directed_order_cancellation_notice_at] = (directed_order_cancellation_notice_base + 2 + directed_order_cancellation_notice_at + 1) % 256; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> directed_order_cancellation_notice_record.trader_id[directed_order_cancellation_notice_at] = (directed_order_cancellation_notice_base + 6 + directed_order_cancellation_notice_at + 1) % 256; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_record.verb_side = (directed_order_cancellation_notice_base + 14 + 1) % 256;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> directed_order_cancellation_notice_record.quantity[directed_order_cancellation_notice_at] = (directed_order_cancellation_notice_base + 15 + directed_order_cancellation_notice_at + 1) % 256; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 10 -> directed_order_cancellation_notice_record.price[directed_order_cancellation_notice_at] = (directed_order_cancellation_notice_base + 23 + directed_order_cancellation_notice_at + 1) % 256; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> directed_order_cancellation_notice_record.referenced_order_id[directed_order_cancellation_notice_at] = (directed_order_cancellation_notice_base + 33 + directed_order_cancellation_notice_at + 1) % 256; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Directed Order Cancellation Notice to the wire, 41 bytes from where the cursor stands */
inline encode_directed_order_cancellation_notice(directed_order_cancellation_notice_record) {
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 2 -> wire[at] = directed_order_cancellation_notice_record.group[directed_order_cancellation_notice_at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 4 -> wire[at] = directed_order_cancellation_notice_record.instrument_optional[directed_order_cancellation_notice_at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> wire[at] = directed_order_cancellation_notice_record.trader_id[directed_order_cancellation_notice_at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  wire[at] = directed_order_cancellation_notice_record.verb_side; at = at + 1;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> wire[at] = directed_order_cancellation_notice_record.quantity[directed_order_cancellation_notice_at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 10 -> wire[at] = directed_order_cancellation_notice_record.price[directed_order_cancellation_notice_at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> wire[at] = directed_order_cancellation_notice_record.referenced_order_id[directed_order_cancellation_notice_at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Directed Order Cancellation Notice off the wire, 41 bytes from where the cursor stands */
inline decode_directed_order_cancellation_notice(directed_order_cancellation_notice_record) {
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 2 -> directed_order_cancellation_notice_record.group[directed_order_cancellation_notice_at] = wire[at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 4 -> directed_order_cancellation_notice_record.instrument_optional[directed_order_cancellation_notice_at] = wire[at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> directed_order_cancellation_notice_record.trader_id[directed_order_cancellation_notice_at] = wire[at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_record.verb_side = wire[at]; at = at + 1;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> directed_order_cancellation_notice_record.quantity[directed_order_cancellation_notice_at] = wire[at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 10 -> directed_order_cancellation_notice_record.price[directed_order_cancellation_notice_at] = wire[at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> directed_order_cancellation_notice_record.referenced_order_id[directed_order_cancellation_notice_at] = wire[at]; at = at + 1; directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Directed Order Cancellation Notice is what was written, byte for byte */
inline equal_directed_order_cancellation_notice(directed_order_cancellation_notice_read, directed_order_cancellation_notice_written) {
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 2 -> assert(directed_order_cancellation_notice_read.group[directed_order_cancellation_notice_at] == directed_order_cancellation_notice_written.group[directed_order_cancellation_notice_at]); directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 4 -> assert(directed_order_cancellation_notice_read.instrument_optional[directed_order_cancellation_notice_at] == directed_order_cancellation_notice_written.instrument_optional[directed_order_cancellation_notice_at]); directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> assert(directed_order_cancellation_notice_read.trader_id[directed_order_cancellation_notice_at] == directed_order_cancellation_notice_written.trader_id[directed_order_cancellation_notice_at]); directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  assert(directed_order_cancellation_notice_read.verb_side == directed_order_cancellation_notice_written.verb_side);
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> assert(directed_order_cancellation_notice_read.quantity[directed_order_cancellation_notice_at] == directed_order_cancellation_notice_written.quantity[directed_order_cancellation_notice_at]); directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 10 -> assert(directed_order_cancellation_notice_read.price[directed_order_cancellation_notice_at] == directed_order_cancellation_notice_written.price[directed_order_cancellation_notice_at]); directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  directed_order_cancellation_notice_at = 0;
  do
  :: directed_order_cancellation_notice_at < 8 -> assert(directed_order_cancellation_notice_read.referenced_order_id[directed_order_cancellation_notice_at] == directed_order_cancellation_notice_written.referenced_order_id[directed_order_cancellation_notice_at]); directed_order_cancellation_notice_at = directed_order_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Directed Order Notice: 41 bytes ----------------------------------------- */

typedef DirectedOrderNotice {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte verb_side;
  byte quantity[8];
  byte price[10];
  byte referenced_order_id[8]
};

int directed_order_notice_at;

/* every byte of Directed Order Notice set to one value */
inline fill_directed_order_notice(directed_order_notice_record, directed_order_notice_value) {
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 2 -> directed_order_notice_record.group[directed_order_notice_at] = directed_order_notice_value; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 4 -> directed_order_notice_record.instrument_optional[directed_order_notice_at] = directed_order_notice_value; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> directed_order_notice_record.trader_id[directed_order_notice_at] = directed_order_notice_value; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_record.verb_side = directed_order_notice_value;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> directed_order_notice_record.quantity[directed_order_notice_at] = directed_order_notice_value; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 10 -> directed_order_notice_record.price[directed_order_notice_at] = directed_order_notice_value; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> directed_order_notice_record.referenced_order_id[directed_order_notice_at] = directed_order_notice_value; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Directed Order Notice set to where it lies, so a field read out of place says so */
inline ramp_directed_order_notice(directed_order_notice_record, directed_order_notice_base) {
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 2 -> directed_order_notice_record.group[directed_order_notice_at] = (directed_order_notice_base + 0 + directed_order_notice_at + 1) % 256; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 4 -> directed_order_notice_record.instrument_optional[directed_order_notice_at] = (directed_order_notice_base + 2 + directed_order_notice_at + 1) % 256; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> directed_order_notice_record.trader_id[directed_order_notice_at] = (directed_order_notice_base + 6 + directed_order_notice_at + 1) % 256; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_record.verb_side = (directed_order_notice_base + 14 + 1) % 256;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> directed_order_notice_record.quantity[directed_order_notice_at] = (directed_order_notice_base + 15 + directed_order_notice_at + 1) % 256; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 10 -> directed_order_notice_record.price[directed_order_notice_at] = (directed_order_notice_base + 23 + directed_order_notice_at + 1) % 256; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> directed_order_notice_record.referenced_order_id[directed_order_notice_at] = (directed_order_notice_base + 33 + directed_order_notice_at + 1) % 256; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Directed Order Notice to the wire, 41 bytes from where the cursor stands */
inline encode_directed_order_notice(directed_order_notice_record) {
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 2 -> wire[at] = directed_order_notice_record.group[directed_order_notice_at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 4 -> wire[at] = directed_order_notice_record.instrument_optional[directed_order_notice_at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> wire[at] = directed_order_notice_record.trader_id[directed_order_notice_at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  wire[at] = directed_order_notice_record.verb_side; at = at + 1;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> wire[at] = directed_order_notice_record.quantity[directed_order_notice_at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 10 -> wire[at] = directed_order_notice_record.price[directed_order_notice_at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> wire[at] = directed_order_notice_record.referenced_order_id[directed_order_notice_at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Directed Order Notice off the wire, 41 bytes from where the cursor stands */
inline decode_directed_order_notice(directed_order_notice_record) {
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 2 -> directed_order_notice_record.group[directed_order_notice_at] = wire[at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 4 -> directed_order_notice_record.instrument_optional[directed_order_notice_at] = wire[at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> directed_order_notice_record.trader_id[directed_order_notice_at] = wire[at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_record.verb_side = wire[at]; at = at + 1;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> directed_order_notice_record.quantity[directed_order_notice_at] = wire[at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 10 -> directed_order_notice_record.price[directed_order_notice_at] = wire[at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> directed_order_notice_record.referenced_order_id[directed_order_notice_at] = wire[at]; at = at + 1; directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Directed Order Notice is what was written, byte for byte */
inline equal_directed_order_notice(directed_order_notice_read, directed_order_notice_written) {
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 2 -> assert(directed_order_notice_read.group[directed_order_notice_at] == directed_order_notice_written.group[directed_order_notice_at]); directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 4 -> assert(directed_order_notice_read.instrument_optional[directed_order_notice_at] == directed_order_notice_written.instrument_optional[directed_order_notice_at]); directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> assert(directed_order_notice_read.trader_id[directed_order_notice_at] == directed_order_notice_written.trader_id[directed_order_notice_at]); directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  assert(directed_order_notice_read.verb_side == directed_order_notice_written.verb_side);
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> assert(directed_order_notice_read.quantity[directed_order_notice_at] == directed_order_notice_written.quantity[directed_order_notice_at]); directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 10 -> assert(directed_order_notice_read.price[directed_order_notice_at] == directed_order_notice_written.price[directed_order_notice_at]); directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  directed_order_notice_at = 0;
  do
  :: directed_order_notice_at < 8 -> assert(directed_order_notice_read.referenced_order_id[directed_order_notice_at] == directed_order_notice_written.referenced_order_id[directed_order_notice_at]); directed_order_notice_at = directed_order_notice_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Excluded Instrument Notice: 22 bytes ------------------------------------ */

typedef ExcludedInstrumentNotice {
  byte group[2];
  byte reserved_2[2];
  byte trader_id[8];
  byte second_reserved_2[2];
  byte nb_of_instruments[4];
  byte instrument[4]
};

int excluded_instrument_notice_at;

/* every byte of Excluded Instrument Notice set to one value */
inline fill_excluded_instrument_notice(excluded_instrument_notice_record, excluded_instrument_notice_value) {
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> excluded_instrument_notice_record.group[excluded_instrument_notice_at] = excluded_instrument_notice_value; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> excluded_instrument_notice_record.reserved_2[excluded_instrument_notice_at] = excluded_instrument_notice_value; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 8 -> excluded_instrument_notice_record.trader_id[excluded_instrument_notice_at] = excluded_instrument_notice_value; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> excluded_instrument_notice_record.second_reserved_2[excluded_instrument_notice_at] = excluded_instrument_notice_value; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 4 -> excluded_instrument_notice_record.nb_of_instruments[excluded_instrument_notice_at] = excluded_instrument_notice_value; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 4 -> excluded_instrument_notice_record.instrument[excluded_instrument_notice_at] = excluded_instrument_notice_value; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Excluded Instrument Notice set to where it lies, so a field read out of place says so */
inline ramp_excluded_instrument_notice(excluded_instrument_notice_record, excluded_instrument_notice_base) {
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> excluded_instrument_notice_record.group[excluded_instrument_notice_at] = (excluded_instrument_notice_base + 0 + excluded_instrument_notice_at + 1) % 256; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> excluded_instrument_notice_record.reserved_2[excluded_instrument_notice_at] = (excluded_instrument_notice_base + 2 + excluded_instrument_notice_at + 1) % 256; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 8 -> excluded_instrument_notice_record.trader_id[excluded_instrument_notice_at] = (excluded_instrument_notice_base + 4 + excluded_instrument_notice_at + 1) % 256; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> excluded_instrument_notice_record.second_reserved_2[excluded_instrument_notice_at] = (excluded_instrument_notice_base + 12 + excluded_instrument_notice_at + 1) % 256; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 4 -> excluded_instrument_notice_record.nb_of_instruments[excluded_instrument_notice_at] = (excluded_instrument_notice_base + 14 + excluded_instrument_notice_at + 1) % 256; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 4 -> excluded_instrument_notice_record.instrument[excluded_instrument_notice_at] = (excluded_instrument_notice_base + 18 + excluded_instrument_notice_at + 1) % 256; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Excluded Instrument Notice to the wire, 22 bytes from where the cursor stands */
inline encode_excluded_instrument_notice(excluded_instrument_notice_record) {
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> wire[at] = excluded_instrument_notice_record.group[excluded_instrument_notice_at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> wire[at] = excluded_instrument_notice_record.reserved_2[excluded_instrument_notice_at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 8 -> wire[at] = excluded_instrument_notice_record.trader_id[excluded_instrument_notice_at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> wire[at] = excluded_instrument_notice_record.second_reserved_2[excluded_instrument_notice_at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 4 -> wire[at] = excluded_instrument_notice_record.nb_of_instruments[excluded_instrument_notice_at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 4 -> wire[at] = excluded_instrument_notice_record.instrument[excluded_instrument_notice_at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Excluded Instrument Notice off the wire, 22 bytes from where the cursor stands */
inline decode_excluded_instrument_notice(excluded_instrument_notice_record) {
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> excluded_instrument_notice_record.group[excluded_instrument_notice_at] = wire[at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> excluded_instrument_notice_record.reserved_2[excluded_instrument_notice_at] = wire[at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 8 -> excluded_instrument_notice_record.trader_id[excluded_instrument_notice_at] = wire[at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> excluded_instrument_notice_record.second_reserved_2[excluded_instrument_notice_at] = wire[at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 4 -> excluded_instrument_notice_record.nb_of_instruments[excluded_instrument_notice_at] = wire[at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 4 -> excluded_instrument_notice_record.instrument[excluded_instrument_notice_at] = wire[at]; at = at + 1; excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Excluded Instrument Notice is what was written, byte for byte */
inline equal_excluded_instrument_notice(excluded_instrument_notice_read, excluded_instrument_notice_written) {
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> assert(excluded_instrument_notice_read.group[excluded_instrument_notice_at] == excluded_instrument_notice_written.group[excluded_instrument_notice_at]); excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> assert(excluded_instrument_notice_read.reserved_2[excluded_instrument_notice_at] == excluded_instrument_notice_written.reserved_2[excluded_instrument_notice_at]); excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 8 -> assert(excluded_instrument_notice_read.trader_id[excluded_instrument_notice_at] == excluded_instrument_notice_written.trader_id[excluded_instrument_notice_at]); excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 2 -> assert(excluded_instrument_notice_read.second_reserved_2[excluded_instrument_notice_at] == excluded_instrument_notice_written.second_reserved_2[excluded_instrument_notice_at]); excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 4 -> assert(excluded_instrument_notice_read.nb_of_instruments[excluded_instrument_notice_at] == excluded_instrument_notice_written.nb_of_instruments[excluded_instrument_notice_at]); excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  excluded_instrument_notice_at = 0;
  do
  :: excluded_instrument_notice_at < 4 -> assert(excluded_instrument_notice_read.instrument[excluded_instrument_notice_at] == excluded_instrument_notice_written.instrument[excluded_instrument_notice_at]); excluded_instrument_notice_at = excluded_instrument_notice_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group State Change: 3 bytes --------------------------------------------- */

typedef GroupStateChange {
  byte group[2];
  byte group_state
};

int group_state_change_at;

/* every byte of Group State Change set to one value */
inline fill_group_state_change(group_state_change_record, group_state_change_value) {
  group_state_change_at = 0;
  do
  :: group_state_change_at < 2 -> group_state_change_record.group[group_state_change_at] = group_state_change_value; group_state_change_at = group_state_change_at + 1
  :: else -> break
  od;
  group_state_change_record.group_state = group_state_change_value;
  skip
}

/* each byte of Group State Change set to where it lies, so a field read out of place says so */
inline ramp_group_state_change(group_state_change_record, group_state_change_base) {
  group_state_change_at = 0;
  do
  :: group_state_change_at < 2 -> group_state_change_record.group[group_state_change_at] = (group_state_change_base + 0 + group_state_change_at + 1) % 256; group_state_change_at = group_state_change_at + 1
  :: else -> break
  od;
  group_state_change_record.group_state = (group_state_change_base + 2 + 1) % 256;
  skip
}

/* Group State Change to the wire, 3 bytes from where the cursor stands */
inline encode_group_state_change(group_state_change_record) {
  group_state_change_at = 0;
  do
  :: group_state_change_at < 2 -> wire[at] = group_state_change_record.group[group_state_change_at]; at = at + 1; group_state_change_at = group_state_change_at + 1
  :: else -> break
  od;
  wire[at] = group_state_change_record.group_state; at = at + 1;
  skip
}

/* Group State Change off the wire, 3 bytes from where the cursor stands */
inline decode_group_state_change(group_state_change_record) {
  group_state_change_at = 0;
  do
  :: group_state_change_at < 2 -> group_state_change_record.group[group_state_change_at] = wire[at]; at = at + 1; group_state_change_at = group_state_change_at + 1
  :: else -> break
  od;
  group_state_change_record.group_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Group State Change is what was written, byte for byte */
inline equal_group_state_change(group_state_change_read, group_state_change_written) {
  group_state_change_at = 0;
  do
  :: group_state_change_at < 2 -> assert(group_state_change_read.group[group_state_change_at] == group_state_change_written.group[group_state_change_at]); group_state_change_at = group_state_change_at + 1
  :: else -> break
  od;
  assert(group_state_change_read.group_state == group_state_change_written.group_state);
  skip
}

/* ---- Leg Execution Notice: 257 bytes ----------------------------------------- */

typedef LegExecutionNotice {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte reference_id[8];
  byte verb_side;
  byte quantity_traded[8];
  byte trade_price[10];
  byte time_trade_hhmmss[6];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte special_trade_indicator;
  byte price_type;
  byte trade_type;
  byte auction_i_d_optional[6];
  byte trade_number[8];
  byte trade_memo[50];
  byte original_reference_id[8];
  byte id_code_for_the_counterpart_participant[4];
  byte liquidity_status;
  byte strategy_group[2];
  byte strategy_instrument_id[4];
  byte strategy_verb_side;
  byte strategy_trade_number[8];
  byte leg_number[2];
  byte counterpart_account_type;
  byte additional_client_memo[16];
  byte reserved_1;
  byte reserved_4[4]
};

int leg_execution_notice_at;

/* every byte of Leg Execution Notice set to one value */
inline fill_leg_execution_notice(leg_execution_notice_record, leg_execution_notice_value) {
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.group[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.instrument_optional[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.trader_id[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.reference_id[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.verb_side = leg_execution_notice_value;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.quantity_traded[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 10 -> leg_execution_notice_record.trade_price[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.time_trade_hhmmss[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  fill_clearing_data(leg_execution_notice_record.clearing_data, leg_execution_notice_value);
  fill_owner_data(leg_execution_notice_record.owner_data, leg_execution_notice_value);
  leg_execution_notice_record.special_trade_indicator = leg_execution_notice_value;
  leg_execution_notice_record.price_type = leg_execution_notice_value;
  leg_execution_notice_record.trade_type = leg_execution_notice_value;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.auction_i_d_optional[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.trade_number[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 50 -> leg_execution_notice_record.trade_memo[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.original_reference_id[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.id_code_for_the_counterpart_participant[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.liquidity_status = leg_execution_notice_value;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.strategy_group[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.strategy_instrument_id[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.strategy_verb_side = leg_execution_notice_value;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.strategy_trade_number[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.leg_number[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.counterpart_account_type = leg_execution_notice_value;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 16 -> leg_execution_notice_record.additional_client_memo[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.reserved_1 = leg_execution_notice_value;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.reserved_4[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Leg Execution Notice set to where it lies, so a field read out of place says so */
inline ramp_leg_execution_notice(leg_execution_notice_record, leg_execution_notice_base) {
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.group[leg_execution_notice_at] = (leg_execution_notice_base + 0 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.instrument_optional[leg_execution_notice_at] = (leg_execution_notice_base + 2 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.trader_id[leg_execution_notice_at] = (leg_execution_notice_base + 6 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.reference_id[leg_execution_notice_at] = (leg_execution_notice_base + 14 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.verb_side = (leg_execution_notice_base + 22 + 1) % 256;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.quantity_traded[leg_execution_notice_at] = (leg_execution_notice_base + 23 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 10 -> leg_execution_notice_record.trade_price[leg_execution_notice_at] = (leg_execution_notice_base + 31 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.time_trade_hhmmss[leg_execution_notice_at] = (leg_execution_notice_base + 41 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  ramp_clearing_data(leg_execution_notice_record.clearing_data, leg_execution_notice_base + 47);
  ramp_owner_data(leg_execution_notice_record.owner_data, leg_execution_notice_base + 67);
  leg_execution_notice_record.special_trade_indicator = (leg_execution_notice_base + 138 + 1) % 256;
  leg_execution_notice_record.price_type = (leg_execution_notice_base + 139 + 1) % 256;
  leg_execution_notice_record.trade_type = (leg_execution_notice_base + 140 + 1) % 256;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.auction_i_d_optional[leg_execution_notice_at] = (leg_execution_notice_base + 141 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.trade_number[leg_execution_notice_at] = (leg_execution_notice_base + 147 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 50 -> leg_execution_notice_record.trade_memo[leg_execution_notice_at] = (leg_execution_notice_base + 155 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.original_reference_id[leg_execution_notice_at] = (leg_execution_notice_base + 205 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.id_code_for_the_counterpart_participant[leg_execution_notice_at] = (leg_execution_notice_base + 213 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.liquidity_status = (leg_execution_notice_base + 217 + 1) % 256;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.strategy_group[leg_execution_notice_at] = (leg_execution_notice_base + 218 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.strategy_instrument_id[leg_execution_notice_at] = (leg_execution_notice_base + 220 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.strategy_verb_side = (leg_execution_notice_base + 224 + 1) % 256;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.strategy_trade_number[leg_execution_notice_at] = (leg_execution_notice_base + 225 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.leg_number[leg_execution_notice_at] = (leg_execution_notice_base + 233 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.counterpart_account_type = (leg_execution_notice_base + 235 + 1) % 256;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 16 -> leg_execution_notice_record.additional_client_memo[leg_execution_notice_at] = (leg_execution_notice_base + 236 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.reserved_1 = (leg_execution_notice_base + 252 + 1) % 256;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.reserved_4[leg_execution_notice_at] = (leg_execution_notice_base + 253 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Leg Execution Notice to the wire, 257 bytes from where the cursor stands */
inline encode_leg_execution_notice(leg_execution_notice_record) {
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> wire[at] = leg_execution_notice_record.group[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> wire[at] = leg_execution_notice_record.instrument_optional[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> wire[at] = leg_execution_notice_record.trader_id[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> wire[at] = leg_execution_notice_record.reference_id[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  wire[at] = leg_execution_notice_record.verb_side; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> wire[at] = leg_execution_notice_record.quantity_traded[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 10 -> wire[at] = leg_execution_notice_record.trade_price[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> wire[at] = leg_execution_notice_record.time_trade_hhmmss[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  encode_clearing_data(leg_execution_notice_record.clearing_data);
  encode_owner_data(leg_execution_notice_record.owner_data);
  wire[at] = leg_execution_notice_record.special_trade_indicator; at = at + 1;
  wire[at] = leg_execution_notice_record.price_type; at = at + 1;
  wire[at] = leg_execution_notice_record.trade_type; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> wire[at] = leg_execution_notice_record.auction_i_d_optional[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> wire[at] = leg_execution_notice_record.trade_number[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 50 -> wire[at] = leg_execution_notice_record.trade_memo[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> wire[at] = leg_execution_notice_record.original_reference_id[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> wire[at] = leg_execution_notice_record.id_code_for_the_counterpart_participant[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  wire[at] = leg_execution_notice_record.liquidity_status; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> wire[at] = leg_execution_notice_record.strategy_group[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> wire[at] = leg_execution_notice_record.strategy_instrument_id[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  wire[at] = leg_execution_notice_record.strategy_verb_side; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> wire[at] = leg_execution_notice_record.strategy_trade_number[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> wire[at] = leg_execution_notice_record.leg_number[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  wire[at] = leg_execution_notice_record.counterpart_account_type; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 16 -> wire[at] = leg_execution_notice_record.additional_client_memo[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  wire[at] = leg_execution_notice_record.reserved_1; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> wire[at] = leg_execution_notice_record.reserved_4[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Leg Execution Notice off the wire, 257 bytes from where the cursor stands */
inline decode_leg_execution_notice(leg_execution_notice_record) {
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.group[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.instrument_optional[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.trader_id[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.reference_id[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.verb_side = wire[at]; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.quantity_traded[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 10 -> leg_execution_notice_record.trade_price[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.time_trade_hhmmss[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  decode_clearing_data(leg_execution_notice_record.clearing_data);
  decode_owner_data(leg_execution_notice_record.owner_data);
  leg_execution_notice_record.special_trade_indicator = wire[at]; at = at + 1;
  leg_execution_notice_record.price_type = wire[at]; at = at + 1;
  leg_execution_notice_record.trade_type = wire[at]; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.auction_i_d_optional[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.trade_number[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 50 -> leg_execution_notice_record.trade_memo[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.original_reference_id[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.id_code_for_the_counterpart_participant[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.liquidity_status = wire[at]; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.strategy_group[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.strategy_instrument_id[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.strategy_verb_side = wire[at]; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.strategy_trade_number[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.leg_number[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.counterpart_account_type = wire[at]; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 16 -> leg_execution_notice_record.additional_client_memo[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.reserved_1 = wire[at]; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.reserved_4[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Leg Execution Notice is what was written, byte for byte */
inline equal_leg_execution_notice(leg_execution_notice_read, leg_execution_notice_written) {
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> assert(leg_execution_notice_read.group[leg_execution_notice_at] == leg_execution_notice_written.group[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> assert(leg_execution_notice_read.instrument_optional[leg_execution_notice_at] == leg_execution_notice_written.instrument_optional[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> assert(leg_execution_notice_read.trader_id[leg_execution_notice_at] == leg_execution_notice_written.trader_id[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> assert(leg_execution_notice_read.reference_id[leg_execution_notice_at] == leg_execution_notice_written.reference_id[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  assert(leg_execution_notice_read.verb_side == leg_execution_notice_written.verb_side);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> assert(leg_execution_notice_read.quantity_traded[leg_execution_notice_at] == leg_execution_notice_written.quantity_traded[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 10 -> assert(leg_execution_notice_read.trade_price[leg_execution_notice_at] == leg_execution_notice_written.trade_price[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> assert(leg_execution_notice_read.time_trade_hhmmss[leg_execution_notice_at] == leg_execution_notice_written.time_trade_hhmmss[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  equal_clearing_data(leg_execution_notice_read.clearing_data, leg_execution_notice_written.clearing_data);
  equal_owner_data(leg_execution_notice_read.owner_data, leg_execution_notice_written.owner_data);
  assert(leg_execution_notice_read.special_trade_indicator == leg_execution_notice_written.special_trade_indicator);
  assert(leg_execution_notice_read.price_type == leg_execution_notice_written.price_type);
  assert(leg_execution_notice_read.trade_type == leg_execution_notice_written.trade_type);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> assert(leg_execution_notice_read.auction_i_d_optional[leg_execution_notice_at] == leg_execution_notice_written.auction_i_d_optional[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> assert(leg_execution_notice_read.trade_number[leg_execution_notice_at] == leg_execution_notice_written.trade_number[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 50 -> assert(leg_execution_notice_read.trade_memo[leg_execution_notice_at] == leg_execution_notice_written.trade_memo[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> assert(leg_execution_notice_read.original_reference_id[leg_execution_notice_at] == leg_execution_notice_written.original_reference_id[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> assert(leg_execution_notice_read.id_code_for_the_counterpart_participant[leg_execution_notice_at] == leg_execution_notice_written.id_code_for_the_counterpart_participant[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  assert(leg_execution_notice_read.liquidity_status == leg_execution_notice_written.liquidity_status);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> assert(leg_execution_notice_read.strategy_group[leg_execution_notice_at] == leg_execution_notice_written.strategy_group[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> assert(leg_execution_notice_read.strategy_instrument_id[leg_execution_notice_at] == leg_execution_notice_written.strategy_instrument_id[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  assert(leg_execution_notice_read.strategy_verb_side == leg_execution_notice_written.strategy_verb_side);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> assert(leg_execution_notice_read.strategy_trade_number[leg_execution_notice_at] == leg_execution_notice_written.strategy_trade_number[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> assert(leg_execution_notice_read.leg_number[leg_execution_notice_at] == leg_execution_notice_written.leg_number[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  assert(leg_execution_notice_read.counterpart_account_type == leg_execution_notice_written.counterpart_account_type);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 16 -> assert(leg_execution_notice_read.additional_client_memo[leg_execution_notice_at] == leg_execution_notice_written.additional_client_memo[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  assert(leg_execution_notice_read.reserved_1 == leg_execution_notice_written.reserved_1);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> assert(leg_execution_notice_read.reserved_4[leg_execution_notice_at] == leg_execution_notice_written.reserved_4[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancellation Of All Quotes Notices: 15 bytes ---------------------------- */

typedef CancellationOfAllQuotesNotices {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte quote_cancel_reason
};

int cancellation_of_all_quotes_notices_at;

/* every byte of Cancellation Of All Quotes Notices set to one value */
inline fill_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_record, cancellation_of_all_quotes_notices_value) {
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 2 -> cancellation_of_all_quotes_notices_record.group[cancellation_of_all_quotes_notices_at] = cancellation_of_all_quotes_notices_value; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 4 -> cancellation_of_all_quotes_notices_record.instrument_optional[cancellation_of_all_quotes_notices_at] = cancellation_of_all_quotes_notices_value; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 8 -> cancellation_of_all_quotes_notices_record.trader_id[cancellation_of_all_quotes_notices_at] = cancellation_of_all_quotes_notices_value; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_record.quote_cancel_reason = cancellation_of_all_quotes_notices_value;
  skip
}

/* each byte of Cancellation Of All Quotes Notices set to where it lies, so a field read out of place says so */
inline ramp_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_record, cancellation_of_all_quotes_notices_base) {
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 2 -> cancellation_of_all_quotes_notices_record.group[cancellation_of_all_quotes_notices_at] = (cancellation_of_all_quotes_notices_base + 0 + cancellation_of_all_quotes_notices_at + 1) % 256; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 4 -> cancellation_of_all_quotes_notices_record.instrument_optional[cancellation_of_all_quotes_notices_at] = (cancellation_of_all_quotes_notices_base + 2 + cancellation_of_all_quotes_notices_at + 1) % 256; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 8 -> cancellation_of_all_quotes_notices_record.trader_id[cancellation_of_all_quotes_notices_at] = (cancellation_of_all_quotes_notices_base + 6 + cancellation_of_all_quotes_notices_at + 1) % 256; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_record.quote_cancel_reason = (cancellation_of_all_quotes_notices_base + 14 + 1) % 256;
  skip
}

/* Cancellation Of All Quotes Notices to the wire, 15 bytes from where the cursor stands */
inline encode_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_record) {
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 2 -> wire[at] = cancellation_of_all_quotes_notices_record.group[cancellation_of_all_quotes_notices_at]; at = at + 1; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 4 -> wire[at] = cancellation_of_all_quotes_notices_record.instrument_optional[cancellation_of_all_quotes_notices_at]; at = at + 1; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 8 -> wire[at] = cancellation_of_all_quotes_notices_record.trader_id[cancellation_of_all_quotes_notices_at]; at = at + 1; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  wire[at] = cancellation_of_all_quotes_notices_record.quote_cancel_reason; at = at + 1;
  skip
}

/* Cancellation Of All Quotes Notices off the wire, 15 bytes from where the cursor stands */
inline decode_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_record) {
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 2 -> cancellation_of_all_quotes_notices_record.group[cancellation_of_all_quotes_notices_at] = wire[at]; at = at + 1; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 4 -> cancellation_of_all_quotes_notices_record.instrument_optional[cancellation_of_all_quotes_notices_at] = wire[at]; at = at + 1; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 8 -> cancellation_of_all_quotes_notices_record.trader_id[cancellation_of_all_quotes_notices_at] = wire[at]; at = at + 1; cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_record.quote_cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Cancellation Of All Quotes Notices is what was written, byte for byte */
inline equal_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_read, cancellation_of_all_quotes_notices_written) {
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 2 -> assert(cancellation_of_all_quotes_notices_read.group[cancellation_of_all_quotes_notices_at] == cancellation_of_all_quotes_notices_written.group[cancellation_of_all_quotes_notices_at]); cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 4 -> assert(cancellation_of_all_quotes_notices_read.instrument_optional[cancellation_of_all_quotes_notices_at] == cancellation_of_all_quotes_notices_written.instrument_optional[cancellation_of_all_quotes_notices_at]); cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notices_at = 0;
  do
  :: cancellation_of_all_quotes_notices_at < 8 -> assert(cancellation_of_all_quotes_notices_read.trader_id[cancellation_of_all_quotes_notices_at] == cancellation_of_all_quotes_notices_written.trader_id[cancellation_of_all_quotes_notices_at]); cancellation_of_all_quotes_notices_at = cancellation_of_all_quotes_notices_at + 1
  :: else -> break
  od;
  assert(cancellation_of_all_quotes_notices_read.quote_cancel_reason == cancellation_of_all_quotes_notices_written.quote_cancel_reason);
  skip
}

/* ---- Quality Market Maker Notification: 65 bytes ----------------------------- */

typedef QualityMarketMakerNotification {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte auction_i_d_optional[6];
  byte verb;
  byte auction_quantity[8];
  byte auction_price[10];
  byte quote_quantity[8];
  byte quote_price[10];
  byte qualified_quantity[8]
};

int quality_market_maker_notification_at;

/* every byte of Quality Market Maker Notification set to one value */
inline fill_quality_market_maker_notification(quality_market_maker_notification_record, quality_market_maker_notification_value) {
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 2 -> quality_market_maker_notification_record.group[quality_market_maker_notification_at] = quality_market_maker_notification_value; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 4 -> quality_market_maker_notification_record.instrument_optional[quality_market_maker_notification_at] = quality_market_maker_notification_value; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.trader_id[quality_market_maker_notification_at] = quality_market_maker_notification_value; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 6 -> quality_market_maker_notification_record.auction_i_d_optional[quality_market_maker_notification_at] = quality_market_maker_notification_value; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_record.verb = quality_market_maker_notification_value;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.auction_quantity[quality_market_maker_notification_at] = quality_market_maker_notification_value; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 10 -> quality_market_maker_notification_record.auction_price[quality_market_maker_notification_at] = quality_market_maker_notification_value; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.quote_quantity[quality_market_maker_notification_at] = quality_market_maker_notification_value; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 10 -> quality_market_maker_notification_record.quote_price[quality_market_maker_notification_at] = quality_market_maker_notification_value; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.qualified_quantity[quality_market_maker_notification_at] = quality_market_maker_notification_value; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quality Market Maker Notification set to where it lies, so a field read out of place says so */
inline ramp_quality_market_maker_notification(quality_market_maker_notification_record, quality_market_maker_notification_base) {
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 2 -> quality_market_maker_notification_record.group[quality_market_maker_notification_at] = (quality_market_maker_notification_base + 0 + quality_market_maker_notification_at + 1) % 256; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 4 -> quality_market_maker_notification_record.instrument_optional[quality_market_maker_notification_at] = (quality_market_maker_notification_base + 2 + quality_market_maker_notification_at + 1) % 256; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.trader_id[quality_market_maker_notification_at] = (quality_market_maker_notification_base + 6 + quality_market_maker_notification_at + 1) % 256; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 6 -> quality_market_maker_notification_record.auction_i_d_optional[quality_market_maker_notification_at] = (quality_market_maker_notification_base + 14 + quality_market_maker_notification_at + 1) % 256; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_record.verb = (quality_market_maker_notification_base + 20 + 1) % 256;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.auction_quantity[quality_market_maker_notification_at] = (quality_market_maker_notification_base + 21 + quality_market_maker_notification_at + 1) % 256; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 10 -> quality_market_maker_notification_record.auction_price[quality_market_maker_notification_at] = (quality_market_maker_notification_base + 29 + quality_market_maker_notification_at + 1) % 256; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.quote_quantity[quality_market_maker_notification_at] = (quality_market_maker_notification_base + 39 + quality_market_maker_notification_at + 1) % 256; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 10 -> quality_market_maker_notification_record.quote_price[quality_market_maker_notification_at] = (quality_market_maker_notification_base + 47 + quality_market_maker_notification_at + 1) % 256; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.qualified_quantity[quality_market_maker_notification_at] = (quality_market_maker_notification_base + 57 + quality_market_maker_notification_at + 1) % 256; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Quality Market Maker Notification to the wire, 65 bytes from where the cursor stands */
inline encode_quality_market_maker_notification(quality_market_maker_notification_record) {
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 2 -> wire[at] = quality_market_maker_notification_record.group[quality_market_maker_notification_at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 4 -> wire[at] = quality_market_maker_notification_record.instrument_optional[quality_market_maker_notification_at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> wire[at] = quality_market_maker_notification_record.trader_id[quality_market_maker_notification_at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 6 -> wire[at] = quality_market_maker_notification_record.auction_i_d_optional[quality_market_maker_notification_at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  wire[at] = quality_market_maker_notification_record.verb; at = at + 1;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> wire[at] = quality_market_maker_notification_record.auction_quantity[quality_market_maker_notification_at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 10 -> wire[at] = quality_market_maker_notification_record.auction_price[quality_market_maker_notification_at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> wire[at] = quality_market_maker_notification_record.quote_quantity[quality_market_maker_notification_at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 10 -> wire[at] = quality_market_maker_notification_record.quote_price[quality_market_maker_notification_at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> wire[at] = quality_market_maker_notification_record.qualified_quantity[quality_market_maker_notification_at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  skip
}

/* Quality Market Maker Notification off the wire, 65 bytes from where the cursor stands */
inline decode_quality_market_maker_notification(quality_market_maker_notification_record) {
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 2 -> quality_market_maker_notification_record.group[quality_market_maker_notification_at] = wire[at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 4 -> quality_market_maker_notification_record.instrument_optional[quality_market_maker_notification_at] = wire[at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.trader_id[quality_market_maker_notification_at] = wire[at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 6 -> quality_market_maker_notification_record.auction_i_d_optional[quality_market_maker_notification_at] = wire[at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_record.verb = wire[at]; at = at + 1;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.auction_quantity[quality_market_maker_notification_at] = wire[at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 10 -> quality_market_maker_notification_record.auction_price[quality_market_maker_notification_at] = wire[at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.quote_quantity[quality_market_maker_notification_at] = wire[at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 10 -> quality_market_maker_notification_record.quote_price[quality_market_maker_notification_at] = wire[at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> quality_market_maker_notification_record.qualified_quantity[quality_market_maker_notification_at] = wire[at]; at = at + 1; quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quality Market Maker Notification is what was written, byte for byte */
inline equal_quality_market_maker_notification(quality_market_maker_notification_read, quality_market_maker_notification_written) {
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 2 -> assert(quality_market_maker_notification_read.group[quality_market_maker_notification_at] == quality_market_maker_notification_written.group[quality_market_maker_notification_at]); quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 4 -> assert(quality_market_maker_notification_read.instrument_optional[quality_market_maker_notification_at] == quality_market_maker_notification_written.instrument_optional[quality_market_maker_notification_at]); quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> assert(quality_market_maker_notification_read.trader_id[quality_market_maker_notification_at] == quality_market_maker_notification_written.trader_id[quality_market_maker_notification_at]); quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 6 -> assert(quality_market_maker_notification_read.auction_i_d_optional[quality_market_maker_notification_at] == quality_market_maker_notification_written.auction_i_d_optional[quality_market_maker_notification_at]); quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  assert(quality_market_maker_notification_read.verb == quality_market_maker_notification_written.verb);
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> assert(quality_market_maker_notification_read.auction_quantity[quality_market_maker_notification_at] == quality_market_maker_notification_written.auction_quantity[quality_market_maker_notification_at]); quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 10 -> assert(quality_market_maker_notification_read.auction_price[quality_market_maker_notification_at] == quality_market_maker_notification_written.auction_price[quality_market_maker_notification_at]); quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> assert(quality_market_maker_notification_read.quote_quantity[quality_market_maker_notification_at] == quality_market_maker_notification_written.quote_quantity[quality_market_maker_notification_at]); quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 10 -> assert(quality_market_maker_notification_read.quote_price[quality_market_maker_notification_at] == quality_market_maker_notification_written.quote_price[quality_market_maker_notification_at]); quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  quality_market_maker_notification_at = 0;
  do
  :: quality_market_maker_notification_at < 8 -> assert(quality_market_maker_notification_read.qualified_quantity[quality_market_maker_notification_at] == quality_market_maker_notification_written.qualified_quantity[quality_market_maker_notification_at]); quality_market_maker_notification_at = quality_market_maker_notification_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Notice: 240 bytes --------------------------------------------- */

typedef ExecutionNotice {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte reference_id[8];
  byte verb_side;
  byte quantity_traded[8];
  byte trade_price[10];
  byte time_of_the_trade_hhmmss[6];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte special_trade_indicator;
  byte price_type;
  byte trade_type;
  byte auction_i_d_optional[6];
  byte trade_number[8];
  byte trade_memo[50];
  byte original_reference_id[8];
  byte id_code_for_the_counterpart_participant[4];
  byte liquidity_status;
  byte counterpart_account_type;
  byte additional_client_memo[16];
  byte reserved_1;
  byte reserved_4[4]
};

int execution_notice_at;

/* every byte of Execution Notice set to one value */
inline fill_execution_notice(execution_notice_record, execution_notice_value) {
  execution_notice_at = 0;
  do
  :: execution_notice_at < 2 -> execution_notice_record.group[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.instrument_optional[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.trader_id[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.reference_id[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_record.verb_side = execution_notice_value;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.quantity_traded[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 10 -> execution_notice_record.trade_price[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> execution_notice_record.time_of_the_trade_hhmmss[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  fill_clearing_data(execution_notice_record.clearing_data, execution_notice_value);
  fill_owner_data(execution_notice_record.owner_data, execution_notice_value);
  execution_notice_record.special_trade_indicator = execution_notice_value;
  execution_notice_record.price_type = execution_notice_value;
  execution_notice_record.trade_type = execution_notice_value;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> execution_notice_record.auction_i_d_optional[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.trade_number[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 50 -> execution_notice_record.trade_memo[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.original_reference_id[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.id_code_for_the_counterpart_participant[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_record.liquidity_status = execution_notice_value;
  execution_notice_record.counterpart_account_type = execution_notice_value;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 16 -> execution_notice_record.additional_client_memo[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_record.reserved_1 = execution_notice_value;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.reserved_4[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Notice set to where it lies, so a field read out of place says so */
inline ramp_execution_notice(execution_notice_record, execution_notice_base) {
  execution_notice_at = 0;
  do
  :: execution_notice_at < 2 -> execution_notice_record.group[execution_notice_at] = (execution_notice_base + 0 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.instrument_optional[execution_notice_at] = (execution_notice_base + 2 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.trader_id[execution_notice_at] = (execution_notice_base + 6 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.reference_id[execution_notice_at] = (execution_notice_base + 14 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_record.verb_side = (execution_notice_base + 22 + 1) % 256;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.quantity_traded[execution_notice_at] = (execution_notice_base + 23 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 10 -> execution_notice_record.trade_price[execution_notice_at] = (execution_notice_base + 31 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> execution_notice_record.time_of_the_trade_hhmmss[execution_notice_at] = (execution_notice_base + 41 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  ramp_clearing_data(execution_notice_record.clearing_data, execution_notice_base + 47);
  ramp_owner_data(execution_notice_record.owner_data, execution_notice_base + 67);
  execution_notice_record.special_trade_indicator = (execution_notice_base + 138 + 1) % 256;
  execution_notice_record.price_type = (execution_notice_base + 139 + 1) % 256;
  execution_notice_record.trade_type = (execution_notice_base + 140 + 1) % 256;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> execution_notice_record.auction_i_d_optional[execution_notice_at] = (execution_notice_base + 141 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.trade_number[execution_notice_at] = (execution_notice_base + 147 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 50 -> execution_notice_record.trade_memo[execution_notice_at] = (execution_notice_base + 155 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.original_reference_id[execution_notice_at] = (execution_notice_base + 205 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.id_code_for_the_counterpart_participant[execution_notice_at] = (execution_notice_base + 213 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_record.liquidity_status = (execution_notice_base + 217 + 1) % 256;
  execution_notice_record.counterpart_account_type = (execution_notice_base + 218 + 1) % 256;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 16 -> execution_notice_record.additional_client_memo[execution_notice_at] = (execution_notice_base + 219 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_record.reserved_1 = (execution_notice_base + 235 + 1) % 256;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.reserved_4[execution_notice_at] = (execution_notice_base + 236 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Notice to the wire, 240 bytes from where the cursor stands */
inline encode_execution_notice(execution_notice_record) {
  execution_notice_at = 0;
  do
  :: execution_notice_at < 2 -> wire[at] = execution_notice_record.group[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> wire[at] = execution_notice_record.instrument_optional[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> wire[at] = execution_notice_record.trader_id[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> wire[at] = execution_notice_record.reference_id[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  wire[at] = execution_notice_record.verb_side; at = at + 1;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> wire[at] = execution_notice_record.quantity_traded[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 10 -> wire[at] = execution_notice_record.trade_price[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> wire[at] = execution_notice_record.time_of_the_trade_hhmmss[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  encode_clearing_data(execution_notice_record.clearing_data);
  encode_owner_data(execution_notice_record.owner_data);
  wire[at] = execution_notice_record.special_trade_indicator; at = at + 1;
  wire[at] = execution_notice_record.price_type; at = at + 1;
  wire[at] = execution_notice_record.trade_type; at = at + 1;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> wire[at] = execution_notice_record.auction_i_d_optional[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> wire[at] = execution_notice_record.trade_number[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 50 -> wire[at] = execution_notice_record.trade_memo[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> wire[at] = execution_notice_record.original_reference_id[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> wire[at] = execution_notice_record.id_code_for_the_counterpart_participant[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  wire[at] = execution_notice_record.liquidity_status; at = at + 1;
  wire[at] = execution_notice_record.counterpart_account_type; at = at + 1;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 16 -> wire[at] = execution_notice_record.additional_client_memo[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  wire[at] = execution_notice_record.reserved_1; at = at + 1;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> wire[at] = execution_notice_record.reserved_4[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Notice off the wire, 240 bytes from where the cursor stands */
inline decode_execution_notice(execution_notice_record) {
  execution_notice_at = 0;
  do
  :: execution_notice_at < 2 -> execution_notice_record.group[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.instrument_optional[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.trader_id[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.reference_id[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_record.verb_side = wire[at]; at = at + 1;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.quantity_traded[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 10 -> execution_notice_record.trade_price[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> execution_notice_record.time_of_the_trade_hhmmss[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  decode_clearing_data(execution_notice_record.clearing_data);
  decode_owner_data(execution_notice_record.owner_data);
  execution_notice_record.special_trade_indicator = wire[at]; at = at + 1;
  execution_notice_record.price_type = wire[at]; at = at + 1;
  execution_notice_record.trade_type = wire[at]; at = at + 1;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> execution_notice_record.auction_i_d_optional[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.trade_number[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 50 -> execution_notice_record.trade_memo[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.original_reference_id[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.id_code_for_the_counterpart_participant[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_record.liquidity_status = wire[at]; at = at + 1;
  execution_notice_record.counterpart_account_type = wire[at]; at = at + 1;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 16 -> execution_notice_record.additional_client_memo[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_record.reserved_1 = wire[at]; at = at + 1;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.reserved_4[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Notice is what was written, byte for byte */
inline equal_execution_notice(execution_notice_read, execution_notice_written) {
  execution_notice_at = 0;
  do
  :: execution_notice_at < 2 -> assert(execution_notice_read.group[execution_notice_at] == execution_notice_written.group[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> assert(execution_notice_read.instrument_optional[execution_notice_at] == execution_notice_written.instrument_optional[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> assert(execution_notice_read.trader_id[execution_notice_at] == execution_notice_written.trader_id[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> assert(execution_notice_read.reference_id[execution_notice_at] == execution_notice_written.reference_id[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  assert(execution_notice_read.verb_side == execution_notice_written.verb_side);
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> assert(execution_notice_read.quantity_traded[execution_notice_at] == execution_notice_written.quantity_traded[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 10 -> assert(execution_notice_read.trade_price[execution_notice_at] == execution_notice_written.trade_price[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> assert(execution_notice_read.time_of_the_trade_hhmmss[execution_notice_at] == execution_notice_written.time_of_the_trade_hhmmss[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  equal_clearing_data(execution_notice_read.clearing_data, execution_notice_written.clearing_data);
  equal_owner_data(execution_notice_read.owner_data, execution_notice_written.owner_data);
  assert(execution_notice_read.special_trade_indicator == execution_notice_written.special_trade_indicator);
  assert(execution_notice_read.price_type == execution_notice_written.price_type);
  assert(execution_notice_read.trade_type == execution_notice_written.trade_type);
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> assert(execution_notice_read.auction_i_d_optional[execution_notice_at] == execution_notice_written.auction_i_d_optional[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> assert(execution_notice_read.trade_number[execution_notice_at] == execution_notice_written.trade_number[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 50 -> assert(execution_notice_read.trade_memo[execution_notice_at] == execution_notice_written.trade_memo[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> assert(execution_notice_read.original_reference_id[execution_notice_at] == execution_notice_written.original_reference_id[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> assert(execution_notice_read.id_code_for_the_counterpart_participant[execution_notice_at] == execution_notice_written.id_code_for_the_counterpart_participant[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  assert(execution_notice_read.liquidity_status == execution_notice_written.liquidity_status);
  assert(execution_notice_read.counterpart_account_type == execution_notice_written.counterpart_account_type);
  execution_notice_at = 0;
  do
  :: execution_notice_at < 16 -> assert(execution_notice_read.additional_client_memo[execution_notice_at] == execution_notice_written.additional_client_memo[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  assert(execution_notice_read.reserved_1 == execution_notice_written.reserved_1);
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> assert(execution_notice_read.reserved_4[execution_notice_at] == execution_notice_written.reserved_4[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Notice: 75 bytes -------------------------------------------------- */

typedef QuoteNotice {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte reference_id_quote[8];
  byte verb_side;
  byte order_type;
  byte action;
  byte new_quantity[8];
  byte new_price[10];
  byte previous_quantity[8];
  byte previous_price[10];
  byte auction_i_d_optional[6];
  byte original_reference_id_quote_or_order_id[8]
};

int quote_notice_at;

/* every byte of Quote Notice set to one value */
inline fill_quote_notice(quote_notice_record, quote_notice_value) {
  quote_notice_at = 0;
  do
  :: quote_notice_at < 2 -> quote_notice_record.group[quote_notice_at] = quote_notice_value; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 4 -> quote_notice_record.instrument_optional[quote_notice_at] = quote_notice_value; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.trader_id[quote_notice_at] = quote_notice_value; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.reference_id_quote[quote_notice_at] = quote_notice_value; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_record.verb_side = quote_notice_value;
  quote_notice_record.order_type = quote_notice_value;
  quote_notice_record.action = quote_notice_value;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.new_quantity[quote_notice_at] = quote_notice_value; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 10 -> quote_notice_record.new_price[quote_notice_at] = quote_notice_value; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.previous_quantity[quote_notice_at] = quote_notice_value; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 10 -> quote_notice_record.previous_price[quote_notice_at] = quote_notice_value; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 6 -> quote_notice_record.auction_i_d_optional[quote_notice_at] = quote_notice_value; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.original_reference_id_quote_or_order_id[quote_notice_at] = quote_notice_value; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Notice set to where it lies, so a field read out of place says so */
inline ramp_quote_notice(quote_notice_record, quote_notice_base) {
  quote_notice_at = 0;
  do
  :: quote_notice_at < 2 -> quote_notice_record.group[quote_notice_at] = (quote_notice_base + 0 + quote_notice_at + 1) % 256; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 4 -> quote_notice_record.instrument_optional[quote_notice_at] = (quote_notice_base + 2 + quote_notice_at + 1) % 256; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.trader_id[quote_notice_at] = (quote_notice_base + 6 + quote_notice_at + 1) % 256; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.reference_id_quote[quote_notice_at] = (quote_notice_base + 14 + quote_notice_at + 1) % 256; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_record.verb_side = (quote_notice_base + 22 + 1) % 256;
  quote_notice_record.order_type = (quote_notice_base + 23 + 1) % 256;
  quote_notice_record.action = (quote_notice_base + 24 + 1) % 256;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.new_quantity[quote_notice_at] = (quote_notice_base + 25 + quote_notice_at + 1) % 256; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 10 -> quote_notice_record.new_price[quote_notice_at] = (quote_notice_base + 33 + quote_notice_at + 1) % 256; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.previous_quantity[quote_notice_at] = (quote_notice_base + 43 + quote_notice_at + 1) % 256; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 10 -> quote_notice_record.previous_price[quote_notice_at] = (quote_notice_base + 51 + quote_notice_at + 1) % 256; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 6 -> quote_notice_record.auction_i_d_optional[quote_notice_at] = (quote_notice_base + 61 + quote_notice_at + 1) % 256; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.original_reference_id_quote_or_order_id[quote_notice_at] = (quote_notice_base + 67 + quote_notice_at + 1) % 256; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Notice to the wire, 75 bytes from where the cursor stands */
inline encode_quote_notice(quote_notice_record) {
  quote_notice_at = 0;
  do
  :: quote_notice_at < 2 -> wire[at] = quote_notice_record.group[quote_notice_at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 4 -> wire[at] = quote_notice_record.instrument_optional[quote_notice_at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> wire[at] = quote_notice_record.trader_id[quote_notice_at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> wire[at] = quote_notice_record.reference_id_quote[quote_notice_at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  wire[at] = quote_notice_record.verb_side; at = at + 1;
  wire[at] = quote_notice_record.order_type; at = at + 1;
  wire[at] = quote_notice_record.action; at = at + 1;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> wire[at] = quote_notice_record.new_quantity[quote_notice_at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 10 -> wire[at] = quote_notice_record.new_price[quote_notice_at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> wire[at] = quote_notice_record.previous_quantity[quote_notice_at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 10 -> wire[at] = quote_notice_record.previous_price[quote_notice_at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 6 -> wire[at] = quote_notice_record.auction_i_d_optional[quote_notice_at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> wire[at] = quote_notice_record.original_reference_id_quote_or_order_id[quote_notice_at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Notice off the wire, 75 bytes from where the cursor stands */
inline decode_quote_notice(quote_notice_record) {
  quote_notice_at = 0;
  do
  :: quote_notice_at < 2 -> quote_notice_record.group[quote_notice_at] = wire[at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 4 -> quote_notice_record.instrument_optional[quote_notice_at] = wire[at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.trader_id[quote_notice_at] = wire[at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.reference_id_quote[quote_notice_at] = wire[at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_record.verb_side = wire[at]; at = at + 1;
  quote_notice_record.order_type = wire[at]; at = at + 1;
  quote_notice_record.action = wire[at]; at = at + 1;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.new_quantity[quote_notice_at] = wire[at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 10 -> quote_notice_record.new_price[quote_notice_at] = wire[at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.previous_quantity[quote_notice_at] = wire[at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 10 -> quote_notice_record.previous_price[quote_notice_at] = wire[at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 6 -> quote_notice_record.auction_i_d_optional[quote_notice_at] = wire[at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> quote_notice_record.original_reference_id_quote_or_order_id[quote_notice_at] = wire[at]; at = at + 1; quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Notice is what was written, byte for byte */
inline equal_quote_notice(quote_notice_read, quote_notice_written) {
  quote_notice_at = 0;
  do
  :: quote_notice_at < 2 -> assert(quote_notice_read.group[quote_notice_at] == quote_notice_written.group[quote_notice_at]); quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 4 -> assert(quote_notice_read.instrument_optional[quote_notice_at] == quote_notice_written.instrument_optional[quote_notice_at]); quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> assert(quote_notice_read.trader_id[quote_notice_at] == quote_notice_written.trader_id[quote_notice_at]); quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> assert(quote_notice_read.reference_id_quote[quote_notice_at] == quote_notice_written.reference_id_quote[quote_notice_at]); quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  assert(quote_notice_read.verb_side == quote_notice_written.verb_side);
  assert(quote_notice_read.order_type == quote_notice_written.order_type);
  assert(quote_notice_read.action == quote_notice_written.action);
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> assert(quote_notice_read.new_quantity[quote_notice_at] == quote_notice_written.new_quantity[quote_notice_at]); quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 10 -> assert(quote_notice_read.new_price[quote_notice_at] == quote_notice_written.new_price[quote_notice_at]); quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> assert(quote_notice_read.previous_quantity[quote_notice_at] == quote_notice_written.previous_quantity[quote_notice_at]); quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 10 -> assert(quote_notice_read.previous_price[quote_notice_at] == quote_notice_written.previous_price[quote_notice_at]); quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 6 -> assert(quote_notice_read.auction_i_d_optional[quote_notice_at] == quote_notice_written.auction_i_d_optional[quote_notice_at]); quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  quote_notice_at = 0;
  do
  :: quote_notice_at < 8 -> assert(quote_notice_read.original_reference_id_quote_or_order_id[quote_notice_at] == quote_notice_written.original_reference_id_quote_or_order_id[quote_notice_at]); quote_notice_at = quote_notice_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Execution Cancellation Notice: 240 bytes -------------------------------- */

/* Stated by the guide as having the same number of bytes and format as NT, whose fields are written out here. */
typedef ExecutionCancellationNotice {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte reference_id[8];
  byte verb_side;
  byte quantity_traded[8];
  byte trade_price[10];
  byte time_of_the_trade_hhmmss[6];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte special_trade_indicator;
  byte price_type;
  byte trade_type;
  byte auction_i_d_optional[6];
  byte trade_number[8];
  byte trade_memo[50];
  byte original_reference_id[8];
  byte id_code_for_the_counterpart_participant[4];
  byte liquidity_status;
  byte counterpart_account_type;
  byte additional_client_memo[16];
  byte reserved_1;
  byte reserved_4[4]
};

int execution_cancellation_notice_at;

/* every byte of Execution Cancellation Notice set to one value */
inline fill_execution_cancellation_notice(execution_cancellation_notice_record, execution_cancellation_notice_value) {
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 2 -> execution_cancellation_notice_record.group[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.instrument_optional[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.trader_id[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.reference_id[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_record.verb_side = execution_cancellation_notice_value;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.quantity_traded[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 10 -> execution_cancellation_notice_record.trade_price[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.time_of_the_trade_hhmmss[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  fill_clearing_data(execution_cancellation_notice_record.clearing_data, execution_cancellation_notice_value);
  fill_owner_data(execution_cancellation_notice_record.owner_data, execution_cancellation_notice_value);
  execution_cancellation_notice_record.special_trade_indicator = execution_cancellation_notice_value;
  execution_cancellation_notice_record.price_type = execution_cancellation_notice_value;
  execution_cancellation_notice_record.trade_type = execution_cancellation_notice_value;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.auction_i_d_optional[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.trade_number[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 50 -> execution_cancellation_notice_record.trade_memo[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.original_reference_id[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.id_code_for_the_counterpart_participant[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_record.liquidity_status = execution_cancellation_notice_value;
  execution_cancellation_notice_record.counterpart_account_type = execution_cancellation_notice_value;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 16 -> execution_cancellation_notice_record.additional_client_memo[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_record.reserved_1 = execution_cancellation_notice_value;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.reserved_4[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Cancellation Notice set to where it lies, so a field read out of place says so */
inline ramp_execution_cancellation_notice(execution_cancellation_notice_record, execution_cancellation_notice_base) {
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 2 -> execution_cancellation_notice_record.group[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 0 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.instrument_optional[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 2 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.trader_id[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 6 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.reference_id[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 14 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_record.verb_side = (execution_cancellation_notice_base + 22 + 1) % 256;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.quantity_traded[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 23 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 10 -> execution_cancellation_notice_record.trade_price[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 31 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.time_of_the_trade_hhmmss[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 41 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  ramp_clearing_data(execution_cancellation_notice_record.clearing_data, execution_cancellation_notice_base + 47);
  ramp_owner_data(execution_cancellation_notice_record.owner_data, execution_cancellation_notice_base + 67);
  execution_cancellation_notice_record.special_trade_indicator = (execution_cancellation_notice_base + 138 + 1) % 256;
  execution_cancellation_notice_record.price_type = (execution_cancellation_notice_base + 139 + 1) % 256;
  execution_cancellation_notice_record.trade_type = (execution_cancellation_notice_base + 140 + 1) % 256;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.auction_i_d_optional[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 141 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.trade_number[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 147 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 50 -> execution_cancellation_notice_record.trade_memo[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 155 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.original_reference_id[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 205 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.id_code_for_the_counterpart_participant[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 213 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_record.liquidity_status = (execution_cancellation_notice_base + 217 + 1) % 256;
  execution_cancellation_notice_record.counterpart_account_type = (execution_cancellation_notice_base + 218 + 1) % 256;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 16 -> execution_cancellation_notice_record.additional_client_memo[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 219 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_record.reserved_1 = (execution_cancellation_notice_base + 235 + 1) % 256;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.reserved_4[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 236 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Cancellation Notice to the wire, 240 bytes from where the cursor stands */
inline encode_execution_cancellation_notice(execution_cancellation_notice_record) {
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 2 -> wire[at] = execution_cancellation_notice_record.group[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> wire[at] = execution_cancellation_notice_record.instrument_optional[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> wire[at] = execution_cancellation_notice_record.trader_id[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> wire[at] = execution_cancellation_notice_record.reference_id[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  wire[at] = execution_cancellation_notice_record.verb_side; at = at + 1;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> wire[at] = execution_cancellation_notice_record.quantity_traded[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 10 -> wire[at] = execution_cancellation_notice_record.trade_price[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> wire[at] = execution_cancellation_notice_record.time_of_the_trade_hhmmss[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  encode_clearing_data(execution_cancellation_notice_record.clearing_data);
  encode_owner_data(execution_cancellation_notice_record.owner_data);
  wire[at] = execution_cancellation_notice_record.special_trade_indicator; at = at + 1;
  wire[at] = execution_cancellation_notice_record.price_type; at = at + 1;
  wire[at] = execution_cancellation_notice_record.trade_type; at = at + 1;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> wire[at] = execution_cancellation_notice_record.auction_i_d_optional[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> wire[at] = execution_cancellation_notice_record.trade_number[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 50 -> wire[at] = execution_cancellation_notice_record.trade_memo[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> wire[at] = execution_cancellation_notice_record.original_reference_id[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> wire[at] = execution_cancellation_notice_record.id_code_for_the_counterpart_participant[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  wire[at] = execution_cancellation_notice_record.liquidity_status; at = at + 1;
  wire[at] = execution_cancellation_notice_record.counterpart_account_type; at = at + 1;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 16 -> wire[at] = execution_cancellation_notice_record.additional_client_memo[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  wire[at] = execution_cancellation_notice_record.reserved_1; at = at + 1;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> wire[at] = execution_cancellation_notice_record.reserved_4[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Cancellation Notice off the wire, 240 bytes from where the cursor stands */
inline decode_execution_cancellation_notice(execution_cancellation_notice_record) {
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 2 -> execution_cancellation_notice_record.group[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.instrument_optional[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.trader_id[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.reference_id[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_record.verb_side = wire[at]; at = at + 1;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.quantity_traded[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 10 -> execution_cancellation_notice_record.trade_price[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.time_of_the_trade_hhmmss[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  decode_clearing_data(execution_cancellation_notice_record.clearing_data);
  decode_owner_data(execution_cancellation_notice_record.owner_data);
  execution_cancellation_notice_record.special_trade_indicator = wire[at]; at = at + 1;
  execution_cancellation_notice_record.price_type = wire[at]; at = at + 1;
  execution_cancellation_notice_record.trade_type = wire[at]; at = at + 1;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.auction_i_d_optional[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.trade_number[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 50 -> execution_cancellation_notice_record.trade_memo[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.original_reference_id[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.id_code_for_the_counterpart_participant[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_record.liquidity_status = wire[at]; at = at + 1;
  execution_cancellation_notice_record.counterpart_account_type = wire[at]; at = at + 1;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 16 -> execution_cancellation_notice_record.additional_client_memo[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_record.reserved_1 = wire[at]; at = at + 1;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.reserved_4[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Cancellation Notice is what was written, byte for byte */
inline equal_execution_cancellation_notice(execution_cancellation_notice_read, execution_cancellation_notice_written) {
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 2 -> assert(execution_cancellation_notice_read.group[execution_cancellation_notice_at] == execution_cancellation_notice_written.group[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> assert(execution_cancellation_notice_read.instrument_optional[execution_cancellation_notice_at] == execution_cancellation_notice_written.instrument_optional[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> assert(execution_cancellation_notice_read.trader_id[execution_cancellation_notice_at] == execution_cancellation_notice_written.trader_id[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> assert(execution_cancellation_notice_read.reference_id[execution_cancellation_notice_at] == execution_cancellation_notice_written.reference_id[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  assert(execution_cancellation_notice_read.verb_side == execution_cancellation_notice_written.verb_side);
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> assert(execution_cancellation_notice_read.quantity_traded[execution_cancellation_notice_at] == execution_cancellation_notice_written.quantity_traded[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 10 -> assert(execution_cancellation_notice_read.trade_price[execution_cancellation_notice_at] == execution_cancellation_notice_written.trade_price[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> assert(execution_cancellation_notice_read.time_of_the_trade_hhmmss[execution_cancellation_notice_at] == execution_cancellation_notice_written.time_of_the_trade_hhmmss[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  equal_clearing_data(execution_cancellation_notice_read.clearing_data, execution_cancellation_notice_written.clearing_data);
  equal_owner_data(execution_cancellation_notice_read.owner_data, execution_cancellation_notice_written.owner_data);
  assert(execution_cancellation_notice_read.special_trade_indicator == execution_cancellation_notice_written.special_trade_indicator);
  assert(execution_cancellation_notice_read.price_type == execution_cancellation_notice_written.price_type);
  assert(execution_cancellation_notice_read.trade_type == execution_cancellation_notice_written.trade_type);
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> assert(execution_cancellation_notice_read.auction_i_d_optional[execution_cancellation_notice_at] == execution_cancellation_notice_written.auction_i_d_optional[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> assert(execution_cancellation_notice_read.trade_number[execution_cancellation_notice_at] == execution_cancellation_notice_written.trade_number[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 50 -> assert(execution_cancellation_notice_read.trade_memo[execution_cancellation_notice_at] == execution_cancellation_notice_written.trade_memo[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> assert(execution_cancellation_notice_read.original_reference_id[execution_cancellation_notice_at] == execution_cancellation_notice_written.original_reference_id[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> assert(execution_cancellation_notice_read.id_code_for_the_counterpart_participant[execution_cancellation_notice_at] == execution_cancellation_notice_written.id_code_for_the_counterpart_participant[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  assert(execution_cancellation_notice_read.liquidity_status == execution_cancellation_notice_written.liquidity_status);
  assert(execution_cancellation_notice_read.counterpart_account_type == execution_cancellation_notice_written.counterpart_account_type);
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 16 -> assert(execution_cancellation_notice_read.additional_client_memo[execution_cancellation_notice_at] == execution_cancellation_notice_written.additional_client_memo[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  assert(execution_cancellation_notice_read.reserved_1 == execution_cancellation_notice_written.reserved_1);
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> assert(execution_cancellation_notice_read.reserved_4[execution_cancellation_notice_at] == execution_cancellation_notice_written.reserved_4[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Leg Execution Cancellation Notice: 257 bytes ---------------------------- */

/* Stated by the guide as having the same number of bytes and format as NL, whose fields are written out here. */
typedef LegExecutionCancellationNotice {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte reference_id[8];
  byte verb_side;
  byte quantity_traded[8];
  byte trade_price[10];
  byte time_trade_hhmmss[6];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte special_trade_indicator;
  byte price_type;
  byte trade_type;
  byte auction_i_d_optional[6];
  byte trade_number[8];
  byte trade_memo[50];
  byte original_reference_id[8];
  byte id_code_for_the_counterpart_participant[4];
  byte liquidity_status;
  byte strategy_group[2];
  byte strategy_instrument_id[4];
  byte strategy_verb_side;
  byte strategy_trade_number[8];
  byte leg_number[2];
  byte counterpart_account_type;
  byte additional_client_memo[16];
  byte reserved_1;
  byte reserved_4[4]
};

int leg_execution_cancellation_notice_at;

/* every byte of Leg Execution Cancellation Notice set to one value */
inline fill_leg_execution_cancellation_notice(leg_execution_cancellation_notice_record, leg_execution_cancellation_notice_value) {
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.group[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.instrument_optional[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.trader_id[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.reference_id[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.verb_side = leg_execution_cancellation_notice_value;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.quantity_traded[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 10 -> leg_execution_cancellation_notice_record.trade_price[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.time_trade_hhmmss[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  fill_clearing_data(leg_execution_cancellation_notice_record.clearing_data, leg_execution_cancellation_notice_value);
  fill_owner_data(leg_execution_cancellation_notice_record.owner_data, leg_execution_cancellation_notice_value);
  leg_execution_cancellation_notice_record.special_trade_indicator = leg_execution_cancellation_notice_value;
  leg_execution_cancellation_notice_record.price_type = leg_execution_cancellation_notice_value;
  leg_execution_cancellation_notice_record.trade_type = leg_execution_cancellation_notice_value;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.auction_i_d_optional[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.trade_number[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 50 -> leg_execution_cancellation_notice_record.trade_memo[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.original_reference_id[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.id_code_for_the_counterpart_participant[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.liquidity_status = leg_execution_cancellation_notice_value;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.strategy_group[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.strategy_instrument_id[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.strategy_verb_side = leg_execution_cancellation_notice_value;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.strategy_trade_number[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.leg_number[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.counterpart_account_type = leg_execution_cancellation_notice_value;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 16 -> leg_execution_cancellation_notice_record.additional_client_memo[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.reserved_1 = leg_execution_cancellation_notice_value;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.reserved_4[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Leg Execution Cancellation Notice set to where it lies, so a field read out of place says so */
inline ramp_leg_execution_cancellation_notice(leg_execution_cancellation_notice_record, leg_execution_cancellation_notice_base) {
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.group[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 0 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.instrument_optional[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 2 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.trader_id[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 6 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.reference_id[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 14 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.verb_side = (leg_execution_cancellation_notice_base + 22 + 1) % 256;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.quantity_traded[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 23 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 10 -> leg_execution_cancellation_notice_record.trade_price[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 31 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.time_trade_hhmmss[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 41 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  ramp_clearing_data(leg_execution_cancellation_notice_record.clearing_data, leg_execution_cancellation_notice_base + 47);
  ramp_owner_data(leg_execution_cancellation_notice_record.owner_data, leg_execution_cancellation_notice_base + 67);
  leg_execution_cancellation_notice_record.special_trade_indicator = (leg_execution_cancellation_notice_base + 138 + 1) % 256;
  leg_execution_cancellation_notice_record.price_type = (leg_execution_cancellation_notice_base + 139 + 1) % 256;
  leg_execution_cancellation_notice_record.trade_type = (leg_execution_cancellation_notice_base + 140 + 1) % 256;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.auction_i_d_optional[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 141 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.trade_number[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 147 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 50 -> leg_execution_cancellation_notice_record.trade_memo[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 155 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.original_reference_id[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 205 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.id_code_for_the_counterpart_participant[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 213 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.liquidity_status = (leg_execution_cancellation_notice_base + 217 + 1) % 256;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.strategy_group[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 218 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.strategy_instrument_id[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 220 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.strategy_verb_side = (leg_execution_cancellation_notice_base + 224 + 1) % 256;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.strategy_trade_number[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 225 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.leg_number[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 233 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.counterpart_account_type = (leg_execution_cancellation_notice_base + 235 + 1) % 256;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 16 -> leg_execution_cancellation_notice_record.additional_client_memo[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 236 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.reserved_1 = (leg_execution_cancellation_notice_base + 252 + 1) % 256;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.reserved_4[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 253 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Leg Execution Cancellation Notice to the wire, 257 bytes from where the cursor stands */
inline encode_leg_execution_cancellation_notice(leg_execution_cancellation_notice_record) {
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> wire[at] = leg_execution_cancellation_notice_record.group[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> wire[at] = leg_execution_cancellation_notice_record.instrument_optional[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> wire[at] = leg_execution_cancellation_notice_record.trader_id[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> wire[at] = leg_execution_cancellation_notice_record.reference_id[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  wire[at] = leg_execution_cancellation_notice_record.verb_side; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> wire[at] = leg_execution_cancellation_notice_record.quantity_traded[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 10 -> wire[at] = leg_execution_cancellation_notice_record.trade_price[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> wire[at] = leg_execution_cancellation_notice_record.time_trade_hhmmss[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  encode_clearing_data(leg_execution_cancellation_notice_record.clearing_data);
  encode_owner_data(leg_execution_cancellation_notice_record.owner_data);
  wire[at] = leg_execution_cancellation_notice_record.special_trade_indicator; at = at + 1;
  wire[at] = leg_execution_cancellation_notice_record.price_type; at = at + 1;
  wire[at] = leg_execution_cancellation_notice_record.trade_type; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> wire[at] = leg_execution_cancellation_notice_record.auction_i_d_optional[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> wire[at] = leg_execution_cancellation_notice_record.trade_number[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 50 -> wire[at] = leg_execution_cancellation_notice_record.trade_memo[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> wire[at] = leg_execution_cancellation_notice_record.original_reference_id[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> wire[at] = leg_execution_cancellation_notice_record.id_code_for_the_counterpart_participant[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  wire[at] = leg_execution_cancellation_notice_record.liquidity_status; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> wire[at] = leg_execution_cancellation_notice_record.strategy_group[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> wire[at] = leg_execution_cancellation_notice_record.strategy_instrument_id[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  wire[at] = leg_execution_cancellation_notice_record.strategy_verb_side; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> wire[at] = leg_execution_cancellation_notice_record.strategy_trade_number[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> wire[at] = leg_execution_cancellation_notice_record.leg_number[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  wire[at] = leg_execution_cancellation_notice_record.counterpart_account_type; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 16 -> wire[at] = leg_execution_cancellation_notice_record.additional_client_memo[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  wire[at] = leg_execution_cancellation_notice_record.reserved_1; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> wire[at] = leg_execution_cancellation_notice_record.reserved_4[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Leg Execution Cancellation Notice off the wire, 257 bytes from where the cursor stands */
inline decode_leg_execution_cancellation_notice(leg_execution_cancellation_notice_record) {
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.group[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.instrument_optional[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.trader_id[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.reference_id[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.verb_side = wire[at]; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.quantity_traded[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 10 -> leg_execution_cancellation_notice_record.trade_price[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.time_trade_hhmmss[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  decode_clearing_data(leg_execution_cancellation_notice_record.clearing_data);
  decode_owner_data(leg_execution_cancellation_notice_record.owner_data);
  leg_execution_cancellation_notice_record.special_trade_indicator = wire[at]; at = at + 1;
  leg_execution_cancellation_notice_record.price_type = wire[at]; at = at + 1;
  leg_execution_cancellation_notice_record.trade_type = wire[at]; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.auction_i_d_optional[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.trade_number[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 50 -> leg_execution_cancellation_notice_record.trade_memo[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.original_reference_id[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.id_code_for_the_counterpart_participant[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.liquidity_status = wire[at]; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.strategy_group[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.strategy_instrument_id[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.strategy_verb_side = wire[at]; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.strategy_trade_number[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.leg_number[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.counterpart_account_type = wire[at]; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 16 -> leg_execution_cancellation_notice_record.additional_client_memo[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.reserved_1 = wire[at]; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.reserved_4[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Leg Execution Cancellation Notice is what was written, byte for byte */
inline equal_leg_execution_cancellation_notice(leg_execution_cancellation_notice_read, leg_execution_cancellation_notice_written) {
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> assert(leg_execution_cancellation_notice_read.group[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.group[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> assert(leg_execution_cancellation_notice_read.instrument_optional[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.instrument_optional[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> assert(leg_execution_cancellation_notice_read.trader_id[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.trader_id[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> assert(leg_execution_cancellation_notice_read.reference_id[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.reference_id[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  assert(leg_execution_cancellation_notice_read.verb_side == leg_execution_cancellation_notice_written.verb_side);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> assert(leg_execution_cancellation_notice_read.quantity_traded[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.quantity_traded[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 10 -> assert(leg_execution_cancellation_notice_read.trade_price[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.trade_price[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> assert(leg_execution_cancellation_notice_read.time_trade_hhmmss[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.time_trade_hhmmss[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  equal_clearing_data(leg_execution_cancellation_notice_read.clearing_data, leg_execution_cancellation_notice_written.clearing_data);
  equal_owner_data(leg_execution_cancellation_notice_read.owner_data, leg_execution_cancellation_notice_written.owner_data);
  assert(leg_execution_cancellation_notice_read.special_trade_indicator == leg_execution_cancellation_notice_written.special_trade_indicator);
  assert(leg_execution_cancellation_notice_read.price_type == leg_execution_cancellation_notice_written.price_type);
  assert(leg_execution_cancellation_notice_read.trade_type == leg_execution_cancellation_notice_written.trade_type);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> assert(leg_execution_cancellation_notice_read.auction_i_d_optional[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.auction_i_d_optional[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> assert(leg_execution_cancellation_notice_read.trade_number[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.trade_number[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 50 -> assert(leg_execution_cancellation_notice_read.trade_memo[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.trade_memo[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> assert(leg_execution_cancellation_notice_read.original_reference_id[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.original_reference_id[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> assert(leg_execution_cancellation_notice_read.id_code_for_the_counterpart_participant[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.id_code_for_the_counterpart_participant[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  assert(leg_execution_cancellation_notice_read.liquidity_status == leg_execution_cancellation_notice_written.liquidity_status);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> assert(leg_execution_cancellation_notice_read.strategy_group[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.strategy_group[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> assert(leg_execution_cancellation_notice_read.strategy_instrument_id[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.strategy_instrument_id[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  assert(leg_execution_cancellation_notice_read.strategy_verb_side == leg_execution_cancellation_notice_written.strategy_verb_side);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> assert(leg_execution_cancellation_notice_read.strategy_trade_number[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.strategy_trade_number[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> assert(leg_execution_cancellation_notice_read.leg_number[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.leg_number[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  assert(leg_execution_cancellation_notice_read.counterpart_account_type == leg_execution_cancellation_notice_written.counterpart_account_type);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 16 -> assert(leg_execution_cancellation_notice_read.additional_client_memo[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.additional_client_memo[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  assert(leg_execution_cancellation_notice_read.reserved_1 == leg_execution_cancellation_notice_written.reserved_1);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> assert(leg_execution_cancellation_notice_read.reserved_4[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.reserved_4[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancellation Notice By System: 167 bytes -------------------------- */

/* Stated by the guide as having the same number of bytes and format as KZ, whose fields are written out here. */
typedef OrderCancellationNoticeBySystem {
  byte group[2];
  byte instrument_optional[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte original_order_id[8];
  byte auction_i_d[6];
  byte additional_client_memo[16];
  byte reserved_4[4]
};

int order_cancellation_notice_by_system_at;

/* every byte of Order Cancellation Notice By System set to one value */
inline fill_order_cancellation_notice_by_system(order_cancellation_notice_by_system_record, order_cancellation_notice_by_system_value) {
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 2 -> order_cancellation_notice_by_system_record.group[order_cancellation_notice_by_system_at] = order_cancellation_notice_by_system_value; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 4 -> order_cancellation_notice_by_system_record.instrument_optional[order_cancellation_notice_by_system_at] = order_cancellation_notice_by_system_value; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.trader_id[order_cancellation_notice_by_system_at] = order_cancellation_notice_by_system_value; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.order_id[order_cancellation_notice_by_system_at] = order_cancellation_notice_by_system_value; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_record.status = order_cancellation_notice_by_system_value;
  order_cancellation_notice_by_system_record.verb_side = order_cancellation_notice_by_system_value;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.quantity[order_cancellation_notice_by_system_at] = order_cancellation_notice_by_system_value; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 10 -> order_cancellation_notice_by_system_record.assigned_price[order_cancellation_notice_by_system_at] = order_cancellation_notice_by_system_value; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  fill_clearing_data(order_cancellation_notice_by_system_record.clearing_data, order_cancellation_notice_by_system_value);
  fill_owner_data(order_cancellation_notice_by_system_record.owner_data, order_cancellation_notice_by_system_value);
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.original_order_id[order_cancellation_notice_by_system_at] = order_cancellation_notice_by_system_value; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 6 -> order_cancellation_notice_by_system_record.auction_i_d[order_cancellation_notice_by_system_at] = order_cancellation_notice_by_system_value; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 16 -> order_cancellation_notice_by_system_record.additional_client_memo[order_cancellation_notice_by_system_at] = order_cancellation_notice_by_system_value; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 4 -> order_cancellation_notice_by_system_record.reserved_4[order_cancellation_notice_by_system_at] = order_cancellation_notice_by_system_value; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancellation Notice By System set to where it lies, so a field read out of place says so */
inline ramp_order_cancellation_notice_by_system(order_cancellation_notice_by_system_record, order_cancellation_notice_by_system_base) {
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 2 -> order_cancellation_notice_by_system_record.group[order_cancellation_notice_by_system_at] = (order_cancellation_notice_by_system_base + 0 + order_cancellation_notice_by_system_at + 1) % 256; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 4 -> order_cancellation_notice_by_system_record.instrument_optional[order_cancellation_notice_by_system_at] = (order_cancellation_notice_by_system_base + 2 + order_cancellation_notice_by_system_at + 1) % 256; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.trader_id[order_cancellation_notice_by_system_at] = (order_cancellation_notice_by_system_base + 6 + order_cancellation_notice_by_system_at + 1) % 256; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.order_id[order_cancellation_notice_by_system_at] = (order_cancellation_notice_by_system_base + 14 + order_cancellation_notice_by_system_at + 1) % 256; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_record.status = (order_cancellation_notice_by_system_base + 22 + 1) % 256;
  order_cancellation_notice_by_system_record.verb_side = (order_cancellation_notice_by_system_base + 23 + 1) % 256;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.quantity[order_cancellation_notice_by_system_at] = (order_cancellation_notice_by_system_base + 24 + order_cancellation_notice_by_system_at + 1) % 256; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 10 -> order_cancellation_notice_by_system_record.assigned_price[order_cancellation_notice_by_system_at] = (order_cancellation_notice_by_system_base + 32 + order_cancellation_notice_by_system_at + 1) % 256; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  ramp_clearing_data(order_cancellation_notice_by_system_record.clearing_data, order_cancellation_notice_by_system_base + 42);
  ramp_owner_data(order_cancellation_notice_by_system_record.owner_data, order_cancellation_notice_by_system_base + 62);
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.original_order_id[order_cancellation_notice_by_system_at] = (order_cancellation_notice_by_system_base + 133 + order_cancellation_notice_by_system_at + 1) % 256; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 6 -> order_cancellation_notice_by_system_record.auction_i_d[order_cancellation_notice_by_system_at] = (order_cancellation_notice_by_system_base + 141 + order_cancellation_notice_by_system_at + 1) % 256; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 16 -> order_cancellation_notice_by_system_record.additional_client_memo[order_cancellation_notice_by_system_at] = (order_cancellation_notice_by_system_base + 147 + order_cancellation_notice_by_system_at + 1) % 256; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 4 -> order_cancellation_notice_by_system_record.reserved_4[order_cancellation_notice_by_system_at] = (order_cancellation_notice_by_system_base + 163 + order_cancellation_notice_by_system_at + 1) % 256; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Notice By System to the wire, 167 bytes from where the cursor stands */
inline encode_order_cancellation_notice_by_system(order_cancellation_notice_by_system_record) {
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 2 -> wire[at] = order_cancellation_notice_by_system_record.group[order_cancellation_notice_by_system_at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 4 -> wire[at] = order_cancellation_notice_by_system_record.instrument_optional[order_cancellation_notice_by_system_at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> wire[at] = order_cancellation_notice_by_system_record.trader_id[order_cancellation_notice_by_system_at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> wire[at] = order_cancellation_notice_by_system_record.order_id[order_cancellation_notice_by_system_at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  wire[at] = order_cancellation_notice_by_system_record.status; at = at + 1;
  wire[at] = order_cancellation_notice_by_system_record.verb_side; at = at + 1;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> wire[at] = order_cancellation_notice_by_system_record.quantity[order_cancellation_notice_by_system_at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 10 -> wire[at] = order_cancellation_notice_by_system_record.assigned_price[order_cancellation_notice_by_system_at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  encode_clearing_data(order_cancellation_notice_by_system_record.clearing_data);
  encode_owner_data(order_cancellation_notice_by_system_record.owner_data);
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> wire[at] = order_cancellation_notice_by_system_record.original_order_id[order_cancellation_notice_by_system_at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 6 -> wire[at] = order_cancellation_notice_by_system_record.auction_i_d[order_cancellation_notice_by_system_at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 16 -> wire[at] = order_cancellation_notice_by_system_record.additional_client_memo[order_cancellation_notice_by_system_at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 4 -> wire[at] = order_cancellation_notice_by_system_record.reserved_4[order_cancellation_notice_by_system_at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Notice By System off the wire, 167 bytes from where the cursor stands */
inline decode_order_cancellation_notice_by_system(order_cancellation_notice_by_system_record) {
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 2 -> order_cancellation_notice_by_system_record.group[order_cancellation_notice_by_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 4 -> order_cancellation_notice_by_system_record.instrument_optional[order_cancellation_notice_by_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.trader_id[order_cancellation_notice_by_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.order_id[order_cancellation_notice_by_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_record.status = wire[at]; at = at + 1;
  order_cancellation_notice_by_system_record.verb_side = wire[at]; at = at + 1;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.quantity[order_cancellation_notice_by_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 10 -> order_cancellation_notice_by_system_record.assigned_price[order_cancellation_notice_by_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  decode_clearing_data(order_cancellation_notice_by_system_record.clearing_data);
  decode_owner_data(order_cancellation_notice_by_system_record.owner_data);
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> order_cancellation_notice_by_system_record.original_order_id[order_cancellation_notice_by_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 6 -> order_cancellation_notice_by_system_record.auction_i_d[order_cancellation_notice_by_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 16 -> order_cancellation_notice_by_system_record.additional_client_memo[order_cancellation_notice_by_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 4 -> order_cancellation_notice_by_system_record.reserved_4[order_cancellation_notice_by_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancellation Notice By System is what was written, byte for byte */
inline equal_order_cancellation_notice_by_system(order_cancellation_notice_by_system_read, order_cancellation_notice_by_system_written) {
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 2 -> assert(order_cancellation_notice_by_system_read.group[order_cancellation_notice_by_system_at] == order_cancellation_notice_by_system_written.group[order_cancellation_notice_by_system_at]); order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 4 -> assert(order_cancellation_notice_by_system_read.instrument_optional[order_cancellation_notice_by_system_at] == order_cancellation_notice_by_system_written.instrument_optional[order_cancellation_notice_by_system_at]); order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> assert(order_cancellation_notice_by_system_read.trader_id[order_cancellation_notice_by_system_at] == order_cancellation_notice_by_system_written.trader_id[order_cancellation_notice_by_system_at]); order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> assert(order_cancellation_notice_by_system_read.order_id[order_cancellation_notice_by_system_at] == order_cancellation_notice_by_system_written.order_id[order_cancellation_notice_by_system_at]); order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  assert(order_cancellation_notice_by_system_read.status == order_cancellation_notice_by_system_written.status);
  assert(order_cancellation_notice_by_system_read.verb_side == order_cancellation_notice_by_system_written.verb_side);
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> assert(order_cancellation_notice_by_system_read.quantity[order_cancellation_notice_by_system_at] == order_cancellation_notice_by_system_written.quantity[order_cancellation_notice_by_system_at]); order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 10 -> assert(order_cancellation_notice_by_system_read.assigned_price[order_cancellation_notice_by_system_at] == order_cancellation_notice_by_system_written.assigned_price[order_cancellation_notice_by_system_at]); order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  equal_clearing_data(order_cancellation_notice_by_system_read.clearing_data, order_cancellation_notice_by_system_written.clearing_data);
  equal_owner_data(order_cancellation_notice_by_system_read.owner_data, order_cancellation_notice_by_system_written.owner_data);
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 8 -> assert(order_cancellation_notice_by_system_read.original_order_id[order_cancellation_notice_by_system_at] == order_cancellation_notice_by_system_written.original_order_id[order_cancellation_notice_by_system_at]); order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 6 -> assert(order_cancellation_notice_by_system_read.auction_i_d[order_cancellation_notice_by_system_at] == order_cancellation_notice_by_system_written.auction_i_d[order_cancellation_notice_by_system_at]); order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 16 -> assert(order_cancellation_notice_by_system_read.additional_client_memo[order_cancellation_notice_by_system_at] == order_cancellation_notice_by_system_written.additional_client_memo[order_cancellation_notice_by_system_at]); order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_system_at = 0;
  do
  :: order_cancellation_notice_by_system_at < 4 -> assert(order_cancellation_notice_by_system_read.reserved_4[order_cancellation_notice_by_system_at] == order_cancellation_notice_by_system_written.reserved_4[order_cancellation_notice_by_system_at]); order_cancellation_notice_by_system_at = order_cancellation_notice_by_system_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Outgoing Header: encoded, read back, and compared */
proctype check_outgoing_header() {
  OutgoingHeader outgoing_header_sent;
  OutgoingHeader outgoing_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outgoing_header(outgoing_header_sent, 0)
  :: pattern == 1 -> fill_outgoing_header(outgoing_header_sent, 32)
  :: pattern == 2 -> fill_outgoing_header(outgoing_header_sent, 255)
  :: else -> ramp_outgoing_header(outgoing_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outgoing_header(outgoing_header_sent);
    assert(at == 30);
    at = 0;
    decode_outgoing_header(outgoing_header_got);
    assert(at == 30);
    equal_outgoing_header(outgoing_header_got, outgoing_header_sent)
  }
}

/* Heartbeat Question: encoded, read back, and compared */
proctype check_heartbeat_question() {
  HeartbeatQuestion heartbeat_question_sent;
  HeartbeatQuestion heartbeat_question_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat_question(heartbeat_question_sent, 0)
  :: pattern == 1 -> fill_heartbeat_question(heartbeat_question_sent, 32)
  :: pattern == 2 -> fill_heartbeat_question(heartbeat_question_sent, 255)
  :: else -> ramp_heartbeat_question(heartbeat_question_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat_question(heartbeat_question_sent);
    assert(at == 20);
    at = 0;
    decode_heartbeat_question(heartbeat_question_got);
    assert(at == 20);
    equal_heartbeat_question(heartbeat_question_got, heartbeat_question_sent)
  }
}

/* Out Of Sequence: encoded, read back, and compared */
proctype check_out_of_sequence() {
  OutOfSequence out_of_sequence_sent;
  OutOfSequence out_of_sequence_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_out_of_sequence(out_of_sequence_sent, 0)
  :: pattern == 1 -> fill_out_of_sequence(out_of_sequence_sent, 32)
  :: pattern == 2 -> fill_out_of_sequence(out_of_sequence_sent, 255)
  :: else -> ramp_out_of_sequence(out_of_sequence_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_out_of_sequence(out_of_sequence_sent);
    assert(at == 22);
    at = 0;
    decode_out_of_sequence(out_of_sequence_got);
    assert(at == 22);
    equal_out_of_sequence(out_of_sequence_got, out_of_sequence_sent)
  }
}

/* Technical Error Notice: encoded, read back, and compared */
proctype check_technical_error_notice() {
  TechnicalErrorNotice technical_error_notice_sent;
  TechnicalErrorNotice technical_error_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_technical_error_notice(technical_error_notice_sent, 0)
  :: pattern == 1 -> fill_technical_error_notice(technical_error_notice_sent, 32)
  :: pattern == 2 -> fill_technical_error_notice(technical_error_notice_sent, 255)
  :: else -> ramp_technical_error_notice(technical_error_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_technical_error_notice(technical_error_notice_sent);
    assert(at == 218);
    at = 0;
    decode_technical_error_notice(technical_error_notice_got);
    assert(at == 218);
    equal_technical_error_notice(technical_error_notice_got, technical_error_notice_sent)
  }
}

/* Disconnection Instruction Acknowledgement: encoded, read back, and compared */
proctype check_disconnection_instruction_acknowledgement() {
  DisconnectionInstructionAcknowledgement disconnection_instruction_acknowledgement_sent;
  DisconnectionInstructionAcknowledgement disconnection_instruction_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_sent, 255)
  :: else -> ramp_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_sent);
    assert(at == 12);
    at = 0;
    decode_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_got);
    assert(at == 12);
    equal_disconnection_instruction_acknowledgement(disconnection_instruction_acknowledgement_got, disconnection_instruction_acknowledgement_sent)
  }
}

/* Connection Acknowledgement: encoded, read back, and compared */
proctype check_connection_acknowledgement() {
  ConnectionAcknowledgement connection_acknowledgement_sent;
  ConnectionAcknowledgement connection_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_connection_acknowledgement(connection_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_connection_acknowledgement(connection_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_connection_acknowledgement(connection_acknowledgement_sent, 255)
  :: else -> ramp_connection_acknowledgement(connection_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_connection_acknowledgement(connection_acknowledgement_sent);
    assert(at == 12);
    at = 0;
    decode_connection_acknowledgement(connection_acknowledgement_got);
    assert(at == 12);
    equal_connection_acknowledgement(connection_acknowledgement_got, connection_acknowledgement_sent)
  }
}

/* Disconnection Acknowledgement: encoded, read back, and compared */
proctype check_disconnection_acknowledgement() {
  DisconnectionAcknowledgement disconnection_acknowledgement_sent;
  DisconnectionAcknowledgement disconnection_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_disconnection_acknowledgement(disconnection_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_disconnection_acknowledgement(disconnection_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_disconnection_acknowledgement(disconnection_acknowledgement_sent, 255)
  :: else -> ramp_disconnection_acknowledgement(disconnection_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_disconnection_acknowledgement(disconnection_acknowledgement_sent);
    assert(at == 12);
    at = 0;
    decode_disconnection_acknowledgement(disconnection_acknowledgement_got);
    assert(at == 12);
    equal_disconnection_acknowledgement(disconnection_acknowledgement_got, disconnection_acknowledgement_sent)
  }
}

/* End Of Transmission: encoded, read back, and compared */
proctype check_end_of_transmission() {
  EndOfTransmission end_of_transmission_sent;
  EndOfTransmission end_of_transmission_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_transmission(end_of_transmission_sent, 0)
  :: pattern == 1 -> fill_end_of_transmission(end_of_transmission_sent, 32)
  :: pattern == 2 -> fill_end_of_transmission(end_of_transmission_sent, 255)
  :: else -> ramp_end_of_transmission(end_of_transmission_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_transmission(end_of_transmission_sent);
    assert(at == 18);
    at = 0;
    decode_end_of_transmission(end_of_transmission_got);
    assert(at == 18);
    equal_end_of_transmission(end_of_transmission_got, end_of_transmission_sent)
  }
}

/* Error Notice: encoded, read back, and compared */
proctype check_error_notice() {
  ErrorNotice error_notice_sent;
  ErrorNotice error_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_error_notice(error_notice_sent, 0)
  :: pattern == 1 -> fill_error_notice(error_notice_sent, 32)
  :: pattern == 2 -> fill_error_notice(error_notice_sent, 255)
  :: else -> ramp_error_notice(error_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_error_notice(error_notice_sent);
    assert(at == 358);
    at = 0;
    decode_error_notice(error_notice_got);
    assert(at == 358);
    equal_error_notice(error_notice_got, error_notice_sent)
  }
}

/* Bulk Quote Data Acknowledgement: encoded, read back, and compared */
proctype check_bulk_quote_data_acknowledgement() {
  BulkQuoteDataAcknowledgement bulk_quote_data_acknowledgement_sent;
  BulkQuoteDataAcknowledgement bulk_quote_data_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_sent, 255)
  :: else -> ramp_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_sent);
    assert(at == 18);
    at = 0;
    decode_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_got);
    assert(at == 18);
    equal_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_got, bulk_quote_data_acknowledgement_sent)
  }
}

/* Clearing Data: encoded, read back, and compared */
proctype check_clearing_data() {
  ClearingData clearing_data_sent;
  ClearingData clearing_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clearing_data(clearing_data_sent, 0)
  :: pattern == 1 -> fill_clearing_data(clearing_data_sent, 32)
  :: pattern == 2 -> fill_clearing_data(clearing_data_sent, 255)
  :: else -> ramp_clearing_data(clearing_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clearing_data(clearing_data_sent);
    assert(at == 20);
    at = 0;
    decode_clearing_data(clearing_data_got);
    assert(at == 20);
    equal_clearing_data(clearing_data_got, clearing_data_sent)
  }
}

/* Owner Data: encoded, read back, and compared */
proctype check_owner_data() {
  OwnerData owner_data_sent;
  OwnerData owner_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_owner_data(owner_data_sent, 0)
  :: pattern == 1 -> fill_owner_data(owner_data_sent, 32)
  :: pattern == 2 -> fill_owner_data(owner_data_sent, 255)
  :: else -> ramp_owner_data(owner_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_owner_data(owner_data_sent);
    assert(at == 71);
    at = 0;
    decode_owner_data(owner_data_got);
    assert(at == 71);
    equal_owner_data(owner_data_got, owner_data_sent)
  }
}

/* Order Acknowledgement: encoded, read back, and compared */
proctype check_order_acknowledgement() {
  OrderAcknowledgement order_acknowledgement_sent;
  OrderAcknowledgement order_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_acknowledgement(order_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_order_acknowledgement(order_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_order_acknowledgement(order_acknowledgement_sent, 255)
  :: else -> ramp_order_acknowledgement(order_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_acknowledgement(order_acknowledgement_sent);
    assert(at == 167);
    at = 0;
    decode_order_acknowledgement(order_acknowledgement_got);
    assert(at == 167);
    equal_order_acknowledgement(order_acknowledgement_got, order_acknowledgement_sent)
  }
}

/* Global Cancellation Confirmation: encoded, read back, and compared */
proctype check_global_cancellation_confirmation() {
  GlobalCancellationConfirmation global_cancellation_confirmation_sent;
  GlobalCancellationConfirmation global_cancellation_confirmation_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_global_cancellation_confirmation(global_cancellation_confirmation_sent, 0)
  :: pattern == 1 -> fill_global_cancellation_confirmation(global_cancellation_confirmation_sent, 32)
  :: pattern == 2 -> fill_global_cancellation_confirmation(global_cancellation_confirmation_sent, 255)
  :: else -> ramp_global_cancellation_confirmation(global_cancellation_confirmation_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_global_cancellation_confirmation(global_cancellation_confirmation_sent);
    assert(at == 11);
    at = 0;
    decode_global_cancellation_confirmation(global_cancellation_confirmation_got);
    assert(at == 11);
    equal_global_cancellation_confirmation(global_cancellation_confirmation_got, global_cancellation_confirmation_sent)
  }
}

/* Improvement Order Acknowlegment: encoded, read back, and compared */
proctype check_improvement_order_acknowlegment() {
  ImprovementOrderAcknowlegment improvement_order_acknowlegment_sent;
  ImprovementOrderAcknowlegment improvement_order_acknowlegment_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_improvement_order_acknowlegment(improvement_order_acknowlegment_sent, 0)
  :: pattern == 1 -> fill_improvement_order_acknowlegment(improvement_order_acknowlegment_sent, 32)
  :: pattern == 2 -> fill_improvement_order_acknowlegment(improvement_order_acknowlegment_sent, 255)
  :: else -> ramp_improvement_order_acknowlegment(improvement_order_acknowlegment_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_improvement_order_acknowlegment(improvement_order_acknowlegment_sent);
    assert(at == 167);
    at = 0;
    decode_improvement_order_acknowlegment(improvement_order_acknowlegment_got);
    assert(at == 167);
    equal_improvement_order_acknowlegment(improvement_order_acknowlegment_got, improvement_order_acknowlegment_sent)
  }
}

/* Order Modification Acknowledgement: encoded, read back, and compared */
proctype check_order_modification_acknowledgement() {
  OrderModificationAcknowledgement order_modification_acknowledgement_sent;
  OrderModificationAcknowledgement order_modification_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_modification_acknowledgement(order_modification_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_order_modification_acknowledgement(order_modification_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_order_modification_acknowledgement(order_modification_acknowledgement_sent, 255)
  :: else -> ramp_order_modification_acknowledgement(order_modification_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_modification_acknowledgement(order_modification_acknowledgement_sent);
    assert(at == 167);
    at = 0;
    decode_order_modification_acknowledgement(order_modification_acknowledgement_got);
    assert(at == 167);
    equal_order_modification_acknowledgement(order_modification_acknowledgement_got, order_modification_acknowledgement_sent)
  }
}

/* Standard Acknowledgement: encoded, read back, and compared */
proctype check_standard_acknowledgement() {
  StandardAcknowledgement standard_acknowledgement_sent;
  StandardAcknowledgement standard_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_standard_acknowledgement(standard_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_standard_acknowledgement(standard_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_standard_acknowledgement(standard_acknowledgement_sent, 255)
  :: else -> ramp_standard_acknowledgement(standard_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_standard_acknowledgement(standard_acknowledgement_sent);
    assert(at == 10);
    at = 0;
    decode_standard_acknowledgement(standard_acknowledgement_got);
    assert(at == 10);
    equal_standard_acknowledgement(standard_acknowledgement_got, standard_acknowledgement_sent)
  }
}

/* Complex Order Auction Acknowledgement: encoded, read back, and compared */
proctype check_complex_order_auction_acknowledgement() {
  ComplexOrderAuctionAcknowledgement complex_order_auction_acknowledgement_sent;
  ComplexOrderAuctionAcknowledgement complex_order_auction_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_sent, 255)
  :: else -> ramp_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_sent);
    assert(at == 167);
    at = 0;
    decode_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_got);
    assert(at == 167);
    equal_complex_order_auction_acknowledgement(complex_order_auction_acknowledgement_got, complex_order_auction_acknowledgement_sent)
  }
}

/* Auction Or Improvement Cancellation Acknowledgement: encoded, read back, and compared */
proctype check_auction_or_improvement_cancellation_acknowledgement() {
  AuctionOrImprovementCancellationAcknowledgement auction_or_improvement_cancellation_acknowledgement_sent;
  AuctionOrImprovementCancellationAcknowledgement auction_or_improvement_cancellation_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_sent, 255)
  :: else -> ramp_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_sent);
    assert(at == 147);
    at = 0;
    decode_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_got);
    assert(at == 147);
    equal_auction_or_improvement_cancellation_acknowledgement(auction_or_improvement_cancellation_acknowledgement_got, auction_or_improvement_cancellation_acknowledgement_sent)
  }
}

/* Order Cancellation Acknowledgement: encoded, read back, and compared */
proctype check_order_cancellation_acknowledgement() {
  OrderCancellationAcknowledgement order_cancellation_acknowledgement_sent;
  OrderCancellationAcknowledgement order_cancellation_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancellation_acknowledgement(order_cancellation_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_order_cancellation_acknowledgement(order_cancellation_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_order_cancellation_acknowledgement(order_cancellation_acknowledgement_sent, 255)
  :: else -> ramp_order_cancellation_acknowledgement(order_cancellation_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancellation_acknowledgement(order_cancellation_acknowledgement_sent);
    assert(at == 167);
    at = 0;
    decode_order_cancellation_acknowledgement(order_cancellation_acknowledgement_got);
    assert(at == 167);
    equal_order_cancellation_acknowledgement(order_cancellation_acknowledgement_got, order_cancellation_acknowledgement_sent)
  }
}

/* Trader Status: encoded, read back, and compared */
proctype check_trader_status() {
  TraderStatus trader_status_sent;
  TraderStatus trader_status_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trader_status(trader_status_sent, 0)
  :: pattern == 1 -> fill_trader_status(trader_status_sent, 32)
  :: pattern == 2 -> fill_trader_status(trader_status_sent, 255)
  :: else -> ramp_trader_status(trader_status_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trader_status(trader_status_sent);
    assert(at == 10);
    at = 0;
    decode_trader_status(trader_status_got);
    assert(at == 10);
    equal_trader_status(trader_status_got, trader_status_sent)
  }
}

/* Directed Order Cancellation Notice: encoded, read back, and compared */
proctype check_directed_order_cancellation_notice() {
  DirectedOrderCancellationNotice directed_order_cancellation_notice_sent;
  DirectedOrderCancellationNotice directed_order_cancellation_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_directed_order_cancellation_notice(directed_order_cancellation_notice_sent, 0)
  :: pattern == 1 -> fill_directed_order_cancellation_notice(directed_order_cancellation_notice_sent, 32)
  :: pattern == 2 -> fill_directed_order_cancellation_notice(directed_order_cancellation_notice_sent, 255)
  :: else -> ramp_directed_order_cancellation_notice(directed_order_cancellation_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_directed_order_cancellation_notice(directed_order_cancellation_notice_sent);
    assert(at == 41);
    at = 0;
    decode_directed_order_cancellation_notice(directed_order_cancellation_notice_got);
    assert(at == 41);
    equal_directed_order_cancellation_notice(directed_order_cancellation_notice_got, directed_order_cancellation_notice_sent)
  }
}

/* Directed Order Notice: encoded, read back, and compared */
proctype check_directed_order_notice() {
  DirectedOrderNotice directed_order_notice_sent;
  DirectedOrderNotice directed_order_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_directed_order_notice(directed_order_notice_sent, 0)
  :: pattern == 1 -> fill_directed_order_notice(directed_order_notice_sent, 32)
  :: pattern == 2 -> fill_directed_order_notice(directed_order_notice_sent, 255)
  :: else -> ramp_directed_order_notice(directed_order_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_directed_order_notice(directed_order_notice_sent);
    assert(at == 41);
    at = 0;
    decode_directed_order_notice(directed_order_notice_got);
    assert(at == 41);
    equal_directed_order_notice(directed_order_notice_got, directed_order_notice_sent)
  }
}

/* Excluded Instrument Notice: encoded, read back, and compared */
proctype check_excluded_instrument_notice() {
  ExcludedInstrumentNotice excluded_instrument_notice_sent;
  ExcludedInstrumentNotice excluded_instrument_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_excluded_instrument_notice(excluded_instrument_notice_sent, 0)
  :: pattern == 1 -> fill_excluded_instrument_notice(excluded_instrument_notice_sent, 32)
  :: pattern == 2 -> fill_excluded_instrument_notice(excluded_instrument_notice_sent, 255)
  :: else -> ramp_excluded_instrument_notice(excluded_instrument_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_excluded_instrument_notice(excluded_instrument_notice_sent);
    assert(at == 22);
    at = 0;
    decode_excluded_instrument_notice(excluded_instrument_notice_got);
    assert(at == 22);
    equal_excluded_instrument_notice(excluded_instrument_notice_got, excluded_instrument_notice_sent)
  }
}

/* Group State Change: encoded, read back, and compared */
proctype check_group_state_change() {
  GroupStateChange group_state_change_sent;
  GroupStateChange group_state_change_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_state_change(group_state_change_sent, 0)
  :: pattern == 1 -> fill_group_state_change(group_state_change_sent, 32)
  :: pattern == 2 -> fill_group_state_change(group_state_change_sent, 255)
  :: else -> ramp_group_state_change(group_state_change_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_state_change(group_state_change_sent);
    assert(at == 3);
    at = 0;
    decode_group_state_change(group_state_change_got);
    assert(at == 3);
    equal_group_state_change(group_state_change_got, group_state_change_sent)
  }
}

/* Leg Execution Notice: encoded, read back, and compared */
proctype check_leg_execution_notice() {
  LegExecutionNotice leg_execution_notice_sent;
  LegExecutionNotice leg_execution_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_leg_execution_notice(leg_execution_notice_sent, 0)
  :: pattern == 1 -> fill_leg_execution_notice(leg_execution_notice_sent, 32)
  :: pattern == 2 -> fill_leg_execution_notice(leg_execution_notice_sent, 255)
  :: else -> ramp_leg_execution_notice(leg_execution_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_leg_execution_notice(leg_execution_notice_sent);
    assert(at == 257);
    at = 0;
    decode_leg_execution_notice(leg_execution_notice_got);
    assert(at == 257);
    equal_leg_execution_notice(leg_execution_notice_got, leg_execution_notice_sent)
  }
}

/* Cancellation Of All Quotes Notices: encoded, read back, and compared */
proctype check_cancellation_of_all_quotes_notices() {
  CancellationOfAllQuotesNotices cancellation_of_all_quotes_notices_sent;
  CancellationOfAllQuotesNotices cancellation_of_all_quotes_notices_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_sent, 0)
  :: pattern == 1 -> fill_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_sent, 32)
  :: pattern == 2 -> fill_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_sent, 255)
  :: else -> ramp_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_sent);
    assert(at == 15);
    at = 0;
    decode_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_got);
    assert(at == 15);
    equal_cancellation_of_all_quotes_notices(cancellation_of_all_quotes_notices_got, cancellation_of_all_quotes_notices_sent)
  }
}

/* Quality Market Maker Notification: encoded, read back, and compared */
proctype check_quality_market_maker_notification() {
  QualityMarketMakerNotification quality_market_maker_notification_sent;
  QualityMarketMakerNotification quality_market_maker_notification_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quality_market_maker_notification(quality_market_maker_notification_sent, 0)
  :: pattern == 1 -> fill_quality_market_maker_notification(quality_market_maker_notification_sent, 32)
  :: pattern == 2 -> fill_quality_market_maker_notification(quality_market_maker_notification_sent, 255)
  :: else -> ramp_quality_market_maker_notification(quality_market_maker_notification_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quality_market_maker_notification(quality_market_maker_notification_sent);
    assert(at == 65);
    at = 0;
    decode_quality_market_maker_notification(quality_market_maker_notification_got);
    assert(at == 65);
    equal_quality_market_maker_notification(quality_market_maker_notification_got, quality_market_maker_notification_sent)
  }
}

/* Execution Notice: encoded, read back, and compared */
proctype check_execution_notice() {
  ExecutionNotice execution_notice_sent;
  ExecutionNotice execution_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_notice(execution_notice_sent, 0)
  :: pattern == 1 -> fill_execution_notice(execution_notice_sent, 32)
  :: pattern == 2 -> fill_execution_notice(execution_notice_sent, 255)
  :: else -> ramp_execution_notice(execution_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_notice(execution_notice_sent);
    assert(at == 240);
    at = 0;
    decode_execution_notice(execution_notice_got);
    assert(at == 240);
    equal_execution_notice(execution_notice_got, execution_notice_sent)
  }
}

/* Quote Notice: encoded, read back, and compared */
proctype check_quote_notice() {
  QuoteNotice quote_notice_sent;
  QuoteNotice quote_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_notice(quote_notice_sent, 0)
  :: pattern == 1 -> fill_quote_notice(quote_notice_sent, 32)
  :: pattern == 2 -> fill_quote_notice(quote_notice_sent, 255)
  :: else -> ramp_quote_notice(quote_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_notice(quote_notice_sent);
    assert(at == 75);
    at = 0;
    decode_quote_notice(quote_notice_got);
    assert(at == 75);
    equal_quote_notice(quote_notice_got, quote_notice_sent)
  }
}

/* Execution Cancellation Notice: encoded, read back, and compared */
proctype check_execution_cancellation_notice() {
  ExecutionCancellationNotice execution_cancellation_notice_sent;
  ExecutionCancellationNotice execution_cancellation_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_cancellation_notice(execution_cancellation_notice_sent, 0)
  :: pattern == 1 -> fill_execution_cancellation_notice(execution_cancellation_notice_sent, 32)
  :: pattern == 2 -> fill_execution_cancellation_notice(execution_cancellation_notice_sent, 255)
  :: else -> ramp_execution_cancellation_notice(execution_cancellation_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_cancellation_notice(execution_cancellation_notice_sent);
    assert(at == 240);
    at = 0;
    decode_execution_cancellation_notice(execution_cancellation_notice_got);
    assert(at == 240);
    equal_execution_cancellation_notice(execution_cancellation_notice_got, execution_cancellation_notice_sent)
  }
}

/* Leg Execution Cancellation Notice: encoded, read back, and compared */
proctype check_leg_execution_cancellation_notice() {
  LegExecutionCancellationNotice leg_execution_cancellation_notice_sent;
  LegExecutionCancellationNotice leg_execution_cancellation_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_leg_execution_cancellation_notice(leg_execution_cancellation_notice_sent, 0)
  :: pattern == 1 -> fill_leg_execution_cancellation_notice(leg_execution_cancellation_notice_sent, 32)
  :: pattern == 2 -> fill_leg_execution_cancellation_notice(leg_execution_cancellation_notice_sent, 255)
  :: else -> ramp_leg_execution_cancellation_notice(leg_execution_cancellation_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_leg_execution_cancellation_notice(leg_execution_cancellation_notice_sent);
    assert(at == 257);
    at = 0;
    decode_leg_execution_cancellation_notice(leg_execution_cancellation_notice_got);
    assert(at == 257);
    equal_leg_execution_cancellation_notice(leg_execution_cancellation_notice_got, leg_execution_cancellation_notice_sent)
  }
}

/* Order Cancellation Notice By System: encoded, read back, and compared */
proctype check_order_cancellation_notice_by_system() {
  OrderCancellationNoticeBySystem order_cancellation_notice_by_system_sent;
  OrderCancellationNoticeBySystem order_cancellation_notice_by_system_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancellation_notice_by_system(order_cancellation_notice_by_system_sent, 0)
  :: pattern == 1 -> fill_order_cancellation_notice_by_system(order_cancellation_notice_by_system_sent, 32)
  :: pattern == 2 -> fill_order_cancellation_notice_by_system(order_cancellation_notice_by_system_sent, 255)
  :: else -> ramp_order_cancellation_notice_by_system(order_cancellation_notice_by_system_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancellation_notice_by_system(order_cancellation_notice_by_system_sent);
    assert(at == 167);
    at = 0;
    decode_order_cancellation_notice_by_system(order_cancellation_notice_by_system_got);
    assert(at == 167);
    equal_order_cancellation_notice_by_system(order_cancellation_notice_by_system_got, order_cancellation_notice_by_system_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_outgoing_header()
  :: run check_heartbeat_question()
  :: run check_out_of_sequence()
  :: run check_technical_error_notice()
  :: run check_disconnection_instruction_acknowledgement()
  :: run check_connection_acknowledgement()
  :: run check_disconnection_acknowledgement()
  :: run check_end_of_transmission()
  :: run check_error_notice()
  :: run check_bulk_quote_data_acknowledgement()
  :: run check_clearing_data()
  :: run check_owner_data()
  :: run check_order_acknowledgement()
  :: run check_global_cancellation_confirmation()
  :: run check_improvement_order_acknowlegment()
  :: run check_order_modification_acknowledgement()
  :: run check_standard_acknowledgement()
  :: run check_complex_order_auction_acknowledgement()
  :: run check_auction_or_improvement_cancellation_acknowledgement()
  :: run check_order_cancellation_acknowledgement()
  :: run check_trader_status()
  :: run check_directed_order_cancellation_notice()
  :: run check_directed_order_notice()
  :: run check_excluded_instrument_notice()
  :: run check_group_state_change()
  :: run check_leg_execution_notice()
  :: run check_cancellation_of_all_quotes_notices()
  :: run check_quality_market_maker_notification()
  :: run check_execution_notice()
  :: run check_quote_notice()
  :: run check_execution_cancellation_notice()
  :: run check_leg_execution_cancellation_notice()
  :: run check_order_cancellation_notice_by_system()
  fi
}
