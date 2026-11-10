/*
 * Investors Exchange Binary Order Entry
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
#define WIRE 154

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

/* ---- Order Ack Message: 139 bytes -------------------------------------------- */

/* OrderAckMessage */
typedef OrderAckMessage {
  byte account_account[16];
  byte transact_time[8];
  byte instrument_id[4];
  byte market_participant_id[4];
  byte cl_ord_id[8];
  byte clearing_account[4];
  byte orig_cl_ord_id[8];
  byte order_id[8];
  byte customer_or_firm;
  byte open_close;
  byte attributed_quote;
  byte time_in_force;
  byte cancel_instead_of_slide;
  byte display_inst;
  byte exec_inst;
  byte ord_type;
  byte target_party_id[4];
  byte auction_id[4];
  byte clearing_firm[4];
  byte optional_data[16];
  byte routing_firm_id[4];
  byte aiq[3];
  byte side;
  byte price_price_8[8];
  byte order_qty_quantity_non_zero[4];
  byte leaves_qty[4];
  byte effective_limit_price[8];
  byte display_price[8];
  byte reason_code;
  byte ack_type;
  byte throttle_indicator
};

int order_ack_message_at;

/* every byte of Order Ack Message set to one value */
inline fill_order_ack_message(order_ack_message_record, order_ack_message_value) {
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 16 -> order_ack_message_record.account_account[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.transact_time[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.instrument_id[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.market_participant_id[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.cl_ord_id[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.clearing_account[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.orig_cl_ord_id[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.order_id[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_record.customer_or_firm = order_ack_message_value;
  order_ack_message_record.open_close = order_ack_message_value;
  order_ack_message_record.attributed_quote = order_ack_message_value;
  order_ack_message_record.time_in_force = order_ack_message_value;
  order_ack_message_record.cancel_instead_of_slide = order_ack_message_value;
  order_ack_message_record.display_inst = order_ack_message_value;
  order_ack_message_record.exec_inst = order_ack_message_value;
  order_ack_message_record.ord_type = order_ack_message_value;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.target_party_id[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.auction_id[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.clearing_firm[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 16 -> order_ack_message_record.optional_data[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.routing_firm_id[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 3 -> order_ack_message_record.aiq[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_record.side = order_ack_message_value;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.price_price_8[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.order_qty_quantity_non_zero[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.leaves_qty[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.effective_limit_price[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.display_price[order_ack_message_at] = order_ack_message_value; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_record.reason_code = order_ack_message_value;
  order_ack_message_record.ack_type = order_ack_message_value;
  order_ack_message_record.throttle_indicator = order_ack_message_value;
  skip
}

/* each byte of Order Ack Message set to where it lies, so a field read out of place says so */
inline ramp_order_ack_message(order_ack_message_record, order_ack_message_base) {
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 16 -> order_ack_message_record.account_account[order_ack_message_at] = (order_ack_message_base + 0 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.transact_time[order_ack_message_at] = (order_ack_message_base + 16 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.instrument_id[order_ack_message_at] = (order_ack_message_base + 24 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.market_participant_id[order_ack_message_at] = (order_ack_message_base + 28 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.cl_ord_id[order_ack_message_at] = (order_ack_message_base + 32 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.clearing_account[order_ack_message_at] = (order_ack_message_base + 40 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.orig_cl_ord_id[order_ack_message_at] = (order_ack_message_base + 44 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.order_id[order_ack_message_at] = (order_ack_message_base + 52 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_record.customer_or_firm = (order_ack_message_base + 60 + 1) % 256;
  order_ack_message_record.open_close = (order_ack_message_base + 61 + 1) % 256;
  order_ack_message_record.attributed_quote = (order_ack_message_base + 62 + 1) % 256;
  order_ack_message_record.time_in_force = (order_ack_message_base + 63 + 1) % 256;
  order_ack_message_record.cancel_instead_of_slide = (order_ack_message_base + 64 + 1) % 256;
  order_ack_message_record.display_inst = (order_ack_message_base + 65 + 1) % 256;
  order_ack_message_record.exec_inst = (order_ack_message_base + 66 + 1) % 256;
  order_ack_message_record.ord_type = (order_ack_message_base + 67 + 1) % 256;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.target_party_id[order_ack_message_at] = (order_ack_message_base + 68 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.auction_id[order_ack_message_at] = (order_ack_message_base + 72 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.clearing_firm[order_ack_message_at] = (order_ack_message_base + 76 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 16 -> order_ack_message_record.optional_data[order_ack_message_at] = (order_ack_message_base + 80 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.routing_firm_id[order_ack_message_at] = (order_ack_message_base + 96 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 3 -> order_ack_message_record.aiq[order_ack_message_at] = (order_ack_message_base + 100 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_record.side = (order_ack_message_base + 103 + 1) % 256;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.price_price_8[order_ack_message_at] = (order_ack_message_base + 104 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.order_qty_quantity_non_zero[order_ack_message_at] = (order_ack_message_base + 112 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.leaves_qty[order_ack_message_at] = (order_ack_message_base + 116 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.effective_limit_price[order_ack_message_at] = (order_ack_message_base + 120 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.display_price[order_ack_message_at] = (order_ack_message_base + 128 + order_ack_message_at + 1) % 256; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_record.reason_code = (order_ack_message_base + 136 + 1) % 256;
  order_ack_message_record.ack_type = (order_ack_message_base + 137 + 1) % 256;
  order_ack_message_record.throttle_indicator = (order_ack_message_base + 138 + 1) % 256;
  skip
}

/* Order Ack Message to the wire, 139 bytes from where the cursor stands */
inline encode_order_ack_message(order_ack_message_record) {
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 16 -> wire[at] = order_ack_message_record.account_account[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> wire[at] = order_ack_message_record.transact_time[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> wire[at] = order_ack_message_record.instrument_id[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> wire[at] = order_ack_message_record.market_participant_id[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> wire[at] = order_ack_message_record.cl_ord_id[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> wire[at] = order_ack_message_record.clearing_account[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> wire[at] = order_ack_message_record.orig_cl_ord_id[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> wire[at] = order_ack_message_record.order_id[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = order_ack_message_record.customer_or_firm; at = at + 1;
  wire[at] = order_ack_message_record.open_close; at = at + 1;
  wire[at] = order_ack_message_record.attributed_quote; at = at + 1;
  wire[at] = order_ack_message_record.time_in_force; at = at + 1;
  wire[at] = order_ack_message_record.cancel_instead_of_slide; at = at + 1;
  wire[at] = order_ack_message_record.display_inst; at = at + 1;
  wire[at] = order_ack_message_record.exec_inst; at = at + 1;
  wire[at] = order_ack_message_record.ord_type; at = at + 1;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> wire[at] = order_ack_message_record.target_party_id[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> wire[at] = order_ack_message_record.auction_id[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> wire[at] = order_ack_message_record.clearing_firm[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 16 -> wire[at] = order_ack_message_record.optional_data[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> wire[at] = order_ack_message_record.routing_firm_id[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 3 -> wire[at] = order_ack_message_record.aiq[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = order_ack_message_record.side; at = at + 1;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> wire[at] = order_ack_message_record.price_price_8[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> wire[at] = order_ack_message_record.order_qty_quantity_non_zero[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> wire[at] = order_ack_message_record.leaves_qty[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> wire[at] = order_ack_message_record.effective_limit_price[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> wire[at] = order_ack_message_record.display_price[order_ack_message_at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = order_ack_message_record.reason_code; at = at + 1;
  wire[at] = order_ack_message_record.ack_type; at = at + 1;
  wire[at] = order_ack_message_record.throttle_indicator; at = at + 1;
  skip
}

/* Order Ack Message off the wire, 139 bytes from where the cursor stands */
inline decode_order_ack_message(order_ack_message_record) {
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 16 -> order_ack_message_record.account_account[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.transact_time[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.instrument_id[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.market_participant_id[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.cl_ord_id[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.clearing_account[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.orig_cl_ord_id[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.order_id[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_record.customer_or_firm = wire[at]; at = at + 1;
  order_ack_message_record.open_close = wire[at]; at = at + 1;
  order_ack_message_record.attributed_quote = wire[at]; at = at + 1;
  order_ack_message_record.time_in_force = wire[at]; at = at + 1;
  order_ack_message_record.cancel_instead_of_slide = wire[at]; at = at + 1;
  order_ack_message_record.display_inst = wire[at]; at = at + 1;
  order_ack_message_record.exec_inst = wire[at]; at = at + 1;
  order_ack_message_record.ord_type = wire[at]; at = at + 1;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.target_party_id[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.auction_id[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.clearing_firm[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 16 -> order_ack_message_record.optional_data[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.routing_firm_id[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 3 -> order_ack_message_record.aiq[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_record.side = wire[at]; at = at + 1;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.price_price_8[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.order_qty_quantity_non_zero[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> order_ack_message_record.leaves_qty[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.effective_limit_price[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> order_ack_message_record.display_price[order_ack_message_at] = wire[at]; at = at + 1; order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_record.reason_code = wire[at]; at = at + 1;
  order_ack_message_record.ack_type = wire[at]; at = at + 1;
  order_ack_message_record.throttle_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Ack Message is what was written, byte for byte */
inline equal_order_ack_message(order_ack_message_read, order_ack_message_written) {
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 16 -> assert(order_ack_message_read.account_account[order_ack_message_at] == order_ack_message_written.account_account[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> assert(order_ack_message_read.transact_time[order_ack_message_at] == order_ack_message_written.transact_time[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> assert(order_ack_message_read.instrument_id[order_ack_message_at] == order_ack_message_written.instrument_id[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> assert(order_ack_message_read.market_participant_id[order_ack_message_at] == order_ack_message_written.market_participant_id[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> assert(order_ack_message_read.cl_ord_id[order_ack_message_at] == order_ack_message_written.cl_ord_id[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> assert(order_ack_message_read.clearing_account[order_ack_message_at] == order_ack_message_written.clearing_account[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> assert(order_ack_message_read.orig_cl_ord_id[order_ack_message_at] == order_ack_message_written.orig_cl_ord_id[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> assert(order_ack_message_read.order_id[order_ack_message_at] == order_ack_message_written.order_id[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  assert(order_ack_message_read.customer_or_firm == order_ack_message_written.customer_or_firm);
  assert(order_ack_message_read.open_close == order_ack_message_written.open_close);
  assert(order_ack_message_read.attributed_quote == order_ack_message_written.attributed_quote);
  assert(order_ack_message_read.time_in_force == order_ack_message_written.time_in_force);
  assert(order_ack_message_read.cancel_instead_of_slide == order_ack_message_written.cancel_instead_of_slide);
  assert(order_ack_message_read.display_inst == order_ack_message_written.display_inst);
  assert(order_ack_message_read.exec_inst == order_ack_message_written.exec_inst);
  assert(order_ack_message_read.ord_type == order_ack_message_written.ord_type);
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> assert(order_ack_message_read.target_party_id[order_ack_message_at] == order_ack_message_written.target_party_id[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> assert(order_ack_message_read.auction_id[order_ack_message_at] == order_ack_message_written.auction_id[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> assert(order_ack_message_read.clearing_firm[order_ack_message_at] == order_ack_message_written.clearing_firm[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 16 -> assert(order_ack_message_read.optional_data[order_ack_message_at] == order_ack_message_written.optional_data[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> assert(order_ack_message_read.routing_firm_id[order_ack_message_at] == order_ack_message_written.routing_firm_id[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 3 -> assert(order_ack_message_read.aiq[order_ack_message_at] == order_ack_message_written.aiq[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  assert(order_ack_message_read.side == order_ack_message_written.side);
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> assert(order_ack_message_read.price_price_8[order_ack_message_at] == order_ack_message_written.price_price_8[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> assert(order_ack_message_read.order_qty_quantity_non_zero[order_ack_message_at] == order_ack_message_written.order_qty_quantity_non_zero[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 4 -> assert(order_ack_message_read.leaves_qty[order_ack_message_at] == order_ack_message_written.leaves_qty[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> assert(order_ack_message_read.effective_limit_price[order_ack_message_at] == order_ack_message_written.effective_limit_price[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  order_ack_message_at = 0;
  do
  :: order_ack_message_at < 8 -> assert(order_ack_message_read.display_price[order_ack_message_at] == order_ack_message_written.display_price[order_ack_message_at]); order_ack_message_at = order_ack_message_at + 1
  :: else -> break
  od;
  assert(order_ack_message_read.reason_code == order_ack_message_written.reason_code);
  assert(order_ack_message_read.ack_type == order_ack_message_written.ack_type);
  assert(order_ack_message_read.throttle_indicator == order_ack_message_written.throttle_indicator);
  skip
}

/* ---- Unsolicited Modify Ack Message: 67 bytes -------------------------------- */

/* UnsolicitedModifyAckMessage */
typedef UnsolicitedModifyAckMessage {
  byte transact_time[8];
  byte instrument_id[4];
  byte market_participant_id[4];
  byte orig_cl_ord_id[8];
  byte order_id[8];
  byte price_price_8[8];
  byte order_qty_quantity_non_zero[4];
  byte leaves_qty[4];
  byte effective_limit_price[8];
  byte display_price[8];
  byte restatement_reason;
  byte reason_code;
  byte ack_type
};

int unsolicited_modify_ack_message_at;

/* every byte of Unsolicited Modify Ack Message set to one value */
inline fill_unsolicited_modify_ack_message(unsolicited_modify_ack_message_record, unsolicited_modify_ack_message_value) {
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.transact_time[unsolicited_modify_ack_message_at] = unsolicited_modify_ack_message_value; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.instrument_id[unsolicited_modify_ack_message_at] = unsolicited_modify_ack_message_value; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.market_participant_id[unsolicited_modify_ack_message_at] = unsolicited_modify_ack_message_value; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.orig_cl_ord_id[unsolicited_modify_ack_message_at] = unsolicited_modify_ack_message_value; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.order_id[unsolicited_modify_ack_message_at] = unsolicited_modify_ack_message_value; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.price_price_8[unsolicited_modify_ack_message_at] = unsolicited_modify_ack_message_value; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.order_qty_quantity_non_zero[unsolicited_modify_ack_message_at] = unsolicited_modify_ack_message_value; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.leaves_qty[unsolicited_modify_ack_message_at] = unsolicited_modify_ack_message_value; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.effective_limit_price[unsolicited_modify_ack_message_at] = unsolicited_modify_ack_message_value; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.display_price[unsolicited_modify_ack_message_at] = unsolicited_modify_ack_message_value; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_record.restatement_reason = unsolicited_modify_ack_message_value;
  unsolicited_modify_ack_message_record.reason_code = unsolicited_modify_ack_message_value;
  unsolicited_modify_ack_message_record.ack_type = unsolicited_modify_ack_message_value;
  skip
}

/* each byte of Unsolicited Modify Ack Message set to where it lies, so a field read out of place says so */
inline ramp_unsolicited_modify_ack_message(unsolicited_modify_ack_message_record, unsolicited_modify_ack_message_base) {
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.transact_time[unsolicited_modify_ack_message_at] = (unsolicited_modify_ack_message_base + 0 + unsolicited_modify_ack_message_at + 1) % 256; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.instrument_id[unsolicited_modify_ack_message_at] = (unsolicited_modify_ack_message_base + 8 + unsolicited_modify_ack_message_at + 1) % 256; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.market_participant_id[unsolicited_modify_ack_message_at] = (unsolicited_modify_ack_message_base + 12 + unsolicited_modify_ack_message_at + 1) % 256; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.orig_cl_ord_id[unsolicited_modify_ack_message_at] = (unsolicited_modify_ack_message_base + 16 + unsolicited_modify_ack_message_at + 1) % 256; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.order_id[unsolicited_modify_ack_message_at] = (unsolicited_modify_ack_message_base + 24 + unsolicited_modify_ack_message_at + 1) % 256; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.price_price_8[unsolicited_modify_ack_message_at] = (unsolicited_modify_ack_message_base + 32 + unsolicited_modify_ack_message_at + 1) % 256; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.order_qty_quantity_non_zero[unsolicited_modify_ack_message_at] = (unsolicited_modify_ack_message_base + 40 + unsolicited_modify_ack_message_at + 1) % 256; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.leaves_qty[unsolicited_modify_ack_message_at] = (unsolicited_modify_ack_message_base + 44 + unsolicited_modify_ack_message_at + 1) % 256; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.effective_limit_price[unsolicited_modify_ack_message_at] = (unsolicited_modify_ack_message_base + 48 + unsolicited_modify_ack_message_at + 1) % 256; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.display_price[unsolicited_modify_ack_message_at] = (unsolicited_modify_ack_message_base + 56 + unsolicited_modify_ack_message_at + 1) % 256; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_record.restatement_reason = (unsolicited_modify_ack_message_base + 64 + 1) % 256;
  unsolicited_modify_ack_message_record.reason_code = (unsolicited_modify_ack_message_base + 65 + 1) % 256;
  unsolicited_modify_ack_message_record.ack_type = (unsolicited_modify_ack_message_base + 66 + 1) % 256;
  skip
}

/* Unsolicited Modify Ack Message to the wire, 67 bytes from where the cursor stands */
inline encode_unsolicited_modify_ack_message(unsolicited_modify_ack_message_record) {
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> wire[at] = unsolicited_modify_ack_message_record.transact_time[unsolicited_modify_ack_message_at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> wire[at] = unsolicited_modify_ack_message_record.instrument_id[unsolicited_modify_ack_message_at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> wire[at] = unsolicited_modify_ack_message_record.market_participant_id[unsolicited_modify_ack_message_at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> wire[at] = unsolicited_modify_ack_message_record.orig_cl_ord_id[unsolicited_modify_ack_message_at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> wire[at] = unsolicited_modify_ack_message_record.order_id[unsolicited_modify_ack_message_at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> wire[at] = unsolicited_modify_ack_message_record.price_price_8[unsolicited_modify_ack_message_at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> wire[at] = unsolicited_modify_ack_message_record.order_qty_quantity_non_zero[unsolicited_modify_ack_message_at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> wire[at] = unsolicited_modify_ack_message_record.leaves_qty[unsolicited_modify_ack_message_at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> wire[at] = unsolicited_modify_ack_message_record.effective_limit_price[unsolicited_modify_ack_message_at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> wire[at] = unsolicited_modify_ack_message_record.display_price[unsolicited_modify_ack_message_at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = unsolicited_modify_ack_message_record.restatement_reason; at = at + 1;
  wire[at] = unsolicited_modify_ack_message_record.reason_code; at = at + 1;
  wire[at] = unsolicited_modify_ack_message_record.ack_type; at = at + 1;
  skip
}

/* Unsolicited Modify Ack Message off the wire, 67 bytes from where the cursor stands */
inline decode_unsolicited_modify_ack_message(unsolicited_modify_ack_message_record) {
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.transact_time[unsolicited_modify_ack_message_at] = wire[at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.instrument_id[unsolicited_modify_ack_message_at] = wire[at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.market_participant_id[unsolicited_modify_ack_message_at] = wire[at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.orig_cl_ord_id[unsolicited_modify_ack_message_at] = wire[at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.order_id[unsolicited_modify_ack_message_at] = wire[at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.price_price_8[unsolicited_modify_ack_message_at] = wire[at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.order_qty_quantity_non_zero[unsolicited_modify_ack_message_at] = wire[at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> unsolicited_modify_ack_message_record.leaves_qty[unsolicited_modify_ack_message_at] = wire[at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.effective_limit_price[unsolicited_modify_ack_message_at] = wire[at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> unsolicited_modify_ack_message_record.display_price[unsolicited_modify_ack_message_at] = wire[at]; at = at + 1; unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_record.restatement_reason = wire[at]; at = at + 1;
  unsolicited_modify_ack_message_record.reason_code = wire[at]; at = at + 1;
  unsolicited_modify_ack_message_record.ack_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Unsolicited Modify Ack Message is what was written, byte for byte */
inline equal_unsolicited_modify_ack_message(unsolicited_modify_ack_message_read, unsolicited_modify_ack_message_written) {
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> assert(unsolicited_modify_ack_message_read.transact_time[unsolicited_modify_ack_message_at] == unsolicited_modify_ack_message_written.transact_time[unsolicited_modify_ack_message_at]); unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> assert(unsolicited_modify_ack_message_read.instrument_id[unsolicited_modify_ack_message_at] == unsolicited_modify_ack_message_written.instrument_id[unsolicited_modify_ack_message_at]); unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> assert(unsolicited_modify_ack_message_read.market_participant_id[unsolicited_modify_ack_message_at] == unsolicited_modify_ack_message_written.market_participant_id[unsolicited_modify_ack_message_at]); unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> assert(unsolicited_modify_ack_message_read.orig_cl_ord_id[unsolicited_modify_ack_message_at] == unsolicited_modify_ack_message_written.orig_cl_ord_id[unsolicited_modify_ack_message_at]); unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> assert(unsolicited_modify_ack_message_read.order_id[unsolicited_modify_ack_message_at] == unsolicited_modify_ack_message_written.order_id[unsolicited_modify_ack_message_at]); unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> assert(unsolicited_modify_ack_message_read.price_price_8[unsolicited_modify_ack_message_at] == unsolicited_modify_ack_message_written.price_price_8[unsolicited_modify_ack_message_at]); unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> assert(unsolicited_modify_ack_message_read.order_qty_quantity_non_zero[unsolicited_modify_ack_message_at] == unsolicited_modify_ack_message_written.order_qty_quantity_non_zero[unsolicited_modify_ack_message_at]); unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 4 -> assert(unsolicited_modify_ack_message_read.leaves_qty[unsolicited_modify_ack_message_at] == unsolicited_modify_ack_message_written.leaves_qty[unsolicited_modify_ack_message_at]); unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> assert(unsolicited_modify_ack_message_read.effective_limit_price[unsolicited_modify_ack_message_at] == unsolicited_modify_ack_message_written.effective_limit_price[unsolicited_modify_ack_message_at]); unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  unsolicited_modify_ack_message_at = 0;
  do
  :: unsolicited_modify_ack_message_at < 8 -> assert(unsolicited_modify_ack_message_read.display_price[unsolicited_modify_ack_message_at] == unsolicited_modify_ack_message_written.display_price[unsolicited_modify_ack_message_at]); unsolicited_modify_ack_message_at = unsolicited_modify_ack_message_at + 1
  :: else -> break
  od;
  assert(unsolicited_modify_ack_message_read.restatement_reason == unsolicited_modify_ack_message_written.restatement_reason);
  assert(unsolicited_modify_ack_message_read.reason_code == unsolicited_modify_ack_message_written.reason_code);
  assert(unsolicited_modify_ack_message_read.ack_type == unsolicited_modify_ack_message_written.ack_type);
  skip
}

/* ---- Order Cancel Ack Message: 55 bytes -------------------------------------- */

/* OrderCancelAckMessage */
typedef OrderCancelAckMessage {
  byte transact_time[8];
  byte instrument_id[4];
  byte market_participant_id[4];
  byte cl_ord_id[8];
  byte orig_cl_ord_id[8];
  byte order_id[8];
  byte price_price_8[8];
  byte leaves_qty[4];
  byte reason_code;
  byte ack_type;
  byte throttle_indicator
};

int order_cancel_ack_message_at;

/* every byte of Order Cancel Ack Message set to one value */
inline fill_order_cancel_ack_message(order_cancel_ack_message_record, order_cancel_ack_message_value) {
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.transact_time[order_cancel_ack_message_at] = order_cancel_ack_message_value; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> order_cancel_ack_message_record.instrument_id[order_cancel_ack_message_at] = order_cancel_ack_message_value; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> order_cancel_ack_message_record.market_participant_id[order_cancel_ack_message_at] = order_cancel_ack_message_value; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.cl_ord_id[order_cancel_ack_message_at] = order_cancel_ack_message_value; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.orig_cl_ord_id[order_cancel_ack_message_at] = order_cancel_ack_message_value; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.order_id[order_cancel_ack_message_at] = order_cancel_ack_message_value; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.price_price_8[order_cancel_ack_message_at] = order_cancel_ack_message_value; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> order_cancel_ack_message_record.leaves_qty[order_cancel_ack_message_at] = order_cancel_ack_message_value; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_record.reason_code = order_cancel_ack_message_value;
  order_cancel_ack_message_record.ack_type = order_cancel_ack_message_value;
  order_cancel_ack_message_record.throttle_indicator = order_cancel_ack_message_value;
  skip
}

/* each byte of Order Cancel Ack Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_ack_message(order_cancel_ack_message_record, order_cancel_ack_message_base) {
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.transact_time[order_cancel_ack_message_at] = (order_cancel_ack_message_base + 0 + order_cancel_ack_message_at + 1) % 256; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> order_cancel_ack_message_record.instrument_id[order_cancel_ack_message_at] = (order_cancel_ack_message_base + 8 + order_cancel_ack_message_at + 1) % 256; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> order_cancel_ack_message_record.market_participant_id[order_cancel_ack_message_at] = (order_cancel_ack_message_base + 12 + order_cancel_ack_message_at + 1) % 256; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.cl_ord_id[order_cancel_ack_message_at] = (order_cancel_ack_message_base + 16 + order_cancel_ack_message_at + 1) % 256; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.orig_cl_ord_id[order_cancel_ack_message_at] = (order_cancel_ack_message_base + 24 + order_cancel_ack_message_at + 1) % 256; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.order_id[order_cancel_ack_message_at] = (order_cancel_ack_message_base + 32 + order_cancel_ack_message_at + 1) % 256; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.price_price_8[order_cancel_ack_message_at] = (order_cancel_ack_message_base + 40 + order_cancel_ack_message_at + 1) % 256; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> order_cancel_ack_message_record.leaves_qty[order_cancel_ack_message_at] = (order_cancel_ack_message_base + 48 + order_cancel_ack_message_at + 1) % 256; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_record.reason_code = (order_cancel_ack_message_base + 52 + 1) % 256;
  order_cancel_ack_message_record.ack_type = (order_cancel_ack_message_base + 53 + 1) % 256;
  order_cancel_ack_message_record.throttle_indicator = (order_cancel_ack_message_base + 54 + 1) % 256;
  skip
}

/* Order Cancel Ack Message to the wire, 55 bytes from where the cursor stands */
inline encode_order_cancel_ack_message(order_cancel_ack_message_record) {
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> wire[at] = order_cancel_ack_message_record.transact_time[order_cancel_ack_message_at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> wire[at] = order_cancel_ack_message_record.instrument_id[order_cancel_ack_message_at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> wire[at] = order_cancel_ack_message_record.market_participant_id[order_cancel_ack_message_at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> wire[at] = order_cancel_ack_message_record.cl_ord_id[order_cancel_ack_message_at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> wire[at] = order_cancel_ack_message_record.orig_cl_ord_id[order_cancel_ack_message_at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> wire[at] = order_cancel_ack_message_record.order_id[order_cancel_ack_message_at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> wire[at] = order_cancel_ack_message_record.price_price_8[order_cancel_ack_message_at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> wire[at] = order_cancel_ack_message_record.leaves_qty[order_cancel_ack_message_at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_ack_message_record.reason_code; at = at + 1;
  wire[at] = order_cancel_ack_message_record.ack_type; at = at + 1;
  wire[at] = order_cancel_ack_message_record.throttle_indicator; at = at + 1;
  skip
}

/* Order Cancel Ack Message off the wire, 55 bytes from where the cursor stands */
inline decode_order_cancel_ack_message(order_cancel_ack_message_record) {
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.transact_time[order_cancel_ack_message_at] = wire[at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> order_cancel_ack_message_record.instrument_id[order_cancel_ack_message_at] = wire[at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> order_cancel_ack_message_record.market_participant_id[order_cancel_ack_message_at] = wire[at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.cl_ord_id[order_cancel_ack_message_at] = wire[at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.orig_cl_ord_id[order_cancel_ack_message_at] = wire[at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.order_id[order_cancel_ack_message_at] = wire[at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> order_cancel_ack_message_record.price_price_8[order_cancel_ack_message_at] = wire[at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> order_cancel_ack_message_record.leaves_qty[order_cancel_ack_message_at] = wire[at]; at = at + 1; order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_record.reason_code = wire[at]; at = at + 1;
  order_cancel_ack_message_record.ack_type = wire[at]; at = at + 1;
  order_cancel_ack_message_record.throttle_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Cancel Ack Message is what was written, byte for byte */
inline equal_order_cancel_ack_message(order_cancel_ack_message_read, order_cancel_ack_message_written) {
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> assert(order_cancel_ack_message_read.transact_time[order_cancel_ack_message_at] == order_cancel_ack_message_written.transact_time[order_cancel_ack_message_at]); order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> assert(order_cancel_ack_message_read.instrument_id[order_cancel_ack_message_at] == order_cancel_ack_message_written.instrument_id[order_cancel_ack_message_at]); order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> assert(order_cancel_ack_message_read.market_participant_id[order_cancel_ack_message_at] == order_cancel_ack_message_written.market_participant_id[order_cancel_ack_message_at]); order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> assert(order_cancel_ack_message_read.cl_ord_id[order_cancel_ack_message_at] == order_cancel_ack_message_written.cl_ord_id[order_cancel_ack_message_at]); order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> assert(order_cancel_ack_message_read.orig_cl_ord_id[order_cancel_ack_message_at] == order_cancel_ack_message_written.orig_cl_ord_id[order_cancel_ack_message_at]); order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> assert(order_cancel_ack_message_read.order_id[order_cancel_ack_message_at] == order_cancel_ack_message_written.order_id[order_cancel_ack_message_at]); order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 8 -> assert(order_cancel_ack_message_read.price_price_8[order_cancel_ack_message_at] == order_cancel_ack_message_written.price_price_8[order_cancel_ack_message_at]); order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  order_cancel_ack_message_at = 0;
  do
  :: order_cancel_ack_message_at < 4 -> assert(order_cancel_ack_message_read.leaves_qty[order_cancel_ack_message_at] == order_cancel_ack_message_written.leaves_qty[order_cancel_ack_message_at]); order_cancel_ack_message_at = order_cancel_ack_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_ack_message_read.reason_code == order_cancel_ack_message_written.reason_code);
  assert(order_cancel_ack_message_read.ack_type == order_cancel_ack_message_written.ack_type);
  assert(order_cancel_ack_message_read.throttle_indicator == order_cancel_ack_message_written.throttle_indicator);
  skip
}

/* ---- Mass Cancel Ack Message: 33 bytes --------------------------------------- */

/* MassCancelAckMessage */
typedef MassCancelAckMessage {
  byte transact_time[8];
  byte underlying_id_optional[4];
  byte market_participant_id[4];
  byte cl_ord_id[8];
  byte reason_code;
  byte ack_style_mass_cancel_ack_style;
  byte mpid_filter;
  byte bulk_action;
  byte cancel_count[4];
  byte throttle_indicator
};

int mass_cancel_ack_message_at;

/* every byte of Mass Cancel Ack Message set to one value */
inline fill_mass_cancel_ack_message(mass_cancel_ack_message_record, mass_cancel_ack_message_value) {
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 8 -> mass_cancel_ack_message_record.transact_time[mass_cancel_ack_message_at] = mass_cancel_ack_message_value; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> mass_cancel_ack_message_record.underlying_id_optional[mass_cancel_ack_message_at] = mass_cancel_ack_message_value; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> mass_cancel_ack_message_record.market_participant_id[mass_cancel_ack_message_at] = mass_cancel_ack_message_value; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 8 -> mass_cancel_ack_message_record.cl_ord_id[mass_cancel_ack_message_at] = mass_cancel_ack_message_value; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_record.reason_code = mass_cancel_ack_message_value;
  mass_cancel_ack_message_record.ack_style_mass_cancel_ack_style = mass_cancel_ack_message_value;
  mass_cancel_ack_message_record.mpid_filter = mass_cancel_ack_message_value;
  mass_cancel_ack_message_record.bulk_action = mass_cancel_ack_message_value;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> mass_cancel_ack_message_record.cancel_count[mass_cancel_ack_message_at] = mass_cancel_ack_message_value; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_record.throttle_indicator = mass_cancel_ack_message_value;
  skip
}

/* each byte of Mass Cancel Ack Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_ack_message(mass_cancel_ack_message_record, mass_cancel_ack_message_base) {
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 8 -> mass_cancel_ack_message_record.transact_time[mass_cancel_ack_message_at] = (mass_cancel_ack_message_base + 0 + mass_cancel_ack_message_at + 1) % 256; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> mass_cancel_ack_message_record.underlying_id_optional[mass_cancel_ack_message_at] = (mass_cancel_ack_message_base + 8 + mass_cancel_ack_message_at + 1) % 256; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> mass_cancel_ack_message_record.market_participant_id[mass_cancel_ack_message_at] = (mass_cancel_ack_message_base + 12 + mass_cancel_ack_message_at + 1) % 256; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 8 -> mass_cancel_ack_message_record.cl_ord_id[mass_cancel_ack_message_at] = (mass_cancel_ack_message_base + 16 + mass_cancel_ack_message_at + 1) % 256; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_record.reason_code = (mass_cancel_ack_message_base + 24 + 1) % 256;
  mass_cancel_ack_message_record.ack_style_mass_cancel_ack_style = (mass_cancel_ack_message_base + 25 + 1) % 256;
  mass_cancel_ack_message_record.mpid_filter = (mass_cancel_ack_message_base + 26 + 1) % 256;
  mass_cancel_ack_message_record.bulk_action = (mass_cancel_ack_message_base + 27 + 1) % 256;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> mass_cancel_ack_message_record.cancel_count[mass_cancel_ack_message_at] = (mass_cancel_ack_message_base + 28 + mass_cancel_ack_message_at + 1) % 256; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_record.throttle_indicator = (mass_cancel_ack_message_base + 32 + 1) % 256;
  skip
}

/* Mass Cancel Ack Message to the wire, 33 bytes from where the cursor stands */
inline encode_mass_cancel_ack_message(mass_cancel_ack_message_record) {
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 8 -> wire[at] = mass_cancel_ack_message_record.transact_time[mass_cancel_ack_message_at]; at = at + 1; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> wire[at] = mass_cancel_ack_message_record.underlying_id_optional[mass_cancel_ack_message_at]; at = at + 1; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> wire[at] = mass_cancel_ack_message_record.market_participant_id[mass_cancel_ack_message_at]; at = at + 1; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 8 -> wire[at] = mass_cancel_ack_message_record.cl_ord_id[mass_cancel_ack_message_at]; at = at + 1; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_ack_message_record.reason_code; at = at + 1;
  wire[at] = mass_cancel_ack_message_record.ack_style_mass_cancel_ack_style; at = at + 1;
  wire[at] = mass_cancel_ack_message_record.mpid_filter; at = at + 1;
  wire[at] = mass_cancel_ack_message_record.bulk_action; at = at + 1;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> wire[at] = mass_cancel_ack_message_record.cancel_count[mass_cancel_ack_message_at]; at = at + 1; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_ack_message_record.throttle_indicator; at = at + 1;
  skip
}

/* Mass Cancel Ack Message off the wire, 33 bytes from where the cursor stands */
inline decode_mass_cancel_ack_message(mass_cancel_ack_message_record) {
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 8 -> mass_cancel_ack_message_record.transact_time[mass_cancel_ack_message_at] = wire[at]; at = at + 1; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> mass_cancel_ack_message_record.underlying_id_optional[mass_cancel_ack_message_at] = wire[at]; at = at + 1; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> mass_cancel_ack_message_record.market_participant_id[mass_cancel_ack_message_at] = wire[at]; at = at + 1; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 8 -> mass_cancel_ack_message_record.cl_ord_id[mass_cancel_ack_message_at] = wire[at]; at = at + 1; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_record.reason_code = wire[at]; at = at + 1;
  mass_cancel_ack_message_record.ack_style_mass_cancel_ack_style = wire[at]; at = at + 1;
  mass_cancel_ack_message_record.mpid_filter = wire[at]; at = at + 1;
  mass_cancel_ack_message_record.bulk_action = wire[at]; at = at + 1;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> mass_cancel_ack_message_record.cancel_count[mass_cancel_ack_message_at] = wire[at]; at = at + 1; mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_record.throttle_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Mass Cancel Ack Message is what was written, byte for byte */
inline equal_mass_cancel_ack_message(mass_cancel_ack_message_read, mass_cancel_ack_message_written) {
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 8 -> assert(mass_cancel_ack_message_read.transact_time[mass_cancel_ack_message_at] == mass_cancel_ack_message_written.transact_time[mass_cancel_ack_message_at]); mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> assert(mass_cancel_ack_message_read.underlying_id_optional[mass_cancel_ack_message_at] == mass_cancel_ack_message_written.underlying_id_optional[mass_cancel_ack_message_at]); mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> assert(mass_cancel_ack_message_read.market_participant_id[mass_cancel_ack_message_at] == mass_cancel_ack_message_written.market_participant_id[mass_cancel_ack_message_at]); mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 8 -> assert(mass_cancel_ack_message_read.cl_ord_id[mass_cancel_ack_message_at] == mass_cancel_ack_message_written.cl_ord_id[mass_cancel_ack_message_at]); mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_ack_message_read.reason_code == mass_cancel_ack_message_written.reason_code);
  assert(mass_cancel_ack_message_read.ack_style_mass_cancel_ack_style == mass_cancel_ack_message_written.ack_style_mass_cancel_ack_style);
  assert(mass_cancel_ack_message_read.mpid_filter == mass_cancel_ack_message_written.mpid_filter);
  assert(mass_cancel_ack_message_read.bulk_action == mass_cancel_ack_message_written.bulk_action);
  mass_cancel_ack_message_at = 0;
  do
  :: mass_cancel_ack_message_at < 4 -> assert(mass_cancel_ack_message_read.cancel_count[mass_cancel_ack_message_at] == mass_cancel_ack_message_written.cancel_count[mass_cancel_ack_message_at]); mass_cancel_ack_message_at = mass_cancel_ack_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_ack_message_read.throttle_indicator == mass_cancel_ack_message_written.throttle_indicator);
  skip
}

/* ---- Quote Acks Group Encoding: 2 bytes -------------------------------------- */

/* quoteAcksGroupEncoding */
typedef QuoteAcksGroupEncoding {
  byte block_length_short;
  byte num_in_group
};

/* every byte of Quote Acks Group Encoding set to one value */
inline fill_quote_acks_group_encoding(quote_acks_group_encoding_record, quote_acks_group_encoding_value) {
  quote_acks_group_encoding_record.block_length_short = quote_acks_group_encoding_value;
  quote_acks_group_encoding_record.num_in_group = quote_acks_group_encoding_value;
  skip
}

/* each byte of Quote Acks Group Encoding set to where it lies, so a field read out of place says so */
inline ramp_quote_acks_group_encoding(quote_acks_group_encoding_record, quote_acks_group_encoding_base) {
  quote_acks_group_encoding_record.block_length_short = (quote_acks_group_encoding_base + 0 + 1) % 256;
  quote_acks_group_encoding_record.num_in_group = (quote_acks_group_encoding_base + 1 + 1) % 256;
  skip
}

/* Quote Acks Group Encoding to the wire, 2 bytes from where the cursor stands */
inline encode_quote_acks_group_encoding(quote_acks_group_encoding_record) {
  wire[at] = quote_acks_group_encoding_record.block_length_short; at = at + 1;
  wire[at] = quote_acks_group_encoding_record.num_in_group; at = at + 1;
  skip
}

/* Quote Acks Group Encoding off the wire, 2 bytes from where the cursor stands */
inline decode_quote_acks_group_encoding(quote_acks_group_encoding_record) {
  quote_acks_group_encoding_record.block_length_short = wire[at]; at = at + 1;
  quote_acks_group_encoding_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Acks Group Encoding is what was written, byte for byte */
inline equal_quote_acks_group_encoding(quote_acks_group_encoding_read, quote_acks_group_encoding_written) {
  assert(quote_acks_group_encoding_read.block_length_short == quote_acks_group_encoding_written.block_length_short);
  assert(quote_acks_group_encoding_read.num_in_group == quote_acks_group_encoding_written.num_in_group);
  skip
}

/* ---- New Ioc Quote Ack Message: 51 bytes ------------------------------------- */

/* NewIocQuoteAckMessage */
typedef NewIocQuoteAckMessage {
  byte transact_time[8];
  byte market_participant_id[4];
  byte cl_ord_id[8];
  byte clearing_account[4];
  byte aiq[3];
  byte instrument_id[4];
  byte side;
  byte order_id[8];
  byte ack_type;
  byte price_price_4[4];
  byte order_qty_quantity_non_zero[4];
  byte reason_code;
  byte throttle_indicator
};

int new_ioc_quote_ack_message_at;

/* every byte of New Ioc Quote Ack Message set to one value */
inline fill_new_ioc_quote_ack_message(new_ioc_quote_ack_message_record, new_ioc_quote_ack_message_value) {
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> new_ioc_quote_ack_message_record.transact_time[new_ioc_quote_ack_message_at] = new_ioc_quote_ack_message_value; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.market_participant_id[new_ioc_quote_ack_message_at] = new_ioc_quote_ack_message_value; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> new_ioc_quote_ack_message_record.cl_ord_id[new_ioc_quote_ack_message_at] = new_ioc_quote_ack_message_value; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.clearing_account[new_ioc_quote_ack_message_at] = new_ioc_quote_ack_message_value; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 3 -> new_ioc_quote_ack_message_record.aiq[new_ioc_quote_ack_message_at] = new_ioc_quote_ack_message_value; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.instrument_id[new_ioc_quote_ack_message_at] = new_ioc_quote_ack_message_value; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_record.side = new_ioc_quote_ack_message_value;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> new_ioc_quote_ack_message_record.order_id[new_ioc_quote_ack_message_at] = new_ioc_quote_ack_message_value; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_record.ack_type = new_ioc_quote_ack_message_value;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.price_price_4[new_ioc_quote_ack_message_at] = new_ioc_quote_ack_message_value; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.order_qty_quantity_non_zero[new_ioc_quote_ack_message_at] = new_ioc_quote_ack_message_value; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_record.reason_code = new_ioc_quote_ack_message_value;
  new_ioc_quote_ack_message_record.throttle_indicator = new_ioc_quote_ack_message_value;
  skip
}

/* each byte of New Ioc Quote Ack Message set to where it lies, so a field read out of place says so */
inline ramp_new_ioc_quote_ack_message(new_ioc_quote_ack_message_record, new_ioc_quote_ack_message_base) {
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> new_ioc_quote_ack_message_record.transact_time[new_ioc_quote_ack_message_at] = (new_ioc_quote_ack_message_base + 0 + new_ioc_quote_ack_message_at + 1) % 256; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.market_participant_id[new_ioc_quote_ack_message_at] = (new_ioc_quote_ack_message_base + 8 + new_ioc_quote_ack_message_at + 1) % 256; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> new_ioc_quote_ack_message_record.cl_ord_id[new_ioc_quote_ack_message_at] = (new_ioc_quote_ack_message_base + 12 + new_ioc_quote_ack_message_at + 1) % 256; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.clearing_account[new_ioc_quote_ack_message_at] = (new_ioc_quote_ack_message_base + 20 + new_ioc_quote_ack_message_at + 1) % 256; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 3 -> new_ioc_quote_ack_message_record.aiq[new_ioc_quote_ack_message_at] = (new_ioc_quote_ack_message_base + 24 + new_ioc_quote_ack_message_at + 1) % 256; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.instrument_id[new_ioc_quote_ack_message_at] = (new_ioc_quote_ack_message_base + 27 + new_ioc_quote_ack_message_at + 1) % 256; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_record.side = (new_ioc_quote_ack_message_base + 31 + 1) % 256;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> new_ioc_quote_ack_message_record.order_id[new_ioc_quote_ack_message_at] = (new_ioc_quote_ack_message_base + 32 + new_ioc_quote_ack_message_at + 1) % 256; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_record.ack_type = (new_ioc_quote_ack_message_base + 40 + 1) % 256;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.price_price_4[new_ioc_quote_ack_message_at] = (new_ioc_quote_ack_message_base + 41 + new_ioc_quote_ack_message_at + 1) % 256; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.order_qty_quantity_non_zero[new_ioc_quote_ack_message_at] = (new_ioc_quote_ack_message_base + 45 + new_ioc_quote_ack_message_at + 1) % 256; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_record.reason_code = (new_ioc_quote_ack_message_base + 49 + 1) % 256;
  new_ioc_quote_ack_message_record.throttle_indicator = (new_ioc_quote_ack_message_base + 50 + 1) % 256;
  skip
}

/* New Ioc Quote Ack Message to the wire, 51 bytes from where the cursor stands */
inline encode_new_ioc_quote_ack_message(new_ioc_quote_ack_message_record) {
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> wire[at] = new_ioc_quote_ack_message_record.transact_time[new_ioc_quote_ack_message_at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> wire[at] = new_ioc_quote_ack_message_record.market_participant_id[new_ioc_quote_ack_message_at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> wire[at] = new_ioc_quote_ack_message_record.cl_ord_id[new_ioc_quote_ack_message_at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> wire[at] = new_ioc_quote_ack_message_record.clearing_account[new_ioc_quote_ack_message_at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 3 -> wire[at] = new_ioc_quote_ack_message_record.aiq[new_ioc_quote_ack_message_at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> wire[at] = new_ioc_quote_ack_message_record.instrument_id[new_ioc_quote_ack_message_at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = new_ioc_quote_ack_message_record.side; at = at + 1;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> wire[at] = new_ioc_quote_ack_message_record.order_id[new_ioc_quote_ack_message_at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = new_ioc_quote_ack_message_record.ack_type; at = at + 1;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> wire[at] = new_ioc_quote_ack_message_record.price_price_4[new_ioc_quote_ack_message_at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> wire[at] = new_ioc_quote_ack_message_record.order_qty_quantity_non_zero[new_ioc_quote_ack_message_at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  wire[at] = new_ioc_quote_ack_message_record.reason_code; at = at + 1;
  wire[at] = new_ioc_quote_ack_message_record.throttle_indicator; at = at + 1;
  skip
}

/* New Ioc Quote Ack Message off the wire, 51 bytes from where the cursor stands */
inline decode_new_ioc_quote_ack_message(new_ioc_quote_ack_message_record) {
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> new_ioc_quote_ack_message_record.transact_time[new_ioc_quote_ack_message_at] = wire[at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.market_participant_id[new_ioc_quote_ack_message_at] = wire[at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> new_ioc_quote_ack_message_record.cl_ord_id[new_ioc_quote_ack_message_at] = wire[at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.clearing_account[new_ioc_quote_ack_message_at] = wire[at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 3 -> new_ioc_quote_ack_message_record.aiq[new_ioc_quote_ack_message_at] = wire[at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.instrument_id[new_ioc_quote_ack_message_at] = wire[at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_record.side = wire[at]; at = at + 1;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> new_ioc_quote_ack_message_record.order_id[new_ioc_quote_ack_message_at] = wire[at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_record.ack_type = wire[at]; at = at + 1;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.price_price_4[new_ioc_quote_ack_message_at] = wire[at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> new_ioc_quote_ack_message_record.order_qty_quantity_non_zero[new_ioc_quote_ack_message_at] = wire[at]; at = at + 1; new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_record.reason_code = wire[at]; at = at + 1;
  new_ioc_quote_ack_message_record.throttle_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of New Ioc Quote Ack Message is what was written, byte for byte */
inline equal_new_ioc_quote_ack_message(new_ioc_quote_ack_message_read, new_ioc_quote_ack_message_written) {
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> assert(new_ioc_quote_ack_message_read.transact_time[new_ioc_quote_ack_message_at] == new_ioc_quote_ack_message_written.transact_time[new_ioc_quote_ack_message_at]); new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> assert(new_ioc_quote_ack_message_read.market_participant_id[new_ioc_quote_ack_message_at] == new_ioc_quote_ack_message_written.market_participant_id[new_ioc_quote_ack_message_at]); new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> assert(new_ioc_quote_ack_message_read.cl_ord_id[new_ioc_quote_ack_message_at] == new_ioc_quote_ack_message_written.cl_ord_id[new_ioc_quote_ack_message_at]); new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> assert(new_ioc_quote_ack_message_read.clearing_account[new_ioc_quote_ack_message_at] == new_ioc_quote_ack_message_written.clearing_account[new_ioc_quote_ack_message_at]); new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 3 -> assert(new_ioc_quote_ack_message_read.aiq[new_ioc_quote_ack_message_at] == new_ioc_quote_ack_message_written.aiq[new_ioc_quote_ack_message_at]); new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> assert(new_ioc_quote_ack_message_read.instrument_id[new_ioc_quote_ack_message_at] == new_ioc_quote_ack_message_written.instrument_id[new_ioc_quote_ack_message_at]); new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  assert(new_ioc_quote_ack_message_read.side == new_ioc_quote_ack_message_written.side);
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 8 -> assert(new_ioc_quote_ack_message_read.order_id[new_ioc_quote_ack_message_at] == new_ioc_quote_ack_message_written.order_id[new_ioc_quote_ack_message_at]); new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  assert(new_ioc_quote_ack_message_read.ack_type == new_ioc_quote_ack_message_written.ack_type);
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> assert(new_ioc_quote_ack_message_read.price_price_4[new_ioc_quote_ack_message_at] == new_ioc_quote_ack_message_written.price_price_4[new_ioc_quote_ack_message_at]); new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  new_ioc_quote_ack_message_at = 0;
  do
  :: new_ioc_quote_ack_message_at < 4 -> assert(new_ioc_quote_ack_message_read.order_qty_quantity_non_zero[new_ioc_quote_ack_message_at] == new_ioc_quote_ack_message_written.order_qty_quantity_non_zero[new_ioc_quote_ack_message_at]); new_ioc_quote_ack_message_at = new_ioc_quote_ack_message_at + 1
  :: else -> break
  od;
  assert(new_ioc_quote_ack_message_read.reason_code == new_ioc_quote_ack_message_written.reason_code);
  assert(new_ioc_quote_ack_message_read.throttle_indicator == new_ioc_quote_ack_message_written.throttle_indicator);
  skip
}

/* ---- Quote Restated Message: 47 bytes ---------------------------------------- */

/* QuoteRestatedMessage */
typedef QuoteRestatedMessage {
  byte transact_time[8];
  byte instrument_id[4];
  byte market_participant_id[4];
  byte cl_ord_id[8];
  byte order_id[8];
  byte side;
  byte price_price_8[8];
  byte reason_code;
  byte ack_type;
  byte delta[4]
};

int quote_restated_message_at;

/* every byte of Quote Restated Message set to one value */
inline fill_quote_restated_message(quote_restated_message_record, quote_restated_message_value) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.transact_time[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.instrument_id[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.market_participant_id[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.cl_ord_id[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.order_id[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_record.side = quote_restated_message_value;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.price_price_8[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_record.reason_code = quote_restated_message_value;
  quote_restated_message_record.ack_type = quote_restated_message_value;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.delta[quote_restated_message_at] = quote_restated_message_value; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Restated Message set to where it lies, so a field read out of place says so */
inline ramp_quote_restated_message(quote_restated_message_record, quote_restated_message_base) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.transact_time[quote_restated_message_at] = (quote_restated_message_base + 0 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.instrument_id[quote_restated_message_at] = (quote_restated_message_base + 8 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.market_participant_id[quote_restated_message_at] = (quote_restated_message_base + 12 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.cl_ord_id[quote_restated_message_at] = (quote_restated_message_base + 16 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.order_id[quote_restated_message_at] = (quote_restated_message_base + 24 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_record.side = (quote_restated_message_base + 32 + 1) % 256;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.price_price_8[quote_restated_message_at] = (quote_restated_message_base + 33 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_record.reason_code = (quote_restated_message_base + 41 + 1) % 256;
  quote_restated_message_record.ack_type = (quote_restated_message_base + 42 + 1) % 256;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.delta[quote_restated_message_at] = (quote_restated_message_base + 43 + quote_restated_message_at + 1) % 256; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Restated Message to the wire, 47 bytes from where the cursor stands */
inline encode_quote_restated_message(quote_restated_message_record) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> wire[at] = quote_restated_message_record.transact_time[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> wire[at] = quote_restated_message_record.instrument_id[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> wire[at] = quote_restated_message_record.market_participant_id[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> wire[at] = quote_restated_message_record.cl_ord_id[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> wire[at] = quote_restated_message_record.order_id[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_restated_message_record.side; at = at + 1;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> wire[at] = quote_restated_message_record.price_price_8[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_restated_message_record.reason_code; at = at + 1;
  wire[at] = quote_restated_message_record.ack_type; at = at + 1;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> wire[at] = quote_restated_message_record.delta[quote_restated_message_at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Restated Message off the wire, 47 bytes from where the cursor stands */
inline decode_quote_restated_message(quote_restated_message_record) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.transact_time[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.instrument_id[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.market_participant_id[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.cl_ord_id[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.order_id[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_record.side = wire[at]; at = at + 1;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> quote_restated_message_record.price_price_8[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_record.reason_code = wire[at]; at = at + 1;
  quote_restated_message_record.ack_type = wire[at]; at = at + 1;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> quote_restated_message_record.delta[quote_restated_message_at] = wire[at]; at = at + 1; quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Restated Message is what was written, byte for byte */
inline equal_quote_restated_message(quote_restated_message_read, quote_restated_message_written) {
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> assert(quote_restated_message_read.transact_time[quote_restated_message_at] == quote_restated_message_written.transact_time[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> assert(quote_restated_message_read.instrument_id[quote_restated_message_at] == quote_restated_message_written.instrument_id[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> assert(quote_restated_message_read.market_participant_id[quote_restated_message_at] == quote_restated_message_written.market_participant_id[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> assert(quote_restated_message_read.cl_ord_id[quote_restated_message_at] == quote_restated_message_written.cl_ord_id[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> assert(quote_restated_message_read.order_id[quote_restated_message_at] == quote_restated_message_written.order_id[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  assert(quote_restated_message_read.side == quote_restated_message_written.side);
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 8 -> assert(quote_restated_message_read.price_price_8[quote_restated_message_at] == quote_restated_message_written.price_price_8[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  assert(quote_restated_message_read.reason_code == quote_restated_message_written.reason_code);
  assert(quote_restated_message_read.ack_type == quote_restated_message_written.ack_type);
  quote_restated_message_at = 0;
  do
  :: quote_restated_message_at < 4 -> assert(quote_restated_message_read.delta[quote_restated_message_at] == quote_restated_message_written.delta[quote_restated_message_at]); quote_restated_message_at = quote_restated_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Canceled Message: 39 bytes ---------------------------------------- */

/* QuoteCanceledMessage */
typedef QuoteCanceledMessage {
  byte transact_time[8];
  byte instrument_id[4];
  byte market_participant_id[4];
  byte cl_ord_id[8];
  byte order_id[8];
  byte side;
  byte reason_code;
  byte ack_type;
  byte delta[4]
};

int quote_canceled_message_at;

/* every byte of Quote Canceled Message set to one value */
inline fill_quote_canceled_message(quote_canceled_message_record, quote_canceled_message_value) {
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> quote_canceled_message_record.transact_time[quote_canceled_message_at] = quote_canceled_message_value; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> quote_canceled_message_record.instrument_id[quote_canceled_message_at] = quote_canceled_message_value; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> quote_canceled_message_record.market_participant_id[quote_canceled_message_at] = quote_canceled_message_value; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> quote_canceled_message_record.cl_ord_id[quote_canceled_message_at] = quote_canceled_message_value; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> quote_canceled_message_record.order_id[quote_canceled_message_at] = quote_canceled_message_value; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_record.side = quote_canceled_message_value;
  quote_canceled_message_record.reason_code = quote_canceled_message_value;
  quote_canceled_message_record.ack_type = quote_canceled_message_value;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> quote_canceled_message_record.delta[quote_canceled_message_at] = quote_canceled_message_value; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Canceled Message set to where it lies, so a field read out of place says so */
inline ramp_quote_canceled_message(quote_canceled_message_record, quote_canceled_message_base) {
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> quote_canceled_message_record.transact_time[quote_canceled_message_at] = (quote_canceled_message_base + 0 + quote_canceled_message_at + 1) % 256; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> quote_canceled_message_record.instrument_id[quote_canceled_message_at] = (quote_canceled_message_base + 8 + quote_canceled_message_at + 1) % 256; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> quote_canceled_message_record.market_participant_id[quote_canceled_message_at] = (quote_canceled_message_base + 12 + quote_canceled_message_at + 1) % 256; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> quote_canceled_message_record.cl_ord_id[quote_canceled_message_at] = (quote_canceled_message_base + 16 + quote_canceled_message_at + 1) % 256; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> quote_canceled_message_record.order_id[quote_canceled_message_at] = (quote_canceled_message_base + 24 + quote_canceled_message_at + 1) % 256; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_record.side = (quote_canceled_message_base + 32 + 1) % 256;
  quote_canceled_message_record.reason_code = (quote_canceled_message_base + 33 + 1) % 256;
  quote_canceled_message_record.ack_type = (quote_canceled_message_base + 34 + 1) % 256;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> quote_canceled_message_record.delta[quote_canceled_message_at] = (quote_canceled_message_base + 35 + quote_canceled_message_at + 1) % 256; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Canceled Message to the wire, 39 bytes from where the cursor stands */
inline encode_quote_canceled_message(quote_canceled_message_record) {
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> wire[at] = quote_canceled_message_record.transact_time[quote_canceled_message_at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> wire[at] = quote_canceled_message_record.instrument_id[quote_canceled_message_at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> wire[at] = quote_canceled_message_record.market_participant_id[quote_canceled_message_at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> wire[at] = quote_canceled_message_record.cl_ord_id[quote_canceled_message_at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> wire[at] = quote_canceled_message_record.order_id[quote_canceled_message_at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_canceled_message_record.side; at = at + 1;
  wire[at] = quote_canceled_message_record.reason_code; at = at + 1;
  wire[at] = quote_canceled_message_record.ack_type; at = at + 1;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> wire[at] = quote_canceled_message_record.delta[quote_canceled_message_at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Canceled Message off the wire, 39 bytes from where the cursor stands */
inline decode_quote_canceled_message(quote_canceled_message_record) {
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> quote_canceled_message_record.transact_time[quote_canceled_message_at] = wire[at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> quote_canceled_message_record.instrument_id[quote_canceled_message_at] = wire[at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> quote_canceled_message_record.market_participant_id[quote_canceled_message_at] = wire[at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> quote_canceled_message_record.cl_ord_id[quote_canceled_message_at] = wire[at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> quote_canceled_message_record.order_id[quote_canceled_message_at] = wire[at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_record.side = wire[at]; at = at + 1;
  quote_canceled_message_record.reason_code = wire[at]; at = at + 1;
  quote_canceled_message_record.ack_type = wire[at]; at = at + 1;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> quote_canceled_message_record.delta[quote_canceled_message_at] = wire[at]; at = at + 1; quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Canceled Message is what was written, byte for byte */
inline equal_quote_canceled_message(quote_canceled_message_read, quote_canceled_message_written) {
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> assert(quote_canceled_message_read.transact_time[quote_canceled_message_at] == quote_canceled_message_written.transact_time[quote_canceled_message_at]); quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> assert(quote_canceled_message_read.instrument_id[quote_canceled_message_at] == quote_canceled_message_written.instrument_id[quote_canceled_message_at]); quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> assert(quote_canceled_message_read.market_participant_id[quote_canceled_message_at] == quote_canceled_message_written.market_participant_id[quote_canceled_message_at]); quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> assert(quote_canceled_message_read.cl_ord_id[quote_canceled_message_at] == quote_canceled_message_written.cl_ord_id[quote_canceled_message_at]); quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 8 -> assert(quote_canceled_message_read.order_id[quote_canceled_message_at] == quote_canceled_message_written.order_id[quote_canceled_message_at]); quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  assert(quote_canceled_message_read.side == quote_canceled_message_written.side);
  assert(quote_canceled_message_read.reason_code == quote_canceled_message_written.reason_code);
  assert(quote_canceled_message_read.ack_type == quote_canceled_message_written.ack_type);
  quote_canceled_message_at = 0;
  do
  :: quote_canceled_message_at < 4 -> assert(quote_canceled_message_read.delta[quote_canceled_message_at] == quote_canceled_message_written.delta[quote_canceled_message_at]); quote_canceled_message_at = quote_canceled_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Custom Group Ids Group Encoding: 2 bytes -------------------------------- */

/* customGroupIdsGroupEncoding */
typedef CustomGroupIdsGroupEncoding {
  byte block_length_short;
  byte num_in_group
};

/* every byte of Custom Group Ids Group Encoding set to one value */
inline fill_custom_group_ids_group_encoding(custom_group_ids_group_encoding_record, custom_group_ids_group_encoding_value) {
  custom_group_ids_group_encoding_record.block_length_short = custom_group_ids_group_encoding_value;
  custom_group_ids_group_encoding_record.num_in_group = custom_group_ids_group_encoding_value;
  skip
}

/* each byte of Custom Group Ids Group Encoding set to where it lies, so a field read out of place says so */
inline ramp_custom_group_ids_group_encoding(custom_group_ids_group_encoding_record, custom_group_ids_group_encoding_base) {
  custom_group_ids_group_encoding_record.block_length_short = (custom_group_ids_group_encoding_base + 0 + 1) % 256;
  custom_group_ids_group_encoding_record.num_in_group = (custom_group_ids_group_encoding_base + 1 + 1) % 256;
  skip
}

/* Custom Group Ids Group Encoding to the wire, 2 bytes from where the cursor stands */
inline encode_custom_group_ids_group_encoding(custom_group_ids_group_encoding_record) {
  wire[at] = custom_group_ids_group_encoding_record.block_length_short; at = at + 1;
  wire[at] = custom_group_ids_group_encoding_record.num_in_group; at = at + 1;
  skip
}

/* Custom Group Ids Group Encoding off the wire, 2 bytes from where the cursor stands */
inline decode_custom_group_ids_group_encoding(custom_group_ids_group_encoding_record) {
  custom_group_ids_group_encoding_record.block_length_short = wire[at]; at = at + 1;
  custom_group_ids_group_encoding_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Custom Group Ids Group Encoding is what was written, byte for byte */
inline equal_custom_group_ids_group_encoding(custom_group_ids_group_encoding_read, custom_group_ids_group_encoding_written) {
  assert(custom_group_ids_group_encoding_read.block_length_short == custom_group_ids_group_encoding_written.block_length_short);
  assert(custom_group_ids_group_encoding_read.num_in_group == custom_group_ids_group_encoding_written.num_in_group);
  skip
}

/* ---- Execution Report Message: 154 bytes ------------------------------------- */

/* ExecutionReportMessage */
typedef ExecutionReportMessage {
  byte account_account[16];
  byte transact_time[8];
  byte instrument_id[4];
  byte market_participant_id[4];
  byte cl_ord_id[8];
  byte clearing_account[4];
  byte customer_or_firm;
  byte order_id[8];
  byte exec_id[8];
  byte trade_id[8];
  byte last_px[8];
  byte open_close;
  byte side;
  byte target_party_id[4];
  byte auction_id[4];
  byte clearing_firm[4];
  byte optional_data[16];
  byte routing_firm_id[4];
  byte aiq[3];
  byte leaves_qty[4];
  byte cum_qty[4];
  byte last_qty[4];
  byte trade_liquidity_indicator;
  byte fee_code[2];
  byte reason_code;
  byte occ_id[5];
  byte contra_clearing_account[4];
  byte contra_clearing_firm[4];
  byte contra_mpid[4];
  byte contra_open_close;
  byte contra_customer_or_firm;
  byte contra_occ_id[5]
};

int execution_report_message_at;

/* every byte of Execution Report Message set to one value */
inline fill_execution_report_message(execution_report_message_record, execution_report_message_value) {
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 16 -> execution_report_message_record.account_account[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.transact_time[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.instrument_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.market_participant_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.cl_ord_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.clearing_account[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.customer_or_firm = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.order_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.exec_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.trade_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.last_px[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.open_close = execution_report_message_value;
  execution_report_message_record.side = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.target_party_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.auction_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.clearing_firm[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 16 -> execution_report_message_record.optional_data[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.routing_firm_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 3 -> execution_report_message_record.aiq[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.leaves_qty[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.cum_qty[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.last_qty[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.trade_liquidity_indicator = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 2 -> execution_report_message_record.fee_code[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.reason_code = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 5 -> execution_report_message_record.occ_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.contra_clearing_account[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.contra_clearing_firm[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.contra_mpid[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.contra_open_close = execution_report_message_value;
  execution_report_message_record.contra_customer_or_firm = execution_report_message_value;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 5 -> execution_report_message_record.contra_occ_id[execution_report_message_at] = execution_report_message_value; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Execution Report Message set to where it lies, so a field read out of place says so */
inline ramp_execution_report_message(execution_report_message_record, execution_report_message_base) {
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 16 -> execution_report_message_record.account_account[execution_report_message_at] = (execution_report_message_base + 0 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.transact_time[execution_report_message_at] = (execution_report_message_base + 16 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.instrument_id[execution_report_message_at] = (execution_report_message_base + 24 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.market_participant_id[execution_report_message_at] = (execution_report_message_base + 28 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.cl_ord_id[execution_report_message_at] = (execution_report_message_base + 32 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.clearing_account[execution_report_message_at] = (execution_report_message_base + 40 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.customer_or_firm = (execution_report_message_base + 44 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.order_id[execution_report_message_at] = (execution_report_message_base + 45 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.exec_id[execution_report_message_at] = (execution_report_message_base + 53 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.trade_id[execution_report_message_at] = (execution_report_message_base + 61 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.last_px[execution_report_message_at] = (execution_report_message_base + 69 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.open_close = (execution_report_message_base + 77 + 1) % 256;
  execution_report_message_record.side = (execution_report_message_base + 78 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.target_party_id[execution_report_message_at] = (execution_report_message_base + 79 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.auction_id[execution_report_message_at] = (execution_report_message_base + 83 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.clearing_firm[execution_report_message_at] = (execution_report_message_base + 87 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 16 -> execution_report_message_record.optional_data[execution_report_message_at] = (execution_report_message_base + 91 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.routing_firm_id[execution_report_message_at] = (execution_report_message_base + 107 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 3 -> execution_report_message_record.aiq[execution_report_message_at] = (execution_report_message_base + 111 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.leaves_qty[execution_report_message_at] = (execution_report_message_base + 114 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.cum_qty[execution_report_message_at] = (execution_report_message_base + 118 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.last_qty[execution_report_message_at] = (execution_report_message_base + 122 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.trade_liquidity_indicator = (execution_report_message_base + 126 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 2 -> execution_report_message_record.fee_code[execution_report_message_at] = (execution_report_message_base + 127 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.reason_code = (execution_report_message_base + 129 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 5 -> execution_report_message_record.occ_id[execution_report_message_at] = (execution_report_message_base + 130 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.contra_clearing_account[execution_report_message_at] = (execution_report_message_base + 135 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.contra_clearing_firm[execution_report_message_at] = (execution_report_message_base + 139 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.contra_mpid[execution_report_message_at] = (execution_report_message_base + 143 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.contra_open_close = (execution_report_message_base + 147 + 1) % 256;
  execution_report_message_record.contra_customer_or_firm = (execution_report_message_base + 148 + 1) % 256;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 5 -> execution_report_message_record.contra_occ_id[execution_report_message_at] = (execution_report_message_base + 149 + execution_report_message_at + 1) % 256; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Message to the wire, 154 bytes from where the cursor stands */
inline encode_execution_report_message(execution_report_message_record) {
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 16 -> wire[at] = execution_report_message_record.account_account[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> wire[at] = execution_report_message_record.transact_time[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.instrument_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.market_participant_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> wire[at] = execution_report_message_record.cl_ord_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.clearing_account[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_message_record.customer_or_firm; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> wire[at] = execution_report_message_record.order_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> wire[at] = execution_report_message_record.exec_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> wire[at] = execution_report_message_record.trade_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> wire[at] = execution_report_message_record.last_px[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_message_record.open_close; at = at + 1;
  wire[at] = execution_report_message_record.side; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.target_party_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.auction_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.clearing_firm[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 16 -> wire[at] = execution_report_message_record.optional_data[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.routing_firm_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 3 -> wire[at] = execution_report_message_record.aiq[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.leaves_qty[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.cum_qty[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.last_qty[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_message_record.trade_liquidity_indicator; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 2 -> wire[at] = execution_report_message_record.fee_code[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_message_record.reason_code; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 5 -> wire[at] = execution_report_message_record.occ_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.contra_clearing_account[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.contra_clearing_firm[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> wire[at] = execution_report_message_record.contra_mpid[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  wire[at] = execution_report_message_record.contra_open_close; at = at + 1;
  wire[at] = execution_report_message_record.contra_customer_or_firm; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 5 -> wire[at] = execution_report_message_record.contra_occ_id[execution_report_message_at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Execution Report Message off the wire, 154 bytes from where the cursor stands */
inline decode_execution_report_message(execution_report_message_record) {
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 16 -> execution_report_message_record.account_account[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.transact_time[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.instrument_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.market_participant_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.cl_ord_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.clearing_account[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.customer_or_firm = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.order_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.exec_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.trade_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> execution_report_message_record.last_px[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.open_close = wire[at]; at = at + 1;
  execution_report_message_record.side = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.target_party_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.auction_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.clearing_firm[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 16 -> execution_report_message_record.optional_data[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.routing_firm_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 3 -> execution_report_message_record.aiq[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.leaves_qty[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.cum_qty[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.last_qty[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.trade_liquidity_indicator = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 2 -> execution_report_message_record.fee_code[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.reason_code = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 5 -> execution_report_message_record.occ_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.contra_clearing_account[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.contra_clearing_firm[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> execution_report_message_record.contra_mpid[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_record.contra_open_close = wire[at]; at = at + 1;
  execution_report_message_record.contra_customer_or_firm = wire[at]; at = at + 1;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 5 -> execution_report_message_record.contra_occ_id[execution_report_message_at] = wire[at]; at = at + 1; execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Execution Report Message is what was written, byte for byte */
inline equal_execution_report_message(execution_report_message_read, execution_report_message_written) {
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 16 -> assert(execution_report_message_read.account_account[execution_report_message_at] == execution_report_message_written.account_account[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> assert(execution_report_message_read.transact_time[execution_report_message_at] == execution_report_message_written.transact_time[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.instrument_id[execution_report_message_at] == execution_report_message_written.instrument_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.market_participant_id[execution_report_message_at] == execution_report_message_written.market_participant_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> assert(execution_report_message_read.cl_ord_id[execution_report_message_at] == execution_report_message_written.cl_ord_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.clearing_account[execution_report_message_at] == execution_report_message_written.clearing_account[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  assert(execution_report_message_read.customer_or_firm == execution_report_message_written.customer_or_firm);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> assert(execution_report_message_read.order_id[execution_report_message_at] == execution_report_message_written.order_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> assert(execution_report_message_read.exec_id[execution_report_message_at] == execution_report_message_written.exec_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> assert(execution_report_message_read.trade_id[execution_report_message_at] == execution_report_message_written.trade_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 8 -> assert(execution_report_message_read.last_px[execution_report_message_at] == execution_report_message_written.last_px[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  assert(execution_report_message_read.open_close == execution_report_message_written.open_close);
  assert(execution_report_message_read.side == execution_report_message_written.side);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.target_party_id[execution_report_message_at] == execution_report_message_written.target_party_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.auction_id[execution_report_message_at] == execution_report_message_written.auction_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.clearing_firm[execution_report_message_at] == execution_report_message_written.clearing_firm[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 16 -> assert(execution_report_message_read.optional_data[execution_report_message_at] == execution_report_message_written.optional_data[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.routing_firm_id[execution_report_message_at] == execution_report_message_written.routing_firm_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 3 -> assert(execution_report_message_read.aiq[execution_report_message_at] == execution_report_message_written.aiq[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.leaves_qty[execution_report_message_at] == execution_report_message_written.leaves_qty[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.cum_qty[execution_report_message_at] == execution_report_message_written.cum_qty[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.last_qty[execution_report_message_at] == execution_report_message_written.last_qty[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  assert(execution_report_message_read.trade_liquidity_indicator == execution_report_message_written.trade_liquidity_indicator);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 2 -> assert(execution_report_message_read.fee_code[execution_report_message_at] == execution_report_message_written.fee_code[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  assert(execution_report_message_read.reason_code == execution_report_message_written.reason_code);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 5 -> assert(execution_report_message_read.occ_id[execution_report_message_at] == execution_report_message_written.occ_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.contra_clearing_account[execution_report_message_at] == execution_report_message_written.contra_clearing_account[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.contra_clearing_firm[execution_report_message_at] == execution_report_message_written.contra_clearing_firm[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 4 -> assert(execution_report_message_read.contra_mpid[execution_report_message_at] == execution_report_message_written.contra_mpid[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  assert(execution_report_message_read.contra_open_close == execution_report_message_written.contra_open_close);
  assert(execution_report_message_read.contra_customer_or_firm == execution_report_message_written.contra_customer_or_firm);
  execution_report_message_at = 0;
  do
  :: execution_report_message_at < 5 -> assert(execution_report_message_read.contra_occ_id[execution_report_message_at] == execution_report_message_written.contra_occ_id[execution_report_message_at]); execution_report_message_at = execution_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Bust Correct Message: 86 bytes ------------------------------------ */

/* TradeBustCorrectMessage */
typedef TradeBustCorrectMessage {
  byte transact_time[8];
  byte instrument_id[4];
  byte market_participant_id[4];
  byte cl_ord_id[8];
  byte order_id[8];
  byte exec_id[8];
  byte trade_id[8];
  byte trade_ref_id[8];
  byte last_px[8];
  byte account_account[16];
  byte last_qty[4];
  byte reason_code;
  byte bust_or_correction
};

int trade_bust_correct_message_at;

/* every byte of Trade Bust Correct Message set to one value */
inline fill_trade_bust_correct_message(trade_bust_correct_message_record, trade_bust_correct_message_value) {
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.transact_time[trade_bust_correct_message_at] = trade_bust_correct_message_value; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> trade_bust_correct_message_record.instrument_id[trade_bust_correct_message_at] = trade_bust_correct_message_value; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> trade_bust_correct_message_record.market_participant_id[trade_bust_correct_message_at] = trade_bust_correct_message_value; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.cl_ord_id[trade_bust_correct_message_at] = trade_bust_correct_message_value; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.order_id[trade_bust_correct_message_at] = trade_bust_correct_message_value; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.exec_id[trade_bust_correct_message_at] = trade_bust_correct_message_value; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.trade_id[trade_bust_correct_message_at] = trade_bust_correct_message_value; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.trade_ref_id[trade_bust_correct_message_at] = trade_bust_correct_message_value; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.last_px[trade_bust_correct_message_at] = trade_bust_correct_message_value; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 16 -> trade_bust_correct_message_record.account_account[trade_bust_correct_message_at] = trade_bust_correct_message_value; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> trade_bust_correct_message_record.last_qty[trade_bust_correct_message_at] = trade_bust_correct_message_value; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_record.reason_code = trade_bust_correct_message_value;
  trade_bust_correct_message_record.bust_or_correction = trade_bust_correct_message_value;
  skip
}

/* each byte of Trade Bust Correct Message set to where it lies, so a field read out of place says so */
inline ramp_trade_bust_correct_message(trade_bust_correct_message_record, trade_bust_correct_message_base) {
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.transact_time[trade_bust_correct_message_at] = (trade_bust_correct_message_base + 0 + trade_bust_correct_message_at + 1) % 256; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> trade_bust_correct_message_record.instrument_id[trade_bust_correct_message_at] = (trade_bust_correct_message_base + 8 + trade_bust_correct_message_at + 1) % 256; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> trade_bust_correct_message_record.market_participant_id[trade_bust_correct_message_at] = (trade_bust_correct_message_base + 12 + trade_bust_correct_message_at + 1) % 256; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.cl_ord_id[trade_bust_correct_message_at] = (trade_bust_correct_message_base + 16 + trade_bust_correct_message_at + 1) % 256; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.order_id[trade_bust_correct_message_at] = (trade_bust_correct_message_base + 24 + trade_bust_correct_message_at + 1) % 256; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.exec_id[trade_bust_correct_message_at] = (trade_bust_correct_message_base + 32 + trade_bust_correct_message_at + 1) % 256; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.trade_id[trade_bust_correct_message_at] = (trade_bust_correct_message_base + 40 + trade_bust_correct_message_at + 1) % 256; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.trade_ref_id[trade_bust_correct_message_at] = (trade_bust_correct_message_base + 48 + trade_bust_correct_message_at + 1) % 256; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.last_px[trade_bust_correct_message_at] = (trade_bust_correct_message_base + 56 + trade_bust_correct_message_at + 1) % 256; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 16 -> trade_bust_correct_message_record.account_account[trade_bust_correct_message_at] = (trade_bust_correct_message_base + 64 + trade_bust_correct_message_at + 1) % 256; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> trade_bust_correct_message_record.last_qty[trade_bust_correct_message_at] = (trade_bust_correct_message_base + 80 + trade_bust_correct_message_at + 1) % 256; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_record.reason_code = (trade_bust_correct_message_base + 84 + 1) % 256;
  trade_bust_correct_message_record.bust_or_correction = (trade_bust_correct_message_base + 85 + 1) % 256;
  skip
}

/* Trade Bust Correct Message to the wire, 86 bytes from where the cursor stands */
inline encode_trade_bust_correct_message(trade_bust_correct_message_record) {
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> wire[at] = trade_bust_correct_message_record.transact_time[trade_bust_correct_message_at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> wire[at] = trade_bust_correct_message_record.instrument_id[trade_bust_correct_message_at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> wire[at] = trade_bust_correct_message_record.market_participant_id[trade_bust_correct_message_at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> wire[at] = trade_bust_correct_message_record.cl_ord_id[trade_bust_correct_message_at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> wire[at] = trade_bust_correct_message_record.order_id[trade_bust_correct_message_at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> wire[at] = trade_bust_correct_message_record.exec_id[trade_bust_correct_message_at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> wire[at] = trade_bust_correct_message_record.trade_id[trade_bust_correct_message_at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> wire[at] = trade_bust_correct_message_record.trade_ref_id[trade_bust_correct_message_at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> wire[at] = trade_bust_correct_message_record.last_px[trade_bust_correct_message_at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 16 -> wire[at] = trade_bust_correct_message_record.account_account[trade_bust_correct_message_at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> wire[at] = trade_bust_correct_message_record.last_qty[trade_bust_correct_message_at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_bust_correct_message_record.reason_code; at = at + 1;
  wire[at] = trade_bust_correct_message_record.bust_or_correction; at = at + 1;
  skip
}

/* Trade Bust Correct Message off the wire, 86 bytes from where the cursor stands */
inline decode_trade_bust_correct_message(trade_bust_correct_message_record) {
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.transact_time[trade_bust_correct_message_at] = wire[at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> trade_bust_correct_message_record.instrument_id[trade_bust_correct_message_at] = wire[at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> trade_bust_correct_message_record.market_participant_id[trade_bust_correct_message_at] = wire[at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.cl_ord_id[trade_bust_correct_message_at] = wire[at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.order_id[trade_bust_correct_message_at] = wire[at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.exec_id[trade_bust_correct_message_at] = wire[at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.trade_id[trade_bust_correct_message_at] = wire[at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.trade_ref_id[trade_bust_correct_message_at] = wire[at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> trade_bust_correct_message_record.last_px[trade_bust_correct_message_at] = wire[at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 16 -> trade_bust_correct_message_record.account_account[trade_bust_correct_message_at] = wire[at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> trade_bust_correct_message_record.last_qty[trade_bust_correct_message_at] = wire[at]; at = at + 1; trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_record.reason_code = wire[at]; at = at + 1;
  trade_bust_correct_message_record.bust_or_correction = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Bust Correct Message is what was written, byte for byte */
inline equal_trade_bust_correct_message(trade_bust_correct_message_read, trade_bust_correct_message_written) {
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> assert(trade_bust_correct_message_read.transact_time[trade_bust_correct_message_at] == trade_bust_correct_message_written.transact_time[trade_bust_correct_message_at]); trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> assert(trade_bust_correct_message_read.instrument_id[trade_bust_correct_message_at] == trade_bust_correct_message_written.instrument_id[trade_bust_correct_message_at]); trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> assert(trade_bust_correct_message_read.market_participant_id[trade_bust_correct_message_at] == trade_bust_correct_message_written.market_participant_id[trade_bust_correct_message_at]); trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> assert(trade_bust_correct_message_read.cl_ord_id[trade_bust_correct_message_at] == trade_bust_correct_message_written.cl_ord_id[trade_bust_correct_message_at]); trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> assert(trade_bust_correct_message_read.order_id[trade_bust_correct_message_at] == trade_bust_correct_message_written.order_id[trade_bust_correct_message_at]); trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> assert(trade_bust_correct_message_read.exec_id[trade_bust_correct_message_at] == trade_bust_correct_message_written.exec_id[trade_bust_correct_message_at]); trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> assert(trade_bust_correct_message_read.trade_id[trade_bust_correct_message_at] == trade_bust_correct_message_written.trade_id[trade_bust_correct_message_at]); trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> assert(trade_bust_correct_message_read.trade_ref_id[trade_bust_correct_message_at] == trade_bust_correct_message_written.trade_ref_id[trade_bust_correct_message_at]); trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 8 -> assert(trade_bust_correct_message_read.last_px[trade_bust_correct_message_at] == trade_bust_correct_message_written.last_px[trade_bust_correct_message_at]); trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 16 -> assert(trade_bust_correct_message_read.account_account[trade_bust_correct_message_at] == trade_bust_correct_message_written.account_account[trade_bust_correct_message_at]); trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  trade_bust_correct_message_at = 0;
  do
  :: trade_bust_correct_message_at < 4 -> assert(trade_bust_correct_message_read.last_qty[trade_bust_correct_message_at] == trade_bust_correct_message_written.last_qty[trade_bust_correct_message_at]); trade_bust_correct_message_at = trade_bust_correct_message_at + 1
  :: else -> break
  od;
  assert(trade_bust_correct_message_read.reason_code == trade_bust_correct_message_written.reason_code);
  assert(trade_bust_correct_message_read.bust_or_correction == trade_bust_correct_message_written.bust_or_correction);
  skip
}

/* ---- Application Layer Reject Message: 47 bytes ------------------------------ */

/* ApplicationLayerRejectMessage */
typedef ApplicationLayerRejectMessage {
  byte transact_time[8];
  byte underlying_id[4];
  byte instrument_id[4];
  byte market_participant_id[4];
  byte cl_ord_id[8];
  byte account_string_16[16];
  byte reason_code;
  byte reject_type;
  byte throttle_indicator
};

int application_layer_reject_message_at;

/* every byte of Application Layer Reject Message set to one value */
inline fill_application_layer_reject_message(application_layer_reject_message_record, application_layer_reject_message_value) {
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 8 -> application_layer_reject_message_record.transact_time[application_layer_reject_message_at] = application_layer_reject_message_value; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> application_layer_reject_message_record.underlying_id[application_layer_reject_message_at] = application_layer_reject_message_value; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> application_layer_reject_message_record.instrument_id[application_layer_reject_message_at] = application_layer_reject_message_value; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> application_layer_reject_message_record.market_participant_id[application_layer_reject_message_at] = application_layer_reject_message_value; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 8 -> application_layer_reject_message_record.cl_ord_id[application_layer_reject_message_at] = application_layer_reject_message_value; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 16 -> application_layer_reject_message_record.account_string_16[application_layer_reject_message_at] = application_layer_reject_message_value; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_record.reason_code = application_layer_reject_message_value;
  application_layer_reject_message_record.reject_type = application_layer_reject_message_value;
  application_layer_reject_message_record.throttle_indicator = application_layer_reject_message_value;
  skip
}

/* each byte of Application Layer Reject Message set to where it lies, so a field read out of place says so */
inline ramp_application_layer_reject_message(application_layer_reject_message_record, application_layer_reject_message_base) {
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 8 -> application_layer_reject_message_record.transact_time[application_layer_reject_message_at] = (application_layer_reject_message_base + 0 + application_layer_reject_message_at + 1) % 256; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> application_layer_reject_message_record.underlying_id[application_layer_reject_message_at] = (application_layer_reject_message_base + 8 + application_layer_reject_message_at + 1) % 256; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> application_layer_reject_message_record.instrument_id[application_layer_reject_message_at] = (application_layer_reject_message_base + 12 + application_layer_reject_message_at + 1) % 256; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> application_layer_reject_message_record.market_participant_id[application_layer_reject_message_at] = (application_layer_reject_message_base + 16 + application_layer_reject_message_at + 1) % 256; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 8 -> application_layer_reject_message_record.cl_ord_id[application_layer_reject_message_at] = (application_layer_reject_message_base + 20 + application_layer_reject_message_at + 1) % 256; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 16 -> application_layer_reject_message_record.account_string_16[application_layer_reject_message_at] = (application_layer_reject_message_base + 28 + application_layer_reject_message_at + 1) % 256; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_record.reason_code = (application_layer_reject_message_base + 44 + 1) % 256;
  application_layer_reject_message_record.reject_type = (application_layer_reject_message_base + 45 + 1) % 256;
  application_layer_reject_message_record.throttle_indicator = (application_layer_reject_message_base + 46 + 1) % 256;
  skip
}

/* Application Layer Reject Message to the wire, 47 bytes from where the cursor stands */
inline encode_application_layer_reject_message(application_layer_reject_message_record) {
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 8 -> wire[at] = application_layer_reject_message_record.transact_time[application_layer_reject_message_at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> wire[at] = application_layer_reject_message_record.underlying_id[application_layer_reject_message_at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> wire[at] = application_layer_reject_message_record.instrument_id[application_layer_reject_message_at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> wire[at] = application_layer_reject_message_record.market_participant_id[application_layer_reject_message_at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 8 -> wire[at] = application_layer_reject_message_record.cl_ord_id[application_layer_reject_message_at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 16 -> wire[at] = application_layer_reject_message_record.account_string_16[application_layer_reject_message_at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = application_layer_reject_message_record.reason_code; at = at + 1;
  wire[at] = application_layer_reject_message_record.reject_type; at = at + 1;
  wire[at] = application_layer_reject_message_record.throttle_indicator; at = at + 1;
  skip
}

/* Application Layer Reject Message off the wire, 47 bytes from where the cursor stands */
inline decode_application_layer_reject_message(application_layer_reject_message_record) {
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 8 -> application_layer_reject_message_record.transact_time[application_layer_reject_message_at] = wire[at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> application_layer_reject_message_record.underlying_id[application_layer_reject_message_at] = wire[at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> application_layer_reject_message_record.instrument_id[application_layer_reject_message_at] = wire[at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> application_layer_reject_message_record.market_participant_id[application_layer_reject_message_at] = wire[at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 8 -> application_layer_reject_message_record.cl_ord_id[application_layer_reject_message_at] = wire[at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 16 -> application_layer_reject_message_record.account_string_16[application_layer_reject_message_at] = wire[at]; at = at + 1; application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_record.reason_code = wire[at]; at = at + 1;
  application_layer_reject_message_record.reject_type = wire[at]; at = at + 1;
  application_layer_reject_message_record.throttle_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Application Layer Reject Message is what was written, byte for byte */
inline equal_application_layer_reject_message(application_layer_reject_message_read, application_layer_reject_message_written) {
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 8 -> assert(application_layer_reject_message_read.transact_time[application_layer_reject_message_at] == application_layer_reject_message_written.transact_time[application_layer_reject_message_at]); application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> assert(application_layer_reject_message_read.underlying_id[application_layer_reject_message_at] == application_layer_reject_message_written.underlying_id[application_layer_reject_message_at]); application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> assert(application_layer_reject_message_read.instrument_id[application_layer_reject_message_at] == application_layer_reject_message_written.instrument_id[application_layer_reject_message_at]); application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 4 -> assert(application_layer_reject_message_read.market_participant_id[application_layer_reject_message_at] == application_layer_reject_message_written.market_participant_id[application_layer_reject_message_at]); application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 8 -> assert(application_layer_reject_message_read.cl_ord_id[application_layer_reject_message_at] == application_layer_reject_message_written.cl_ord_id[application_layer_reject_message_at]); application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  application_layer_reject_message_at = 0;
  do
  :: application_layer_reject_message_at < 16 -> assert(application_layer_reject_message_read.account_string_16[application_layer_reject_message_at] == application_layer_reject_message_written.account_string_16[application_layer_reject_message_at]); application_layer_reject_message_at = application_layer_reject_message_at + 1
  :: else -> break
  od;
  assert(application_layer_reject_message_read.reason_code == application_layer_reject_message_written.reason_code);
  assert(application_layer_reject_message_read.reject_type == application_layer_reject_message_written.reject_type);
  assert(application_layer_reject_message_read.throttle_indicator == application_layer_reject_message_written.throttle_indicator);
  skip
}

/* ---- Underlying Ref Data Message: 25 bytes ----------------------------------- */

/* UnderlyingRefDataMessage */
typedef UnderlyingRefDataMessage {
  byte transact_time[8];
  byte underlying_id[4];
  byte underlying_symbol[8];
  byte mic[4];
  byte mpv_group
};

int underlying_ref_data_message_at;

/* every byte of Underlying Ref Data Message set to one value */
inline fill_underlying_ref_data_message(underlying_ref_data_message_record, underlying_ref_data_message_value) {
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> underlying_ref_data_message_record.transact_time[underlying_ref_data_message_at] = underlying_ref_data_message_value; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> underlying_ref_data_message_record.underlying_id[underlying_ref_data_message_at] = underlying_ref_data_message_value; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> underlying_ref_data_message_record.underlying_symbol[underlying_ref_data_message_at] = underlying_ref_data_message_value; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> underlying_ref_data_message_record.mic[underlying_ref_data_message_at] = underlying_ref_data_message_value; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_record.mpv_group = underlying_ref_data_message_value;
  skip
}

/* each byte of Underlying Ref Data Message set to where it lies, so a field read out of place says so */
inline ramp_underlying_ref_data_message(underlying_ref_data_message_record, underlying_ref_data_message_base) {
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> underlying_ref_data_message_record.transact_time[underlying_ref_data_message_at] = (underlying_ref_data_message_base + 0 + underlying_ref_data_message_at + 1) % 256; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> underlying_ref_data_message_record.underlying_id[underlying_ref_data_message_at] = (underlying_ref_data_message_base + 8 + underlying_ref_data_message_at + 1) % 256; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> underlying_ref_data_message_record.underlying_symbol[underlying_ref_data_message_at] = (underlying_ref_data_message_base + 12 + underlying_ref_data_message_at + 1) % 256; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> underlying_ref_data_message_record.mic[underlying_ref_data_message_at] = (underlying_ref_data_message_base + 20 + underlying_ref_data_message_at + 1) % 256; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_record.mpv_group = (underlying_ref_data_message_base + 24 + 1) % 256;
  skip
}

/* Underlying Ref Data Message to the wire, 25 bytes from where the cursor stands */
inline encode_underlying_ref_data_message(underlying_ref_data_message_record) {
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> wire[at] = underlying_ref_data_message_record.transact_time[underlying_ref_data_message_at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> wire[at] = underlying_ref_data_message_record.underlying_id[underlying_ref_data_message_at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> wire[at] = underlying_ref_data_message_record.underlying_symbol[underlying_ref_data_message_at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> wire[at] = underlying_ref_data_message_record.mic[underlying_ref_data_message_at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  wire[at] = underlying_ref_data_message_record.mpv_group; at = at + 1;
  skip
}

/* Underlying Ref Data Message off the wire, 25 bytes from where the cursor stands */
inline decode_underlying_ref_data_message(underlying_ref_data_message_record) {
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> underlying_ref_data_message_record.transact_time[underlying_ref_data_message_at] = wire[at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> underlying_ref_data_message_record.underlying_id[underlying_ref_data_message_at] = wire[at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> underlying_ref_data_message_record.underlying_symbol[underlying_ref_data_message_at] = wire[at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> underlying_ref_data_message_record.mic[underlying_ref_data_message_at] = wire[at]; at = at + 1; underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_record.mpv_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Underlying Ref Data Message is what was written, byte for byte */
inline equal_underlying_ref_data_message(underlying_ref_data_message_read, underlying_ref_data_message_written) {
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> assert(underlying_ref_data_message_read.transact_time[underlying_ref_data_message_at] == underlying_ref_data_message_written.transact_time[underlying_ref_data_message_at]); underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> assert(underlying_ref_data_message_read.underlying_id[underlying_ref_data_message_at] == underlying_ref_data_message_written.underlying_id[underlying_ref_data_message_at]); underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 8 -> assert(underlying_ref_data_message_read.underlying_symbol[underlying_ref_data_message_at] == underlying_ref_data_message_written.underlying_symbol[underlying_ref_data_message_at]); underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  underlying_ref_data_message_at = 0;
  do
  :: underlying_ref_data_message_at < 4 -> assert(underlying_ref_data_message_read.mic[underlying_ref_data_message_at] == underlying_ref_data_message_written.mic[underlying_ref_data_message_at]); underlying_ref_data_message_at = underlying_ref_data_message_at + 1
  :: else -> break
  od;
  assert(underlying_ref_data_message_read.mpv_group == underlying_ref_data_message_written.mpv_group);
  skip
}

/* ---- Instrument Ref Data Message: 59 bytes ----------------------------------- */

/* InstrumentRefDataMessage */
typedef InstrumentRefDataMessage {
  byte transact_time[8];
  byte instrument_id[4];
  byte underlying_id[4];
  byte osi_symbol[21];
  byte maturity_date[8];
  byte option_type;
  byte strike_price[8];
  byte closing_only;
  byte orp_enabled;
  byte trading_ring;
  byte matching_unit[2]
};

int instrument_ref_data_message_at;

/* every byte of Instrument Ref Data Message set to one value */
inline fill_instrument_ref_data_message(instrument_ref_data_message_record, instrument_ref_data_message_value) {
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> instrument_ref_data_message_record.transact_time[instrument_ref_data_message_at] = instrument_ref_data_message_value; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 4 -> instrument_ref_data_message_record.instrument_id[instrument_ref_data_message_at] = instrument_ref_data_message_value; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 4 -> instrument_ref_data_message_record.underlying_id[instrument_ref_data_message_at] = instrument_ref_data_message_value; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 21 -> instrument_ref_data_message_record.osi_symbol[instrument_ref_data_message_at] = instrument_ref_data_message_value; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> instrument_ref_data_message_record.maturity_date[instrument_ref_data_message_at] = instrument_ref_data_message_value; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_record.option_type = instrument_ref_data_message_value;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> instrument_ref_data_message_record.strike_price[instrument_ref_data_message_at] = instrument_ref_data_message_value; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_record.closing_only = instrument_ref_data_message_value;
  instrument_ref_data_message_record.orp_enabled = instrument_ref_data_message_value;
  instrument_ref_data_message_record.trading_ring = instrument_ref_data_message_value;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 2 -> instrument_ref_data_message_record.matching_unit[instrument_ref_data_message_at] = instrument_ref_data_message_value; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Ref Data Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_ref_data_message(instrument_ref_data_message_record, instrument_ref_data_message_base) {
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> instrument_ref_data_message_record.transact_time[instrument_ref_data_message_at] = (instrument_ref_data_message_base + 0 + instrument_ref_data_message_at + 1) % 256; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 4 -> instrument_ref_data_message_record.instrument_id[instrument_ref_data_message_at] = (instrument_ref_data_message_base + 8 + instrument_ref_data_message_at + 1) % 256; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 4 -> instrument_ref_data_message_record.underlying_id[instrument_ref_data_message_at] = (instrument_ref_data_message_base + 12 + instrument_ref_data_message_at + 1) % 256; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 21 -> instrument_ref_data_message_record.osi_symbol[instrument_ref_data_message_at] = (instrument_ref_data_message_base + 16 + instrument_ref_data_message_at + 1) % 256; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> instrument_ref_data_message_record.maturity_date[instrument_ref_data_message_at] = (instrument_ref_data_message_base + 37 + instrument_ref_data_message_at + 1) % 256; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_record.option_type = (instrument_ref_data_message_base + 45 + 1) % 256;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> instrument_ref_data_message_record.strike_price[instrument_ref_data_message_at] = (instrument_ref_data_message_base + 46 + instrument_ref_data_message_at + 1) % 256; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_record.closing_only = (instrument_ref_data_message_base + 54 + 1) % 256;
  instrument_ref_data_message_record.orp_enabled = (instrument_ref_data_message_base + 55 + 1) % 256;
  instrument_ref_data_message_record.trading_ring = (instrument_ref_data_message_base + 56 + 1) % 256;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 2 -> instrument_ref_data_message_record.matching_unit[instrument_ref_data_message_at] = (instrument_ref_data_message_base + 57 + instrument_ref_data_message_at + 1) % 256; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Ref Data Message to the wire, 59 bytes from where the cursor stands */
inline encode_instrument_ref_data_message(instrument_ref_data_message_record) {
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> wire[at] = instrument_ref_data_message_record.transact_time[instrument_ref_data_message_at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 4 -> wire[at] = instrument_ref_data_message_record.instrument_id[instrument_ref_data_message_at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 4 -> wire[at] = instrument_ref_data_message_record.underlying_id[instrument_ref_data_message_at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 21 -> wire[at] = instrument_ref_data_message_record.osi_symbol[instrument_ref_data_message_at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> wire[at] = instrument_ref_data_message_record.maturity_date[instrument_ref_data_message_at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_ref_data_message_record.option_type; at = at + 1;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> wire[at] = instrument_ref_data_message_record.strike_price[instrument_ref_data_message_at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_ref_data_message_record.closing_only; at = at + 1;
  wire[at] = instrument_ref_data_message_record.orp_enabled; at = at + 1;
  wire[at] = instrument_ref_data_message_record.trading_ring; at = at + 1;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 2 -> wire[at] = instrument_ref_data_message_record.matching_unit[instrument_ref_data_message_at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Ref Data Message off the wire, 59 bytes from where the cursor stands */
inline decode_instrument_ref_data_message(instrument_ref_data_message_record) {
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> instrument_ref_data_message_record.transact_time[instrument_ref_data_message_at] = wire[at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 4 -> instrument_ref_data_message_record.instrument_id[instrument_ref_data_message_at] = wire[at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 4 -> instrument_ref_data_message_record.underlying_id[instrument_ref_data_message_at] = wire[at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 21 -> instrument_ref_data_message_record.osi_symbol[instrument_ref_data_message_at] = wire[at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> instrument_ref_data_message_record.maturity_date[instrument_ref_data_message_at] = wire[at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_record.option_type = wire[at]; at = at + 1;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> instrument_ref_data_message_record.strike_price[instrument_ref_data_message_at] = wire[at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_record.closing_only = wire[at]; at = at + 1;
  instrument_ref_data_message_record.orp_enabled = wire[at]; at = at + 1;
  instrument_ref_data_message_record.trading_ring = wire[at]; at = at + 1;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 2 -> instrument_ref_data_message_record.matching_unit[instrument_ref_data_message_at] = wire[at]; at = at + 1; instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Ref Data Message is what was written, byte for byte */
inline equal_instrument_ref_data_message(instrument_ref_data_message_read, instrument_ref_data_message_written) {
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> assert(instrument_ref_data_message_read.transact_time[instrument_ref_data_message_at] == instrument_ref_data_message_written.transact_time[instrument_ref_data_message_at]); instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 4 -> assert(instrument_ref_data_message_read.instrument_id[instrument_ref_data_message_at] == instrument_ref_data_message_written.instrument_id[instrument_ref_data_message_at]); instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 4 -> assert(instrument_ref_data_message_read.underlying_id[instrument_ref_data_message_at] == instrument_ref_data_message_written.underlying_id[instrument_ref_data_message_at]); instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 21 -> assert(instrument_ref_data_message_read.osi_symbol[instrument_ref_data_message_at] == instrument_ref_data_message_written.osi_symbol[instrument_ref_data_message_at]); instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> assert(instrument_ref_data_message_read.maturity_date[instrument_ref_data_message_at] == instrument_ref_data_message_written.maturity_date[instrument_ref_data_message_at]); instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  assert(instrument_ref_data_message_read.option_type == instrument_ref_data_message_written.option_type);
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 8 -> assert(instrument_ref_data_message_read.strike_price[instrument_ref_data_message_at] == instrument_ref_data_message_written.strike_price[instrument_ref_data_message_at]); instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  assert(instrument_ref_data_message_read.closing_only == instrument_ref_data_message_written.closing_only);
  assert(instrument_ref_data_message_read.orp_enabled == instrument_ref_data_message_written.orp_enabled);
  assert(instrument_ref_data_message_read.trading_ring == instrument_ref_data_message_written.trading_ring);
  instrument_ref_data_message_at = 0;
  do
  :: instrument_ref_data_message_at < 2 -> assert(instrument_ref_data_message_read.matching_unit[instrument_ref_data_message_at] == instrument_ref_data_message_written.matching_unit[instrument_ref_data_message_at]); instrument_ref_data_message_at = instrument_ref_data_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mpid Configuration Acknowledgement Message: 76 bytes -------------------- */

/* MPIDConfigurationAcknowledgementMessage */
typedef MpidConfigurationAcknowledgementMessage {
  byte transact_time[8];
  byte market_participant_id[4];
  byte mpid_status;
  byte member[8];
  byte max_qty[4];
  byte max_notional[8];
  byte default_account[16];
  byte default_optional_data[16];
  byte default_clearing_account[4];
  byte allow_market_orders;
  byte allow_isoioc;
  byte allow_iso_day;
  byte max_duplicative[4]
};

int mpid_configuration_acknowledgement_message_at;

/* every byte of Mpid Configuration Acknowledgement Message set to one value */
inline fill_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_record, mpid_configuration_acknowledgement_message_value) {
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> mpid_configuration_acknowledgement_message_record.transact_time[mpid_configuration_acknowledgement_message_at] = mpid_configuration_acknowledgement_message_value; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.market_participant_id[mpid_configuration_acknowledgement_message_at] = mpid_configuration_acknowledgement_message_value; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_record.mpid_status = mpid_configuration_acknowledgement_message_value;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> mpid_configuration_acknowledgement_message_record.member[mpid_configuration_acknowledgement_message_at] = mpid_configuration_acknowledgement_message_value; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.max_qty[mpid_configuration_acknowledgement_message_at] = mpid_configuration_acknowledgement_message_value; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> mpid_configuration_acknowledgement_message_record.max_notional[mpid_configuration_acknowledgement_message_at] = mpid_configuration_acknowledgement_message_value; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 16 -> mpid_configuration_acknowledgement_message_record.default_account[mpid_configuration_acknowledgement_message_at] = mpid_configuration_acknowledgement_message_value; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 16 -> mpid_configuration_acknowledgement_message_record.default_optional_data[mpid_configuration_acknowledgement_message_at] = mpid_configuration_acknowledgement_message_value; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.default_clearing_account[mpid_configuration_acknowledgement_message_at] = mpid_configuration_acknowledgement_message_value; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_record.allow_market_orders = mpid_configuration_acknowledgement_message_value;
  mpid_configuration_acknowledgement_message_record.allow_isoioc = mpid_configuration_acknowledgement_message_value;
  mpid_configuration_acknowledgement_message_record.allow_iso_day = mpid_configuration_acknowledgement_message_value;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.max_duplicative[mpid_configuration_acknowledgement_message_at] = mpid_configuration_acknowledgement_message_value; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mpid Configuration Acknowledgement Message set to where it lies, so a field read out of place says so */
inline ramp_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_record, mpid_configuration_acknowledgement_message_base) {
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> mpid_configuration_acknowledgement_message_record.transact_time[mpid_configuration_acknowledgement_message_at] = (mpid_configuration_acknowledgement_message_base + 0 + mpid_configuration_acknowledgement_message_at + 1) % 256; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.market_participant_id[mpid_configuration_acknowledgement_message_at] = (mpid_configuration_acknowledgement_message_base + 8 + mpid_configuration_acknowledgement_message_at + 1) % 256; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_record.mpid_status = (mpid_configuration_acknowledgement_message_base + 12 + 1) % 256;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> mpid_configuration_acknowledgement_message_record.member[mpid_configuration_acknowledgement_message_at] = (mpid_configuration_acknowledgement_message_base + 13 + mpid_configuration_acknowledgement_message_at + 1) % 256; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.max_qty[mpid_configuration_acknowledgement_message_at] = (mpid_configuration_acknowledgement_message_base + 21 + mpid_configuration_acknowledgement_message_at + 1) % 256; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> mpid_configuration_acknowledgement_message_record.max_notional[mpid_configuration_acknowledgement_message_at] = (mpid_configuration_acknowledgement_message_base + 25 + mpid_configuration_acknowledgement_message_at + 1) % 256; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 16 -> mpid_configuration_acknowledgement_message_record.default_account[mpid_configuration_acknowledgement_message_at] = (mpid_configuration_acknowledgement_message_base + 33 + mpid_configuration_acknowledgement_message_at + 1) % 256; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 16 -> mpid_configuration_acknowledgement_message_record.default_optional_data[mpid_configuration_acknowledgement_message_at] = (mpid_configuration_acknowledgement_message_base + 49 + mpid_configuration_acknowledgement_message_at + 1) % 256; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.default_clearing_account[mpid_configuration_acknowledgement_message_at] = (mpid_configuration_acknowledgement_message_base + 65 + mpid_configuration_acknowledgement_message_at + 1) % 256; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_record.allow_market_orders = (mpid_configuration_acknowledgement_message_base + 69 + 1) % 256;
  mpid_configuration_acknowledgement_message_record.allow_isoioc = (mpid_configuration_acknowledgement_message_base + 70 + 1) % 256;
  mpid_configuration_acknowledgement_message_record.allow_iso_day = (mpid_configuration_acknowledgement_message_base + 71 + 1) % 256;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.max_duplicative[mpid_configuration_acknowledgement_message_at] = (mpid_configuration_acknowledgement_message_base + 72 + mpid_configuration_acknowledgement_message_at + 1) % 256; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mpid Configuration Acknowledgement Message to the wire, 76 bytes from where the cursor stands */
inline encode_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_record) {
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> wire[at] = mpid_configuration_acknowledgement_message_record.transact_time[mpid_configuration_acknowledgement_message_at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> wire[at] = mpid_configuration_acknowledgement_message_record.market_participant_id[mpid_configuration_acknowledgement_message_at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = mpid_configuration_acknowledgement_message_record.mpid_status; at = at + 1;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> wire[at] = mpid_configuration_acknowledgement_message_record.member[mpid_configuration_acknowledgement_message_at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> wire[at] = mpid_configuration_acknowledgement_message_record.max_qty[mpid_configuration_acknowledgement_message_at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> wire[at] = mpid_configuration_acknowledgement_message_record.max_notional[mpid_configuration_acknowledgement_message_at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 16 -> wire[at] = mpid_configuration_acknowledgement_message_record.default_account[mpid_configuration_acknowledgement_message_at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 16 -> wire[at] = mpid_configuration_acknowledgement_message_record.default_optional_data[mpid_configuration_acknowledgement_message_at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> wire[at] = mpid_configuration_acknowledgement_message_record.default_clearing_account[mpid_configuration_acknowledgement_message_at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = mpid_configuration_acknowledgement_message_record.allow_market_orders; at = at + 1;
  wire[at] = mpid_configuration_acknowledgement_message_record.allow_isoioc; at = at + 1;
  wire[at] = mpid_configuration_acknowledgement_message_record.allow_iso_day; at = at + 1;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> wire[at] = mpid_configuration_acknowledgement_message_record.max_duplicative[mpid_configuration_acknowledgement_message_at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mpid Configuration Acknowledgement Message off the wire, 76 bytes from where the cursor stands */
inline decode_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_record) {
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> mpid_configuration_acknowledgement_message_record.transact_time[mpid_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.market_participant_id[mpid_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_record.mpid_status = wire[at]; at = at + 1;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> mpid_configuration_acknowledgement_message_record.member[mpid_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.max_qty[mpid_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> mpid_configuration_acknowledgement_message_record.max_notional[mpid_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 16 -> mpid_configuration_acknowledgement_message_record.default_account[mpid_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 16 -> mpid_configuration_acknowledgement_message_record.default_optional_data[mpid_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.default_clearing_account[mpid_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_record.allow_market_orders = wire[at]; at = at + 1;
  mpid_configuration_acknowledgement_message_record.allow_isoioc = wire[at]; at = at + 1;
  mpid_configuration_acknowledgement_message_record.allow_iso_day = wire[at]; at = at + 1;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> mpid_configuration_acknowledgement_message_record.max_duplicative[mpid_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mpid Configuration Acknowledgement Message is what was written, byte for byte */
inline equal_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_read, mpid_configuration_acknowledgement_message_written) {
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> assert(mpid_configuration_acknowledgement_message_read.transact_time[mpid_configuration_acknowledgement_message_at] == mpid_configuration_acknowledgement_message_written.transact_time[mpid_configuration_acknowledgement_message_at]); mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> assert(mpid_configuration_acknowledgement_message_read.market_participant_id[mpid_configuration_acknowledgement_message_at] == mpid_configuration_acknowledgement_message_written.market_participant_id[mpid_configuration_acknowledgement_message_at]); mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(mpid_configuration_acknowledgement_message_read.mpid_status == mpid_configuration_acknowledgement_message_written.mpid_status);
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> assert(mpid_configuration_acknowledgement_message_read.member[mpid_configuration_acknowledgement_message_at] == mpid_configuration_acknowledgement_message_written.member[mpid_configuration_acknowledgement_message_at]); mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> assert(mpid_configuration_acknowledgement_message_read.max_qty[mpid_configuration_acknowledgement_message_at] == mpid_configuration_acknowledgement_message_written.max_qty[mpid_configuration_acknowledgement_message_at]); mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 8 -> assert(mpid_configuration_acknowledgement_message_read.max_notional[mpid_configuration_acknowledgement_message_at] == mpid_configuration_acknowledgement_message_written.max_notional[mpid_configuration_acknowledgement_message_at]); mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 16 -> assert(mpid_configuration_acknowledgement_message_read.default_account[mpid_configuration_acknowledgement_message_at] == mpid_configuration_acknowledgement_message_written.default_account[mpid_configuration_acknowledgement_message_at]); mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 16 -> assert(mpid_configuration_acknowledgement_message_read.default_optional_data[mpid_configuration_acknowledgement_message_at] == mpid_configuration_acknowledgement_message_written.default_optional_data[mpid_configuration_acknowledgement_message_at]); mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> assert(mpid_configuration_acknowledgement_message_read.default_clearing_account[mpid_configuration_acknowledgement_message_at] == mpid_configuration_acknowledgement_message_written.default_clearing_account[mpid_configuration_acknowledgement_message_at]); mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(mpid_configuration_acknowledgement_message_read.allow_market_orders == mpid_configuration_acknowledgement_message_written.allow_market_orders);
  assert(mpid_configuration_acknowledgement_message_read.allow_isoioc == mpid_configuration_acknowledgement_message_written.allow_isoioc);
  assert(mpid_configuration_acknowledgement_message_read.allow_iso_day == mpid_configuration_acknowledgement_message_written.allow_iso_day);
  mpid_configuration_acknowledgement_message_at = 0;
  do
  :: mpid_configuration_acknowledgement_message_at < 4 -> assert(mpid_configuration_acknowledgement_message_read.max_duplicative[mpid_configuration_acknowledgement_message_at] == mpid_configuration_acknowledgement_message_written.max_duplicative[mpid_configuration_acknowledgement_message_at]); mpid_configuration_acknowledgement_message_at = mpid_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Maker Symbol Appointment Message: 26 bytes ----------------------- */

/* MarketMakerSymbolAppointmentMessage */
typedef MarketMakerSymbolAppointmentMessage {
  byte transact_time[8];
  byte underlying_id[4];
  byte market_participant_id[4];
  byte appointment_type;
  byte appointment_status;
  byte max_allowable_width[4];
  byte quote_relief_mult[4]
};

int market_maker_symbol_appointment_message_at;

/* every byte of Market Maker Symbol Appointment Message set to one value */
inline fill_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_record, market_maker_symbol_appointment_message_value) {
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 8 -> market_maker_symbol_appointment_message_record.transact_time[market_maker_symbol_appointment_message_at] = market_maker_symbol_appointment_message_value; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.underlying_id[market_maker_symbol_appointment_message_at] = market_maker_symbol_appointment_message_value; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.market_participant_id[market_maker_symbol_appointment_message_at] = market_maker_symbol_appointment_message_value; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_record.appointment_type = market_maker_symbol_appointment_message_value;
  market_maker_symbol_appointment_message_record.appointment_status = market_maker_symbol_appointment_message_value;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.max_allowable_width[market_maker_symbol_appointment_message_at] = market_maker_symbol_appointment_message_value; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.quote_relief_mult[market_maker_symbol_appointment_message_at] = market_maker_symbol_appointment_message_value; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Maker Symbol Appointment Message set to where it lies, so a field read out of place says so */
inline ramp_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_record, market_maker_symbol_appointment_message_base) {
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 8 -> market_maker_symbol_appointment_message_record.transact_time[market_maker_symbol_appointment_message_at] = (market_maker_symbol_appointment_message_base + 0 + market_maker_symbol_appointment_message_at + 1) % 256; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.underlying_id[market_maker_symbol_appointment_message_at] = (market_maker_symbol_appointment_message_base + 8 + market_maker_symbol_appointment_message_at + 1) % 256; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.market_participant_id[market_maker_symbol_appointment_message_at] = (market_maker_symbol_appointment_message_base + 12 + market_maker_symbol_appointment_message_at + 1) % 256; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_record.appointment_type = (market_maker_symbol_appointment_message_base + 16 + 1) % 256;
  market_maker_symbol_appointment_message_record.appointment_status = (market_maker_symbol_appointment_message_base + 17 + 1) % 256;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.max_allowable_width[market_maker_symbol_appointment_message_at] = (market_maker_symbol_appointment_message_base + 18 + market_maker_symbol_appointment_message_at + 1) % 256; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.quote_relief_mult[market_maker_symbol_appointment_message_at] = (market_maker_symbol_appointment_message_base + 22 + market_maker_symbol_appointment_message_at + 1) % 256; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Maker Symbol Appointment Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_record) {
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 8 -> wire[at] = market_maker_symbol_appointment_message_record.transact_time[market_maker_symbol_appointment_message_at]; at = at + 1; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> wire[at] = market_maker_symbol_appointment_message_record.underlying_id[market_maker_symbol_appointment_message_at]; at = at + 1; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> wire[at] = market_maker_symbol_appointment_message_record.market_participant_id[market_maker_symbol_appointment_message_at]; at = at + 1; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  wire[at] = market_maker_symbol_appointment_message_record.appointment_type; at = at + 1;
  wire[at] = market_maker_symbol_appointment_message_record.appointment_status; at = at + 1;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> wire[at] = market_maker_symbol_appointment_message_record.max_allowable_width[market_maker_symbol_appointment_message_at]; at = at + 1; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> wire[at] = market_maker_symbol_appointment_message_record.quote_relief_mult[market_maker_symbol_appointment_message_at]; at = at + 1; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Maker Symbol Appointment Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_record) {
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 8 -> market_maker_symbol_appointment_message_record.transact_time[market_maker_symbol_appointment_message_at] = wire[at]; at = at + 1; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.underlying_id[market_maker_symbol_appointment_message_at] = wire[at]; at = at + 1; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.market_participant_id[market_maker_symbol_appointment_message_at] = wire[at]; at = at + 1; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_record.appointment_type = wire[at]; at = at + 1;
  market_maker_symbol_appointment_message_record.appointment_status = wire[at]; at = at + 1;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.max_allowable_width[market_maker_symbol_appointment_message_at] = wire[at]; at = at + 1; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> market_maker_symbol_appointment_message_record.quote_relief_mult[market_maker_symbol_appointment_message_at] = wire[at]; at = at + 1; market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Maker Symbol Appointment Message is what was written, byte for byte */
inline equal_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_read, market_maker_symbol_appointment_message_written) {
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 8 -> assert(market_maker_symbol_appointment_message_read.transact_time[market_maker_symbol_appointment_message_at] == market_maker_symbol_appointment_message_written.transact_time[market_maker_symbol_appointment_message_at]); market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> assert(market_maker_symbol_appointment_message_read.underlying_id[market_maker_symbol_appointment_message_at] == market_maker_symbol_appointment_message_written.underlying_id[market_maker_symbol_appointment_message_at]); market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> assert(market_maker_symbol_appointment_message_read.market_participant_id[market_maker_symbol_appointment_message_at] == market_maker_symbol_appointment_message_written.market_participant_id[market_maker_symbol_appointment_message_at]); market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  assert(market_maker_symbol_appointment_message_read.appointment_type == market_maker_symbol_appointment_message_written.appointment_type);
  assert(market_maker_symbol_appointment_message_read.appointment_status == market_maker_symbol_appointment_message_written.appointment_status);
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> assert(market_maker_symbol_appointment_message_read.max_allowable_width[market_maker_symbol_appointment_message_at] == market_maker_symbol_appointment_message_written.max_allowable_width[market_maker_symbol_appointment_message_at]); market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  market_maker_symbol_appointment_message_at = 0;
  do
  :: market_maker_symbol_appointment_message_at < 4 -> assert(market_maker_symbol_appointment_message_read.quote_relief_mult[market_maker_symbol_appointment_message_at] == market_maker_symbol_appointment_message_written.quote_relief_mult[market_maker_symbol_appointment_message_at]); market_maker_symbol_appointment_message_at = market_maker_symbol_appointment_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Session Configuration Acknowledgement Message: 35 bytes ----------------- */

/* SessionConfigurationAcknowledgementMessage */
typedef SessionConfigurationAcknowledgementMessage {
  byte transact_time[8];
  byte user_session_type;
  byte user_session_status;
  byte member[8];
  byte default_mpid[4];
  byte mic[4];
  byte cancel_on_disconnect;
  byte aiq_default[3];
  byte order_unsolicited_ack_subscription;
  byte quote_unsolicited_ack_subscription;
  byte default_attributed_quote;
  byte default_cancel_instead_of_slide;
  byte trading_ring
};

int session_configuration_acknowledgement_message_at;

/* every byte of Session Configuration Acknowledgement Message set to one value */
inline fill_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_record, session_configuration_acknowledgement_message_value) {
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 8 -> session_configuration_acknowledgement_message_record.transact_time[session_configuration_acknowledgement_message_at] = session_configuration_acknowledgement_message_value; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_record.user_session_type = session_configuration_acknowledgement_message_value;
  session_configuration_acknowledgement_message_record.user_session_status = session_configuration_acknowledgement_message_value;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 8 -> session_configuration_acknowledgement_message_record.member[session_configuration_acknowledgement_message_at] = session_configuration_acknowledgement_message_value; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 4 -> session_configuration_acknowledgement_message_record.default_mpid[session_configuration_acknowledgement_message_at] = session_configuration_acknowledgement_message_value; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 4 -> session_configuration_acknowledgement_message_record.mic[session_configuration_acknowledgement_message_at] = session_configuration_acknowledgement_message_value; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_record.cancel_on_disconnect = session_configuration_acknowledgement_message_value;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 3 -> session_configuration_acknowledgement_message_record.aiq_default[session_configuration_acknowledgement_message_at] = session_configuration_acknowledgement_message_value; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_record.order_unsolicited_ack_subscription = session_configuration_acknowledgement_message_value;
  session_configuration_acknowledgement_message_record.quote_unsolicited_ack_subscription = session_configuration_acknowledgement_message_value;
  session_configuration_acknowledgement_message_record.default_attributed_quote = session_configuration_acknowledgement_message_value;
  session_configuration_acknowledgement_message_record.default_cancel_instead_of_slide = session_configuration_acknowledgement_message_value;
  session_configuration_acknowledgement_message_record.trading_ring = session_configuration_acknowledgement_message_value;
  skip
}

/* each byte of Session Configuration Acknowledgement Message set to where it lies, so a field read out of place says so */
inline ramp_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_record, session_configuration_acknowledgement_message_base) {
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 8 -> session_configuration_acknowledgement_message_record.transact_time[session_configuration_acknowledgement_message_at] = (session_configuration_acknowledgement_message_base + 0 + session_configuration_acknowledgement_message_at + 1) % 256; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_record.user_session_type = (session_configuration_acknowledgement_message_base + 8 + 1) % 256;
  session_configuration_acknowledgement_message_record.user_session_status = (session_configuration_acknowledgement_message_base + 9 + 1) % 256;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 8 -> session_configuration_acknowledgement_message_record.member[session_configuration_acknowledgement_message_at] = (session_configuration_acknowledgement_message_base + 10 + session_configuration_acknowledgement_message_at + 1) % 256; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 4 -> session_configuration_acknowledgement_message_record.default_mpid[session_configuration_acknowledgement_message_at] = (session_configuration_acknowledgement_message_base + 18 + session_configuration_acknowledgement_message_at + 1) % 256; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 4 -> session_configuration_acknowledgement_message_record.mic[session_configuration_acknowledgement_message_at] = (session_configuration_acknowledgement_message_base + 22 + session_configuration_acknowledgement_message_at + 1) % 256; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_record.cancel_on_disconnect = (session_configuration_acknowledgement_message_base + 26 + 1) % 256;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 3 -> session_configuration_acknowledgement_message_record.aiq_default[session_configuration_acknowledgement_message_at] = (session_configuration_acknowledgement_message_base + 27 + session_configuration_acknowledgement_message_at + 1) % 256; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_record.order_unsolicited_ack_subscription = (session_configuration_acknowledgement_message_base + 30 + 1) % 256;
  session_configuration_acknowledgement_message_record.quote_unsolicited_ack_subscription = (session_configuration_acknowledgement_message_base + 31 + 1) % 256;
  session_configuration_acknowledgement_message_record.default_attributed_quote = (session_configuration_acknowledgement_message_base + 32 + 1) % 256;
  session_configuration_acknowledgement_message_record.default_cancel_instead_of_slide = (session_configuration_acknowledgement_message_base + 33 + 1) % 256;
  session_configuration_acknowledgement_message_record.trading_ring = (session_configuration_acknowledgement_message_base + 34 + 1) % 256;
  skip
}

/* Session Configuration Acknowledgement Message to the wire, 35 bytes from where the cursor stands */
inline encode_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_record) {
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 8 -> wire[at] = session_configuration_acknowledgement_message_record.transact_time[session_configuration_acknowledgement_message_at]; at = at + 1; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = session_configuration_acknowledgement_message_record.user_session_type; at = at + 1;
  wire[at] = session_configuration_acknowledgement_message_record.user_session_status; at = at + 1;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 8 -> wire[at] = session_configuration_acknowledgement_message_record.member[session_configuration_acknowledgement_message_at]; at = at + 1; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 4 -> wire[at] = session_configuration_acknowledgement_message_record.default_mpid[session_configuration_acknowledgement_message_at]; at = at + 1; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 4 -> wire[at] = session_configuration_acknowledgement_message_record.mic[session_configuration_acknowledgement_message_at]; at = at + 1; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = session_configuration_acknowledgement_message_record.cancel_on_disconnect; at = at + 1;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 3 -> wire[at] = session_configuration_acknowledgement_message_record.aiq_default[session_configuration_acknowledgement_message_at]; at = at + 1; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  wire[at] = session_configuration_acknowledgement_message_record.order_unsolicited_ack_subscription; at = at + 1;
  wire[at] = session_configuration_acknowledgement_message_record.quote_unsolicited_ack_subscription; at = at + 1;
  wire[at] = session_configuration_acknowledgement_message_record.default_attributed_quote; at = at + 1;
  wire[at] = session_configuration_acknowledgement_message_record.default_cancel_instead_of_slide; at = at + 1;
  wire[at] = session_configuration_acknowledgement_message_record.trading_ring; at = at + 1;
  skip
}

/* Session Configuration Acknowledgement Message off the wire, 35 bytes from where the cursor stands */
inline decode_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_record) {
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 8 -> session_configuration_acknowledgement_message_record.transact_time[session_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_record.user_session_type = wire[at]; at = at + 1;
  session_configuration_acknowledgement_message_record.user_session_status = wire[at]; at = at + 1;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 8 -> session_configuration_acknowledgement_message_record.member[session_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 4 -> session_configuration_acknowledgement_message_record.default_mpid[session_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 4 -> session_configuration_acknowledgement_message_record.mic[session_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_record.cancel_on_disconnect = wire[at]; at = at + 1;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 3 -> session_configuration_acknowledgement_message_record.aiq_default[session_configuration_acknowledgement_message_at] = wire[at]; at = at + 1; session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_record.order_unsolicited_ack_subscription = wire[at]; at = at + 1;
  session_configuration_acknowledgement_message_record.quote_unsolicited_ack_subscription = wire[at]; at = at + 1;
  session_configuration_acknowledgement_message_record.default_attributed_quote = wire[at]; at = at + 1;
  session_configuration_acknowledgement_message_record.default_cancel_instead_of_slide = wire[at]; at = at + 1;
  session_configuration_acknowledgement_message_record.trading_ring = wire[at]; at = at + 1;
  skip
}

/* what was read of Session Configuration Acknowledgement Message is what was written, byte for byte */
inline equal_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_read, session_configuration_acknowledgement_message_written) {
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 8 -> assert(session_configuration_acknowledgement_message_read.transact_time[session_configuration_acknowledgement_message_at] == session_configuration_acknowledgement_message_written.transact_time[session_configuration_acknowledgement_message_at]); session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(session_configuration_acknowledgement_message_read.user_session_type == session_configuration_acknowledgement_message_written.user_session_type);
  assert(session_configuration_acknowledgement_message_read.user_session_status == session_configuration_acknowledgement_message_written.user_session_status);
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 8 -> assert(session_configuration_acknowledgement_message_read.member[session_configuration_acknowledgement_message_at] == session_configuration_acknowledgement_message_written.member[session_configuration_acknowledgement_message_at]); session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 4 -> assert(session_configuration_acknowledgement_message_read.default_mpid[session_configuration_acknowledgement_message_at] == session_configuration_acknowledgement_message_written.default_mpid[session_configuration_acknowledgement_message_at]); session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 4 -> assert(session_configuration_acknowledgement_message_read.mic[session_configuration_acknowledgement_message_at] == session_configuration_acknowledgement_message_written.mic[session_configuration_acknowledgement_message_at]); session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(session_configuration_acknowledgement_message_read.cancel_on_disconnect == session_configuration_acknowledgement_message_written.cancel_on_disconnect);
  session_configuration_acknowledgement_message_at = 0;
  do
  :: session_configuration_acknowledgement_message_at < 3 -> assert(session_configuration_acknowledgement_message_read.aiq_default[session_configuration_acknowledgement_message_at] == session_configuration_acknowledgement_message_written.aiq_default[session_configuration_acknowledgement_message_at]); session_configuration_acknowledgement_message_at = session_configuration_acknowledgement_message_at + 1
  :: else -> break
  od;
  assert(session_configuration_acknowledgement_message_read.order_unsolicited_ack_subscription == session_configuration_acknowledgement_message_written.order_unsolicited_ack_subscription);
  assert(session_configuration_acknowledgement_message_read.quote_unsolicited_ack_subscription == session_configuration_acknowledgement_message_written.quote_unsolicited_ack_subscription);
  assert(session_configuration_acknowledgement_message_read.default_attributed_quote == session_configuration_acknowledgement_message_written.default_attributed_quote);
  assert(session_configuration_acknowledgement_message_read.default_cancel_instead_of_slide == session_configuration_acknowledgement_message_written.default_cancel_instead_of_slide);
  assert(session_configuration_acknowledgement_message_read.trading_ring == session_configuration_acknowledgement_message_written.trading_ring);
  skip
}

/* ---- Risk Control Acknowledgment Message: 50 bytes --------------------------- */

/* RiskControlAcknowledgmentMessage */
typedef RiskControlAcknowledgmentMessage {
  byte transact_time[8];
  byte underlying_id_optional[4];
  byte market_participant_id[4];
  byte cl_ord_id[8];
  byte custom_group_id_optional[2];
  byte risk_ack_type;
  byte risk_control_status;
  byte risk_control;
  byte risk_action;
  byte time_limit[8];
  byte percentage_limit[4];
  byte count_limit[4];
  byte ioc_attribution;
  byte blocked_by_breach_indicator;
  byte cust_capacity_weight;
  byte throttle_indicator
};

int risk_control_acknowledgment_message_at;

/* every byte of Risk Control Acknowledgment Message set to one value */
inline fill_risk_control_acknowledgment_message(risk_control_acknowledgment_message_record, risk_control_acknowledgment_message_value) {
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> risk_control_acknowledgment_message_record.transact_time[risk_control_acknowledgment_message_at] = risk_control_acknowledgment_message_value; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.underlying_id_optional[risk_control_acknowledgment_message_at] = risk_control_acknowledgment_message_value; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.market_participant_id[risk_control_acknowledgment_message_at] = risk_control_acknowledgment_message_value; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> risk_control_acknowledgment_message_record.cl_ord_id[risk_control_acknowledgment_message_at] = risk_control_acknowledgment_message_value; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 2 -> risk_control_acknowledgment_message_record.custom_group_id_optional[risk_control_acknowledgment_message_at] = risk_control_acknowledgment_message_value; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_record.risk_ack_type = risk_control_acknowledgment_message_value;
  risk_control_acknowledgment_message_record.risk_control_status = risk_control_acknowledgment_message_value;
  risk_control_acknowledgment_message_record.risk_control = risk_control_acknowledgment_message_value;
  risk_control_acknowledgment_message_record.risk_action = risk_control_acknowledgment_message_value;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> risk_control_acknowledgment_message_record.time_limit[risk_control_acknowledgment_message_at] = risk_control_acknowledgment_message_value; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.percentage_limit[risk_control_acknowledgment_message_at] = risk_control_acknowledgment_message_value; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.count_limit[risk_control_acknowledgment_message_at] = risk_control_acknowledgment_message_value; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_record.ioc_attribution = risk_control_acknowledgment_message_value;
  risk_control_acknowledgment_message_record.blocked_by_breach_indicator = risk_control_acknowledgment_message_value;
  risk_control_acknowledgment_message_record.cust_capacity_weight = risk_control_acknowledgment_message_value;
  risk_control_acknowledgment_message_record.throttle_indicator = risk_control_acknowledgment_message_value;
  skip
}

/* each byte of Risk Control Acknowledgment Message set to where it lies, so a field read out of place says so */
inline ramp_risk_control_acknowledgment_message(risk_control_acknowledgment_message_record, risk_control_acknowledgment_message_base) {
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> risk_control_acknowledgment_message_record.transact_time[risk_control_acknowledgment_message_at] = (risk_control_acknowledgment_message_base + 0 + risk_control_acknowledgment_message_at + 1) % 256; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.underlying_id_optional[risk_control_acknowledgment_message_at] = (risk_control_acknowledgment_message_base + 8 + risk_control_acknowledgment_message_at + 1) % 256; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.market_participant_id[risk_control_acknowledgment_message_at] = (risk_control_acknowledgment_message_base + 12 + risk_control_acknowledgment_message_at + 1) % 256; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> risk_control_acknowledgment_message_record.cl_ord_id[risk_control_acknowledgment_message_at] = (risk_control_acknowledgment_message_base + 16 + risk_control_acknowledgment_message_at + 1) % 256; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 2 -> risk_control_acknowledgment_message_record.custom_group_id_optional[risk_control_acknowledgment_message_at] = (risk_control_acknowledgment_message_base + 24 + risk_control_acknowledgment_message_at + 1) % 256; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_record.risk_ack_type = (risk_control_acknowledgment_message_base + 26 + 1) % 256;
  risk_control_acknowledgment_message_record.risk_control_status = (risk_control_acknowledgment_message_base + 27 + 1) % 256;
  risk_control_acknowledgment_message_record.risk_control = (risk_control_acknowledgment_message_base + 28 + 1) % 256;
  risk_control_acknowledgment_message_record.risk_action = (risk_control_acknowledgment_message_base + 29 + 1) % 256;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> risk_control_acknowledgment_message_record.time_limit[risk_control_acknowledgment_message_at] = (risk_control_acknowledgment_message_base + 30 + risk_control_acknowledgment_message_at + 1) % 256; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.percentage_limit[risk_control_acknowledgment_message_at] = (risk_control_acknowledgment_message_base + 38 + risk_control_acknowledgment_message_at + 1) % 256; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.count_limit[risk_control_acknowledgment_message_at] = (risk_control_acknowledgment_message_base + 42 + risk_control_acknowledgment_message_at + 1) % 256; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_record.ioc_attribution = (risk_control_acknowledgment_message_base + 46 + 1) % 256;
  risk_control_acknowledgment_message_record.blocked_by_breach_indicator = (risk_control_acknowledgment_message_base + 47 + 1) % 256;
  risk_control_acknowledgment_message_record.cust_capacity_weight = (risk_control_acknowledgment_message_base + 48 + 1) % 256;
  risk_control_acknowledgment_message_record.throttle_indicator = (risk_control_acknowledgment_message_base + 49 + 1) % 256;
  skip
}

/* Risk Control Acknowledgment Message to the wire, 50 bytes from where the cursor stands */
inline encode_risk_control_acknowledgment_message(risk_control_acknowledgment_message_record) {
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> wire[at] = risk_control_acknowledgment_message_record.transact_time[risk_control_acknowledgment_message_at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> wire[at] = risk_control_acknowledgment_message_record.underlying_id_optional[risk_control_acknowledgment_message_at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> wire[at] = risk_control_acknowledgment_message_record.market_participant_id[risk_control_acknowledgment_message_at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> wire[at] = risk_control_acknowledgment_message_record.cl_ord_id[risk_control_acknowledgment_message_at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 2 -> wire[at] = risk_control_acknowledgment_message_record.custom_group_id_optional[risk_control_acknowledgment_message_at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  wire[at] = risk_control_acknowledgment_message_record.risk_ack_type; at = at + 1;
  wire[at] = risk_control_acknowledgment_message_record.risk_control_status; at = at + 1;
  wire[at] = risk_control_acknowledgment_message_record.risk_control; at = at + 1;
  wire[at] = risk_control_acknowledgment_message_record.risk_action; at = at + 1;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> wire[at] = risk_control_acknowledgment_message_record.time_limit[risk_control_acknowledgment_message_at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> wire[at] = risk_control_acknowledgment_message_record.percentage_limit[risk_control_acknowledgment_message_at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> wire[at] = risk_control_acknowledgment_message_record.count_limit[risk_control_acknowledgment_message_at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  wire[at] = risk_control_acknowledgment_message_record.ioc_attribution; at = at + 1;
  wire[at] = risk_control_acknowledgment_message_record.blocked_by_breach_indicator; at = at + 1;
  wire[at] = risk_control_acknowledgment_message_record.cust_capacity_weight; at = at + 1;
  wire[at] = risk_control_acknowledgment_message_record.throttle_indicator; at = at + 1;
  skip
}

/* Risk Control Acknowledgment Message off the wire, 50 bytes from where the cursor stands */
inline decode_risk_control_acknowledgment_message(risk_control_acknowledgment_message_record) {
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> risk_control_acknowledgment_message_record.transact_time[risk_control_acknowledgment_message_at] = wire[at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.underlying_id_optional[risk_control_acknowledgment_message_at] = wire[at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.market_participant_id[risk_control_acknowledgment_message_at] = wire[at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> risk_control_acknowledgment_message_record.cl_ord_id[risk_control_acknowledgment_message_at] = wire[at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 2 -> risk_control_acknowledgment_message_record.custom_group_id_optional[risk_control_acknowledgment_message_at] = wire[at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_record.risk_ack_type = wire[at]; at = at + 1;
  risk_control_acknowledgment_message_record.risk_control_status = wire[at]; at = at + 1;
  risk_control_acknowledgment_message_record.risk_control = wire[at]; at = at + 1;
  risk_control_acknowledgment_message_record.risk_action = wire[at]; at = at + 1;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> risk_control_acknowledgment_message_record.time_limit[risk_control_acknowledgment_message_at] = wire[at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.percentage_limit[risk_control_acknowledgment_message_at] = wire[at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> risk_control_acknowledgment_message_record.count_limit[risk_control_acknowledgment_message_at] = wire[at]; at = at + 1; risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_record.ioc_attribution = wire[at]; at = at + 1;
  risk_control_acknowledgment_message_record.blocked_by_breach_indicator = wire[at]; at = at + 1;
  risk_control_acknowledgment_message_record.cust_capacity_weight = wire[at]; at = at + 1;
  risk_control_acknowledgment_message_record.throttle_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Risk Control Acknowledgment Message is what was written, byte for byte */
inline equal_risk_control_acknowledgment_message(risk_control_acknowledgment_message_read, risk_control_acknowledgment_message_written) {
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> assert(risk_control_acknowledgment_message_read.transact_time[risk_control_acknowledgment_message_at] == risk_control_acknowledgment_message_written.transact_time[risk_control_acknowledgment_message_at]); risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> assert(risk_control_acknowledgment_message_read.underlying_id_optional[risk_control_acknowledgment_message_at] == risk_control_acknowledgment_message_written.underlying_id_optional[risk_control_acknowledgment_message_at]); risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> assert(risk_control_acknowledgment_message_read.market_participant_id[risk_control_acknowledgment_message_at] == risk_control_acknowledgment_message_written.market_participant_id[risk_control_acknowledgment_message_at]); risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> assert(risk_control_acknowledgment_message_read.cl_ord_id[risk_control_acknowledgment_message_at] == risk_control_acknowledgment_message_written.cl_ord_id[risk_control_acknowledgment_message_at]); risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 2 -> assert(risk_control_acknowledgment_message_read.custom_group_id_optional[risk_control_acknowledgment_message_at] == risk_control_acknowledgment_message_written.custom_group_id_optional[risk_control_acknowledgment_message_at]); risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  assert(risk_control_acknowledgment_message_read.risk_ack_type == risk_control_acknowledgment_message_written.risk_ack_type);
  assert(risk_control_acknowledgment_message_read.risk_control_status == risk_control_acknowledgment_message_written.risk_control_status);
  assert(risk_control_acknowledgment_message_read.risk_control == risk_control_acknowledgment_message_written.risk_control);
  assert(risk_control_acknowledgment_message_read.risk_action == risk_control_acknowledgment_message_written.risk_action);
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 8 -> assert(risk_control_acknowledgment_message_read.time_limit[risk_control_acknowledgment_message_at] == risk_control_acknowledgment_message_written.time_limit[risk_control_acknowledgment_message_at]); risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> assert(risk_control_acknowledgment_message_read.percentage_limit[risk_control_acknowledgment_message_at] == risk_control_acknowledgment_message_written.percentage_limit[risk_control_acknowledgment_message_at]); risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  risk_control_acknowledgment_message_at = 0;
  do
  :: risk_control_acknowledgment_message_at < 4 -> assert(risk_control_acknowledgment_message_read.count_limit[risk_control_acknowledgment_message_at] == risk_control_acknowledgment_message_written.count_limit[risk_control_acknowledgment_message_at]); risk_control_acknowledgment_message_at = risk_control_acknowledgment_message_at + 1
  :: else -> break
  od;
  assert(risk_control_acknowledgment_message_read.ioc_attribution == risk_control_acknowledgment_message_written.ioc_attribution);
  assert(risk_control_acknowledgment_message_read.blocked_by_breach_indicator == risk_control_acknowledgment_message_written.blocked_by_breach_indicator);
  assert(risk_control_acknowledgment_message_read.cust_capacity_weight == risk_control_acknowledgment_message_written.cust_capacity_weight);
  assert(risk_control_acknowledgment_message_read.throttle_indicator == risk_control_acknowledgment_message_written.throttle_indicator);
  skip
}

/* ---- Risk Control Alert Message: 34 bytes ------------------------------------ */

/* RiskControlAlertMessage */
typedef RiskControlAlertMessage {
  byte transact_time[8];
  byte underlying_id_optional[4];
  byte market_participant_id[4];
  byte risk_control;
  byte time_limit[8];
  byte percentage_limit[4];
  byte count_limit[4];
  byte notification_reason
};

int risk_control_alert_message_at;

/* every byte of Risk Control Alert Message set to one value */
inline fill_risk_control_alert_message(risk_control_alert_message_record, risk_control_alert_message_value) {
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 8 -> risk_control_alert_message_record.transact_time[risk_control_alert_message_at] = risk_control_alert_message_value; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.underlying_id_optional[risk_control_alert_message_at] = risk_control_alert_message_value; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.market_participant_id[risk_control_alert_message_at] = risk_control_alert_message_value; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_record.risk_control = risk_control_alert_message_value;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 8 -> risk_control_alert_message_record.time_limit[risk_control_alert_message_at] = risk_control_alert_message_value; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.percentage_limit[risk_control_alert_message_at] = risk_control_alert_message_value; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.count_limit[risk_control_alert_message_at] = risk_control_alert_message_value; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_record.notification_reason = risk_control_alert_message_value;
  skip
}

/* each byte of Risk Control Alert Message set to where it lies, so a field read out of place says so */
inline ramp_risk_control_alert_message(risk_control_alert_message_record, risk_control_alert_message_base) {
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 8 -> risk_control_alert_message_record.transact_time[risk_control_alert_message_at] = (risk_control_alert_message_base + 0 + risk_control_alert_message_at + 1) % 256; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.underlying_id_optional[risk_control_alert_message_at] = (risk_control_alert_message_base + 8 + risk_control_alert_message_at + 1) % 256; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.market_participant_id[risk_control_alert_message_at] = (risk_control_alert_message_base + 12 + risk_control_alert_message_at + 1) % 256; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_record.risk_control = (risk_control_alert_message_base + 16 + 1) % 256;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 8 -> risk_control_alert_message_record.time_limit[risk_control_alert_message_at] = (risk_control_alert_message_base + 17 + risk_control_alert_message_at + 1) % 256; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.percentage_limit[risk_control_alert_message_at] = (risk_control_alert_message_base + 25 + risk_control_alert_message_at + 1) % 256; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.count_limit[risk_control_alert_message_at] = (risk_control_alert_message_base + 29 + risk_control_alert_message_at + 1) % 256; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_record.notification_reason = (risk_control_alert_message_base + 33 + 1) % 256;
  skip
}

/* Risk Control Alert Message to the wire, 34 bytes from where the cursor stands */
inline encode_risk_control_alert_message(risk_control_alert_message_record) {
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 8 -> wire[at] = risk_control_alert_message_record.transact_time[risk_control_alert_message_at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> wire[at] = risk_control_alert_message_record.underlying_id_optional[risk_control_alert_message_at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> wire[at] = risk_control_alert_message_record.market_participant_id[risk_control_alert_message_at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  wire[at] = risk_control_alert_message_record.risk_control; at = at + 1;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 8 -> wire[at] = risk_control_alert_message_record.time_limit[risk_control_alert_message_at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> wire[at] = risk_control_alert_message_record.percentage_limit[risk_control_alert_message_at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> wire[at] = risk_control_alert_message_record.count_limit[risk_control_alert_message_at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  wire[at] = risk_control_alert_message_record.notification_reason; at = at + 1;
  skip
}

/* Risk Control Alert Message off the wire, 34 bytes from where the cursor stands */
inline decode_risk_control_alert_message(risk_control_alert_message_record) {
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 8 -> risk_control_alert_message_record.transact_time[risk_control_alert_message_at] = wire[at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.underlying_id_optional[risk_control_alert_message_at] = wire[at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.market_participant_id[risk_control_alert_message_at] = wire[at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_record.risk_control = wire[at]; at = at + 1;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 8 -> risk_control_alert_message_record.time_limit[risk_control_alert_message_at] = wire[at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.percentage_limit[risk_control_alert_message_at] = wire[at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> risk_control_alert_message_record.count_limit[risk_control_alert_message_at] = wire[at]; at = at + 1; risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_record.notification_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Risk Control Alert Message is what was written, byte for byte */
inline equal_risk_control_alert_message(risk_control_alert_message_read, risk_control_alert_message_written) {
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 8 -> assert(risk_control_alert_message_read.transact_time[risk_control_alert_message_at] == risk_control_alert_message_written.transact_time[risk_control_alert_message_at]); risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> assert(risk_control_alert_message_read.underlying_id_optional[risk_control_alert_message_at] == risk_control_alert_message_written.underlying_id_optional[risk_control_alert_message_at]); risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> assert(risk_control_alert_message_read.market_participant_id[risk_control_alert_message_at] == risk_control_alert_message_written.market_participant_id[risk_control_alert_message_at]); risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  assert(risk_control_alert_message_read.risk_control == risk_control_alert_message_written.risk_control);
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 8 -> assert(risk_control_alert_message_read.time_limit[risk_control_alert_message_at] == risk_control_alert_message_written.time_limit[risk_control_alert_message_at]); risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> assert(risk_control_alert_message_read.percentage_limit[risk_control_alert_message_at] == risk_control_alert_message_written.percentage_limit[risk_control_alert_message_at]); risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  risk_control_alert_message_at = 0;
  do
  :: risk_control_alert_message_at < 4 -> assert(risk_control_alert_message_read.count_limit[risk_control_alert_message_at] == risk_control_alert_message_written.count_limit[risk_control_alert_message_at]); risk_control_alert_message_at = risk_control_alert_message_at + 1
  :: else -> break
  od;
  assert(risk_control_alert_message_read.notification_reason == risk_control_alert_message_written.notification_reason);
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

/* Order Ack Message: encoded, read back, and compared */
proctype check_order_ack_message() {
  OrderAckMessage order_ack_message_sent;
  OrderAckMessage order_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_ack_message(order_ack_message_sent, 0)
  :: pattern == 1 -> fill_order_ack_message(order_ack_message_sent, 32)
  :: pattern == 2 -> fill_order_ack_message(order_ack_message_sent, 255)
  :: else -> ramp_order_ack_message(order_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_ack_message(order_ack_message_sent);
    assert(at == 139);
    at = 0;
    decode_order_ack_message(order_ack_message_got);
    assert(at == 139);
    equal_order_ack_message(order_ack_message_got, order_ack_message_sent)
  }
}

/* Unsolicited Modify Ack Message: encoded, read back, and compared */
proctype check_unsolicited_modify_ack_message() {
  UnsolicitedModifyAckMessage unsolicited_modify_ack_message_sent;
  UnsolicitedModifyAckMessage unsolicited_modify_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unsolicited_modify_ack_message(unsolicited_modify_ack_message_sent, 0)
  :: pattern == 1 -> fill_unsolicited_modify_ack_message(unsolicited_modify_ack_message_sent, 32)
  :: pattern == 2 -> fill_unsolicited_modify_ack_message(unsolicited_modify_ack_message_sent, 255)
  :: else -> ramp_unsolicited_modify_ack_message(unsolicited_modify_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unsolicited_modify_ack_message(unsolicited_modify_ack_message_sent);
    assert(at == 67);
    at = 0;
    decode_unsolicited_modify_ack_message(unsolicited_modify_ack_message_got);
    assert(at == 67);
    equal_unsolicited_modify_ack_message(unsolicited_modify_ack_message_got, unsolicited_modify_ack_message_sent)
  }
}

/* Order Cancel Ack Message: encoded, read back, and compared */
proctype check_order_cancel_ack_message() {
  OrderCancelAckMessage order_cancel_ack_message_sent;
  OrderCancelAckMessage order_cancel_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_ack_message(order_cancel_ack_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_ack_message(order_cancel_ack_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_ack_message(order_cancel_ack_message_sent, 255)
  :: else -> ramp_order_cancel_ack_message(order_cancel_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_ack_message(order_cancel_ack_message_sent);
    assert(at == 55);
    at = 0;
    decode_order_cancel_ack_message(order_cancel_ack_message_got);
    assert(at == 55);
    equal_order_cancel_ack_message(order_cancel_ack_message_got, order_cancel_ack_message_sent)
  }
}

/* Mass Cancel Ack Message: encoded, read back, and compared */
proctype check_mass_cancel_ack_message() {
  MassCancelAckMessage mass_cancel_ack_message_sent;
  MassCancelAckMessage mass_cancel_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_ack_message(mass_cancel_ack_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_ack_message(mass_cancel_ack_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_ack_message(mass_cancel_ack_message_sent, 255)
  :: else -> ramp_mass_cancel_ack_message(mass_cancel_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_ack_message(mass_cancel_ack_message_sent);
    assert(at == 33);
    at = 0;
    decode_mass_cancel_ack_message(mass_cancel_ack_message_got);
    assert(at == 33);
    equal_mass_cancel_ack_message(mass_cancel_ack_message_got, mass_cancel_ack_message_sent)
  }
}

/* Quote Acks Group Encoding: encoded, read back, and compared */
proctype check_quote_acks_group_encoding() {
  QuoteAcksGroupEncoding quote_acks_group_encoding_sent;
  QuoteAcksGroupEncoding quote_acks_group_encoding_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_acks_group_encoding(quote_acks_group_encoding_sent, 0)
  :: pattern == 1 -> fill_quote_acks_group_encoding(quote_acks_group_encoding_sent, 32)
  :: pattern == 2 -> fill_quote_acks_group_encoding(quote_acks_group_encoding_sent, 255)
  :: else -> ramp_quote_acks_group_encoding(quote_acks_group_encoding_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_acks_group_encoding(quote_acks_group_encoding_sent);
    assert(at == 2);
    at = 0;
    decode_quote_acks_group_encoding(quote_acks_group_encoding_got);
    assert(at == 2);
    equal_quote_acks_group_encoding(quote_acks_group_encoding_got, quote_acks_group_encoding_sent)
  }
}

/* New Ioc Quote Ack Message: encoded, read back, and compared */
proctype check_new_ioc_quote_ack_message() {
  NewIocQuoteAckMessage new_ioc_quote_ack_message_sent;
  NewIocQuoteAckMessage new_ioc_quote_ack_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_ioc_quote_ack_message(new_ioc_quote_ack_message_sent, 0)
  :: pattern == 1 -> fill_new_ioc_quote_ack_message(new_ioc_quote_ack_message_sent, 32)
  :: pattern == 2 -> fill_new_ioc_quote_ack_message(new_ioc_quote_ack_message_sent, 255)
  :: else -> ramp_new_ioc_quote_ack_message(new_ioc_quote_ack_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_ioc_quote_ack_message(new_ioc_quote_ack_message_sent);
    assert(at == 51);
    at = 0;
    decode_new_ioc_quote_ack_message(new_ioc_quote_ack_message_got);
    assert(at == 51);
    equal_new_ioc_quote_ack_message(new_ioc_quote_ack_message_got, new_ioc_quote_ack_message_sent)
  }
}

/* Quote Restated Message: encoded, read back, and compared */
proctype check_quote_restated_message() {
  QuoteRestatedMessage quote_restated_message_sent;
  QuoteRestatedMessage quote_restated_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_restated_message(quote_restated_message_sent, 0)
  :: pattern == 1 -> fill_quote_restated_message(quote_restated_message_sent, 32)
  :: pattern == 2 -> fill_quote_restated_message(quote_restated_message_sent, 255)
  :: else -> ramp_quote_restated_message(quote_restated_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_restated_message(quote_restated_message_sent);
    assert(at == 47);
    at = 0;
    decode_quote_restated_message(quote_restated_message_got);
    assert(at == 47);
    equal_quote_restated_message(quote_restated_message_got, quote_restated_message_sent)
  }
}

/* Quote Canceled Message: encoded, read back, and compared */
proctype check_quote_canceled_message() {
  QuoteCanceledMessage quote_canceled_message_sent;
  QuoteCanceledMessage quote_canceled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_canceled_message(quote_canceled_message_sent, 0)
  :: pattern == 1 -> fill_quote_canceled_message(quote_canceled_message_sent, 32)
  :: pattern == 2 -> fill_quote_canceled_message(quote_canceled_message_sent, 255)
  :: else -> ramp_quote_canceled_message(quote_canceled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_canceled_message(quote_canceled_message_sent);
    assert(at == 39);
    at = 0;
    decode_quote_canceled_message(quote_canceled_message_got);
    assert(at == 39);
    equal_quote_canceled_message(quote_canceled_message_got, quote_canceled_message_sent)
  }
}

/* Custom Group Ids Group Encoding: encoded, read back, and compared */
proctype check_custom_group_ids_group_encoding() {
  CustomGroupIdsGroupEncoding custom_group_ids_group_encoding_sent;
  CustomGroupIdsGroupEncoding custom_group_ids_group_encoding_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_custom_group_ids_group_encoding(custom_group_ids_group_encoding_sent, 0)
  :: pattern == 1 -> fill_custom_group_ids_group_encoding(custom_group_ids_group_encoding_sent, 32)
  :: pattern == 2 -> fill_custom_group_ids_group_encoding(custom_group_ids_group_encoding_sent, 255)
  :: else -> ramp_custom_group_ids_group_encoding(custom_group_ids_group_encoding_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_custom_group_ids_group_encoding(custom_group_ids_group_encoding_sent);
    assert(at == 2);
    at = 0;
    decode_custom_group_ids_group_encoding(custom_group_ids_group_encoding_got);
    assert(at == 2);
    equal_custom_group_ids_group_encoding(custom_group_ids_group_encoding_got, custom_group_ids_group_encoding_sent)
  }
}

/* Execution Report Message: encoded, read back, and compared */
proctype check_execution_report_message() {
  ExecutionReportMessage execution_report_message_sent;
  ExecutionReportMessage execution_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_execution_report_message(execution_report_message_sent, 0)
  :: pattern == 1 -> fill_execution_report_message(execution_report_message_sent, 32)
  :: pattern == 2 -> fill_execution_report_message(execution_report_message_sent, 255)
  :: else -> ramp_execution_report_message(execution_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_execution_report_message(execution_report_message_sent);
    assert(at == 154);
    at = 0;
    decode_execution_report_message(execution_report_message_got);
    assert(at == 154);
    equal_execution_report_message(execution_report_message_got, execution_report_message_sent)
  }
}

/* Trade Bust Correct Message: encoded, read back, and compared */
proctype check_trade_bust_correct_message() {
  TradeBustCorrectMessage trade_bust_correct_message_sent;
  TradeBustCorrectMessage trade_bust_correct_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_bust_correct_message(trade_bust_correct_message_sent, 0)
  :: pattern == 1 -> fill_trade_bust_correct_message(trade_bust_correct_message_sent, 32)
  :: pattern == 2 -> fill_trade_bust_correct_message(trade_bust_correct_message_sent, 255)
  :: else -> ramp_trade_bust_correct_message(trade_bust_correct_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_bust_correct_message(trade_bust_correct_message_sent);
    assert(at == 86);
    at = 0;
    decode_trade_bust_correct_message(trade_bust_correct_message_got);
    assert(at == 86);
    equal_trade_bust_correct_message(trade_bust_correct_message_got, trade_bust_correct_message_sent)
  }
}

/* Application Layer Reject Message: encoded, read back, and compared */
proctype check_application_layer_reject_message() {
  ApplicationLayerRejectMessage application_layer_reject_message_sent;
  ApplicationLayerRejectMessage application_layer_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_application_layer_reject_message(application_layer_reject_message_sent, 0)
  :: pattern == 1 -> fill_application_layer_reject_message(application_layer_reject_message_sent, 32)
  :: pattern == 2 -> fill_application_layer_reject_message(application_layer_reject_message_sent, 255)
  :: else -> ramp_application_layer_reject_message(application_layer_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_application_layer_reject_message(application_layer_reject_message_sent);
    assert(at == 47);
    at = 0;
    decode_application_layer_reject_message(application_layer_reject_message_got);
    assert(at == 47);
    equal_application_layer_reject_message(application_layer_reject_message_got, application_layer_reject_message_sent)
  }
}

/* Underlying Ref Data Message: encoded, read back, and compared */
proctype check_underlying_ref_data_message() {
  UnderlyingRefDataMessage underlying_ref_data_message_sent;
  UnderlyingRefDataMessage underlying_ref_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_underlying_ref_data_message(underlying_ref_data_message_sent, 0)
  :: pattern == 1 -> fill_underlying_ref_data_message(underlying_ref_data_message_sent, 32)
  :: pattern == 2 -> fill_underlying_ref_data_message(underlying_ref_data_message_sent, 255)
  :: else -> ramp_underlying_ref_data_message(underlying_ref_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_underlying_ref_data_message(underlying_ref_data_message_sent);
    assert(at == 25);
    at = 0;
    decode_underlying_ref_data_message(underlying_ref_data_message_got);
    assert(at == 25);
    equal_underlying_ref_data_message(underlying_ref_data_message_got, underlying_ref_data_message_sent)
  }
}

/* Instrument Ref Data Message: encoded, read back, and compared */
proctype check_instrument_ref_data_message() {
  InstrumentRefDataMessage instrument_ref_data_message_sent;
  InstrumentRefDataMessage instrument_ref_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_ref_data_message(instrument_ref_data_message_sent, 0)
  :: pattern == 1 -> fill_instrument_ref_data_message(instrument_ref_data_message_sent, 32)
  :: pattern == 2 -> fill_instrument_ref_data_message(instrument_ref_data_message_sent, 255)
  :: else -> ramp_instrument_ref_data_message(instrument_ref_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_ref_data_message(instrument_ref_data_message_sent);
    assert(at == 59);
    at = 0;
    decode_instrument_ref_data_message(instrument_ref_data_message_got);
    assert(at == 59);
    equal_instrument_ref_data_message(instrument_ref_data_message_got, instrument_ref_data_message_sent)
  }
}

/* Mpid Configuration Acknowledgement Message: encoded, read back, and compared */
proctype check_mpid_configuration_acknowledgement_message() {
  MpidConfigurationAcknowledgementMessage mpid_configuration_acknowledgement_message_sent;
  MpidConfigurationAcknowledgementMessage mpid_configuration_acknowledgement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_sent, 0)
  :: pattern == 1 -> fill_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_sent, 32)
  :: pattern == 2 -> fill_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_sent, 255)
  :: else -> ramp_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_sent);
    assert(at == 76);
    at = 0;
    decode_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_got);
    assert(at == 76);
    equal_mpid_configuration_acknowledgement_message(mpid_configuration_acknowledgement_message_got, mpid_configuration_acknowledgement_message_sent)
  }
}

/* Market Maker Symbol Appointment Message: encoded, read back, and compared */
proctype check_market_maker_symbol_appointment_message() {
  MarketMakerSymbolAppointmentMessage market_maker_symbol_appointment_message_sent;
  MarketMakerSymbolAppointmentMessage market_maker_symbol_appointment_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_sent, 0)
  :: pattern == 1 -> fill_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_sent, 32)
  :: pattern == 2 -> fill_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_sent, 255)
  :: else -> ramp_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_got);
    assert(at == 26);
    equal_market_maker_symbol_appointment_message(market_maker_symbol_appointment_message_got, market_maker_symbol_appointment_message_sent)
  }
}

/* Session Configuration Acknowledgement Message: encoded, read back, and compared */
proctype check_session_configuration_acknowledgement_message() {
  SessionConfigurationAcknowledgementMessage session_configuration_acknowledgement_message_sent;
  SessionConfigurationAcknowledgementMessage session_configuration_acknowledgement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_sent, 0)
  :: pattern == 1 -> fill_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_sent, 32)
  :: pattern == 2 -> fill_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_sent, 255)
  :: else -> ramp_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_sent);
    assert(at == 35);
    at = 0;
    decode_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_got);
    assert(at == 35);
    equal_session_configuration_acknowledgement_message(session_configuration_acknowledgement_message_got, session_configuration_acknowledgement_message_sent)
  }
}

/* Risk Control Acknowledgment Message: encoded, read back, and compared */
proctype check_risk_control_acknowledgment_message() {
  RiskControlAcknowledgmentMessage risk_control_acknowledgment_message_sent;
  RiskControlAcknowledgmentMessage risk_control_acknowledgment_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_risk_control_acknowledgment_message(risk_control_acknowledgment_message_sent, 0)
  :: pattern == 1 -> fill_risk_control_acknowledgment_message(risk_control_acknowledgment_message_sent, 32)
  :: pattern == 2 -> fill_risk_control_acknowledgment_message(risk_control_acknowledgment_message_sent, 255)
  :: else -> ramp_risk_control_acknowledgment_message(risk_control_acknowledgment_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_risk_control_acknowledgment_message(risk_control_acknowledgment_message_sent);
    assert(at == 50);
    at = 0;
    decode_risk_control_acknowledgment_message(risk_control_acknowledgment_message_got);
    assert(at == 50);
    equal_risk_control_acknowledgment_message(risk_control_acknowledgment_message_got, risk_control_acknowledgment_message_sent)
  }
}

/* Risk Control Alert Message: encoded, read back, and compared */
proctype check_risk_control_alert_message() {
  RiskControlAlertMessage risk_control_alert_message_sent;
  RiskControlAlertMessage risk_control_alert_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_risk_control_alert_message(risk_control_alert_message_sent, 0)
  :: pattern == 1 -> fill_risk_control_alert_message(risk_control_alert_message_sent, 32)
  :: pattern == 2 -> fill_risk_control_alert_message(risk_control_alert_message_sent, 255)
  :: else -> ramp_risk_control_alert_message(risk_control_alert_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_risk_control_alert_message(risk_control_alert_message_sent);
    assert(at == 34);
    at = 0;
    decode_risk_control_alert_message(risk_control_alert_message_got);
    assert(at == 34);
    equal_risk_control_alert_message(risk_control_alert_message_got, risk_control_alert_message_sent)
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
  :: run check_order_ack_message()
  :: run check_unsolicited_modify_ack_message()
  :: run check_order_cancel_ack_message()
  :: run check_mass_cancel_ack_message()
  :: run check_quote_acks_group_encoding()
  :: run check_new_ioc_quote_ack_message()
  :: run check_quote_restated_message()
  :: run check_quote_canceled_message()
  :: run check_custom_group_ids_group_encoding()
  :: run check_execution_report_message()
  :: run check_trade_bust_correct_message()
  :: run check_application_layer_reject_message()
  :: run check_underlying_ref_data_message()
  :: run check_instrument_ref_data_message()
  :: run check_mpid_configuration_acknowledgement_message()
  :: run check_market_maker_symbol_appointment_message()
  :: run check_session_configuration_acknowledgement_message()
  :: run check_risk_control_acknowledgment_message()
  :: run check_risk_control_alert_message()
  fi
}
