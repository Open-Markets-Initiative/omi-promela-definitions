/*
 * TMX Group Sola Order Entry
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
#define WIRE 235

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Connection Acknowledgement: 12 bytes ------------------------------------ */

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

/* ---- Heartbeat Question: 20 bytes -------------------------------------------- */

typedef HeartbeatQuestion {
  byte user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[8];
  byte last_exchange_message_id_sent_to_participant[6];
  byte trading_engine_timestamp_local_hhmmss[6]
};

int heartbeat_question_at;

/* every byte of Heartbeat Question set to one value */
inline fill_heartbeat_question(heartbeat_question_record, heartbeat_question_value) {
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 8 -> heartbeat_question_record.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_question_at] = heartbeat_question_value; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.last_exchange_message_id_sent_to_participant[heartbeat_question_at] = heartbeat_question_value; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.trading_engine_timestamp_local_hhmmss[heartbeat_question_at] = heartbeat_question_value; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Question set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_question(heartbeat_question_record, heartbeat_question_base) {
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 8 -> heartbeat_question_record.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_question_at] = (heartbeat_question_base + 0 + heartbeat_question_at + 1) % 256; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.last_exchange_message_id_sent_to_participant[heartbeat_question_at] = (heartbeat_question_base + 8 + heartbeat_question_at + 1) % 256; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.trading_engine_timestamp_local_hhmmss[heartbeat_question_at] = (heartbeat_question_base + 14 + heartbeat_question_at + 1) % 256; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Question to the wire, 20 bytes from where the cursor stands */
inline encode_heartbeat_question(heartbeat_question_record) {
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 8 -> wire[at] = heartbeat_question_record.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_question_at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> wire[at] = heartbeat_question_record.last_exchange_message_id_sent_to_participant[heartbeat_question_at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> wire[at] = heartbeat_question_record.trading_engine_timestamp_local_hhmmss[heartbeat_question_at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Question off the wire, 20 bytes from where the cursor stands */
inline decode_heartbeat_question(heartbeat_question_record) {
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 8 -> heartbeat_question_record.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_question_at] = wire[at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.last_exchange_message_id_sent_to_participant[heartbeat_question_at] = wire[at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> heartbeat_question_record.trading_engine_timestamp_local_hhmmss[heartbeat_question_at] = wire[at]; at = at + 1; heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Question is what was written, byte for byte */
inline equal_heartbeat_question(heartbeat_question_read, heartbeat_question_written) {
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 8 -> assert(heartbeat_question_read.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_question_at] == heartbeat_question_written.user_sequence_id_first_user_sequence_id_for_nextcurrent_heartbeat_period[heartbeat_question_at]); heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> assert(heartbeat_question_read.last_exchange_message_id_sent_to_participant[heartbeat_question_at] == heartbeat_question_written.last_exchange_message_id_sent_to_participant[heartbeat_question_at]); heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  heartbeat_question_at = 0;
  do
  :: heartbeat_question_at < 6 -> assert(heartbeat_question_read.trading_engine_timestamp_local_hhmmss[heartbeat_question_at] == heartbeat_question_written.trading_engine_timestamp_local_hhmmss[heartbeat_question_at]); heartbeat_question_at = heartbeat_question_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Out Of Sequence: 22 bytes ----------------------------------------------- */

typedef OutOfSequence {
  byte received_user_sequence_id[8];
  byte expected_last_user_sequence_id[8];
  byte user_message_timestamp_local_hhmmss[6]
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
  :: out_of_sequence_at < 6 -> out_of_sequence_record.user_message_timestamp_local_hhmmss[out_of_sequence_at] = out_of_sequence_value; out_of_sequence_at = out_of_sequence_at + 1
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
  :: out_of_sequence_at < 6 -> out_of_sequence_record.user_message_timestamp_local_hhmmss[out_of_sequence_at] = (out_of_sequence_base + 16 + out_of_sequence_at + 1) % 256; out_of_sequence_at = out_of_sequence_at + 1
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
  :: out_of_sequence_at < 6 -> wire[at] = out_of_sequence_record.user_message_timestamp_local_hhmmss[out_of_sequence_at]; at = at + 1; out_of_sequence_at = out_of_sequence_at + 1
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
  :: out_of_sequence_at < 6 -> out_of_sequence_record.user_message_timestamp_local_hhmmss[out_of_sequence_at] = wire[at]; at = at + 1; out_of_sequence_at = out_of_sequence_at + 1
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
  :: out_of_sequence_at < 6 -> assert(out_of_sequence_read.user_message_timestamp_local_hhmmss[out_of_sequence_at] == out_of_sequence_written.user_message_timestamp_local_hhmmss[out_of_sequence_at]); out_of_sequence_at = out_of_sequence_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Technical Error Notice: 218 bytes --------------------------------------- */

typedef TechnicalErrorNotice {
  byte received_message_type[2];
  byte preceding_user_sequence_id_received_zeroes_if_none[8];
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
  :: technical_error_notice_at < 8 -> technical_error_notice_record.preceding_user_sequence_id_received_zeroes_if_none[technical_error_notice_at] = technical_error_notice_value; technical_error_notice_at = technical_error_notice_at + 1
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
  :: technical_error_notice_at < 8 -> technical_error_notice_record.preceding_user_sequence_id_received_zeroes_if_none[technical_error_notice_at] = (technical_error_notice_base + 2 + technical_error_notice_at + 1) % 256; technical_error_notice_at = technical_error_notice_at + 1
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
  :: technical_error_notice_at < 8 -> wire[at] = technical_error_notice_record.preceding_user_sequence_id_received_zeroes_if_none[technical_error_notice_at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
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
  :: technical_error_notice_at < 8 -> technical_error_notice_record.preceding_user_sequence_id_received_zeroes_if_none[technical_error_notice_at] = wire[at]; at = at + 1; technical_error_notice_at = technical_error_notice_at + 1
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
  :: technical_error_notice_at < 8 -> assert(technical_error_notice_read.preceding_user_sequence_id_received_zeroes_if_none[technical_error_notice_at] == technical_error_notice_written.preceding_user_sequence_id_received_zeroes_if_none[technical_error_notice_at]); technical_error_notice_at = technical_error_notice_at + 1
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

/* ---- Disconnection Acknowledgement: 12 bytes --------------------------------- */

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
  byte last_user_sequence_id_received_if_no_business_message_has_been_received_o_soi8v5[8];
  byte trading_engine_timestamp_local_hhmmss[6]
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
  :: end_of_transmission_at < 8 -> end_of_transmission_record.last_user_sequence_id_received_if_no_business_message_has_been_received_o_soi8v5[end_of_transmission_at] = end_of_transmission_value; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 6 -> end_of_transmission_record.trading_engine_timestamp_local_hhmmss[end_of_transmission_at] = end_of_transmission_value; end_of_transmission_at = end_of_transmission_at + 1
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
  :: end_of_transmission_at < 8 -> end_of_transmission_record.last_user_sequence_id_received_if_no_business_message_has_been_received_o_soi8v5[end_of_transmission_at] = (end_of_transmission_base + 4 + end_of_transmission_at + 1) % 256; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 6 -> end_of_transmission_record.trading_engine_timestamp_local_hhmmss[end_of_transmission_at] = (end_of_transmission_base + 12 + end_of_transmission_at + 1) % 256; end_of_transmission_at = end_of_transmission_at + 1
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
  :: end_of_transmission_at < 8 -> wire[at] = end_of_transmission_record.last_user_sequence_id_received_if_no_business_message_has_been_received_o_soi8v5[end_of_transmission_at]; at = at + 1; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 6 -> wire[at] = end_of_transmission_record.trading_engine_timestamp_local_hhmmss[end_of_transmission_at]; at = at + 1; end_of_transmission_at = end_of_transmission_at + 1
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
  :: end_of_transmission_at < 8 -> end_of_transmission_record.last_user_sequence_id_received_if_no_business_message_has_been_received_o_soi8v5[end_of_transmission_at] = wire[at]; at = at + 1; end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 6 -> end_of_transmission_record.trading_engine_timestamp_local_hhmmss[end_of_transmission_at] = wire[at]; at = at + 1; end_of_transmission_at = end_of_transmission_at + 1
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
  :: end_of_transmission_at < 8 -> assert(end_of_transmission_read.last_user_sequence_id_received_if_no_business_message_has_been_received_o_soi8v5[end_of_transmission_at] == end_of_transmission_written.last_user_sequence_id_received_if_no_business_message_has_been_received_o_soi8v5[end_of_transmission_at]); end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  end_of_transmission_at = 0;
  do
  :: end_of_transmission_at < 6 -> assert(end_of_transmission_read.trading_engine_timestamp_local_hhmmss[end_of_transmission_at] == end_of_transmission_written.trading_engine_timestamp_local_hhmmss[end_of_transmission_at]); end_of_transmission_at = end_of_transmission_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Outgoing Messages Header: 22 bytes -------------------------------------- */

/* The guide states these fields once, as the Outgoing Messages Header, for every business message the Exchange sends. Message Type is read by the packet before the branch, so it is not repeated here. */
typedef OutgoingMessagesHeader {
  byte trading_engine_timestamp_local_hhmmss[6];
  byte user_sequence_id[8];
  byte exchange_message_id[6];
  byte gap_sequence_id[2]
};

int outgoing_messages_header_at;

/* every byte of Outgoing Messages Header set to one value */
inline fill_outgoing_messages_header(outgoing_messages_header_record, outgoing_messages_header_value) {
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 6 -> outgoing_messages_header_record.trading_engine_timestamp_local_hhmmss[outgoing_messages_header_at] = outgoing_messages_header_value; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 8 -> outgoing_messages_header_record.user_sequence_id[outgoing_messages_header_at] = outgoing_messages_header_value; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 6 -> outgoing_messages_header_record.exchange_message_id[outgoing_messages_header_at] = outgoing_messages_header_value; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 2 -> outgoing_messages_header_record.gap_sequence_id[outgoing_messages_header_at] = outgoing_messages_header_value; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Outgoing Messages Header set to where it lies, so a field read out of place says so */
inline ramp_outgoing_messages_header(outgoing_messages_header_record, outgoing_messages_header_base) {
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 6 -> outgoing_messages_header_record.trading_engine_timestamp_local_hhmmss[outgoing_messages_header_at] = (outgoing_messages_header_base + 0 + outgoing_messages_header_at + 1) % 256; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 8 -> outgoing_messages_header_record.user_sequence_id[outgoing_messages_header_at] = (outgoing_messages_header_base + 6 + outgoing_messages_header_at + 1) % 256; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 6 -> outgoing_messages_header_record.exchange_message_id[outgoing_messages_header_at] = (outgoing_messages_header_base + 14 + outgoing_messages_header_at + 1) % 256; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 2 -> outgoing_messages_header_record.gap_sequence_id[outgoing_messages_header_at] = (outgoing_messages_header_base + 20 + outgoing_messages_header_at + 1) % 256; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  skip
}

/* Outgoing Messages Header to the wire, 22 bytes from where the cursor stands */
inline encode_outgoing_messages_header(outgoing_messages_header_record) {
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 6 -> wire[at] = outgoing_messages_header_record.trading_engine_timestamp_local_hhmmss[outgoing_messages_header_at]; at = at + 1; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 8 -> wire[at] = outgoing_messages_header_record.user_sequence_id[outgoing_messages_header_at]; at = at + 1; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 6 -> wire[at] = outgoing_messages_header_record.exchange_message_id[outgoing_messages_header_at]; at = at + 1; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 2 -> wire[at] = outgoing_messages_header_record.gap_sequence_id[outgoing_messages_header_at]; at = at + 1; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  skip
}

/* Outgoing Messages Header off the wire, 22 bytes from where the cursor stands */
inline decode_outgoing_messages_header(outgoing_messages_header_record) {
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 6 -> outgoing_messages_header_record.trading_engine_timestamp_local_hhmmss[outgoing_messages_header_at] = wire[at]; at = at + 1; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 8 -> outgoing_messages_header_record.user_sequence_id[outgoing_messages_header_at] = wire[at]; at = at + 1; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 6 -> outgoing_messages_header_record.exchange_message_id[outgoing_messages_header_at] = wire[at]; at = at + 1; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 2 -> outgoing_messages_header_record.gap_sequence_id[outgoing_messages_header_at] = wire[at]; at = at + 1; outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Outgoing Messages Header is what was written, byte for byte */
inline equal_outgoing_messages_header(outgoing_messages_header_read, outgoing_messages_header_written) {
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 6 -> assert(outgoing_messages_header_read.trading_engine_timestamp_local_hhmmss[outgoing_messages_header_at] == outgoing_messages_header_written.trading_engine_timestamp_local_hhmmss[outgoing_messages_header_at]); outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 8 -> assert(outgoing_messages_header_read.user_sequence_id[outgoing_messages_header_at] == outgoing_messages_header_written.user_sequence_id[outgoing_messages_header_at]); outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 6 -> assert(outgoing_messages_header_read.exchange_message_id[outgoing_messages_header_at] == outgoing_messages_header_written.exchange_message_id[outgoing_messages_header_at]); outgoing_messages_header_at = outgoing_messages_header_at + 1
  :: else -> break
  od;
  outgoing_messages_header_at = 0;
  do
  :: outgoing_messages_header_at < 2 -> assert(outgoing_messages_header_read.gap_sequence_id[outgoing_messages_header_at] == outgoing_messages_header_written.gap_sequence_id[outgoing_messages_header_at]); outgoing_messages_header_at = outgoing_messages_header_at + 1
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
  byte filler_5[5]
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
  clearing_data_at = 0;
  do
  :: clearing_data_at < 5 -> clearing_data_record.filler_5[clearing_data_at] = clearing_data_value; clearing_data_at = clearing_data_at + 1
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
  clearing_data_at = 0;
  do
  :: clearing_data_at < 5 -> clearing_data_record.filler_5[clearing_data_at] = (clearing_data_base + 15 + clearing_data_at + 1) % 256; clearing_data_at = clearing_data_at + 1
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
  clearing_data_at = 0;
  do
  :: clearing_data_at < 5 -> wire[at] = clearing_data_record.filler_5[clearing_data_at]; at = at + 1; clearing_data_at = clearing_data_at + 1
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
  clearing_data_at = 0;
  do
  :: clearing_data_at < 5 -> clearing_data_record.filler_5[clearing_data_at] = wire[at]; at = at + 1; clearing_data_at = clearing_data_at + 1
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
  clearing_data_at = 0;
  do
  :: clearing_data_at < 5 -> assert(clearing_data_read.filler_5[clearing_data_at] == clearing_data_written.filler_5[clearing_data_at]); clearing_data_at = clearing_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Owner Data: 50 bytes ---------------------------------------------------- */

/* The guide states this field once, as Owner Data, for every message that carries it. */
typedef OwnerData {
  byte memo[50]
};

int owner_data_at;

/* every byte of Owner Data set to one value */
inline fill_owner_data(owner_data_record, owner_data_value) {
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
  :: owner_data_at < 50 -> owner_data_record.memo[owner_data_at] = (owner_data_base + 0 + owner_data_at + 1) % 256; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Owner Data to the wire, 50 bytes from where the cursor stands */
inline encode_owner_data(owner_data_record) {
  owner_data_at = 0;
  do
  :: owner_data_at < 50 -> wire[at] = owner_data_record.memo[owner_data_at]; at = at + 1; owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Owner Data off the wire, 50 bytes from where the cursor stands */
inline decode_owner_data(owner_data_record) {
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
  :: owner_data_at < 50 -> assert(owner_data_read.memo[owner_data_at] == owner_data_written.memo[owner_data_at]); owner_data_at = owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Reply: 134 bytes -------------------------------------------------- */

typedef OrderReply {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity_remaining[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data
};

int order_reply_at;

/* every byte of Order Reply set to one value */
inline fill_order_reply(order_reply_record, order_reply_value) {
  fill_outgoing_messages_header(order_reply_record.outgoing_messages_header, order_reply_value);
  order_reply_at = 0;
  do
  :: order_reply_at < 2 -> order_reply_record.group[order_reply_at] = order_reply_value; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 4 -> order_reply_record.instrument[order_reply_at] = order_reply_value; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> order_reply_record.trader_id[order_reply_at] = order_reply_value; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> order_reply_record.order_id[order_reply_at] = order_reply_value; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_record.status = order_reply_value;
  order_reply_record.verb_side = order_reply_value;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> order_reply_record.quantity_remaining[order_reply_at] = order_reply_value; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 10 -> order_reply_record.assigned_price[order_reply_at] = order_reply_value; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  fill_clearing_data(order_reply_record.clearing_data, order_reply_value);
  fill_owner_data(order_reply_record.owner_data, order_reply_value);
  skip
}

/* each byte of Order Reply set to where it lies, so a field read out of place says so */
inline ramp_order_reply(order_reply_record, order_reply_base) {
  ramp_outgoing_messages_header(order_reply_record.outgoing_messages_header, order_reply_base + 0);
  order_reply_at = 0;
  do
  :: order_reply_at < 2 -> order_reply_record.group[order_reply_at] = (order_reply_base + 22 + order_reply_at + 1) % 256; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 4 -> order_reply_record.instrument[order_reply_at] = (order_reply_base + 24 + order_reply_at + 1) % 256; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> order_reply_record.trader_id[order_reply_at] = (order_reply_base + 28 + order_reply_at + 1) % 256; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> order_reply_record.order_id[order_reply_at] = (order_reply_base + 36 + order_reply_at + 1) % 256; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_record.status = (order_reply_base + 44 + 1) % 256;
  order_reply_record.verb_side = (order_reply_base + 45 + 1) % 256;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> order_reply_record.quantity_remaining[order_reply_at] = (order_reply_base + 46 + order_reply_at + 1) % 256; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 10 -> order_reply_record.assigned_price[order_reply_at] = (order_reply_base + 54 + order_reply_at + 1) % 256; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  ramp_clearing_data(order_reply_record.clearing_data, order_reply_base + 64);
  ramp_owner_data(order_reply_record.owner_data, order_reply_base + 84);
  skip
}

/* Order Reply to the wire, 134 bytes from where the cursor stands */
inline encode_order_reply(order_reply_record) {
  encode_outgoing_messages_header(order_reply_record.outgoing_messages_header);
  order_reply_at = 0;
  do
  :: order_reply_at < 2 -> wire[at] = order_reply_record.group[order_reply_at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 4 -> wire[at] = order_reply_record.instrument[order_reply_at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> wire[at] = order_reply_record.trader_id[order_reply_at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> wire[at] = order_reply_record.order_id[order_reply_at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  wire[at] = order_reply_record.status; at = at + 1;
  wire[at] = order_reply_record.verb_side; at = at + 1;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> wire[at] = order_reply_record.quantity_remaining[order_reply_at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 10 -> wire[at] = order_reply_record.assigned_price[order_reply_at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  encode_clearing_data(order_reply_record.clearing_data);
  encode_owner_data(order_reply_record.owner_data);
  skip
}

/* Order Reply off the wire, 134 bytes from where the cursor stands */
inline decode_order_reply(order_reply_record) {
  decode_outgoing_messages_header(order_reply_record.outgoing_messages_header);
  order_reply_at = 0;
  do
  :: order_reply_at < 2 -> order_reply_record.group[order_reply_at] = wire[at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 4 -> order_reply_record.instrument[order_reply_at] = wire[at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> order_reply_record.trader_id[order_reply_at] = wire[at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> order_reply_record.order_id[order_reply_at] = wire[at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_record.status = wire[at]; at = at + 1;
  order_reply_record.verb_side = wire[at]; at = at + 1;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> order_reply_record.quantity_remaining[order_reply_at] = wire[at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 10 -> order_reply_record.assigned_price[order_reply_at] = wire[at]; at = at + 1; order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  decode_clearing_data(order_reply_record.clearing_data);
  decode_owner_data(order_reply_record.owner_data);
  skip
}

/* what was read of Order Reply is what was written, byte for byte */
inline equal_order_reply(order_reply_read, order_reply_written) {
  equal_outgoing_messages_header(order_reply_read.outgoing_messages_header, order_reply_written.outgoing_messages_header);
  order_reply_at = 0;
  do
  :: order_reply_at < 2 -> assert(order_reply_read.group[order_reply_at] == order_reply_written.group[order_reply_at]); order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 4 -> assert(order_reply_read.instrument[order_reply_at] == order_reply_written.instrument[order_reply_at]); order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> assert(order_reply_read.trader_id[order_reply_at] == order_reply_written.trader_id[order_reply_at]); order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> assert(order_reply_read.order_id[order_reply_at] == order_reply_written.order_id[order_reply_at]); order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  assert(order_reply_read.status == order_reply_written.status);
  assert(order_reply_read.verb_side == order_reply_written.verb_side);
  order_reply_at = 0;
  do
  :: order_reply_at < 8 -> assert(order_reply_read.quantity_remaining[order_reply_at] == order_reply_written.quantity_remaining[order_reply_at]); order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  order_reply_at = 0;
  do
  :: order_reply_at < 10 -> assert(order_reply_read.assigned_price[order_reply_at] == order_reply_written.assigned_price[order_reply_at]); order_reply_at = order_reply_at + 1
  :: else -> break
  od;
  equal_clearing_data(order_reply_read.clearing_data, order_reply_written.clearing_data);
  equal_owner_data(order_reply_read.owner_data, order_reply_written.owner_data);
  skip
}

/* ---- Error Notice: 126 bytes ------------------------------------------------- */

typedef ErrorNotice {
  OutgoingMessagesHeader outgoing_messages_header;
  byte error_code[4];
  byte error_description[100]
};

int error_notice_at;

/* every byte of Error Notice set to one value */
inline fill_error_notice(error_notice_record, error_notice_value) {
  fill_outgoing_messages_header(error_notice_record.outgoing_messages_header, error_notice_value);
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
  skip
}

/* each byte of Error Notice set to where it lies, so a field read out of place says so */
inline ramp_error_notice(error_notice_record, error_notice_base) {
  ramp_outgoing_messages_header(error_notice_record.outgoing_messages_header, error_notice_base + 0);
  error_notice_at = 0;
  do
  :: error_notice_at < 4 -> error_notice_record.error_code[error_notice_at] = (error_notice_base + 22 + error_notice_at + 1) % 256; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  error_notice_at = 0;
  do
  :: error_notice_at < 100 -> error_notice_record.error_description[error_notice_at] = (error_notice_base + 26 + error_notice_at + 1) % 256; error_notice_at = error_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Error Notice to the wire, 126 bytes from where the cursor stands */
inline encode_error_notice(error_notice_record) {
  encode_outgoing_messages_header(error_notice_record.outgoing_messages_header);
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
  skip
}

/* Error Notice off the wire, 126 bytes from where the cursor stands */
inline decode_error_notice(error_notice_record) {
  decode_outgoing_messages_header(error_notice_record.outgoing_messages_header);
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
  skip
}

/* what was read of Error Notice is what was written, byte for byte */
inline equal_error_notice(error_notice_read, error_notice_written) {
  equal_outgoing_messages_header(error_notice_read.outgoing_messages_header, error_notice_written.outgoing_messages_header);
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
  skip
}

/* ---- Bulk Quote Data Acknowledgement: 40 bytes ------------------------------- */

typedef BulkQuoteDataAcknowledgement {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte trader_id[8];
  byte quote_id_identifies_traders_quote_on_this_group[8]
};

int bulk_quote_data_acknowledgement_at;

/* every byte of Bulk Quote Data Acknowledgement set to one value */
inline fill_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_record, bulk_quote_data_acknowledgement_value) {
  fill_outgoing_messages_header(bulk_quote_data_acknowledgement_record.outgoing_messages_header, bulk_quote_data_acknowledgement_value);
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
  :: bulk_quote_data_acknowledgement_at < 8 -> bulk_quote_data_acknowledgement_record.quote_id_identifies_traders_quote_on_this_group[bulk_quote_data_acknowledgement_at] = bulk_quote_data_acknowledgement_value; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bulk Quote Data Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_record, bulk_quote_data_acknowledgement_base) {
  ramp_outgoing_messages_header(bulk_quote_data_acknowledgement_record.outgoing_messages_header, bulk_quote_data_acknowledgement_base + 0);
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 2 -> bulk_quote_data_acknowledgement_record.group[bulk_quote_data_acknowledgement_at] = (bulk_quote_data_acknowledgement_base + 22 + bulk_quote_data_acknowledgement_at + 1) % 256; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> bulk_quote_data_acknowledgement_record.trader_id[bulk_quote_data_acknowledgement_at] = (bulk_quote_data_acknowledgement_base + 24 + bulk_quote_data_acknowledgement_at + 1) % 256; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  bulk_quote_data_acknowledgement_at = 0;
  do
  :: bulk_quote_data_acknowledgement_at < 8 -> bulk_quote_data_acknowledgement_record.quote_id_identifies_traders_quote_on_this_group[bulk_quote_data_acknowledgement_at] = (bulk_quote_data_acknowledgement_base + 32 + bulk_quote_data_acknowledgement_at + 1) % 256; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Bulk Quote Data Acknowledgement to the wire, 40 bytes from where the cursor stands */
inline encode_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_record) {
  encode_outgoing_messages_header(bulk_quote_data_acknowledgement_record.outgoing_messages_header);
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
  :: bulk_quote_data_acknowledgement_at < 8 -> wire[at] = bulk_quote_data_acknowledgement_record.quote_id_identifies_traders_quote_on_this_group[bulk_quote_data_acknowledgement_at]; at = at + 1; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Bulk Quote Data Acknowledgement off the wire, 40 bytes from where the cursor stands */
inline decode_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_record) {
  decode_outgoing_messages_header(bulk_quote_data_acknowledgement_record.outgoing_messages_header);
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
  :: bulk_quote_data_acknowledgement_at < 8 -> bulk_quote_data_acknowledgement_record.quote_id_identifies_traders_quote_on_this_group[bulk_quote_data_acknowledgement_at] = wire[at]; at = at + 1; bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bulk Quote Data Acknowledgement is what was written, byte for byte */
inline equal_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_read, bulk_quote_data_acknowledgement_written) {
  equal_outgoing_messages_header(bulk_quote_data_acknowledgement_read.outgoing_messages_header, bulk_quote_data_acknowledgement_written.outgoing_messages_header);
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
  :: bulk_quote_data_acknowledgement_at < 8 -> assert(bulk_quote_data_acknowledgement_read.quote_id_identifies_traders_quote_on_this_group[bulk_quote_data_acknowledgement_at] == bulk_quote_data_acknowledgement_written.quote_id_identifies_traders_quote_on_this_group[bulk_quote_data_acknowledgement_at]); bulk_quote_data_acknowledgement_at = bulk_quote_data_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Acknowledgement: 148 bytes ---------------------------------------- */

typedef OrderAcknowledgement {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte original_order_id[8];
  byte filler_6[6]
};

int order_acknowledgement_at;

/* every byte of Order Acknowledgement set to one value */
inline fill_order_acknowledgement(order_acknowledgement_record, order_acknowledgement_value) {
  fill_outgoing_messages_header(order_acknowledgement_record.outgoing_messages_header, order_acknowledgement_value);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 2 -> order_acknowledgement_record.group[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.instrument[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
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
  :: order_acknowledgement_at < 6 -> order_acknowledgement_record.filler_6[order_acknowledgement_at] = order_acknowledgement_value; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_order_acknowledgement(order_acknowledgement_record, order_acknowledgement_base) {
  ramp_outgoing_messages_header(order_acknowledgement_record.outgoing_messages_header, order_acknowledgement_base + 0);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 2 -> order_acknowledgement_record.group[order_acknowledgement_at] = (order_acknowledgement_base + 22 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.instrument[order_acknowledgement_at] = (order_acknowledgement_base + 24 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.trader_id[order_acknowledgement_at] = (order_acknowledgement_base + 28 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.order_id[order_acknowledgement_at] = (order_acknowledgement_base + 36 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_record.status = (order_acknowledgement_base + 44 + 1) % 256;
  order_acknowledgement_record.verb_side = (order_acknowledgement_base + 45 + 1) % 256;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.quantity[order_acknowledgement_at] = (order_acknowledgement_base + 46 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 10 -> order_acknowledgement_record.assigned_price[order_acknowledgement_at] = (order_acknowledgement_base + 54 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  ramp_clearing_data(order_acknowledgement_record.clearing_data, order_acknowledgement_base + 64);
  ramp_owner_data(order_acknowledgement_record.owner_data, order_acknowledgement_base + 84);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 8 -> order_acknowledgement_record.original_order_id[order_acknowledgement_at] = (order_acknowledgement_base + 134 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 6 -> order_acknowledgement_record.filler_6[order_acknowledgement_at] = (order_acknowledgement_base + 142 + order_acknowledgement_at + 1) % 256; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement to the wire, 148 bytes from where the cursor stands */
inline encode_order_acknowledgement(order_acknowledgement_record) {
  encode_outgoing_messages_header(order_acknowledgement_record.outgoing_messages_header);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 2 -> wire[at] = order_acknowledgement_record.group[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> wire[at] = order_acknowledgement_record.instrument[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
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
  :: order_acknowledgement_at < 6 -> wire[at] = order_acknowledgement_record.filler_6[order_acknowledgement_at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Acknowledgement off the wire, 148 bytes from where the cursor stands */
inline decode_order_acknowledgement(order_acknowledgement_record) {
  decode_outgoing_messages_header(order_acknowledgement_record.outgoing_messages_header);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 2 -> order_acknowledgement_record.group[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> order_acknowledgement_record.instrument[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
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
  :: order_acknowledgement_at < 6 -> order_acknowledgement_record.filler_6[order_acknowledgement_at] = wire[at]; at = at + 1; order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Acknowledgement is what was written, byte for byte */
inline equal_order_acknowledgement(order_acknowledgement_read, order_acknowledgement_written) {
  equal_outgoing_messages_header(order_acknowledgement_read.outgoing_messages_header, order_acknowledgement_written.outgoing_messages_header);
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 2 -> assert(order_acknowledgement_read.group[order_acknowledgement_at] == order_acknowledgement_written.group[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  order_acknowledgement_at = 0;
  do
  :: order_acknowledgement_at < 4 -> assert(order_acknowledgement_read.instrument[order_acknowledgement_at] == order_acknowledgement_written.instrument[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
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
  :: order_acknowledgement_at < 6 -> assert(order_acknowledgement_read.filler_6[order_acknowledgement_at] == order_acknowledgement_written.filler_6[order_acknowledgement_at]); order_acknowledgement_at = order_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Global Cancellation Confirmation: 33 bytes ------------------------------ */

typedef GlobalCancellationConfirmation {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte trader_id[8];
  byte type_of_cancellation_only_q_quotes_only_can_be_returned
};

int global_cancellation_confirmation_at;

/* every byte of Global Cancellation Confirmation set to one value */
inline fill_global_cancellation_confirmation(global_cancellation_confirmation_record, global_cancellation_confirmation_value) {
  fill_outgoing_messages_header(global_cancellation_confirmation_record.outgoing_messages_header, global_cancellation_confirmation_value);
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
  global_cancellation_confirmation_record.type_of_cancellation_only_q_quotes_only_can_be_returned = global_cancellation_confirmation_value;
  skip
}

/* each byte of Global Cancellation Confirmation set to where it lies, so a field read out of place says so */
inline ramp_global_cancellation_confirmation(global_cancellation_confirmation_record, global_cancellation_confirmation_base) {
  ramp_outgoing_messages_header(global_cancellation_confirmation_record.outgoing_messages_header, global_cancellation_confirmation_base + 0);
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 2 -> global_cancellation_confirmation_record.group[global_cancellation_confirmation_at] = (global_cancellation_confirmation_base + 22 + global_cancellation_confirmation_at + 1) % 256; global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  global_cancellation_confirmation_at = 0;
  do
  :: global_cancellation_confirmation_at < 8 -> global_cancellation_confirmation_record.trader_id[global_cancellation_confirmation_at] = (global_cancellation_confirmation_base + 24 + global_cancellation_confirmation_at + 1) % 256; global_cancellation_confirmation_at = global_cancellation_confirmation_at + 1
  :: else -> break
  od;
  global_cancellation_confirmation_record.type_of_cancellation_only_q_quotes_only_can_be_returned = (global_cancellation_confirmation_base + 32 + 1) % 256;
  skip
}

/* Global Cancellation Confirmation to the wire, 33 bytes from where the cursor stands */
inline encode_global_cancellation_confirmation(global_cancellation_confirmation_record) {
  encode_outgoing_messages_header(global_cancellation_confirmation_record.outgoing_messages_header);
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
  wire[at] = global_cancellation_confirmation_record.type_of_cancellation_only_q_quotes_only_can_be_returned; at = at + 1;
  skip
}

/* Global Cancellation Confirmation off the wire, 33 bytes from where the cursor stands */
inline decode_global_cancellation_confirmation(global_cancellation_confirmation_record) {
  decode_outgoing_messages_header(global_cancellation_confirmation_record.outgoing_messages_header);
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
  global_cancellation_confirmation_record.type_of_cancellation_only_q_quotes_only_can_be_returned = wire[at]; at = at + 1;
  skip
}

/* what was read of Global Cancellation Confirmation is what was written, byte for byte */
inline equal_global_cancellation_confirmation(global_cancellation_confirmation_read, global_cancellation_confirmation_written) {
  equal_outgoing_messages_header(global_cancellation_confirmation_read.outgoing_messages_header, global_cancellation_confirmation_written.outgoing_messages_header);
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
  assert(global_cancellation_confirmation_read.type_of_cancellation_only_q_quotes_only_can_be_returned == global_cancellation_confirmation_written.type_of_cancellation_only_q_quotes_only_can_be_returned);
  skip
}

/* ---- Order Modification Acknowledgement: 148 bytes --------------------------- */

/* This message is sent by the Exchange to acknowledge an OM: Order Modification message. This message has the same format as the KE: Order Acknowledgement (the extensive list of fields is only described there), KZ: Order Cancellation Acknowledgement and NZ: Order Cancellation Notice (by MOD or System) messages. */
typedef OrderModificationAcknowledgement {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte original_order_id[8];
  byte filler_6[6]
};

int order_modification_acknowledgement_at;

/* every byte of Order Modification Acknowledgement set to one value */
inline fill_order_modification_acknowledgement(order_modification_acknowledgement_record, order_modification_acknowledgement_value) {
  fill_outgoing_messages_header(order_modification_acknowledgement_record.outgoing_messages_header, order_modification_acknowledgement_value);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 2 -> order_modification_acknowledgement_record.group[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> order_modification_acknowledgement_record.instrument[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
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
  :: order_modification_acknowledgement_at < 6 -> order_modification_acknowledgement_record.filler_6[order_modification_acknowledgement_at] = order_modification_acknowledgement_value; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Modification Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_order_modification_acknowledgement(order_modification_acknowledgement_record, order_modification_acknowledgement_base) {
  ramp_outgoing_messages_header(order_modification_acknowledgement_record.outgoing_messages_header, order_modification_acknowledgement_base + 0);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 2 -> order_modification_acknowledgement_record.group[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 22 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> order_modification_acknowledgement_record.instrument[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 24 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.trader_id[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 28 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.order_id[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 36 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_record.status = (order_modification_acknowledgement_base + 44 + 1) % 256;
  order_modification_acknowledgement_record.verb_side = (order_modification_acknowledgement_base + 45 + 1) % 256;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.quantity[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 46 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 10 -> order_modification_acknowledgement_record.assigned_price[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 54 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  ramp_clearing_data(order_modification_acknowledgement_record.clearing_data, order_modification_acknowledgement_base + 64);
  ramp_owner_data(order_modification_acknowledgement_record.owner_data, order_modification_acknowledgement_base + 84);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 8 -> order_modification_acknowledgement_record.original_order_id[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 134 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 6 -> order_modification_acknowledgement_record.filler_6[order_modification_acknowledgement_at] = (order_modification_acknowledgement_base + 142 + order_modification_acknowledgement_at + 1) % 256; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modification Acknowledgement to the wire, 148 bytes from where the cursor stands */
inline encode_order_modification_acknowledgement(order_modification_acknowledgement_record) {
  encode_outgoing_messages_header(order_modification_acknowledgement_record.outgoing_messages_header);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 2 -> wire[at] = order_modification_acknowledgement_record.group[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> wire[at] = order_modification_acknowledgement_record.instrument[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
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
  :: order_modification_acknowledgement_at < 6 -> wire[at] = order_modification_acknowledgement_record.filler_6[order_modification_acknowledgement_at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Modification Acknowledgement off the wire, 148 bytes from where the cursor stands */
inline decode_order_modification_acknowledgement(order_modification_acknowledgement_record) {
  decode_outgoing_messages_header(order_modification_acknowledgement_record.outgoing_messages_header);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 2 -> order_modification_acknowledgement_record.group[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> order_modification_acknowledgement_record.instrument[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
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
  :: order_modification_acknowledgement_at < 6 -> order_modification_acknowledgement_record.filler_6[order_modification_acknowledgement_at] = wire[at]; at = at + 1; order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Modification Acknowledgement is what was written, byte for byte */
inline equal_order_modification_acknowledgement(order_modification_acknowledgement_read, order_modification_acknowledgement_written) {
  equal_outgoing_messages_header(order_modification_acknowledgement_read.outgoing_messages_header, order_modification_acknowledgement_written.outgoing_messages_header);
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 2 -> assert(order_modification_acknowledgement_read.group[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.group[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  order_modification_acknowledgement_at = 0;
  do
  :: order_modification_acknowledgement_at < 4 -> assert(order_modification_acknowledgement_read.instrument[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.instrument[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
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
  :: order_modification_acknowledgement_at < 6 -> assert(order_modification_acknowledgement_read.filler_6[order_modification_acknowledgement_at] == order_modification_acknowledgement_written.filler_6[order_modification_acknowledgement_at]); order_modification_acknowledgement_at = order_modification_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Standard Acknowledgement: 32 bytes -------------------------------------- */

typedef StandardAcknowledgement {
  OutgoingMessagesHeader outgoing_messages_header;
  byte trader_id[8];
  byte original_message_type_af_gz_ml_ox_or_rq[2]
};

int standard_acknowledgement_at;

/* every byte of Standard Acknowledgement set to one value */
inline fill_standard_acknowledgement(standard_acknowledgement_record, standard_acknowledgement_value) {
  fill_outgoing_messages_header(standard_acknowledgement_record.outgoing_messages_header, standard_acknowledgement_value);
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 8 -> standard_acknowledgement_record.trader_id[standard_acknowledgement_at] = standard_acknowledgement_value; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 2 -> standard_acknowledgement_record.original_message_type_af_gz_ml_ox_or_rq[standard_acknowledgement_at] = standard_acknowledgement_value; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Standard Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_standard_acknowledgement(standard_acknowledgement_record, standard_acknowledgement_base) {
  ramp_outgoing_messages_header(standard_acknowledgement_record.outgoing_messages_header, standard_acknowledgement_base + 0);
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 8 -> standard_acknowledgement_record.trader_id[standard_acknowledgement_at] = (standard_acknowledgement_base + 22 + standard_acknowledgement_at + 1) % 256; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 2 -> standard_acknowledgement_record.original_message_type_af_gz_ml_ox_or_rq[standard_acknowledgement_at] = (standard_acknowledgement_base + 30 + standard_acknowledgement_at + 1) % 256; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Standard Acknowledgement to the wire, 32 bytes from where the cursor stands */
inline encode_standard_acknowledgement(standard_acknowledgement_record) {
  encode_outgoing_messages_header(standard_acknowledgement_record.outgoing_messages_header);
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 8 -> wire[at] = standard_acknowledgement_record.trader_id[standard_acknowledgement_at]; at = at + 1; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 2 -> wire[at] = standard_acknowledgement_record.original_message_type_af_gz_ml_ox_or_rq[standard_acknowledgement_at]; at = at + 1; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Standard Acknowledgement off the wire, 32 bytes from where the cursor stands */
inline decode_standard_acknowledgement(standard_acknowledgement_record) {
  decode_outgoing_messages_header(standard_acknowledgement_record.outgoing_messages_header);
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 8 -> standard_acknowledgement_record.trader_id[standard_acknowledgement_at] = wire[at]; at = at + 1; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 2 -> standard_acknowledgement_record.original_message_type_af_gz_ml_ox_or_rq[standard_acknowledgement_at] = wire[at]; at = at + 1; standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Standard Acknowledgement is what was written, byte for byte */
inline equal_standard_acknowledgement(standard_acknowledgement_read, standard_acknowledgement_written) {
  equal_outgoing_messages_header(standard_acknowledgement_read.outgoing_messages_header, standard_acknowledgement_written.outgoing_messages_header);
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 8 -> assert(standard_acknowledgement_read.trader_id[standard_acknowledgement_at] == standard_acknowledgement_written.trader_id[standard_acknowledgement_at]); standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  standard_acknowledgement_at = 0;
  do
  :: standard_acknowledgement_at < 2 -> assert(standard_acknowledgement_read.original_message_type_af_gz_ml_ox_or_rq[standard_acknowledgement_at] == standard_acknowledgement_written.original_message_type_af_gz_ml_ox_or_rq[standard_acknowledgement_at]); standard_acknowledgement_at = standard_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancellation Acknowledgement: 148 bytes --------------------------- */

/* This message is to acknowledge an XE: Order Cancellation message. This message has the same number of bytes and format as the KE: Order Acknowledgement (the extensive list of fields is only described there), the KM: Order Modification Acknowledgement and the NZ: Order Cancellation Notice (by MOD or System) messages. */
typedef OrderCancellationAcknowledgement {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte original_order_id[8];
  byte filler_6[6]
};

int order_cancellation_acknowledgement_at;

/* every byte of Order Cancellation Acknowledgement set to one value */
inline fill_order_cancellation_acknowledgement(order_cancellation_acknowledgement_record, order_cancellation_acknowledgement_value) {
  fill_outgoing_messages_header(order_cancellation_acknowledgement_record.outgoing_messages_header, order_cancellation_acknowledgement_value);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 2 -> order_cancellation_acknowledgement_record.group[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> order_cancellation_acknowledgement_record.instrument[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
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
  :: order_cancellation_acknowledgement_at < 6 -> order_cancellation_acknowledgement_record.filler_6[order_cancellation_acknowledgement_at] = order_cancellation_acknowledgement_value; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancellation Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_order_cancellation_acknowledgement(order_cancellation_acknowledgement_record, order_cancellation_acknowledgement_base) {
  ramp_outgoing_messages_header(order_cancellation_acknowledgement_record.outgoing_messages_header, order_cancellation_acknowledgement_base + 0);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 2 -> order_cancellation_acknowledgement_record.group[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 22 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> order_cancellation_acknowledgement_record.instrument[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 24 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.trader_id[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 28 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.order_id[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 36 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_record.status = (order_cancellation_acknowledgement_base + 44 + 1) % 256;
  order_cancellation_acknowledgement_record.verb_side = (order_cancellation_acknowledgement_base + 45 + 1) % 256;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.quantity[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 46 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 10 -> order_cancellation_acknowledgement_record.assigned_price[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 54 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  ramp_clearing_data(order_cancellation_acknowledgement_record.clearing_data, order_cancellation_acknowledgement_base + 64);
  ramp_owner_data(order_cancellation_acknowledgement_record.owner_data, order_cancellation_acknowledgement_base + 84);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 8 -> order_cancellation_acknowledgement_record.original_order_id[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 134 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 6 -> order_cancellation_acknowledgement_record.filler_6[order_cancellation_acknowledgement_at] = (order_cancellation_acknowledgement_base + 142 + order_cancellation_acknowledgement_at + 1) % 256; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Acknowledgement to the wire, 148 bytes from where the cursor stands */
inline encode_order_cancellation_acknowledgement(order_cancellation_acknowledgement_record) {
  encode_outgoing_messages_header(order_cancellation_acknowledgement_record.outgoing_messages_header);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 2 -> wire[at] = order_cancellation_acknowledgement_record.group[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> wire[at] = order_cancellation_acknowledgement_record.instrument[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
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
  :: order_cancellation_acknowledgement_at < 6 -> wire[at] = order_cancellation_acknowledgement_record.filler_6[order_cancellation_acknowledgement_at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Acknowledgement off the wire, 148 bytes from where the cursor stands */
inline decode_order_cancellation_acknowledgement(order_cancellation_acknowledgement_record) {
  decode_outgoing_messages_header(order_cancellation_acknowledgement_record.outgoing_messages_header);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 2 -> order_cancellation_acknowledgement_record.group[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> order_cancellation_acknowledgement_record.instrument[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
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
  :: order_cancellation_acknowledgement_at < 6 -> order_cancellation_acknowledgement_record.filler_6[order_cancellation_acknowledgement_at] = wire[at]; at = at + 1; order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancellation Acknowledgement is what was written, byte for byte */
inline equal_order_cancellation_acknowledgement(order_cancellation_acknowledgement_read, order_cancellation_acknowledgement_written) {
  equal_outgoing_messages_header(order_cancellation_acknowledgement_read.outgoing_messages_header, order_cancellation_acknowledgement_written.outgoing_messages_header);
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 2 -> assert(order_cancellation_acknowledgement_read.group[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.group[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  order_cancellation_acknowledgement_at = 0;
  do
  :: order_cancellation_acknowledgement_at < 4 -> assert(order_cancellation_acknowledgement_read.instrument[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.instrument[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
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
  :: order_cancellation_acknowledgement_at < 6 -> assert(order_cancellation_acknowledgement_read.filler_6[order_cancellation_acknowledgement_at] == order_cancellation_acknowledgement_written.filler_6[order_cancellation_acknowledgement_at]); order_cancellation_acknowledgement_at = order_cancellation_acknowledgement_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group State Change: 25 bytes -------------------------------------------- */

typedef GroupStateChange {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte group_state
};

int group_state_change_at;

/* every byte of Group State Change set to one value */
inline fill_group_state_change(group_state_change_record, group_state_change_value) {
  fill_outgoing_messages_header(group_state_change_record.outgoing_messages_header, group_state_change_value);
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
  ramp_outgoing_messages_header(group_state_change_record.outgoing_messages_header, group_state_change_base + 0);
  group_state_change_at = 0;
  do
  :: group_state_change_at < 2 -> group_state_change_record.group[group_state_change_at] = (group_state_change_base + 22 + group_state_change_at + 1) % 256; group_state_change_at = group_state_change_at + 1
  :: else -> break
  od;
  group_state_change_record.group_state = (group_state_change_base + 24 + 1) % 256;
  skip
}

/* Group State Change to the wire, 25 bytes from where the cursor stands */
inline encode_group_state_change(group_state_change_record) {
  encode_outgoing_messages_header(group_state_change_record.outgoing_messages_header);
  group_state_change_at = 0;
  do
  :: group_state_change_at < 2 -> wire[at] = group_state_change_record.group[group_state_change_at]; at = at + 1; group_state_change_at = group_state_change_at + 1
  :: else -> break
  od;
  wire[at] = group_state_change_record.group_state; at = at + 1;
  skip
}

/* Group State Change off the wire, 25 bytes from where the cursor stands */
inline decode_group_state_change(group_state_change_record) {
  decode_outgoing_messages_header(group_state_change_record.outgoing_messages_header);
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
  equal_outgoing_messages_header(group_state_change_read.outgoing_messages_header, group_state_change_written.outgoing_messages_header);
  group_state_change_at = 0;
  do
  :: group_state_change_at < 2 -> assert(group_state_change_read.group[group_state_change_at] == group_state_change_written.group[group_state_change_at]); group_state_change_at = group_state_change_at + 1
  :: else -> break
  od;
  assert(group_state_change_read.group_state == group_state_change_written.group_state);
  skip
}

/* ---- Instrument State Change: 29 bytes --------------------------------------- */

typedef InstrumentStateChange {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte instrument_state
};

int instrument_state_change_at;

/* every byte of Instrument State Change set to one value */
inline fill_instrument_state_change(instrument_state_change_record, instrument_state_change_value) {
  fill_outgoing_messages_header(instrument_state_change_record.outgoing_messages_header, instrument_state_change_value);
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 2 -> instrument_state_change_record.group[instrument_state_change_at] = instrument_state_change_value; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 4 -> instrument_state_change_record.instrument[instrument_state_change_at] = instrument_state_change_value; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_record.instrument_state = instrument_state_change_value;
  skip
}

/* each byte of Instrument State Change set to where it lies, so a field read out of place says so */
inline ramp_instrument_state_change(instrument_state_change_record, instrument_state_change_base) {
  ramp_outgoing_messages_header(instrument_state_change_record.outgoing_messages_header, instrument_state_change_base + 0);
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 2 -> instrument_state_change_record.group[instrument_state_change_at] = (instrument_state_change_base + 22 + instrument_state_change_at + 1) % 256; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 4 -> instrument_state_change_record.instrument[instrument_state_change_at] = (instrument_state_change_base + 24 + instrument_state_change_at + 1) % 256; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_record.instrument_state = (instrument_state_change_base + 28 + 1) % 256;
  skip
}

/* Instrument State Change to the wire, 29 bytes from where the cursor stands */
inline encode_instrument_state_change(instrument_state_change_record) {
  encode_outgoing_messages_header(instrument_state_change_record.outgoing_messages_header);
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 2 -> wire[at] = instrument_state_change_record.group[instrument_state_change_at]; at = at + 1; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 4 -> wire[at] = instrument_state_change_record.instrument[instrument_state_change_at]; at = at + 1; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  wire[at] = instrument_state_change_record.instrument_state; at = at + 1;
  skip
}

/* Instrument State Change off the wire, 29 bytes from where the cursor stands */
inline decode_instrument_state_change(instrument_state_change_record) {
  decode_outgoing_messages_header(instrument_state_change_record.outgoing_messages_header);
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 2 -> instrument_state_change_record.group[instrument_state_change_at] = wire[at]; at = at + 1; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 4 -> instrument_state_change_record.instrument[instrument_state_change_at] = wire[at]; at = at + 1; instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_record.instrument_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument State Change is what was written, byte for byte */
inline equal_instrument_state_change(instrument_state_change_read, instrument_state_change_written) {
  equal_outgoing_messages_header(instrument_state_change_read.outgoing_messages_header, instrument_state_change_written.outgoing_messages_header);
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 2 -> assert(instrument_state_change_read.group[instrument_state_change_at] == instrument_state_change_written.group[instrument_state_change_at]); instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  instrument_state_change_at = 0;
  do
  :: instrument_state_change_at < 4 -> assert(instrument_state_change_read.instrument[instrument_state_change_at] == instrument_state_change_written.instrument[instrument_state_change_at]); instrument_state_change_at = instrument_state_change_at + 1
  :: else -> break
  od;
  assert(instrument_state_change_read.instrument_state == instrument_state_change_written.instrument_state);
  skip
}

/* ---- Leg Execution Notice: 235 bytes ----------------------------------------- */

typedef LegExecutionNotice {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte trader_id[8];
  byte reference_id_order_id_or_quote_id[8];
  byte verb_side;
  byte quantity_traded[8];
  byte trade_price[10];
  byte trading_engine_timestamp_of_the_trade_local_hhmmss[6];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte special_trade_indicator;
  byte price_type;
  byte trade_type;
  byte filler_6[6];
  byte trade_number[8];
  byte trade_memo[50];
  byte original_reference_id[8];
  byte id_code_for_the_counterpart_participant[4];
  byte strategy_group[2];
  byte strategy_instrument_id[4];
  byte strategy_verb_side;
  byte strategy_trade_number[8];
  byte leg_number[2]
};

int leg_execution_notice_at;

/* every byte of Leg Execution Notice set to one value */
inline fill_leg_execution_notice(leg_execution_notice_record, leg_execution_notice_value) {
  fill_outgoing_messages_header(leg_execution_notice_record.outgoing_messages_header, leg_execution_notice_value);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.group[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.instrument[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.trader_id[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.reference_id_order_id_or_quote_id[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
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
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  fill_clearing_data(leg_execution_notice_record.clearing_data, leg_execution_notice_value);
  fill_owner_data(leg_execution_notice_record.owner_data, leg_execution_notice_value);
  leg_execution_notice_record.special_trade_indicator = leg_execution_notice_value;
  leg_execution_notice_record.price_type = leg_execution_notice_value;
  leg_execution_notice_record.trade_type = leg_execution_notice_value;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.filler_6[leg_execution_notice_at] = leg_execution_notice_value; leg_execution_notice_at = leg_execution_notice_at + 1
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
  skip
}

/* each byte of Leg Execution Notice set to where it lies, so a field read out of place says so */
inline ramp_leg_execution_notice(leg_execution_notice_record, leg_execution_notice_base) {
  ramp_outgoing_messages_header(leg_execution_notice_record.outgoing_messages_header, leg_execution_notice_base + 0);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.group[leg_execution_notice_at] = (leg_execution_notice_base + 22 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.instrument[leg_execution_notice_at] = (leg_execution_notice_base + 24 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.trader_id[leg_execution_notice_at] = (leg_execution_notice_base + 28 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.reference_id_order_id_or_quote_id[leg_execution_notice_at] = (leg_execution_notice_base + 36 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_record.verb_side = (leg_execution_notice_base + 44 + 1) % 256;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.quantity_traded[leg_execution_notice_at] = (leg_execution_notice_base + 45 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 10 -> leg_execution_notice_record.trade_price[leg_execution_notice_at] = (leg_execution_notice_base + 53 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_notice_at] = (leg_execution_notice_base + 63 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  ramp_clearing_data(leg_execution_notice_record.clearing_data, leg_execution_notice_base + 69);
  ramp_owner_data(leg_execution_notice_record.owner_data, leg_execution_notice_base + 89);
  leg_execution_notice_record.special_trade_indicator = (leg_execution_notice_base + 139 + 1) % 256;
  leg_execution_notice_record.price_type = (leg_execution_notice_base + 140 + 1) % 256;
  leg_execution_notice_record.trade_type = (leg_execution_notice_base + 141 + 1) % 256;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.filler_6[leg_execution_notice_at] = (leg_execution_notice_base + 142 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.trade_number[leg_execution_notice_at] = (leg_execution_notice_base + 148 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 50 -> leg_execution_notice_record.trade_memo[leg_execution_notice_at] = (leg_execution_notice_base + 156 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.original_reference_id[leg_execution_notice_at] = (leg_execution_notice_base + 206 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.id_code_for_the_counterpart_participant[leg_execution_notice_at] = (leg_execution_notice_base + 214 + leg_execution_notice_at + 1) % 256; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
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
  skip
}

/* Leg Execution Notice to the wire, 235 bytes from where the cursor stands */
inline encode_leg_execution_notice(leg_execution_notice_record) {
  encode_outgoing_messages_header(leg_execution_notice_record.outgoing_messages_header);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> wire[at] = leg_execution_notice_record.group[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> wire[at] = leg_execution_notice_record.instrument[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> wire[at] = leg_execution_notice_record.trader_id[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> wire[at] = leg_execution_notice_record.reference_id_order_id_or_quote_id[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
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
  :: leg_execution_notice_at < 6 -> wire[at] = leg_execution_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  encode_clearing_data(leg_execution_notice_record.clearing_data);
  encode_owner_data(leg_execution_notice_record.owner_data);
  wire[at] = leg_execution_notice_record.special_trade_indicator; at = at + 1;
  wire[at] = leg_execution_notice_record.price_type; at = at + 1;
  wire[at] = leg_execution_notice_record.trade_type; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> wire[at] = leg_execution_notice_record.filler_6[leg_execution_notice_at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
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
  skip
}

/* Leg Execution Notice off the wire, 235 bytes from where the cursor stands */
inline decode_leg_execution_notice(leg_execution_notice_record) {
  decode_outgoing_messages_header(leg_execution_notice_record.outgoing_messages_header);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> leg_execution_notice_record.group[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> leg_execution_notice_record.instrument[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.trader_id[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> leg_execution_notice_record.reference_id_order_id_or_quote_id[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
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
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  decode_clearing_data(leg_execution_notice_record.clearing_data);
  decode_owner_data(leg_execution_notice_record.owner_data);
  leg_execution_notice_record.special_trade_indicator = wire[at]; at = at + 1;
  leg_execution_notice_record.price_type = wire[at]; at = at + 1;
  leg_execution_notice_record.trade_type = wire[at]; at = at + 1;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> leg_execution_notice_record.filler_6[leg_execution_notice_at] = wire[at]; at = at + 1; leg_execution_notice_at = leg_execution_notice_at + 1
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
  skip
}

/* what was read of Leg Execution Notice is what was written, byte for byte */
inline equal_leg_execution_notice(leg_execution_notice_read, leg_execution_notice_written) {
  equal_outgoing_messages_header(leg_execution_notice_read.outgoing_messages_header, leg_execution_notice_written.outgoing_messages_header);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 2 -> assert(leg_execution_notice_read.group[leg_execution_notice_at] == leg_execution_notice_written.group[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 4 -> assert(leg_execution_notice_read.instrument[leg_execution_notice_at] == leg_execution_notice_written.instrument[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> assert(leg_execution_notice_read.trader_id[leg_execution_notice_at] == leg_execution_notice_written.trader_id[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 8 -> assert(leg_execution_notice_read.reference_id_order_id_or_quote_id[leg_execution_notice_at] == leg_execution_notice_written.reference_id_order_id_or_quote_id[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
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
  :: leg_execution_notice_at < 6 -> assert(leg_execution_notice_read.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_notice_at] == leg_execution_notice_written.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
  :: else -> break
  od;
  equal_clearing_data(leg_execution_notice_read.clearing_data, leg_execution_notice_written.clearing_data);
  equal_owner_data(leg_execution_notice_read.owner_data, leg_execution_notice_written.owner_data);
  assert(leg_execution_notice_read.special_trade_indicator == leg_execution_notice_written.special_trade_indicator);
  assert(leg_execution_notice_read.price_type == leg_execution_notice_written.price_type);
  assert(leg_execution_notice_read.trade_type == leg_execution_notice_written.trade_type);
  leg_execution_notice_at = 0;
  do
  :: leg_execution_notice_at < 6 -> assert(leg_execution_notice_read.filler_6[leg_execution_notice_at] == leg_execution_notice_written.filler_6[leg_execution_notice_at]); leg_execution_notice_at = leg_execution_notice_at + 1
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
  skip
}

/* ---- Counterpart Owner Data: 50 bytes ---------------------------------------- */

/* Owner Data of the counterpart, which NO: Overstepped Order or Quote Notice carries. */
typedef CounterpartOwnerData {
  byte memo[50]
};

int counterpart_owner_data_at;

/* every byte of Counterpart Owner Data set to one value */
inline fill_counterpart_owner_data(counterpart_owner_data_record, counterpart_owner_data_value) {
  counterpart_owner_data_at = 0;
  do
  :: counterpart_owner_data_at < 50 -> counterpart_owner_data_record.memo[counterpart_owner_data_at] = counterpart_owner_data_value; counterpart_owner_data_at = counterpart_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Counterpart Owner Data set to where it lies, so a field read out of place says so */
inline ramp_counterpart_owner_data(counterpart_owner_data_record, counterpart_owner_data_base) {
  counterpart_owner_data_at = 0;
  do
  :: counterpart_owner_data_at < 50 -> counterpart_owner_data_record.memo[counterpart_owner_data_at] = (counterpart_owner_data_base + 0 + counterpart_owner_data_at + 1) % 256; counterpart_owner_data_at = counterpart_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Counterpart Owner Data to the wire, 50 bytes from where the cursor stands */
inline encode_counterpart_owner_data(counterpart_owner_data_record) {
  counterpart_owner_data_at = 0;
  do
  :: counterpart_owner_data_at < 50 -> wire[at] = counterpart_owner_data_record.memo[counterpart_owner_data_at]; at = at + 1; counterpart_owner_data_at = counterpart_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* Counterpart Owner Data off the wire, 50 bytes from where the cursor stands */
inline decode_counterpart_owner_data(counterpart_owner_data_record) {
  counterpart_owner_data_at = 0;
  do
  :: counterpart_owner_data_at < 50 -> counterpart_owner_data_record.memo[counterpart_owner_data_at] = wire[at]; at = at + 1; counterpart_owner_data_at = counterpart_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Counterpart Owner Data is what was written, byte for byte */
inline equal_counterpart_owner_data(counterpart_owner_data_read, counterpart_owner_data_written) {
  counterpart_owner_data_at = 0;
  do
  :: counterpart_owner_data_at < 50 -> assert(counterpart_owner_data_read.memo[counterpart_owner_data_at] == counterpart_owner_data_written.memo[counterpart_owner_data_at]); counterpart_owner_data_at = counterpart_owner_data_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Overstepped Order Or Quote Notice: 112 bytes ---------------------------- */

typedef OversteppedOrderOrQuoteNotice {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte verb;
  byte order_type;
  byte trader_id[8];
  byte order_id[8];
  byte counterpart_trader_id[8];
  byte counterpart_order_id[8];
  CounterpartOwnerData counterpart_owner_data
};

int overstepped_order_or_quote_notice_at;

/* every byte of Overstepped Order Or Quote Notice set to one value */
inline fill_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_record, overstepped_order_or_quote_notice_value) {
  fill_outgoing_messages_header(overstepped_order_or_quote_notice_record.outgoing_messages_header, overstepped_order_or_quote_notice_value);
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 2 -> overstepped_order_or_quote_notice_record.group[overstepped_order_or_quote_notice_at] = overstepped_order_or_quote_notice_value; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 4 -> overstepped_order_or_quote_notice_record.instrument[overstepped_order_or_quote_notice_at] = overstepped_order_or_quote_notice_value; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_record.verb = overstepped_order_or_quote_notice_value;
  overstepped_order_or_quote_notice_record.order_type = overstepped_order_or_quote_notice_value;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.trader_id[overstepped_order_or_quote_notice_at] = overstepped_order_or_quote_notice_value; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.order_id[overstepped_order_or_quote_notice_at] = overstepped_order_or_quote_notice_value; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.counterpart_trader_id[overstepped_order_or_quote_notice_at] = overstepped_order_or_quote_notice_value; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.counterpart_order_id[overstepped_order_or_quote_notice_at] = overstepped_order_or_quote_notice_value; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  fill_counterpart_owner_data(overstepped_order_or_quote_notice_record.counterpart_owner_data, overstepped_order_or_quote_notice_value);
  skip
}

/* each byte of Overstepped Order Or Quote Notice set to where it lies, so a field read out of place says so */
inline ramp_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_record, overstepped_order_or_quote_notice_base) {
  ramp_outgoing_messages_header(overstepped_order_or_quote_notice_record.outgoing_messages_header, overstepped_order_or_quote_notice_base + 0);
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 2 -> overstepped_order_or_quote_notice_record.group[overstepped_order_or_quote_notice_at] = (overstepped_order_or_quote_notice_base + 22 + overstepped_order_or_quote_notice_at + 1) % 256; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 4 -> overstepped_order_or_quote_notice_record.instrument[overstepped_order_or_quote_notice_at] = (overstepped_order_or_quote_notice_base + 24 + overstepped_order_or_quote_notice_at + 1) % 256; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_record.verb = (overstepped_order_or_quote_notice_base + 28 + 1) % 256;
  overstepped_order_or_quote_notice_record.order_type = (overstepped_order_or_quote_notice_base + 29 + 1) % 256;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.trader_id[overstepped_order_or_quote_notice_at] = (overstepped_order_or_quote_notice_base + 30 + overstepped_order_or_quote_notice_at + 1) % 256; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.order_id[overstepped_order_or_quote_notice_at] = (overstepped_order_or_quote_notice_base + 38 + overstepped_order_or_quote_notice_at + 1) % 256; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.counterpart_trader_id[overstepped_order_or_quote_notice_at] = (overstepped_order_or_quote_notice_base + 46 + overstepped_order_or_quote_notice_at + 1) % 256; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.counterpart_order_id[overstepped_order_or_quote_notice_at] = (overstepped_order_or_quote_notice_base + 54 + overstepped_order_or_quote_notice_at + 1) % 256; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  ramp_counterpart_owner_data(overstepped_order_or_quote_notice_record.counterpart_owner_data, overstepped_order_or_quote_notice_base + 62);
  skip
}

/* Overstepped Order Or Quote Notice to the wire, 112 bytes from where the cursor stands */
inline encode_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_record) {
  encode_outgoing_messages_header(overstepped_order_or_quote_notice_record.outgoing_messages_header);
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 2 -> wire[at] = overstepped_order_or_quote_notice_record.group[overstepped_order_or_quote_notice_at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 4 -> wire[at] = overstepped_order_or_quote_notice_record.instrument[overstepped_order_or_quote_notice_at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  wire[at] = overstepped_order_or_quote_notice_record.verb; at = at + 1;
  wire[at] = overstepped_order_or_quote_notice_record.order_type; at = at + 1;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> wire[at] = overstepped_order_or_quote_notice_record.trader_id[overstepped_order_or_quote_notice_at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> wire[at] = overstepped_order_or_quote_notice_record.order_id[overstepped_order_or_quote_notice_at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> wire[at] = overstepped_order_or_quote_notice_record.counterpart_trader_id[overstepped_order_or_quote_notice_at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> wire[at] = overstepped_order_or_quote_notice_record.counterpart_order_id[overstepped_order_or_quote_notice_at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  encode_counterpart_owner_data(overstepped_order_or_quote_notice_record.counterpart_owner_data);
  skip
}

/* Overstepped Order Or Quote Notice off the wire, 112 bytes from where the cursor stands */
inline decode_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_record) {
  decode_outgoing_messages_header(overstepped_order_or_quote_notice_record.outgoing_messages_header);
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 2 -> overstepped_order_or_quote_notice_record.group[overstepped_order_or_quote_notice_at] = wire[at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 4 -> overstepped_order_or_quote_notice_record.instrument[overstepped_order_or_quote_notice_at] = wire[at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_record.verb = wire[at]; at = at + 1;
  overstepped_order_or_quote_notice_record.order_type = wire[at]; at = at + 1;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.trader_id[overstepped_order_or_quote_notice_at] = wire[at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.order_id[overstepped_order_or_quote_notice_at] = wire[at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.counterpart_trader_id[overstepped_order_or_quote_notice_at] = wire[at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> overstepped_order_or_quote_notice_record.counterpart_order_id[overstepped_order_or_quote_notice_at] = wire[at]; at = at + 1; overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  decode_counterpart_owner_data(overstepped_order_or_quote_notice_record.counterpart_owner_data);
  skip
}

/* what was read of Overstepped Order Or Quote Notice is what was written, byte for byte */
inline equal_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_read, overstepped_order_or_quote_notice_written) {
  equal_outgoing_messages_header(overstepped_order_or_quote_notice_read.outgoing_messages_header, overstepped_order_or_quote_notice_written.outgoing_messages_header);
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 2 -> assert(overstepped_order_or_quote_notice_read.group[overstepped_order_or_quote_notice_at] == overstepped_order_or_quote_notice_written.group[overstepped_order_or_quote_notice_at]); overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 4 -> assert(overstepped_order_or_quote_notice_read.instrument[overstepped_order_or_quote_notice_at] == overstepped_order_or_quote_notice_written.instrument[overstepped_order_or_quote_notice_at]); overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  assert(overstepped_order_or_quote_notice_read.verb == overstepped_order_or_quote_notice_written.verb);
  assert(overstepped_order_or_quote_notice_read.order_type == overstepped_order_or_quote_notice_written.order_type);
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> assert(overstepped_order_or_quote_notice_read.trader_id[overstepped_order_or_quote_notice_at] == overstepped_order_or_quote_notice_written.trader_id[overstepped_order_or_quote_notice_at]); overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> assert(overstepped_order_or_quote_notice_read.order_id[overstepped_order_or_quote_notice_at] == overstepped_order_or_quote_notice_written.order_id[overstepped_order_or_quote_notice_at]); overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> assert(overstepped_order_or_quote_notice_read.counterpart_trader_id[overstepped_order_or_quote_notice_at] == overstepped_order_or_quote_notice_written.counterpart_trader_id[overstepped_order_or_quote_notice_at]); overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  overstepped_order_or_quote_notice_at = 0;
  do
  :: overstepped_order_or_quote_notice_at < 8 -> assert(overstepped_order_or_quote_notice_read.counterpart_order_id[overstepped_order_or_quote_notice_at] == overstepped_order_or_quote_notice_written.counterpart_order_id[overstepped_order_or_quote_notice_at]); overstepped_order_or_quote_notice_at = overstepped_order_or_quote_notice_at + 1
  :: else -> break
  od;
  equal_counterpart_owner_data(overstepped_order_or_quote_notice_read.counterpart_owner_data, overstepped_order_or_quote_notice_written.counterpart_owner_data);
  skip
}

/* ---- Cancellation Of All Quotes Notice: 37 bytes ----------------------------- */

typedef CancellationOfAllQuotesNotice {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte trader_id[8];
  byte cancel_reason
};

int cancellation_of_all_quotes_notice_at;

/* every byte of Cancellation Of All Quotes Notice set to one value */
inline fill_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_record, cancellation_of_all_quotes_notice_value) {
  fill_outgoing_messages_header(cancellation_of_all_quotes_notice_record.outgoing_messages_header, cancellation_of_all_quotes_notice_value);
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 2 -> cancellation_of_all_quotes_notice_record.group[cancellation_of_all_quotes_notice_at] = cancellation_of_all_quotes_notice_value; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 4 -> cancellation_of_all_quotes_notice_record.instrument[cancellation_of_all_quotes_notice_at] = cancellation_of_all_quotes_notice_value; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 8 -> cancellation_of_all_quotes_notice_record.trader_id[cancellation_of_all_quotes_notice_at] = cancellation_of_all_quotes_notice_value; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_record.cancel_reason = cancellation_of_all_quotes_notice_value;
  skip
}

/* each byte of Cancellation Of All Quotes Notice set to where it lies, so a field read out of place says so */
inline ramp_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_record, cancellation_of_all_quotes_notice_base) {
  ramp_outgoing_messages_header(cancellation_of_all_quotes_notice_record.outgoing_messages_header, cancellation_of_all_quotes_notice_base + 0);
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 2 -> cancellation_of_all_quotes_notice_record.group[cancellation_of_all_quotes_notice_at] = (cancellation_of_all_quotes_notice_base + 22 + cancellation_of_all_quotes_notice_at + 1) % 256; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 4 -> cancellation_of_all_quotes_notice_record.instrument[cancellation_of_all_quotes_notice_at] = (cancellation_of_all_quotes_notice_base + 24 + cancellation_of_all_quotes_notice_at + 1) % 256; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 8 -> cancellation_of_all_quotes_notice_record.trader_id[cancellation_of_all_quotes_notice_at] = (cancellation_of_all_quotes_notice_base + 28 + cancellation_of_all_quotes_notice_at + 1) % 256; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_record.cancel_reason = (cancellation_of_all_quotes_notice_base + 36 + 1) % 256;
  skip
}

/* Cancellation Of All Quotes Notice to the wire, 37 bytes from where the cursor stands */
inline encode_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_record) {
  encode_outgoing_messages_header(cancellation_of_all_quotes_notice_record.outgoing_messages_header);
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 2 -> wire[at] = cancellation_of_all_quotes_notice_record.group[cancellation_of_all_quotes_notice_at]; at = at + 1; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 4 -> wire[at] = cancellation_of_all_quotes_notice_record.instrument[cancellation_of_all_quotes_notice_at]; at = at + 1; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 8 -> wire[at] = cancellation_of_all_quotes_notice_record.trader_id[cancellation_of_all_quotes_notice_at]; at = at + 1; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  wire[at] = cancellation_of_all_quotes_notice_record.cancel_reason; at = at + 1;
  skip
}

/* Cancellation Of All Quotes Notice off the wire, 37 bytes from where the cursor stands */
inline decode_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_record) {
  decode_outgoing_messages_header(cancellation_of_all_quotes_notice_record.outgoing_messages_header);
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 2 -> cancellation_of_all_quotes_notice_record.group[cancellation_of_all_quotes_notice_at] = wire[at]; at = at + 1; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 4 -> cancellation_of_all_quotes_notice_record.instrument[cancellation_of_all_quotes_notice_at] = wire[at]; at = at + 1; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 8 -> cancellation_of_all_quotes_notice_record.trader_id[cancellation_of_all_quotes_notice_at] = wire[at]; at = at + 1; cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Cancellation Of All Quotes Notice is what was written, byte for byte */
inline equal_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_read, cancellation_of_all_quotes_notice_written) {
  equal_outgoing_messages_header(cancellation_of_all_quotes_notice_read.outgoing_messages_header, cancellation_of_all_quotes_notice_written.outgoing_messages_header);
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 2 -> assert(cancellation_of_all_quotes_notice_read.group[cancellation_of_all_quotes_notice_at] == cancellation_of_all_quotes_notice_written.group[cancellation_of_all_quotes_notice_at]); cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 4 -> assert(cancellation_of_all_quotes_notice_read.instrument[cancellation_of_all_quotes_notice_at] == cancellation_of_all_quotes_notice_written.instrument[cancellation_of_all_quotes_notice_at]); cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  cancellation_of_all_quotes_notice_at = 0;
  do
  :: cancellation_of_all_quotes_notice_at < 8 -> assert(cancellation_of_all_quotes_notice_read.trader_id[cancellation_of_all_quotes_notice_at] == cancellation_of_all_quotes_notice_written.trader_id[cancellation_of_all_quotes_notice_at]); cancellation_of_all_quotes_notice_at = cancellation_of_all_quotes_notice_at + 1
  :: else -> break
  od;
  assert(cancellation_of_all_quotes_notice_read.cancel_reason == cancellation_of_all_quotes_notice_written.cancel_reason);
  skip
}

/* ---- Execution Notice: 218 bytes --------------------------------------------- */

typedef ExecutionNotice {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte trader_id[8];
  byte reference_id_order_id_or_quote_id[8];
  byte verb_side;
  byte quantity_traded[8];
  byte trade_price[10];
  byte trading_engine_timestamp_of_the_trade_local_hhmmss[6];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte special_trade_indicator;
  byte price_type;
  byte trade_type;
  byte filler_6[6];
  byte trade_number[8];
  byte trade_memo[50];
  byte original_reference_id[8];
  byte id_code_for_the_counterpart_participant[4]
};

int execution_notice_at;

/* every byte of Execution Notice set to one value */
inline fill_execution_notice(execution_notice_record, execution_notice_value) {
  fill_outgoing_messages_header(execution_notice_record.outgoing_messages_header, execution_notice_value);
  execution_notice_at = 0;
  do
  :: execution_notice_at < 2 -> execution_notice_record.group[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.instrument[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.trader_id[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.reference_id_order_id_or_quote_id[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
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
  :: execution_notice_at < 6 -> execution_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  fill_clearing_data(execution_notice_record.clearing_data, execution_notice_value);
  fill_owner_data(execution_notice_record.owner_data, execution_notice_value);
  execution_notice_record.special_trade_indicator = execution_notice_value;
  execution_notice_record.price_type = execution_notice_value;
  execution_notice_record.trade_type = execution_notice_value;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> execution_notice_record.filler_6[execution_notice_at] = execution_notice_value; execution_notice_at = execution_notice_at + 1
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
  skip
}

/* each byte of Execution Notice set to where it lies, so a field read out of place says so */
inline ramp_execution_notice(execution_notice_record, execution_notice_base) {
  ramp_outgoing_messages_header(execution_notice_record.outgoing_messages_header, execution_notice_base + 0);
  execution_notice_at = 0;
  do
  :: execution_notice_at < 2 -> execution_notice_record.group[execution_notice_at] = (execution_notice_base + 22 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.instrument[execution_notice_at] = (execution_notice_base + 24 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.trader_id[execution_notice_at] = (execution_notice_base + 28 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.reference_id_order_id_or_quote_id[execution_notice_at] = (execution_notice_base + 36 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_record.verb_side = (execution_notice_base + 44 + 1) % 256;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.quantity_traded[execution_notice_at] = (execution_notice_base + 45 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 10 -> execution_notice_record.trade_price[execution_notice_at] = (execution_notice_base + 53 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> execution_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_notice_at] = (execution_notice_base + 63 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  ramp_clearing_data(execution_notice_record.clearing_data, execution_notice_base + 69);
  ramp_owner_data(execution_notice_record.owner_data, execution_notice_base + 89);
  execution_notice_record.special_trade_indicator = (execution_notice_base + 139 + 1) % 256;
  execution_notice_record.price_type = (execution_notice_base + 140 + 1) % 256;
  execution_notice_record.trade_type = (execution_notice_base + 141 + 1) % 256;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> execution_notice_record.filler_6[execution_notice_at] = (execution_notice_base + 142 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.trade_number[execution_notice_at] = (execution_notice_base + 148 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 50 -> execution_notice_record.trade_memo[execution_notice_at] = (execution_notice_base + 156 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.original_reference_id[execution_notice_at] = (execution_notice_base + 206 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.id_code_for_the_counterpart_participant[execution_notice_at] = (execution_notice_base + 214 + execution_notice_at + 1) % 256; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Notice to the wire, 218 bytes from where the cursor stands */
inline encode_execution_notice(execution_notice_record) {
  encode_outgoing_messages_header(execution_notice_record.outgoing_messages_header);
  execution_notice_at = 0;
  do
  :: execution_notice_at < 2 -> wire[at] = execution_notice_record.group[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> wire[at] = execution_notice_record.instrument[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> wire[at] = execution_notice_record.trader_id[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> wire[at] = execution_notice_record.reference_id_order_id_or_quote_id[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
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
  :: execution_notice_at < 6 -> wire[at] = execution_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  encode_clearing_data(execution_notice_record.clearing_data);
  encode_owner_data(execution_notice_record.owner_data);
  wire[at] = execution_notice_record.special_trade_indicator; at = at + 1;
  wire[at] = execution_notice_record.price_type; at = at + 1;
  wire[at] = execution_notice_record.trade_type; at = at + 1;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> wire[at] = execution_notice_record.filler_6[execution_notice_at]; at = at + 1; execution_notice_at = execution_notice_at + 1
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
  skip
}

/* Execution Notice off the wire, 218 bytes from where the cursor stands */
inline decode_execution_notice(execution_notice_record) {
  decode_outgoing_messages_header(execution_notice_record.outgoing_messages_header);
  execution_notice_at = 0;
  do
  :: execution_notice_at < 2 -> execution_notice_record.group[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> execution_notice_record.instrument[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.trader_id[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> execution_notice_record.reference_id_order_id_or_quote_id[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
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
  :: execution_notice_at < 6 -> execution_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  decode_clearing_data(execution_notice_record.clearing_data);
  decode_owner_data(execution_notice_record.owner_data);
  execution_notice_record.special_trade_indicator = wire[at]; at = at + 1;
  execution_notice_record.price_type = wire[at]; at = at + 1;
  execution_notice_record.trade_type = wire[at]; at = at + 1;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> execution_notice_record.filler_6[execution_notice_at] = wire[at]; at = at + 1; execution_notice_at = execution_notice_at + 1
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
  skip
}

/* what was read of Execution Notice is what was written, byte for byte */
inline equal_execution_notice(execution_notice_read, execution_notice_written) {
  equal_outgoing_messages_header(execution_notice_read.outgoing_messages_header, execution_notice_written.outgoing_messages_header);
  execution_notice_at = 0;
  do
  :: execution_notice_at < 2 -> assert(execution_notice_read.group[execution_notice_at] == execution_notice_written.group[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 4 -> assert(execution_notice_read.instrument[execution_notice_at] == execution_notice_written.instrument[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> assert(execution_notice_read.trader_id[execution_notice_at] == execution_notice_written.trader_id[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  execution_notice_at = 0;
  do
  :: execution_notice_at < 8 -> assert(execution_notice_read.reference_id_order_id_or_quote_id[execution_notice_at] == execution_notice_written.reference_id_order_id_or_quote_id[execution_notice_at]); execution_notice_at = execution_notice_at + 1
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
  :: execution_notice_at < 6 -> assert(execution_notice_read.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_notice_at] == execution_notice_written.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_notice_at]); execution_notice_at = execution_notice_at + 1
  :: else -> break
  od;
  equal_clearing_data(execution_notice_read.clearing_data, execution_notice_written.clearing_data);
  equal_owner_data(execution_notice_read.owner_data, execution_notice_written.owner_data);
  assert(execution_notice_read.special_trade_indicator == execution_notice_written.special_trade_indicator);
  assert(execution_notice_read.price_type == execution_notice_written.price_type);
  assert(execution_notice_read.trade_type == execution_notice_written.trade_type);
  execution_notice_at = 0;
  do
  :: execution_notice_at < 6 -> assert(execution_notice_read.filler_6[execution_notice_at] == execution_notice_written.filler_6[execution_notice_at]); execution_notice_at = execution_notice_at + 1
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
  skip
}

/* ---- Execution Cancellation Notice: 218 bytes -------------------------------- */

/* This message is sent by the Exchange to report the execution of a trade cancellation by the MOD. This message has the same number of bytes and format as the NT: SAIL Execution Notice messages. */
typedef ExecutionCancellationNotice {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte trader_id[8];
  byte reference_id_order_id_or_quote_id[8];
  byte verb_side;
  byte quantity_traded[8];
  byte trade_price[10];
  byte trading_engine_timestamp_of_the_trade_local_hhmmss[6];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte special_trade_indicator;
  byte price_type;
  byte trade_type;
  byte filler_6[6];
  byte trade_number[8];
  byte trade_memo[50];
  byte original_reference_id[8];
  byte id_code_for_the_counterpart_participant[4]
};

int execution_cancellation_notice_at;

/* every byte of Execution Cancellation Notice set to one value */
inline fill_execution_cancellation_notice(execution_cancellation_notice_record, execution_cancellation_notice_value) {
  fill_outgoing_messages_header(execution_cancellation_notice_record.outgoing_messages_header, execution_cancellation_notice_value);
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 2 -> execution_cancellation_notice_record.group[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.instrument[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.trader_id[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.reference_id_order_id_or_quote_id[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
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
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  fill_clearing_data(execution_cancellation_notice_record.clearing_data, execution_cancellation_notice_value);
  fill_owner_data(execution_cancellation_notice_record.owner_data, execution_cancellation_notice_value);
  execution_cancellation_notice_record.special_trade_indicator = execution_cancellation_notice_value;
  execution_cancellation_notice_record.price_type = execution_cancellation_notice_value;
  execution_cancellation_notice_record.trade_type = execution_cancellation_notice_value;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.filler_6[execution_cancellation_notice_at] = execution_cancellation_notice_value; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
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
  skip
}

/* each byte of Execution Cancellation Notice set to where it lies, so a field read out of place says so */
inline ramp_execution_cancellation_notice(execution_cancellation_notice_record, execution_cancellation_notice_base) {
  ramp_outgoing_messages_header(execution_cancellation_notice_record.outgoing_messages_header, execution_cancellation_notice_base + 0);
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 2 -> execution_cancellation_notice_record.group[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 22 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.instrument[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 24 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.trader_id[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 28 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.reference_id_order_id_or_quote_id[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 36 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_record.verb_side = (execution_cancellation_notice_base + 44 + 1) % 256;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.quantity_traded[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 45 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 10 -> execution_cancellation_notice_record.trade_price[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 53 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 63 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  ramp_clearing_data(execution_cancellation_notice_record.clearing_data, execution_cancellation_notice_base + 69);
  ramp_owner_data(execution_cancellation_notice_record.owner_data, execution_cancellation_notice_base + 89);
  execution_cancellation_notice_record.special_trade_indicator = (execution_cancellation_notice_base + 139 + 1) % 256;
  execution_cancellation_notice_record.price_type = (execution_cancellation_notice_base + 140 + 1) % 256;
  execution_cancellation_notice_record.trade_type = (execution_cancellation_notice_base + 141 + 1) % 256;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.filler_6[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 142 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.trade_number[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 148 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 50 -> execution_cancellation_notice_record.trade_memo[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 156 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.original_reference_id[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 206 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.id_code_for_the_counterpart_participant[execution_cancellation_notice_at] = (execution_cancellation_notice_base + 214 + execution_cancellation_notice_at + 1) % 256; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Cancellation Notice to the wire, 218 bytes from where the cursor stands */
inline encode_execution_cancellation_notice(execution_cancellation_notice_record) {
  encode_outgoing_messages_header(execution_cancellation_notice_record.outgoing_messages_header);
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 2 -> wire[at] = execution_cancellation_notice_record.group[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> wire[at] = execution_cancellation_notice_record.instrument[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> wire[at] = execution_cancellation_notice_record.trader_id[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> wire[at] = execution_cancellation_notice_record.reference_id_order_id_or_quote_id[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
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
  :: execution_cancellation_notice_at < 6 -> wire[at] = execution_cancellation_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  encode_clearing_data(execution_cancellation_notice_record.clearing_data);
  encode_owner_data(execution_cancellation_notice_record.owner_data);
  wire[at] = execution_cancellation_notice_record.special_trade_indicator; at = at + 1;
  wire[at] = execution_cancellation_notice_record.price_type; at = at + 1;
  wire[at] = execution_cancellation_notice_record.trade_type; at = at + 1;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> wire[at] = execution_cancellation_notice_record.filler_6[execution_cancellation_notice_at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
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
  skip
}

/* Execution Cancellation Notice off the wire, 218 bytes from where the cursor stands */
inline decode_execution_cancellation_notice(execution_cancellation_notice_record) {
  decode_outgoing_messages_header(execution_cancellation_notice_record.outgoing_messages_header);
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 2 -> execution_cancellation_notice_record.group[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> execution_cancellation_notice_record.instrument[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.trader_id[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> execution_cancellation_notice_record.reference_id_order_id_or_quote_id[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
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
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  decode_clearing_data(execution_cancellation_notice_record.clearing_data);
  decode_owner_data(execution_cancellation_notice_record.owner_data);
  execution_cancellation_notice_record.special_trade_indicator = wire[at]; at = at + 1;
  execution_cancellation_notice_record.price_type = wire[at]; at = at + 1;
  execution_cancellation_notice_record.trade_type = wire[at]; at = at + 1;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> execution_cancellation_notice_record.filler_6[execution_cancellation_notice_at] = wire[at]; at = at + 1; execution_cancellation_notice_at = execution_cancellation_notice_at + 1
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
  skip
}

/* what was read of Execution Cancellation Notice is what was written, byte for byte */
inline equal_execution_cancellation_notice(execution_cancellation_notice_read, execution_cancellation_notice_written) {
  equal_outgoing_messages_header(execution_cancellation_notice_read.outgoing_messages_header, execution_cancellation_notice_written.outgoing_messages_header);
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 2 -> assert(execution_cancellation_notice_read.group[execution_cancellation_notice_at] == execution_cancellation_notice_written.group[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 4 -> assert(execution_cancellation_notice_read.instrument[execution_cancellation_notice_at] == execution_cancellation_notice_written.instrument[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> assert(execution_cancellation_notice_read.trader_id[execution_cancellation_notice_at] == execution_cancellation_notice_written.trader_id[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 8 -> assert(execution_cancellation_notice_read.reference_id_order_id_or_quote_id[execution_cancellation_notice_at] == execution_cancellation_notice_written.reference_id_order_id_or_quote_id[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
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
  :: execution_cancellation_notice_at < 6 -> assert(execution_cancellation_notice_read.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_cancellation_notice_at] == execution_cancellation_notice_written.trading_engine_timestamp_of_the_trade_local_hhmmss[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
  :: else -> break
  od;
  equal_clearing_data(execution_cancellation_notice_read.clearing_data, execution_cancellation_notice_written.clearing_data);
  equal_owner_data(execution_cancellation_notice_read.owner_data, execution_cancellation_notice_written.owner_data);
  assert(execution_cancellation_notice_read.special_trade_indicator == execution_cancellation_notice_written.special_trade_indicator);
  assert(execution_cancellation_notice_read.price_type == execution_cancellation_notice_written.price_type);
  assert(execution_cancellation_notice_read.trade_type == execution_cancellation_notice_written.trade_type);
  execution_cancellation_notice_at = 0;
  do
  :: execution_cancellation_notice_at < 6 -> assert(execution_cancellation_notice_read.filler_6[execution_cancellation_notice_at] == execution_cancellation_notice_written.filler_6[execution_cancellation_notice_at]); execution_cancellation_notice_at = execution_cancellation_notice_at + 1
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
  skip
}

/* ---- Leg Execution Cancellation Notice: 235 bytes ---------------------------- */

/* This message is sent by the Exchange to report the execution of a cancellation by the MOD for a leg of the strategy trade. This message has the same number of bytes and format as the NL: Leg Execution Notice message. */
typedef LegExecutionCancellationNotice {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte trader_id[8];
  byte reference_id_order_id_or_quote_id[8];
  byte verb_side;
  byte quantity_traded[8];
  byte trade_price[10];
  byte trading_engine_timestamp_of_the_trade_local_hhmmss[6];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte special_trade_indicator;
  byte price_type;
  byte trade_type;
  byte filler_6[6];
  byte trade_number[8];
  byte trade_memo[50];
  byte original_reference_id[8];
  byte id_code_for_the_counterpart_participant[4];
  byte strategy_group[2];
  byte strategy_instrument_id[4];
  byte strategy_verb_side;
  byte strategy_trade_number[8];
  byte leg_number[2]
};

int leg_execution_cancellation_notice_at;

/* every byte of Leg Execution Cancellation Notice set to one value */
inline fill_leg_execution_cancellation_notice(leg_execution_cancellation_notice_record, leg_execution_cancellation_notice_value) {
  fill_outgoing_messages_header(leg_execution_cancellation_notice_record.outgoing_messages_header, leg_execution_cancellation_notice_value);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.group[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.instrument[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.trader_id[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.reference_id_order_id_or_quote_id[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
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
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  fill_clearing_data(leg_execution_cancellation_notice_record.clearing_data, leg_execution_cancellation_notice_value);
  fill_owner_data(leg_execution_cancellation_notice_record.owner_data, leg_execution_cancellation_notice_value);
  leg_execution_cancellation_notice_record.special_trade_indicator = leg_execution_cancellation_notice_value;
  leg_execution_cancellation_notice_record.price_type = leg_execution_cancellation_notice_value;
  leg_execution_cancellation_notice_record.trade_type = leg_execution_cancellation_notice_value;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.filler_6[leg_execution_cancellation_notice_at] = leg_execution_cancellation_notice_value; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
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
  skip
}

/* each byte of Leg Execution Cancellation Notice set to where it lies, so a field read out of place says so */
inline ramp_leg_execution_cancellation_notice(leg_execution_cancellation_notice_record, leg_execution_cancellation_notice_base) {
  ramp_outgoing_messages_header(leg_execution_cancellation_notice_record.outgoing_messages_header, leg_execution_cancellation_notice_base + 0);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.group[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 22 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.instrument[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 24 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.trader_id[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 28 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.reference_id_order_id_or_quote_id[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 36 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_record.verb_side = (leg_execution_cancellation_notice_base + 44 + 1) % 256;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.quantity_traded[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 45 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 10 -> leg_execution_cancellation_notice_record.trade_price[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 53 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 63 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  ramp_clearing_data(leg_execution_cancellation_notice_record.clearing_data, leg_execution_cancellation_notice_base + 69);
  ramp_owner_data(leg_execution_cancellation_notice_record.owner_data, leg_execution_cancellation_notice_base + 89);
  leg_execution_cancellation_notice_record.special_trade_indicator = (leg_execution_cancellation_notice_base + 139 + 1) % 256;
  leg_execution_cancellation_notice_record.price_type = (leg_execution_cancellation_notice_base + 140 + 1) % 256;
  leg_execution_cancellation_notice_record.trade_type = (leg_execution_cancellation_notice_base + 141 + 1) % 256;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.filler_6[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 142 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.trade_number[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 148 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 50 -> leg_execution_cancellation_notice_record.trade_memo[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 156 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.original_reference_id[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 206 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.id_code_for_the_counterpart_participant[leg_execution_cancellation_notice_at] = (leg_execution_cancellation_notice_base + 214 + leg_execution_cancellation_notice_at + 1) % 256; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
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
  skip
}

/* Leg Execution Cancellation Notice to the wire, 235 bytes from where the cursor stands */
inline encode_leg_execution_cancellation_notice(leg_execution_cancellation_notice_record) {
  encode_outgoing_messages_header(leg_execution_cancellation_notice_record.outgoing_messages_header);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> wire[at] = leg_execution_cancellation_notice_record.group[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> wire[at] = leg_execution_cancellation_notice_record.instrument[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> wire[at] = leg_execution_cancellation_notice_record.trader_id[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> wire[at] = leg_execution_cancellation_notice_record.reference_id_order_id_or_quote_id[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
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
  :: leg_execution_cancellation_notice_at < 6 -> wire[at] = leg_execution_cancellation_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  encode_clearing_data(leg_execution_cancellation_notice_record.clearing_data);
  encode_owner_data(leg_execution_cancellation_notice_record.owner_data);
  wire[at] = leg_execution_cancellation_notice_record.special_trade_indicator; at = at + 1;
  wire[at] = leg_execution_cancellation_notice_record.price_type; at = at + 1;
  wire[at] = leg_execution_cancellation_notice_record.trade_type; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> wire[at] = leg_execution_cancellation_notice_record.filler_6[leg_execution_cancellation_notice_at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
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
  skip
}

/* Leg Execution Cancellation Notice off the wire, 235 bytes from where the cursor stands */
inline decode_leg_execution_cancellation_notice(leg_execution_cancellation_notice_record) {
  decode_outgoing_messages_header(leg_execution_cancellation_notice_record.outgoing_messages_header);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> leg_execution_cancellation_notice_record.group[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> leg_execution_cancellation_notice_record.instrument[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.trader_id[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> leg_execution_cancellation_notice_record.reference_id_order_id_or_quote_id[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
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
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  decode_clearing_data(leg_execution_cancellation_notice_record.clearing_data);
  decode_owner_data(leg_execution_cancellation_notice_record.owner_data);
  leg_execution_cancellation_notice_record.special_trade_indicator = wire[at]; at = at + 1;
  leg_execution_cancellation_notice_record.price_type = wire[at]; at = at + 1;
  leg_execution_cancellation_notice_record.trade_type = wire[at]; at = at + 1;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> leg_execution_cancellation_notice_record.filler_6[leg_execution_cancellation_notice_at] = wire[at]; at = at + 1; leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
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
  skip
}

/* what was read of Leg Execution Cancellation Notice is what was written, byte for byte */
inline equal_leg_execution_cancellation_notice(leg_execution_cancellation_notice_read, leg_execution_cancellation_notice_written) {
  equal_outgoing_messages_header(leg_execution_cancellation_notice_read.outgoing_messages_header, leg_execution_cancellation_notice_written.outgoing_messages_header);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 2 -> assert(leg_execution_cancellation_notice_read.group[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.group[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 4 -> assert(leg_execution_cancellation_notice_read.instrument[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.instrument[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> assert(leg_execution_cancellation_notice_read.trader_id[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.trader_id[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 8 -> assert(leg_execution_cancellation_notice_read.reference_id_order_id_or_quote_id[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.reference_id_order_id_or_quote_id[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
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
  :: leg_execution_cancellation_notice_at < 6 -> assert(leg_execution_cancellation_notice_read.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.trading_engine_timestamp_of_the_trade_local_hhmmss[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
  :: else -> break
  od;
  equal_clearing_data(leg_execution_cancellation_notice_read.clearing_data, leg_execution_cancellation_notice_written.clearing_data);
  equal_owner_data(leg_execution_cancellation_notice_read.owner_data, leg_execution_cancellation_notice_written.owner_data);
  assert(leg_execution_cancellation_notice_read.special_trade_indicator == leg_execution_cancellation_notice_written.special_trade_indicator);
  assert(leg_execution_cancellation_notice_read.price_type == leg_execution_cancellation_notice_written.price_type);
  assert(leg_execution_cancellation_notice_read.trade_type == leg_execution_cancellation_notice_written.trade_type);
  leg_execution_cancellation_notice_at = 0;
  do
  :: leg_execution_cancellation_notice_at < 6 -> assert(leg_execution_cancellation_notice_read.filler_6[leg_execution_cancellation_notice_at] == leg_execution_cancellation_notice_written.filler_6[leg_execution_cancellation_notice_at]); leg_execution_cancellation_notice_at = leg_execution_cancellation_notice_at + 1
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
  skip
}

/* ---- Order Cancellation Notice By Mod Or System: 148 bytes ------------------- */

/* This triggered message is sent by the Exchange to report the cancellation of an order by the MOD or by the System. This message has the same number of bytes and format as the KE: Order Acknowledgement, KM: Order Modification Acknowledgement and KZ: Order Cancellation Acknowledgement messages. */
typedef OrderCancellationNoticeByModOrSystem {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte trader_id[8];
  byte order_id[8];
  byte status;
  byte verb_side;
  byte quantity[8];
  byte assigned_price[10];
  ClearingData clearing_data;
  OwnerData owner_data;
  byte original_order_id[8];
  byte filler_6[6]
};

int order_cancellation_notice_by_mod_or_system_at;

/* every byte of Order Cancellation Notice By Mod Or System set to one value */
inline fill_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_record, order_cancellation_notice_by_mod_or_system_value) {
  fill_outgoing_messages_header(order_cancellation_notice_by_mod_or_system_record.outgoing_messages_header, order_cancellation_notice_by_mod_or_system_value);
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 2 -> order_cancellation_notice_by_mod_or_system_record.group[order_cancellation_notice_by_mod_or_system_at] = order_cancellation_notice_by_mod_or_system_value; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 4 -> order_cancellation_notice_by_mod_or_system_record.instrument[order_cancellation_notice_by_mod_or_system_at] = order_cancellation_notice_by_mod_or_system_value; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.trader_id[order_cancellation_notice_by_mod_or_system_at] = order_cancellation_notice_by_mod_or_system_value; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.order_id[order_cancellation_notice_by_mod_or_system_at] = order_cancellation_notice_by_mod_or_system_value; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_record.status = order_cancellation_notice_by_mod_or_system_value;
  order_cancellation_notice_by_mod_or_system_record.verb_side = order_cancellation_notice_by_mod_or_system_value;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.quantity[order_cancellation_notice_by_mod_or_system_at] = order_cancellation_notice_by_mod_or_system_value; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 10 -> order_cancellation_notice_by_mod_or_system_record.assigned_price[order_cancellation_notice_by_mod_or_system_at] = order_cancellation_notice_by_mod_or_system_value; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  fill_clearing_data(order_cancellation_notice_by_mod_or_system_record.clearing_data, order_cancellation_notice_by_mod_or_system_value);
  fill_owner_data(order_cancellation_notice_by_mod_or_system_record.owner_data, order_cancellation_notice_by_mod_or_system_value);
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.original_order_id[order_cancellation_notice_by_mod_or_system_at] = order_cancellation_notice_by_mod_or_system_value; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 6 -> order_cancellation_notice_by_mod_or_system_record.filler_6[order_cancellation_notice_by_mod_or_system_at] = order_cancellation_notice_by_mod_or_system_value; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancellation Notice By Mod Or System set to where it lies, so a field read out of place says so */
inline ramp_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_record, order_cancellation_notice_by_mod_or_system_base) {
  ramp_outgoing_messages_header(order_cancellation_notice_by_mod_or_system_record.outgoing_messages_header, order_cancellation_notice_by_mod_or_system_base + 0);
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 2 -> order_cancellation_notice_by_mod_or_system_record.group[order_cancellation_notice_by_mod_or_system_at] = (order_cancellation_notice_by_mod_or_system_base + 22 + order_cancellation_notice_by_mod_or_system_at + 1) % 256; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 4 -> order_cancellation_notice_by_mod_or_system_record.instrument[order_cancellation_notice_by_mod_or_system_at] = (order_cancellation_notice_by_mod_or_system_base + 24 + order_cancellation_notice_by_mod_or_system_at + 1) % 256; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.trader_id[order_cancellation_notice_by_mod_or_system_at] = (order_cancellation_notice_by_mod_or_system_base + 28 + order_cancellation_notice_by_mod_or_system_at + 1) % 256; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.order_id[order_cancellation_notice_by_mod_or_system_at] = (order_cancellation_notice_by_mod_or_system_base + 36 + order_cancellation_notice_by_mod_or_system_at + 1) % 256; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_record.status = (order_cancellation_notice_by_mod_or_system_base + 44 + 1) % 256;
  order_cancellation_notice_by_mod_or_system_record.verb_side = (order_cancellation_notice_by_mod_or_system_base + 45 + 1) % 256;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.quantity[order_cancellation_notice_by_mod_or_system_at] = (order_cancellation_notice_by_mod_or_system_base + 46 + order_cancellation_notice_by_mod_or_system_at + 1) % 256; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 10 -> order_cancellation_notice_by_mod_or_system_record.assigned_price[order_cancellation_notice_by_mod_or_system_at] = (order_cancellation_notice_by_mod_or_system_base + 54 + order_cancellation_notice_by_mod_or_system_at + 1) % 256; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  ramp_clearing_data(order_cancellation_notice_by_mod_or_system_record.clearing_data, order_cancellation_notice_by_mod_or_system_base + 64);
  ramp_owner_data(order_cancellation_notice_by_mod_or_system_record.owner_data, order_cancellation_notice_by_mod_or_system_base + 84);
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.original_order_id[order_cancellation_notice_by_mod_or_system_at] = (order_cancellation_notice_by_mod_or_system_base + 134 + order_cancellation_notice_by_mod_or_system_at + 1) % 256; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 6 -> order_cancellation_notice_by_mod_or_system_record.filler_6[order_cancellation_notice_by_mod_or_system_at] = (order_cancellation_notice_by_mod_or_system_base + 142 + order_cancellation_notice_by_mod_or_system_at + 1) % 256; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Notice By Mod Or System to the wire, 148 bytes from where the cursor stands */
inline encode_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_record) {
  encode_outgoing_messages_header(order_cancellation_notice_by_mod_or_system_record.outgoing_messages_header);
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 2 -> wire[at] = order_cancellation_notice_by_mod_or_system_record.group[order_cancellation_notice_by_mod_or_system_at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 4 -> wire[at] = order_cancellation_notice_by_mod_or_system_record.instrument[order_cancellation_notice_by_mod_or_system_at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> wire[at] = order_cancellation_notice_by_mod_or_system_record.trader_id[order_cancellation_notice_by_mod_or_system_at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> wire[at] = order_cancellation_notice_by_mod_or_system_record.order_id[order_cancellation_notice_by_mod_or_system_at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  wire[at] = order_cancellation_notice_by_mod_or_system_record.status; at = at + 1;
  wire[at] = order_cancellation_notice_by_mod_or_system_record.verb_side; at = at + 1;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> wire[at] = order_cancellation_notice_by_mod_or_system_record.quantity[order_cancellation_notice_by_mod_or_system_at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 10 -> wire[at] = order_cancellation_notice_by_mod_or_system_record.assigned_price[order_cancellation_notice_by_mod_or_system_at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  encode_clearing_data(order_cancellation_notice_by_mod_or_system_record.clearing_data);
  encode_owner_data(order_cancellation_notice_by_mod_or_system_record.owner_data);
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> wire[at] = order_cancellation_notice_by_mod_or_system_record.original_order_id[order_cancellation_notice_by_mod_or_system_at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 6 -> wire[at] = order_cancellation_notice_by_mod_or_system_record.filler_6[order_cancellation_notice_by_mod_or_system_at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancellation Notice By Mod Or System off the wire, 148 bytes from where the cursor stands */
inline decode_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_record) {
  decode_outgoing_messages_header(order_cancellation_notice_by_mod_or_system_record.outgoing_messages_header);
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 2 -> order_cancellation_notice_by_mod_or_system_record.group[order_cancellation_notice_by_mod_or_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 4 -> order_cancellation_notice_by_mod_or_system_record.instrument[order_cancellation_notice_by_mod_or_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.trader_id[order_cancellation_notice_by_mod_or_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.order_id[order_cancellation_notice_by_mod_or_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_record.status = wire[at]; at = at + 1;
  order_cancellation_notice_by_mod_or_system_record.verb_side = wire[at]; at = at + 1;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.quantity[order_cancellation_notice_by_mod_or_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 10 -> order_cancellation_notice_by_mod_or_system_record.assigned_price[order_cancellation_notice_by_mod_or_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  decode_clearing_data(order_cancellation_notice_by_mod_or_system_record.clearing_data);
  decode_owner_data(order_cancellation_notice_by_mod_or_system_record.owner_data);
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> order_cancellation_notice_by_mod_or_system_record.original_order_id[order_cancellation_notice_by_mod_or_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 6 -> order_cancellation_notice_by_mod_or_system_record.filler_6[order_cancellation_notice_by_mod_or_system_at] = wire[at]; at = at + 1; order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancellation Notice By Mod Or System is what was written, byte for byte */
inline equal_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_read, order_cancellation_notice_by_mod_or_system_written) {
  equal_outgoing_messages_header(order_cancellation_notice_by_mod_or_system_read.outgoing_messages_header, order_cancellation_notice_by_mod_or_system_written.outgoing_messages_header);
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 2 -> assert(order_cancellation_notice_by_mod_or_system_read.group[order_cancellation_notice_by_mod_or_system_at] == order_cancellation_notice_by_mod_or_system_written.group[order_cancellation_notice_by_mod_or_system_at]); order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 4 -> assert(order_cancellation_notice_by_mod_or_system_read.instrument[order_cancellation_notice_by_mod_or_system_at] == order_cancellation_notice_by_mod_or_system_written.instrument[order_cancellation_notice_by_mod_or_system_at]); order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> assert(order_cancellation_notice_by_mod_or_system_read.trader_id[order_cancellation_notice_by_mod_or_system_at] == order_cancellation_notice_by_mod_or_system_written.trader_id[order_cancellation_notice_by_mod_or_system_at]); order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> assert(order_cancellation_notice_by_mod_or_system_read.order_id[order_cancellation_notice_by_mod_or_system_at] == order_cancellation_notice_by_mod_or_system_written.order_id[order_cancellation_notice_by_mod_or_system_at]); order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  assert(order_cancellation_notice_by_mod_or_system_read.status == order_cancellation_notice_by_mod_or_system_written.status);
  assert(order_cancellation_notice_by_mod_or_system_read.verb_side == order_cancellation_notice_by_mod_or_system_written.verb_side);
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> assert(order_cancellation_notice_by_mod_or_system_read.quantity[order_cancellation_notice_by_mod_or_system_at] == order_cancellation_notice_by_mod_or_system_written.quantity[order_cancellation_notice_by_mod_or_system_at]); order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 10 -> assert(order_cancellation_notice_by_mod_or_system_read.assigned_price[order_cancellation_notice_by_mod_or_system_at] == order_cancellation_notice_by_mod_or_system_written.assigned_price[order_cancellation_notice_by_mod_or_system_at]); order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  equal_clearing_data(order_cancellation_notice_by_mod_or_system_read.clearing_data, order_cancellation_notice_by_mod_or_system_written.clearing_data);
  equal_owner_data(order_cancellation_notice_by_mod_or_system_read.owner_data, order_cancellation_notice_by_mod_or_system_written.owner_data);
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 8 -> assert(order_cancellation_notice_by_mod_or_system_read.original_order_id[order_cancellation_notice_by_mod_or_system_at] == order_cancellation_notice_by_mod_or_system_written.original_order_id[order_cancellation_notice_by_mod_or_system_at]); order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  order_cancellation_notice_by_mod_or_system_at = 0;
  do
  :: order_cancellation_notice_by_mod_or_system_at < 6 -> assert(order_cancellation_notice_by_mod_or_system_read.filler_6[order_cancellation_notice_by_mod_or_system_at] == order_cancellation_notice_by_mod_or_system_written.filler_6[order_cancellation_notice_by_mod_or_system_at]); order_cancellation_notice_by_mod_or_system_at = order_cancellation_notice_by_mod_or_system_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Request For Quote With Side Acknowledgement: 37 bytes ------------------- */

typedef RequestForQuoteWithSideAcknowledgement {
  OutgoingMessagesHeader outgoing_messages_header;
  byte group[2];
  byte instrument[4];
  byte quantity[8];
  byte market_side
};

int request_for_quote_with_side_acknowledgement_at;

/* every byte of Request For Quote With Side Acknowledgement set to one value */
inline fill_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_record, request_for_quote_with_side_acknowledgement_value) {
  fill_outgoing_messages_header(request_for_quote_with_side_acknowledgement_record.outgoing_messages_header, request_for_quote_with_side_acknowledgement_value);
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 2 -> request_for_quote_with_side_acknowledgement_record.group[request_for_quote_with_side_acknowledgement_at] = request_for_quote_with_side_acknowledgement_value; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 4 -> request_for_quote_with_side_acknowledgement_record.instrument[request_for_quote_with_side_acknowledgement_at] = request_for_quote_with_side_acknowledgement_value; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 8 -> request_for_quote_with_side_acknowledgement_record.quantity[request_for_quote_with_side_acknowledgement_at] = request_for_quote_with_side_acknowledgement_value; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_record.market_side = request_for_quote_with_side_acknowledgement_value;
  skip
}

/* each byte of Request For Quote With Side Acknowledgement set to where it lies, so a field read out of place says so */
inline ramp_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_record, request_for_quote_with_side_acknowledgement_base) {
  ramp_outgoing_messages_header(request_for_quote_with_side_acknowledgement_record.outgoing_messages_header, request_for_quote_with_side_acknowledgement_base + 0);
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 2 -> request_for_quote_with_side_acknowledgement_record.group[request_for_quote_with_side_acknowledgement_at] = (request_for_quote_with_side_acknowledgement_base + 22 + request_for_quote_with_side_acknowledgement_at + 1) % 256; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 4 -> request_for_quote_with_side_acknowledgement_record.instrument[request_for_quote_with_side_acknowledgement_at] = (request_for_quote_with_side_acknowledgement_base + 24 + request_for_quote_with_side_acknowledgement_at + 1) % 256; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 8 -> request_for_quote_with_side_acknowledgement_record.quantity[request_for_quote_with_side_acknowledgement_at] = (request_for_quote_with_side_acknowledgement_base + 28 + request_for_quote_with_side_acknowledgement_at + 1) % 256; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_record.market_side = (request_for_quote_with_side_acknowledgement_base + 36 + 1) % 256;
  skip
}

/* Request For Quote With Side Acknowledgement to the wire, 37 bytes from where the cursor stands */
inline encode_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_record) {
  encode_outgoing_messages_header(request_for_quote_with_side_acknowledgement_record.outgoing_messages_header);
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 2 -> wire[at] = request_for_quote_with_side_acknowledgement_record.group[request_for_quote_with_side_acknowledgement_at]; at = at + 1; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 4 -> wire[at] = request_for_quote_with_side_acknowledgement_record.instrument[request_for_quote_with_side_acknowledgement_at]; at = at + 1; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 8 -> wire[at] = request_for_quote_with_side_acknowledgement_record.quantity[request_for_quote_with_side_acknowledgement_at]; at = at + 1; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  wire[at] = request_for_quote_with_side_acknowledgement_record.market_side; at = at + 1;
  skip
}

/* Request For Quote With Side Acknowledgement off the wire, 37 bytes from where the cursor stands */
inline decode_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_record) {
  decode_outgoing_messages_header(request_for_quote_with_side_acknowledgement_record.outgoing_messages_header);
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 2 -> request_for_quote_with_side_acknowledgement_record.group[request_for_quote_with_side_acknowledgement_at] = wire[at]; at = at + 1; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 4 -> request_for_quote_with_side_acknowledgement_record.instrument[request_for_quote_with_side_acknowledgement_at] = wire[at]; at = at + 1; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 8 -> request_for_quote_with_side_acknowledgement_record.quantity[request_for_quote_with_side_acknowledgement_at] = wire[at]; at = at + 1; request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_record.market_side = wire[at]; at = at + 1;
  skip
}

/* what was read of Request For Quote With Side Acknowledgement is what was written, byte for byte */
inline equal_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_read, request_for_quote_with_side_acknowledgement_written) {
  equal_outgoing_messages_header(request_for_quote_with_side_acknowledgement_read.outgoing_messages_header, request_for_quote_with_side_acknowledgement_written.outgoing_messages_header);
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 2 -> assert(request_for_quote_with_side_acknowledgement_read.group[request_for_quote_with_side_acknowledgement_at] == request_for_quote_with_side_acknowledgement_written.group[request_for_quote_with_side_acknowledgement_at]); request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 4 -> assert(request_for_quote_with_side_acknowledgement_read.instrument[request_for_quote_with_side_acknowledgement_at] == request_for_quote_with_side_acknowledgement_written.instrument[request_for_quote_with_side_acknowledgement_at]); request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  request_for_quote_with_side_acknowledgement_at = 0;
  do
  :: request_for_quote_with_side_acknowledgement_at < 8 -> assert(request_for_quote_with_side_acknowledgement_read.quantity[request_for_quote_with_side_acknowledgement_at] == request_for_quote_with_side_acknowledgement_written.quantity[request_for_quote_with_side_acknowledgement_at]); request_for_quote_with_side_acknowledgement_at = request_for_quote_with_side_acknowledgement_at + 1
  :: else -> break
  od;
  assert(request_for_quote_with_side_acknowledgement_read.market_side == request_for_quote_with_side_acknowledgement_written.market_side);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

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

/* Outgoing Messages Header: encoded, read back, and compared */
proctype check_outgoing_messages_header() {
  OutgoingMessagesHeader outgoing_messages_header_sent;
  OutgoingMessagesHeader outgoing_messages_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_outgoing_messages_header(outgoing_messages_header_sent, 0)
  :: pattern == 1 -> fill_outgoing_messages_header(outgoing_messages_header_sent, 32)
  :: pattern == 2 -> fill_outgoing_messages_header(outgoing_messages_header_sent, 255)
  :: else -> ramp_outgoing_messages_header(outgoing_messages_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_outgoing_messages_header(outgoing_messages_header_sent);
    assert(at == 22);
    at = 0;
    decode_outgoing_messages_header(outgoing_messages_header_got);
    assert(at == 22);
    equal_outgoing_messages_header(outgoing_messages_header_got, outgoing_messages_header_sent)
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
    assert(at == 50);
    at = 0;
    decode_owner_data(owner_data_got);
    assert(at == 50);
    equal_owner_data(owner_data_got, owner_data_sent)
  }
}

/* Order Reply: encoded, read back, and compared */
proctype check_order_reply() {
  OrderReply order_reply_sent;
  OrderReply order_reply_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_reply(order_reply_sent, 0)
  :: pattern == 1 -> fill_order_reply(order_reply_sent, 32)
  :: pattern == 2 -> fill_order_reply(order_reply_sent, 255)
  :: else -> ramp_order_reply(order_reply_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_reply(order_reply_sent);
    assert(at == 134);
    at = 0;
    decode_order_reply(order_reply_got);
    assert(at == 134);
    equal_order_reply(order_reply_got, order_reply_sent)
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
    assert(at == 126);
    at = 0;
    decode_error_notice(error_notice_got);
    assert(at == 126);
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
    assert(at == 40);
    at = 0;
    decode_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_got);
    assert(at == 40);
    equal_bulk_quote_data_acknowledgement(bulk_quote_data_acknowledgement_got, bulk_quote_data_acknowledgement_sent)
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
    assert(at == 148);
    at = 0;
    decode_order_acknowledgement(order_acknowledgement_got);
    assert(at == 148);
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
    assert(at == 33);
    at = 0;
    decode_global_cancellation_confirmation(global_cancellation_confirmation_got);
    assert(at == 33);
    equal_global_cancellation_confirmation(global_cancellation_confirmation_got, global_cancellation_confirmation_sent)
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
    assert(at == 148);
    at = 0;
    decode_order_modification_acknowledgement(order_modification_acknowledgement_got);
    assert(at == 148);
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
    assert(at == 32);
    at = 0;
    decode_standard_acknowledgement(standard_acknowledgement_got);
    assert(at == 32);
    equal_standard_acknowledgement(standard_acknowledgement_got, standard_acknowledgement_sent)
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
    assert(at == 148);
    at = 0;
    decode_order_cancellation_acknowledgement(order_cancellation_acknowledgement_got);
    assert(at == 148);
    equal_order_cancellation_acknowledgement(order_cancellation_acknowledgement_got, order_cancellation_acknowledgement_sent)
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
    assert(at == 25);
    at = 0;
    decode_group_state_change(group_state_change_got);
    assert(at == 25);
    equal_group_state_change(group_state_change_got, group_state_change_sent)
  }
}

/* Instrument State Change: encoded, read back, and compared */
proctype check_instrument_state_change() {
  InstrumentStateChange instrument_state_change_sent;
  InstrumentStateChange instrument_state_change_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_state_change(instrument_state_change_sent, 0)
  :: pattern == 1 -> fill_instrument_state_change(instrument_state_change_sent, 32)
  :: pattern == 2 -> fill_instrument_state_change(instrument_state_change_sent, 255)
  :: else -> ramp_instrument_state_change(instrument_state_change_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_state_change(instrument_state_change_sent);
    assert(at == 29);
    at = 0;
    decode_instrument_state_change(instrument_state_change_got);
    assert(at == 29);
    equal_instrument_state_change(instrument_state_change_got, instrument_state_change_sent)
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
    assert(at == 235);
    at = 0;
    decode_leg_execution_notice(leg_execution_notice_got);
    assert(at == 235);
    equal_leg_execution_notice(leg_execution_notice_got, leg_execution_notice_sent)
  }
}

/* Counterpart Owner Data: encoded, read back, and compared */
proctype check_counterpart_owner_data() {
  CounterpartOwnerData counterpart_owner_data_sent;
  CounterpartOwnerData counterpart_owner_data_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_counterpart_owner_data(counterpart_owner_data_sent, 0)
  :: pattern == 1 -> fill_counterpart_owner_data(counterpart_owner_data_sent, 32)
  :: pattern == 2 -> fill_counterpart_owner_data(counterpart_owner_data_sent, 255)
  :: else -> ramp_counterpart_owner_data(counterpart_owner_data_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_counterpart_owner_data(counterpart_owner_data_sent);
    assert(at == 50);
    at = 0;
    decode_counterpart_owner_data(counterpart_owner_data_got);
    assert(at == 50);
    equal_counterpart_owner_data(counterpart_owner_data_got, counterpart_owner_data_sent)
  }
}

/* Overstepped Order Or Quote Notice: encoded, read back, and compared */
proctype check_overstepped_order_or_quote_notice() {
  OversteppedOrderOrQuoteNotice overstepped_order_or_quote_notice_sent;
  OversteppedOrderOrQuoteNotice overstepped_order_or_quote_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_sent, 0)
  :: pattern == 1 -> fill_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_sent, 32)
  :: pattern == 2 -> fill_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_sent, 255)
  :: else -> ramp_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_sent);
    assert(at == 112);
    at = 0;
    decode_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_got);
    assert(at == 112);
    equal_overstepped_order_or_quote_notice(overstepped_order_or_quote_notice_got, overstepped_order_or_quote_notice_sent)
  }
}

/* Cancellation Of All Quotes Notice: encoded, read back, and compared */
proctype check_cancellation_of_all_quotes_notice() {
  CancellationOfAllQuotesNotice cancellation_of_all_quotes_notice_sent;
  CancellationOfAllQuotesNotice cancellation_of_all_quotes_notice_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_sent, 0)
  :: pattern == 1 -> fill_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_sent, 32)
  :: pattern == 2 -> fill_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_sent, 255)
  :: else -> ramp_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_sent);
    assert(at == 37);
    at = 0;
    decode_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_got);
    assert(at == 37);
    equal_cancellation_of_all_quotes_notice(cancellation_of_all_quotes_notice_got, cancellation_of_all_quotes_notice_sent)
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
    assert(at == 218);
    at = 0;
    decode_execution_notice(execution_notice_got);
    assert(at == 218);
    equal_execution_notice(execution_notice_got, execution_notice_sent)
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
    assert(at == 218);
    at = 0;
    decode_execution_cancellation_notice(execution_cancellation_notice_got);
    assert(at == 218);
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
    assert(at == 235);
    at = 0;
    decode_leg_execution_cancellation_notice(leg_execution_cancellation_notice_got);
    assert(at == 235);
    equal_leg_execution_cancellation_notice(leg_execution_cancellation_notice_got, leg_execution_cancellation_notice_sent)
  }
}

/* Order Cancellation Notice By Mod Or System: encoded, read back, and compared */
proctype check_order_cancellation_notice_by_mod_or_system() {
  OrderCancellationNoticeByModOrSystem order_cancellation_notice_by_mod_or_system_sent;
  OrderCancellationNoticeByModOrSystem order_cancellation_notice_by_mod_or_system_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_sent, 0)
  :: pattern == 1 -> fill_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_sent, 32)
  :: pattern == 2 -> fill_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_sent, 255)
  :: else -> ramp_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_sent);
    assert(at == 148);
    at = 0;
    decode_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_got);
    assert(at == 148);
    equal_order_cancellation_notice_by_mod_or_system(order_cancellation_notice_by_mod_or_system_got, order_cancellation_notice_by_mod_or_system_sent)
  }
}

/* Request For Quote With Side Acknowledgement: encoded, read back, and compared */
proctype check_request_for_quote_with_side_acknowledgement() {
  RequestForQuoteWithSideAcknowledgement request_for_quote_with_side_acknowledgement_sent;
  RequestForQuoteWithSideAcknowledgement request_for_quote_with_side_acknowledgement_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_sent, 0)
  :: pattern == 1 -> fill_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_sent, 32)
  :: pattern == 2 -> fill_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_sent, 255)
  :: else -> ramp_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_sent);
    assert(at == 37);
    at = 0;
    decode_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_got);
    assert(at == 37);
    equal_request_for_quote_with_side_acknowledgement(request_for_quote_with_side_acknowledgement_got, request_for_quote_with_side_acknowledgement_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_connection_acknowledgement()
  :: run check_disconnection_instruction_acknowledgement()
  :: run check_heartbeat_question()
  :: run check_out_of_sequence()
  :: run check_technical_error_notice()
  :: run check_disconnection_acknowledgement()
  :: run check_end_of_transmission()
  :: run check_outgoing_messages_header()
  :: run check_clearing_data()
  :: run check_owner_data()
  :: run check_order_reply()
  :: run check_error_notice()
  :: run check_bulk_quote_data_acknowledgement()
  :: run check_order_acknowledgement()
  :: run check_global_cancellation_confirmation()
  :: run check_order_modification_acknowledgement()
  :: run check_standard_acknowledgement()
  :: run check_order_cancellation_acknowledgement()
  :: run check_group_state_change()
  :: run check_instrument_state_change()
  :: run check_leg_execution_notice()
  :: run check_counterpart_owner_data()
  :: run check_overstepped_order_or_quote_notice()
  :: run check_cancellation_of_all_quotes_notice()
  :: run check_execution_notice()
  :: run check_execution_cancellation_notice()
  :: run check_leg_execution_cancellation_notice()
  :: run check_order_cancellation_notice_by_mod_or_system()
  :: run check_request_for_quote_with_side_acknowledgement()
  fi
}
