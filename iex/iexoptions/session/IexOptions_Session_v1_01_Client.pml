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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 48

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

/* ---- Login Request Message: 48 bytes ----------------------------------------- */

/* LoginRequestMessage */
typedef LoginRequestMessage {
  byte logon_id[16];
  byte token[32]
};

int login_request_message_at;

/* every byte of Login Request Message set to one value */
inline fill_login_request_message(login_request_message_record, login_request_message_value) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> login_request_message_record.logon_id[login_request_message_at] = login_request_message_value; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 32 -> login_request_message_record.token[login_request_message_at] = login_request_message_value; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request Message set to where it lies, so a field read out of place says so */
inline ramp_login_request_message(login_request_message_record, login_request_message_base) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> login_request_message_record.logon_id[login_request_message_at] = (login_request_message_base + 0 + login_request_message_at + 1) % 256; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 32 -> login_request_message_record.token[login_request_message_at] = (login_request_message_base + 16 + login_request_message_at + 1) % 256; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Message to the wire, 48 bytes from where the cursor stands */
inline encode_login_request_message(login_request_message_record) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> wire[at] = login_request_message_record.logon_id[login_request_message_at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 32 -> wire[at] = login_request_message_record.token[login_request_message_at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Message off the wire, 48 bytes from where the cursor stands */
inline decode_login_request_message(login_request_message_record) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> login_request_message_record.logon_id[login_request_message_at] = wire[at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 32 -> login_request_message_record.token[login_request_message_at] = wire[at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request Message is what was written, byte for byte */
inline equal_login_request_message(login_request_message_read, login_request_message_written) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> assert(login_request_message_read.logon_id[login_request_message_at] == login_request_message_written.logon_id[login_request_message_at]); login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 32 -> assert(login_request_message_read.token[login_request_message_at] == login_request_message_written.token[login_request_message_at]); login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
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

/* ---- Subsession Join Message: 16 bytes --------------------------------------- */

/* SubsessionJoinMessage */
typedef SubsessionJoinMessage {
  byte subsession_id[8];
  byte start_sequence[4];
  byte end_sequence[4]
};

int subsession_join_message_at;

/* every byte of Subsession Join Message set to one value */
inline fill_subsession_join_message(subsession_join_message_record, subsession_join_message_value) {
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 8 -> subsession_join_message_record.subsession_id[subsession_join_message_at] = subsession_join_message_value; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 4 -> subsession_join_message_record.start_sequence[subsession_join_message_at] = subsession_join_message_value; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 4 -> subsession_join_message_record.end_sequence[subsession_join_message_at] = subsession_join_message_value; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Subsession Join Message set to where it lies, so a field read out of place says so */
inline ramp_subsession_join_message(subsession_join_message_record, subsession_join_message_base) {
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 8 -> subsession_join_message_record.subsession_id[subsession_join_message_at] = (subsession_join_message_base + 0 + subsession_join_message_at + 1) % 256; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 4 -> subsession_join_message_record.start_sequence[subsession_join_message_at] = (subsession_join_message_base + 8 + subsession_join_message_at + 1) % 256; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 4 -> subsession_join_message_record.end_sequence[subsession_join_message_at] = (subsession_join_message_base + 12 + subsession_join_message_at + 1) % 256; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  skip
}

/* Subsession Join Message to the wire, 16 bytes from where the cursor stands */
inline encode_subsession_join_message(subsession_join_message_record) {
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 8 -> wire[at] = subsession_join_message_record.subsession_id[subsession_join_message_at]; at = at + 1; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 4 -> wire[at] = subsession_join_message_record.start_sequence[subsession_join_message_at]; at = at + 1; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 4 -> wire[at] = subsession_join_message_record.end_sequence[subsession_join_message_at]; at = at + 1; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  skip
}

/* Subsession Join Message off the wire, 16 bytes from where the cursor stands */
inline decode_subsession_join_message(subsession_join_message_record) {
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 8 -> subsession_join_message_record.subsession_id[subsession_join_message_at] = wire[at]; at = at + 1; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 4 -> subsession_join_message_record.start_sequence[subsession_join_message_at] = wire[at]; at = at + 1; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 4 -> subsession_join_message_record.end_sequence[subsession_join_message_at] = wire[at]; at = at + 1; subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Subsession Join Message is what was written, byte for byte */
inline equal_subsession_join_message(subsession_join_message_read, subsession_join_message_written) {
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 8 -> assert(subsession_join_message_read.subsession_id[subsession_join_message_at] == subsession_join_message_written.subsession_id[subsession_join_message_at]); subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 4 -> assert(subsession_join_message_read.start_sequence[subsession_join_message_at] == subsession_join_message_written.start_sequence[subsession_join_message_at]); subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  subsession_join_message_at = 0;
  do
  :: subsession_join_message_at < 4 -> assert(subsession_join_message_read.end_sequence[subsession_join_message_at] == subsession_join_message_written.end_sequence[subsession_join_message_at]); subsession_join_message_at = subsession_join_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Subsession Leave Message: 8 bytes --------------------------------------- */

/* SubsessionLeaveMessage */
typedef SubsessionLeaveMessage {
  byte subsession_id[8]
};

int subsession_leave_message_at;

/* every byte of Subsession Leave Message set to one value */
inline fill_subsession_leave_message(subsession_leave_message_record, subsession_leave_message_value) {
  subsession_leave_message_at = 0;
  do
  :: subsession_leave_message_at < 8 -> subsession_leave_message_record.subsession_id[subsession_leave_message_at] = subsession_leave_message_value; subsession_leave_message_at = subsession_leave_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Subsession Leave Message set to where it lies, so a field read out of place says so */
inline ramp_subsession_leave_message(subsession_leave_message_record, subsession_leave_message_base) {
  subsession_leave_message_at = 0;
  do
  :: subsession_leave_message_at < 8 -> subsession_leave_message_record.subsession_id[subsession_leave_message_at] = (subsession_leave_message_base + 0 + subsession_leave_message_at + 1) % 256; subsession_leave_message_at = subsession_leave_message_at + 1
  :: else -> break
  od;
  skip
}

/* Subsession Leave Message to the wire, 8 bytes from where the cursor stands */
inline encode_subsession_leave_message(subsession_leave_message_record) {
  subsession_leave_message_at = 0;
  do
  :: subsession_leave_message_at < 8 -> wire[at] = subsession_leave_message_record.subsession_id[subsession_leave_message_at]; at = at + 1; subsession_leave_message_at = subsession_leave_message_at + 1
  :: else -> break
  od;
  skip
}

/* Subsession Leave Message off the wire, 8 bytes from where the cursor stands */
inline decode_subsession_leave_message(subsession_leave_message_record) {
  subsession_leave_message_at = 0;
  do
  :: subsession_leave_message_at < 8 -> subsession_leave_message_record.subsession_id[subsession_leave_message_at] = wire[at]; at = at + 1; subsession_leave_message_at = subsession_leave_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Subsession Leave Message is what was written, byte for byte */
inline equal_subsession_leave_message(subsession_leave_message_read, subsession_leave_message_written) {
  subsession_leave_message_at = 0;
  do
  :: subsession_leave_message_at < 8 -> assert(subsession_leave_message_read.subsession_id[subsession_leave_message_at] == subsession_leave_message_written.subsession_id[subsession_leave_message_at]); subsession_leave_message_at = subsession_leave_message_at + 1
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
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Login Request Message: encoded, read back, and compared */
proctype check_login_request_message() {
  LoginRequestMessage login_request_message_sent;
  LoginRequestMessage login_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request_message(login_request_message_sent, 0)
  :: pattern == 1 -> fill_login_request_message(login_request_message_sent, 32)
  :: pattern == 2 -> fill_login_request_message(login_request_message_sent, 255)
  :: else -> ramp_login_request_message(login_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request_message(login_request_message_sent);
    assert(at == 48);
    at = 0;
    decode_login_request_message(login_request_message_got);
    assert(at == 48);
    equal_login_request_message(login_request_message_got, login_request_message_sent)
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

/* Subsession Join Message: encoded, read back, and compared */
proctype check_subsession_join_message() {
  SubsessionJoinMessage subsession_join_message_sent;
  SubsessionJoinMessage subsession_join_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_subsession_join_message(subsession_join_message_sent, 0)
  :: pattern == 1 -> fill_subsession_join_message(subsession_join_message_sent, 32)
  :: pattern == 2 -> fill_subsession_join_message(subsession_join_message_sent, 255)
  :: else -> ramp_subsession_join_message(subsession_join_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_subsession_join_message(subsession_join_message_sent);
    assert(at == 16);
    at = 0;
    decode_subsession_join_message(subsession_join_message_got);
    assert(at == 16);
    equal_subsession_join_message(subsession_join_message_got, subsession_join_message_sent)
  }
}

/* Subsession Leave Message: encoded, read back, and compared */
proctype check_subsession_leave_message() {
  SubsessionLeaveMessage subsession_leave_message_sent;
  SubsessionLeaveMessage subsession_leave_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_subsession_leave_message(subsession_leave_message_sent, 0)
  :: pattern == 1 -> fill_subsession_leave_message(subsession_leave_message_sent, 32)
  :: pattern == 2 -> fill_subsession_leave_message(subsession_leave_message_sent, 255)
  :: else -> ramp_subsession_leave_message(subsession_leave_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_subsession_leave_message(subsession_leave_message_sent);
    assert(at == 8);
    at = 0;
    decode_subsession_leave_message(subsession_leave_message_got);
    assert(at == 8);
    equal_subsession_leave_message(subsession_leave_message_got, subsession_leave_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_login_request_message()
  :: run check_sequenced_message_header_message()
  :: run check_subsession_join_message()
  :: run check_subsession_leave_message()
  fi
}
