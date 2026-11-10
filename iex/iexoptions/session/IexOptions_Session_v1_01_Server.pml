/*
 * Investors Exchange Session
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
 *   - the dispatch that chooses a message by its type
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 20

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 8 bytes ------------------------------------------------- */

/* Iex Options Sbe message header — message identifiers and length of message root */
typedef MessageHeader {
  byte block_length[2];
  byte template_id[2];
  byte schema_id[2];
  byte version[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = (message_header_base + 6 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 8 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.block_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.template_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.schema_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.version[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 8 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.block_length[message_header_at] == message_header_written.block_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.template_id[message_header_at] == message_header_written.template_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.schema_id[message_header_at] == message_header_written.schema_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.version[message_header_at] == message_header_written.version[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 17 bytes ---------------------------------------- */

/* LoginResponseMessage */
typedef LoginResponseMessage {
  byte logon_id[16];
  byte status
};

int login_response_message_at;

/* every byte of Login Response Message set to one value */
inline fill_login_response_message(login_response_message_record, login_response_message_value) {
  login_response_message_at = 0;
  do
  :: login_response_message_at < 16 -> login_response_message_record.logon_id[login_response_message_at] = login_response_message_value; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  login_response_message_record.status = login_response_message_value;
  skip
}

/* each byte of Login Response Message set to where it lies, so a field read out of place says so */
inline ramp_login_response_message(login_response_message_record, login_response_message_base) {
  login_response_message_at = 0;
  do
  :: login_response_message_at < 16 -> login_response_message_record.logon_id[login_response_message_at] = (login_response_message_base + 0 + login_response_message_at + 1) % 256; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  login_response_message_record.status = (login_response_message_base + 16 + 1) % 256;
  skip
}

/* Login Response Message to the wire, 17 bytes from where the cursor stands */
inline encode_login_response_message(login_response_message_record) {
  login_response_message_at = 0;
  do
  :: login_response_message_at < 16 -> wire[at] = login_response_message_record.logon_id[login_response_message_at]; at = at + 1; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  wire[at] = login_response_message_record.status; at = at + 1;
  skip
}

/* Login Response Message off the wire, 17 bytes from where the cursor stands */
inline decode_login_response_message(login_response_message_record) {
  login_response_message_at = 0;
  do
  :: login_response_message_at < 16 -> login_response_message_record.logon_id[login_response_message_at] = wire[at]; at = at + 1; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  login_response_message_record.status = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Response Message is what was written, byte for byte */
inline equal_login_response_message(login_response_message_read, login_response_message_written) {
  login_response_message_at = 0;
  do
  :: login_response_message_at < 16 -> assert(login_response_message_read.logon_id[login_response_message_at] == login_response_message_written.logon_id[login_response_message_at]); login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  assert(login_response_message_read.status == login_response_message_written.status);
  skip
}

/* ---- Session Info Group Encoding: 2 bytes ------------------------------------ */

/* sessionInfoGroupEncoding */
typedef SessionInfoGroupEncoding {
  byte block_length_short;
  byte num_in_group
};

/* every byte of Session Info Group Encoding set to one value */
inline fill_session_info_group_encoding(session_info_group_encoding_record, session_info_group_encoding_value) {
  session_info_group_encoding_record.block_length_short = session_info_group_encoding_value;
  session_info_group_encoding_record.num_in_group = session_info_group_encoding_value;
  skip
}

/* each byte of Session Info Group Encoding set to where it lies, so a field read out of place says so */
inline ramp_session_info_group_encoding(session_info_group_encoding_record, session_info_group_encoding_base) {
  session_info_group_encoding_record.block_length_short = (session_info_group_encoding_base + 0 + 1) % 256;
  session_info_group_encoding_record.num_in_group = (session_info_group_encoding_base + 1 + 1) % 256;
  skip
}

/* Session Info Group Encoding to the wire, 2 bytes from where the cursor stands */
inline encode_session_info_group_encoding(session_info_group_encoding_record) {
  wire[at] = session_info_group_encoding_record.block_length_short; at = at + 1;
  wire[at] = session_info_group_encoding_record.num_in_group; at = at + 1;
  skip
}

/* Session Info Group Encoding off the wire, 2 bytes from where the cursor stands */
inline decode_session_info_group_encoding(session_info_group_encoding_record) {
  session_info_group_encoding_record.block_length_short = wire[at]; at = at + 1;
  session_info_group_encoding_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Session Info Group Encoding is what was written, byte for byte */
inline equal_session_info_group_encoding(session_info_group_encoding_read, session_info_group_encoding_written) {
  assert(session_info_group_encoding_read.block_length_short == session_info_group_encoding_written.block_length_short);
  assert(session_info_group_encoding_read.num_in_group == session_info_group_encoding_written.num_in_group);
  skip
}

/* ---- Terminate Message: 1 bytes ---------------------------------------------- */

/* TerminateMessage */
typedef TerminateMessage {
  byte reason
};

/* every byte of Terminate Message set to one value */
inline fill_terminate_message(terminate_message_record, terminate_message_value) {
  terminate_message_record.reason = terminate_message_value;
  skip
}

/* each byte of Terminate Message set to where it lies, so a field read out of place says so */
inline ramp_terminate_message(terminate_message_record, terminate_message_base) {
  terminate_message_record.reason = (terminate_message_base + 0 + 1) % 256;
  skip
}

/* Terminate Message to the wire, 1 bytes from where the cursor stands */
inline encode_terminate_message(terminate_message_record) {
  wire[at] = terminate_message_record.reason; at = at + 1;
  skip
}

/* Terminate Message off the wire, 1 bytes from where the cursor stands */
inline decode_terminate_message(terminate_message_record) {
  terminate_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Terminate Message is what was written, byte for byte */
inline equal_terminate_message(terminate_message_read, terminate_message_written) {
  assert(terminate_message_read.reason == terminate_message_written.reason);
  skip
}

/* ---- Sequenced Message Header Message: 20 bytes ------------------------------ */

/* SequencedMessageHeaderMessage */
typedef SequencedMessageHeaderMessage {
  byte subsession_id[8];
  byte sequence[4];
  byte timestamp[8]
};

int sequenced_message_header_message_at;

/* every byte of Sequenced Message Header Message set to one value */
inline fill_sequenced_message_header_message(sequenced_message_header_message_record, sequenced_message_header_message_value) {
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 8 -> sequenced_message_header_message_record.subsession_id[sequenced_message_header_message_at] = sequenced_message_header_message_value; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 4 -> sequenced_message_header_message_record.sequence[sequenced_message_header_message_at] = sequenced_message_header_message_value; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 8 -> sequenced_message_header_message_record.timestamp[sequenced_message_header_message_at] = sequenced_message_header_message_value; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequenced Message Header Message set to where it lies, so a field read out of place says so */
inline ramp_sequenced_message_header_message(sequenced_message_header_message_record, sequenced_message_header_message_base) {
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 8 -> sequenced_message_header_message_record.subsession_id[sequenced_message_header_message_at] = (sequenced_message_header_message_base + 0 + sequenced_message_header_message_at + 1) % 256; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 4 -> sequenced_message_header_message_record.sequence[sequenced_message_header_message_at] = (sequenced_message_header_message_base + 8 + sequenced_message_header_message_at + 1) % 256; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 8 -> sequenced_message_header_message_record.timestamp[sequenced_message_header_message_at] = (sequenced_message_header_message_base + 12 + sequenced_message_header_message_at + 1) % 256; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequenced Message Header Message to the wire, 20 bytes from where the cursor stands */
inline encode_sequenced_message_header_message(sequenced_message_header_message_record) {
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 8 -> wire[at] = sequenced_message_header_message_record.subsession_id[sequenced_message_header_message_at]; at = at + 1; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 4 -> wire[at] = sequenced_message_header_message_record.sequence[sequenced_message_header_message_at]; at = at + 1; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 8 -> wire[at] = sequenced_message_header_message_record.timestamp[sequenced_message_header_message_at]; at = at + 1; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequenced Message Header Message off the wire, 20 bytes from where the cursor stands */
inline decode_sequenced_message_header_message(sequenced_message_header_message_record) {
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 8 -> sequenced_message_header_message_record.subsession_id[sequenced_message_header_message_at] = wire[at]; at = at + 1; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 4 -> sequenced_message_header_message_record.sequence[sequenced_message_header_message_at] = wire[at]; at = at + 1; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 8 -> sequenced_message_header_message_record.timestamp[sequenced_message_header_message_at] = wire[at]; at = at + 1; sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequenced Message Header Message is what was written, byte for byte */
inline equal_sequenced_message_header_message(sequenced_message_header_message_read, sequenced_message_header_message_written) {
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 8 -> assert(sequenced_message_header_message_read.subsession_id[sequenced_message_header_message_at] == sequenced_message_header_message_written.subsession_id[sequenced_message_header_message_at]); sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 4 -> assert(sequenced_message_header_message_read.sequence[sequenced_message_header_message_at] == sequenced_message_header_message_written.sequence[sequenced_message_header_message_at]); sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  sequenced_message_header_message_at = 0;
  do
  :: sequenced_message_header_message_at < 8 -> assert(sequenced_message_header_message_read.timestamp[sequenced_message_header_message_at] == sequenced_message_header_message_written.timestamp[sequenced_message_header_message_at]); sequenced_message_header_message_at = sequenced_message_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Subsession Join Response Message: 9 bytes ------------------------------- */

/* SubsessionJoinResponseMessage */
typedef SubsessionJoinResponseMessage {
  byte subsession_id[8];
  byte status
};

int subsession_join_response_message_at;

/* every byte of Subsession Join Response Message set to one value */
inline fill_subsession_join_response_message(subsession_join_response_message_record, subsession_join_response_message_value) {
  subsession_join_response_message_at = 0;
  do
  :: subsession_join_response_message_at < 8 -> subsession_join_response_message_record.subsession_id[subsession_join_response_message_at] = subsession_join_response_message_value; subsession_join_response_message_at = subsession_join_response_message_at + 1
  :: else -> break
  od;
  subsession_join_response_message_record.status = subsession_join_response_message_value;
  skip
}

/* each byte of Subsession Join Response Message set to where it lies, so a field read out of place says so */
inline ramp_subsession_join_response_message(subsession_join_response_message_record, subsession_join_response_message_base) {
  subsession_join_response_message_at = 0;
  do
  :: subsession_join_response_message_at < 8 -> subsession_join_response_message_record.subsession_id[subsession_join_response_message_at] = (subsession_join_response_message_base + 0 + subsession_join_response_message_at + 1) % 256; subsession_join_response_message_at = subsession_join_response_message_at + 1
  :: else -> break
  od;
  subsession_join_response_message_record.status = (subsession_join_response_message_base + 8 + 1) % 256;
  skip
}

/* Subsession Join Response Message to the wire, 9 bytes from where the cursor stands */
inline encode_subsession_join_response_message(subsession_join_response_message_record) {
  subsession_join_response_message_at = 0;
  do
  :: subsession_join_response_message_at < 8 -> wire[at] = subsession_join_response_message_record.subsession_id[subsession_join_response_message_at]; at = at + 1; subsession_join_response_message_at = subsession_join_response_message_at + 1
  :: else -> break
  od;
  wire[at] = subsession_join_response_message_record.status; at = at + 1;
  skip
}

/* Subsession Join Response Message off the wire, 9 bytes from where the cursor stands */
inline decode_subsession_join_response_message(subsession_join_response_message_record) {
  subsession_join_response_message_at = 0;
  do
  :: subsession_join_response_message_at < 8 -> subsession_join_response_message_record.subsession_id[subsession_join_response_message_at] = wire[at]; at = at + 1; subsession_join_response_message_at = subsession_join_response_message_at + 1
  :: else -> break
  od;
  subsession_join_response_message_record.status = wire[at]; at = at + 1;
  skip
}

/* what was read of Subsession Join Response Message is what was written, byte for byte */
inline equal_subsession_join_response_message(subsession_join_response_message_read, subsession_join_response_message_written) {
  subsession_join_response_message_at = 0;
  do
  :: subsession_join_response_message_at < 8 -> assert(subsession_join_response_message_read.subsession_id[subsession_join_response_message_at] == subsession_join_response_message_written.subsession_id[subsession_join_response_message_at]); subsession_join_response_message_at = subsession_join_response_message_at + 1
  :: else -> break
  od;
  assert(subsession_join_response_message_read.status == subsession_join_response_message_written.status);
  skip
}

/* ---- Subsession Leave Response Message: 9 bytes ------------------------------ */

/* SubsessionLeaveResponseMessage */
typedef SubsessionLeaveResponseMessage {
  byte subsession_id[8];
  byte reason
};

int subsession_leave_response_message_at;

/* every byte of Subsession Leave Response Message set to one value */
inline fill_subsession_leave_response_message(subsession_leave_response_message_record, subsession_leave_response_message_value) {
  subsession_leave_response_message_at = 0;
  do
  :: subsession_leave_response_message_at < 8 -> subsession_leave_response_message_record.subsession_id[subsession_leave_response_message_at] = subsession_leave_response_message_value; subsession_leave_response_message_at = subsession_leave_response_message_at + 1
  :: else -> break
  od;
  subsession_leave_response_message_record.reason = subsession_leave_response_message_value;
  skip
}

/* each byte of Subsession Leave Response Message set to where it lies, so a field read out of place says so */
inline ramp_subsession_leave_response_message(subsession_leave_response_message_record, subsession_leave_response_message_base) {
  subsession_leave_response_message_at = 0;
  do
  :: subsession_leave_response_message_at < 8 -> subsession_leave_response_message_record.subsession_id[subsession_leave_response_message_at] = (subsession_leave_response_message_base + 0 + subsession_leave_response_message_at + 1) % 256; subsession_leave_response_message_at = subsession_leave_response_message_at + 1
  :: else -> break
  od;
  subsession_leave_response_message_record.reason = (subsession_leave_response_message_base + 8 + 1) % 256;
  skip
}

/* Subsession Leave Response Message to the wire, 9 bytes from where the cursor stands */
inline encode_subsession_leave_response_message(subsession_leave_response_message_record) {
  subsession_leave_response_message_at = 0;
  do
  :: subsession_leave_response_message_at < 8 -> wire[at] = subsession_leave_response_message_record.subsession_id[subsession_leave_response_message_at]; at = at + 1; subsession_leave_response_message_at = subsession_leave_response_message_at + 1
  :: else -> break
  od;
  wire[at] = subsession_leave_response_message_record.reason; at = at + 1;
  skip
}

/* Subsession Leave Response Message off the wire, 9 bytes from where the cursor stands */
inline decode_subsession_leave_response_message(subsession_leave_response_message_record) {
  subsession_leave_response_message_at = 0;
  do
  :: subsession_leave_response_message_at < 8 -> subsession_leave_response_message_record.subsession_id[subsession_leave_response_message_at] = wire[at]; at = at + 1; subsession_leave_response_message_at = subsession_leave_response_message_at + 1
  :: else -> break
  od;
  subsession_leave_response_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Subsession Leave Response Message is what was written, byte for byte */
inline equal_subsession_leave_response_message(subsession_leave_response_message_read, subsession_leave_response_message_written) {
  subsession_leave_response_message_at = 0;
  do
  :: subsession_leave_response_message_at < 8 -> assert(subsession_leave_response_message_read.subsession_id[subsession_leave_response_message_at] == subsession_leave_response_message_written.subsession_id[subsession_leave_response_message_at]); subsession_leave_response_message_at = subsession_leave_response_message_at + 1
  :: else -> break
  od;
  assert(subsession_leave_response_message_read.reason == subsession_leave_response_message_written.reason);
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
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Login Response Message: encoded, read back, and compared */
proctype check_login_response_message() {
  LoginResponseMessage login_response_message_sent;
  LoginResponseMessage login_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response_message(login_response_message_sent, 0)
  :: pattern == 1 -> fill_login_response_message(login_response_message_sent, 32)
  :: pattern == 2 -> fill_login_response_message(login_response_message_sent, 255)
  :: else -> ramp_login_response_message(login_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response_message(login_response_message_sent);
    assert(at == 17);
    at = 0;
    decode_login_response_message(login_response_message_got);
    assert(at == 17);
    equal_login_response_message(login_response_message_got, login_response_message_sent)
  }
}

/* Session Info Group Encoding: encoded, read back, and compared */
proctype check_session_info_group_encoding() {
  SessionInfoGroupEncoding session_info_group_encoding_sent;
  SessionInfoGroupEncoding session_info_group_encoding_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_session_info_group_encoding(session_info_group_encoding_sent, 0)
  :: pattern == 1 -> fill_session_info_group_encoding(session_info_group_encoding_sent, 32)
  :: pattern == 2 -> fill_session_info_group_encoding(session_info_group_encoding_sent, 255)
  :: else -> ramp_session_info_group_encoding(session_info_group_encoding_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_session_info_group_encoding(session_info_group_encoding_sent);
    assert(at == 2);
    at = 0;
    decode_session_info_group_encoding(session_info_group_encoding_got);
    assert(at == 2);
    equal_session_info_group_encoding(session_info_group_encoding_got, session_info_group_encoding_sent)
  }
}

/* Terminate Message: encoded, read back, and compared */
proctype check_terminate_message() {
  TerminateMessage terminate_message_sent;
  TerminateMessage terminate_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_terminate_message(terminate_message_sent, 0)
  :: pattern == 1 -> fill_terminate_message(terminate_message_sent, 32)
  :: pattern == 2 -> fill_terminate_message(terminate_message_sent, 255)
  :: else -> ramp_terminate_message(terminate_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_terminate_message(terminate_message_sent);
    assert(at == 1);
    at = 0;
    decode_terminate_message(terminate_message_got);
    assert(at == 1);
    equal_terminate_message(terminate_message_got, terminate_message_sent)
  }
}

/* Sequenced Message Header Message: encoded, read back, and compared */
proctype check_sequenced_message_header_message() {
  SequencedMessageHeaderMessage sequenced_message_header_message_sent;
  SequencedMessageHeaderMessage sequenced_message_header_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequenced_message_header_message(sequenced_message_header_message_sent, 0)
  :: pattern == 1 -> fill_sequenced_message_header_message(sequenced_message_header_message_sent, 32)
  :: pattern == 2 -> fill_sequenced_message_header_message(sequenced_message_header_message_sent, 255)
  :: else -> ramp_sequenced_message_header_message(sequenced_message_header_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequenced_message_header_message(sequenced_message_header_message_sent);
    assert(at == 20);
    at = 0;
    decode_sequenced_message_header_message(sequenced_message_header_message_got);
    assert(at == 20);
    equal_sequenced_message_header_message(sequenced_message_header_message_got, sequenced_message_header_message_sent)
  }
}

/* Subsession Join Response Message: encoded, read back, and compared */
proctype check_subsession_join_response_message() {
  SubsessionJoinResponseMessage subsession_join_response_message_sent;
  SubsessionJoinResponseMessage subsession_join_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_subsession_join_response_message(subsession_join_response_message_sent, 0)
  :: pattern == 1 -> fill_subsession_join_response_message(subsession_join_response_message_sent, 32)
  :: pattern == 2 -> fill_subsession_join_response_message(subsession_join_response_message_sent, 255)
  :: else -> ramp_subsession_join_response_message(subsession_join_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_subsession_join_response_message(subsession_join_response_message_sent);
    assert(at == 9);
    at = 0;
    decode_subsession_join_response_message(subsession_join_response_message_got);
    assert(at == 9);
    equal_subsession_join_response_message(subsession_join_response_message_got, subsession_join_response_message_sent)
  }
}

/* Subsession Leave Response Message: encoded, read back, and compared */
proctype check_subsession_leave_response_message() {
  SubsessionLeaveResponseMessage subsession_leave_response_message_sent;
  SubsessionLeaveResponseMessage subsession_leave_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_subsession_leave_response_message(subsession_leave_response_message_sent, 0)
  :: pattern == 1 -> fill_subsession_leave_response_message(subsession_leave_response_message_sent, 32)
  :: pattern == 2 -> fill_subsession_leave_response_message(subsession_leave_response_message_sent, 255)
  :: else -> ramp_subsession_leave_response_message(subsession_leave_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_subsession_leave_response_message(subsession_leave_response_message_sent);
    assert(at == 9);
    at = 0;
    decode_subsession_leave_response_message(subsession_leave_response_message_got);
    assert(at == 9);
    equal_subsession_leave_response_message(subsession_leave_response_message_got, subsession_leave_response_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_login_response_message()
  :: run check_session_info_group_encoding()
  :: run check_terminate_message()
  :: run check_sequenced_message_header_message()
  :: run check_subsession_join_response_message()
  :: run check_subsession_leave_response_message()
  fi
}
