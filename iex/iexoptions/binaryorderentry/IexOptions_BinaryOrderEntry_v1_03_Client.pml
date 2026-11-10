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
#define WIRE 100

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

/* ---- New Order Single Message: 92 bytes -------------------------------------- */

/* NewOrderSingleMessage */
typedef NewOrderSingleMessage {
  byte account_account_optional[16];
  byte instrument_id[4];
  byte market_participant_id_optional[4];
  byte cl_ord_id[8];
  byte clearing_account_optional[4];
  byte customer_or_firm;
  byte open_close;
  byte attributed_quote_optional;
  byte time_in_force;
  byte cancel_instead_of_slide_optional;
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
  byte price_price_8_optional[8];
  byte order_qty_quantity_non_zero[4]
};

int new_order_single_message_at;

/* every byte of New Order Single Message set to one value */
inline fill_new_order_single_message(new_order_single_message_record, new_order_single_message_value) {
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 16 -> new_order_single_message_record.account_account_optional[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.instrument_id[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.market_participant_id_optional[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 8 -> new_order_single_message_record.cl_ord_id[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.clearing_account_optional[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_record.customer_or_firm = new_order_single_message_value;
  new_order_single_message_record.open_close = new_order_single_message_value;
  new_order_single_message_record.attributed_quote_optional = new_order_single_message_value;
  new_order_single_message_record.time_in_force = new_order_single_message_value;
  new_order_single_message_record.cancel_instead_of_slide_optional = new_order_single_message_value;
  new_order_single_message_record.display_inst = new_order_single_message_value;
  new_order_single_message_record.exec_inst = new_order_single_message_value;
  new_order_single_message_record.ord_type = new_order_single_message_value;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.target_party_id[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.auction_id[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.clearing_firm[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 16 -> new_order_single_message_record.optional_data[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.routing_firm_id[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 3 -> new_order_single_message_record.aiq[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_record.side = new_order_single_message_value;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 8 -> new_order_single_message_record.price_price_8_optional[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.order_qty_quantity_non_zero[new_order_single_message_at] = new_order_single_message_value; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Single Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_single_message(new_order_single_message_record, new_order_single_message_base) {
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 16 -> new_order_single_message_record.account_account_optional[new_order_single_message_at] = (new_order_single_message_base + 0 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.instrument_id[new_order_single_message_at] = (new_order_single_message_base + 16 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.market_participant_id_optional[new_order_single_message_at] = (new_order_single_message_base + 20 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 8 -> new_order_single_message_record.cl_ord_id[new_order_single_message_at] = (new_order_single_message_base + 24 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.clearing_account_optional[new_order_single_message_at] = (new_order_single_message_base + 32 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_record.customer_or_firm = (new_order_single_message_base + 36 + 1) % 256;
  new_order_single_message_record.open_close = (new_order_single_message_base + 37 + 1) % 256;
  new_order_single_message_record.attributed_quote_optional = (new_order_single_message_base + 38 + 1) % 256;
  new_order_single_message_record.time_in_force = (new_order_single_message_base + 39 + 1) % 256;
  new_order_single_message_record.cancel_instead_of_slide_optional = (new_order_single_message_base + 40 + 1) % 256;
  new_order_single_message_record.display_inst = (new_order_single_message_base + 41 + 1) % 256;
  new_order_single_message_record.exec_inst = (new_order_single_message_base + 42 + 1) % 256;
  new_order_single_message_record.ord_type = (new_order_single_message_base + 43 + 1) % 256;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.target_party_id[new_order_single_message_at] = (new_order_single_message_base + 44 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.auction_id[new_order_single_message_at] = (new_order_single_message_base + 48 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.clearing_firm[new_order_single_message_at] = (new_order_single_message_base + 52 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 16 -> new_order_single_message_record.optional_data[new_order_single_message_at] = (new_order_single_message_base + 56 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.routing_firm_id[new_order_single_message_at] = (new_order_single_message_base + 72 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 3 -> new_order_single_message_record.aiq[new_order_single_message_at] = (new_order_single_message_base + 76 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_record.side = (new_order_single_message_base + 79 + 1) % 256;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 8 -> new_order_single_message_record.price_price_8_optional[new_order_single_message_at] = (new_order_single_message_base + 80 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.order_qty_quantity_non_zero[new_order_single_message_at] = (new_order_single_message_base + 88 + new_order_single_message_at + 1) % 256; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Single Message to the wire, 92 bytes from where the cursor stands */
inline encode_new_order_single_message(new_order_single_message_record) {
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 16 -> wire[at] = new_order_single_message_record.account_account_optional[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> wire[at] = new_order_single_message_record.instrument_id[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> wire[at] = new_order_single_message_record.market_participant_id_optional[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 8 -> wire[at] = new_order_single_message_record.cl_ord_id[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> wire[at] = new_order_single_message_record.clearing_account_optional[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_single_message_record.customer_or_firm; at = at + 1;
  wire[at] = new_order_single_message_record.open_close; at = at + 1;
  wire[at] = new_order_single_message_record.attributed_quote_optional; at = at + 1;
  wire[at] = new_order_single_message_record.time_in_force; at = at + 1;
  wire[at] = new_order_single_message_record.cancel_instead_of_slide_optional; at = at + 1;
  wire[at] = new_order_single_message_record.display_inst; at = at + 1;
  wire[at] = new_order_single_message_record.exec_inst; at = at + 1;
  wire[at] = new_order_single_message_record.ord_type; at = at + 1;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> wire[at] = new_order_single_message_record.target_party_id[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> wire[at] = new_order_single_message_record.auction_id[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> wire[at] = new_order_single_message_record.clearing_firm[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 16 -> wire[at] = new_order_single_message_record.optional_data[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> wire[at] = new_order_single_message_record.routing_firm_id[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 3 -> wire[at] = new_order_single_message_record.aiq[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_single_message_record.side; at = at + 1;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 8 -> wire[at] = new_order_single_message_record.price_price_8_optional[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> wire[at] = new_order_single_message_record.order_qty_quantity_non_zero[new_order_single_message_at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Single Message off the wire, 92 bytes from where the cursor stands */
inline decode_new_order_single_message(new_order_single_message_record) {
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 16 -> new_order_single_message_record.account_account_optional[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.instrument_id[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.market_participant_id_optional[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 8 -> new_order_single_message_record.cl_ord_id[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.clearing_account_optional[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_record.customer_or_firm = wire[at]; at = at + 1;
  new_order_single_message_record.open_close = wire[at]; at = at + 1;
  new_order_single_message_record.attributed_quote_optional = wire[at]; at = at + 1;
  new_order_single_message_record.time_in_force = wire[at]; at = at + 1;
  new_order_single_message_record.cancel_instead_of_slide_optional = wire[at]; at = at + 1;
  new_order_single_message_record.display_inst = wire[at]; at = at + 1;
  new_order_single_message_record.exec_inst = wire[at]; at = at + 1;
  new_order_single_message_record.ord_type = wire[at]; at = at + 1;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.target_party_id[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.auction_id[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.clearing_firm[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 16 -> new_order_single_message_record.optional_data[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.routing_firm_id[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 3 -> new_order_single_message_record.aiq[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_record.side = wire[at]; at = at + 1;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 8 -> new_order_single_message_record.price_price_8_optional[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> new_order_single_message_record.order_qty_quantity_non_zero[new_order_single_message_at] = wire[at]; at = at + 1; new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Single Message is what was written, byte for byte */
inline equal_new_order_single_message(new_order_single_message_read, new_order_single_message_written) {
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 16 -> assert(new_order_single_message_read.account_account_optional[new_order_single_message_at] == new_order_single_message_written.account_account_optional[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> assert(new_order_single_message_read.instrument_id[new_order_single_message_at] == new_order_single_message_written.instrument_id[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> assert(new_order_single_message_read.market_participant_id_optional[new_order_single_message_at] == new_order_single_message_written.market_participant_id_optional[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 8 -> assert(new_order_single_message_read.cl_ord_id[new_order_single_message_at] == new_order_single_message_written.cl_ord_id[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> assert(new_order_single_message_read.clearing_account_optional[new_order_single_message_at] == new_order_single_message_written.clearing_account_optional[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  assert(new_order_single_message_read.customer_or_firm == new_order_single_message_written.customer_or_firm);
  assert(new_order_single_message_read.open_close == new_order_single_message_written.open_close);
  assert(new_order_single_message_read.attributed_quote_optional == new_order_single_message_written.attributed_quote_optional);
  assert(new_order_single_message_read.time_in_force == new_order_single_message_written.time_in_force);
  assert(new_order_single_message_read.cancel_instead_of_slide_optional == new_order_single_message_written.cancel_instead_of_slide_optional);
  assert(new_order_single_message_read.display_inst == new_order_single_message_written.display_inst);
  assert(new_order_single_message_read.exec_inst == new_order_single_message_written.exec_inst);
  assert(new_order_single_message_read.ord_type == new_order_single_message_written.ord_type);
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> assert(new_order_single_message_read.target_party_id[new_order_single_message_at] == new_order_single_message_written.target_party_id[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> assert(new_order_single_message_read.auction_id[new_order_single_message_at] == new_order_single_message_written.auction_id[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> assert(new_order_single_message_read.clearing_firm[new_order_single_message_at] == new_order_single_message_written.clearing_firm[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 16 -> assert(new_order_single_message_read.optional_data[new_order_single_message_at] == new_order_single_message_written.optional_data[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> assert(new_order_single_message_read.routing_firm_id[new_order_single_message_at] == new_order_single_message_written.routing_firm_id[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 3 -> assert(new_order_single_message_read.aiq[new_order_single_message_at] == new_order_single_message_written.aiq[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  assert(new_order_single_message_read.side == new_order_single_message_written.side);
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 8 -> assert(new_order_single_message_read.price_price_8_optional[new_order_single_message_at] == new_order_single_message_written.price_price_8_optional[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  new_order_single_message_at = 0;
  do
  :: new_order_single_message_at < 4 -> assert(new_order_single_message_read.order_qty_quantity_non_zero[new_order_single_message_at] == new_order_single_message_written.order_qty_quantity_non_zero[new_order_single_message_at]); new_order_single_message_at = new_order_single_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Replace Request Message: 100 bytes ------------------------- */

/* OrderCancelReplaceRequestMessage */
typedef OrderCancelReplaceRequestMessage {
  byte account_account_optional[16];
  byte instrument_id[4];
  byte market_participant_id_optional[4];
  byte cl_ord_id[8];
  byte clearing_account_optional[4];
  byte orig_cl_ord_id[8];
  byte customer_or_firm_optional;
  byte open_close_optional;
  byte attributed_quote_optional;
  byte time_in_force_optional;
  byte cancel_instead_of_slide_optional;
  byte display_inst;
  byte exec_inst;
  byte ord_type_optional;
  byte target_party_id[4];
  byte auction_id[4];
  byte clearing_firm[4];
  byte optional_data[16];
  byte routing_firm_id[4];
  byte aiq[3];
  byte side_optional;
  byte price_price_8_optional[8];
  byte order_qty_quantity_non_zero[4]
};

int order_cancel_replace_request_message_at;

/* every byte of Order Cancel Replace Request Message set to one value */
inline fill_order_cancel_replace_request_message(order_cancel_replace_request_message_record, order_cancel_replace_request_message_value) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.account_account_optional[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.instrument_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.market_participant_id_optional[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.cl_ord_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.clearing_account_optional[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.orig_cl_ord_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.customer_or_firm_optional = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_record.open_close_optional = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_record.attributed_quote_optional = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_record.time_in_force_optional = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_record.cancel_instead_of_slide_optional = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_record.display_inst = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_record.exec_inst = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_record.ord_type_optional = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.target_party_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.auction_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.clearing_firm[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.optional_data[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.routing_firm_id[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 3 -> order_cancel_replace_request_message_record.aiq[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.side_optional = order_cancel_replace_request_message_value;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.price_price_8_optional[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.order_qty_quantity_non_zero[order_cancel_replace_request_message_at] = order_cancel_replace_request_message_value; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Replace Request Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_replace_request_message(order_cancel_replace_request_message_record, order_cancel_replace_request_message_base) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.account_account_optional[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 0 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.instrument_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 16 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.market_participant_id_optional[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 20 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.cl_ord_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 24 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.clearing_account_optional[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 32 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.orig_cl_ord_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 36 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.customer_or_firm_optional = (order_cancel_replace_request_message_base + 44 + 1) % 256;
  order_cancel_replace_request_message_record.open_close_optional = (order_cancel_replace_request_message_base + 45 + 1) % 256;
  order_cancel_replace_request_message_record.attributed_quote_optional = (order_cancel_replace_request_message_base + 46 + 1) % 256;
  order_cancel_replace_request_message_record.time_in_force_optional = (order_cancel_replace_request_message_base + 47 + 1) % 256;
  order_cancel_replace_request_message_record.cancel_instead_of_slide_optional = (order_cancel_replace_request_message_base + 48 + 1) % 256;
  order_cancel_replace_request_message_record.display_inst = (order_cancel_replace_request_message_base + 49 + 1) % 256;
  order_cancel_replace_request_message_record.exec_inst = (order_cancel_replace_request_message_base + 50 + 1) % 256;
  order_cancel_replace_request_message_record.ord_type_optional = (order_cancel_replace_request_message_base + 51 + 1) % 256;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.target_party_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 52 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.auction_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 56 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.clearing_firm[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 60 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.optional_data[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 64 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.routing_firm_id[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 80 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 3 -> order_cancel_replace_request_message_record.aiq[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 84 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.side_optional = (order_cancel_replace_request_message_base + 87 + 1) % 256;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.price_price_8_optional[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 88 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.order_qty_quantity_non_zero[order_cancel_replace_request_message_at] = (order_cancel_replace_request_message_base + 96 + order_cancel_replace_request_message_at + 1) % 256; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Replace Request Message to the wire, 100 bytes from where the cursor stands */
inline encode_order_cancel_replace_request_message(order_cancel_replace_request_message_record) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> wire[at] = order_cancel_replace_request_message_record.account_account_optional[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.instrument_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.market_participant_id_optional[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> wire[at] = order_cancel_replace_request_message_record.cl_ord_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.clearing_account_optional[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> wire[at] = order_cancel_replace_request_message_record.orig_cl_ord_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_replace_request_message_record.customer_or_firm_optional; at = at + 1;
  wire[at] = order_cancel_replace_request_message_record.open_close_optional; at = at + 1;
  wire[at] = order_cancel_replace_request_message_record.attributed_quote_optional; at = at + 1;
  wire[at] = order_cancel_replace_request_message_record.time_in_force_optional; at = at + 1;
  wire[at] = order_cancel_replace_request_message_record.cancel_instead_of_slide_optional; at = at + 1;
  wire[at] = order_cancel_replace_request_message_record.display_inst; at = at + 1;
  wire[at] = order_cancel_replace_request_message_record.exec_inst; at = at + 1;
  wire[at] = order_cancel_replace_request_message_record.ord_type_optional; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.target_party_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.auction_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.clearing_firm[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> wire[at] = order_cancel_replace_request_message_record.optional_data[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.routing_firm_id[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 3 -> wire[at] = order_cancel_replace_request_message_record.aiq[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  wire[at] = order_cancel_replace_request_message_record.side_optional; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> wire[at] = order_cancel_replace_request_message_record.price_price_8_optional[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> wire[at] = order_cancel_replace_request_message_record.order_qty_quantity_non_zero[order_cancel_replace_request_message_at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Replace Request Message off the wire, 100 bytes from where the cursor stands */
inline decode_order_cancel_replace_request_message(order_cancel_replace_request_message_record) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.account_account_optional[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.instrument_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.market_participant_id_optional[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.cl_ord_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.clearing_account_optional[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.orig_cl_ord_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.customer_or_firm_optional = wire[at]; at = at + 1;
  order_cancel_replace_request_message_record.open_close_optional = wire[at]; at = at + 1;
  order_cancel_replace_request_message_record.attributed_quote_optional = wire[at]; at = at + 1;
  order_cancel_replace_request_message_record.time_in_force_optional = wire[at]; at = at + 1;
  order_cancel_replace_request_message_record.cancel_instead_of_slide_optional = wire[at]; at = at + 1;
  order_cancel_replace_request_message_record.display_inst = wire[at]; at = at + 1;
  order_cancel_replace_request_message_record.exec_inst = wire[at]; at = at + 1;
  order_cancel_replace_request_message_record.ord_type_optional = wire[at]; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.target_party_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.auction_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.clearing_firm[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> order_cancel_replace_request_message_record.optional_data[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.routing_firm_id[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 3 -> order_cancel_replace_request_message_record.aiq[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_record.side_optional = wire[at]; at = at + 1;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> order_cancel_replace_request_message_record.price_price_8_optional[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> order_cancel_replace_request_message_record.order_qty_quantity_non_zero[order_cancel_replace_request_message_at] = wire[at]; at = at + 1; order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Replace Request Message is what was written, byte for byte */
inline equal_order_cancel_replace_request_message(order_cancel_replace_request_message_read, order_cancel_replace_request_message_written) {
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> assert(order_cancel_replace_request_message_read.account_account_optional[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.account_account_optional[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.instrument_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.instrument_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.market_participant_id_optional[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.market_participant_id_optional[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> assert(order_cancel_replace_request_message_read.cl_ord_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.cl_ord_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.clearing_account_optional[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.clearing_account_optional[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> assert(order_cancel_replace_request_message_read.orig_cl_ord_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.orig_cl_ord_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_replace_request_message_read.customer_or_firm_optional == order_cancel_replace_request_message_written.customer_or_firm_optional);
  assert(order_cancel_replace_request_message_read.open_close_optional == order_cancel_replace_request_message_written.open_close_optional);
  assert(order_cancel_replace_request_message_read.attributed_quote_optional == order_cancel_replace_request_message_written.attributed_quote_optional);
  assert(order_cancel_replace_request_message_read.time_in_force_optional == order_cancel_replace_request_message_written.time_in_force_optional);
  assert(order_cancel_replace_request_message_read.cancel_instead_of_slide_optional == order_cancel_replace_request_message_written.cancel_instead_of_slide_optional);
  assert(order_cancel_replace_request_message_read.display_inst == order_cancel_replace_request_message_written.display_inst);
  assert(order_cancel_replace_request_message_read.exec_inst == order_cancel_replace_request_message_written.exec_inst);
  assert(order_cancel_replace_request_message_read.ord_type_optional == order_cancel_replace_request_message_written.ord_type_optional);
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.target_party_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.target_party_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.auction_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.auction_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.clearing_firm[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.clearing_firm[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 16 -> assert(order_cancel_replace_request_message_read.optional_data[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.optional_data[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.routing_firm_id[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.routing_firm_id[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 3 -> assert(order_cancel_replace_request_message_read.aiq[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.aiq[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  assert(order_cancel_replace_request_message_read.side_optional == order_cancel_replace_request_message_written.side_optional);
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 8 -> assert(order_cancel_replace_request_message_read.price_price_8_optional[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.price_price_8_optional[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  order_cancel_replace_request_message_at = 0;
  do
  :: order_cancel_replace_request_message_at < 4 -> assert(order_cancel_replace_request_message_read.order_qty_quantity_non_zero[order_cancel_replace_request_message_at] == order_cancel_replace_request_message_written.order_qty_quantity_non_zero[order_cancel_replace_request_message_at]); order_cancel_replace_request_message_at = order_cancel_replace_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Request Message: 24 bytes ---------------------------------- */

/* OrderCancelRequestMessage */
typedef OrderCancelRequestMessage {
  byte instrument_id[4];
  byte market_participant_id_optional[4];
  byte cl_ord_id[8];
  byte orig_cl_ord_id[8]
};

int order_cancel_request_message_at;

/* every byte of Order Cancel Request Message set to one value */
inline fill_order_cancel_request_message(order_cancel_request_message_record, order_cancel_request_message_value) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> order_cancel_request_message_record.instrument_id[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> order_cancel_request_message_record.market_participant_id_optional[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> order_cancel_request_message_record.cl_ord_id[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> order_cancel_request_message_record.orig_cl_ord_id[order_cancel_request_message_at] = order_cancel_request_message_value; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_request_message(order_cancel_request_message_record, order_cancel_request_message_base) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> order_cancel_request_message_record.instrument_id[order_cancel_request_message_at] = (order_cancel_request_message_base + 0 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> order_cancel_request_message_record.market_participant_id_optional[order_cancel_request_message_at] = (order_cancel_request_message_base + 4 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> order_cancel_request_message_record.cl_ord_id[order_cancel_request_message_at] = (order_cancel_request_message_base + 8 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> order_cancel_request_message_record.orig_cl_ord_id[order_cancel_request_message_at] = (order_cancel_request_message_base + 16 + order_cancel_request_message_at + 1) % 256; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Request Message to the wire, 24 bytes from where the cursor stands */
inline encode_order_cancel_request_message(order_cancel_request_message_record) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> wire[at] = order_cancel_request_message_record.instrument_id[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> wire[at] = order_cancel_request_message_record.market_participant_id_optional[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> wire[at] = order_cancel_request_message_record.cl_ord_id[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> wire[at] = order_cancel_request_message_record.orig_cl_ord_id[order_cancel_request_message_at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Request Message off the wire, 24 bytes from where the cursor stands */
inline decode_order_cancel_request_message(order_cancel_request_message_record) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> order_cancel_request_message_record.instrument_id[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> order_cancel_request_message_record.market_participant_id_optional[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> order_cancel_request_message_record.cl_ord_id[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> order_cancel_request_message_record.orig_cl_ord_id[order_cancel_request_message_at] = wire[at]; at = at + 1; order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Request Message is what was written, byte for byte */
inline equal_order_cancel_request_message(order_cancel_request_message_read, order_cancel_request_message_written) {
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> assert(order_cancel_request_message_read.instrument_id[order_cancel_request_message_at] == order_cancel_request_message_written.instrument_id[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 4 -> assert(order_cancel_request_message_read.market_participant_id_optional[order_cancel_request_message_at] == order_cancel_request_message_written.market_participant_id_optional[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> assert(order_cancel_request_message_read.cl_ord_id[order_cancel_request_message_at] == order_cancel_request_message_written.cl_ord_id[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  order_cancel_request_message_at = 0;
  do
  :: order_cancel_request_message_at < 8 -> assert(order_cancel_request_message_read.orig_cl_ord_id[order_cancel_request_message_at] == order_cancel_request_message_written.orig_cl_ord_id[order_cancel_request_message_at]); order_cancel_request_message_at = order_cancel_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Updates Group Encoding: 2 bytes ----------------------------------- */

/* quoteUpdatesGroupEncoding */
typedef QuoteUpdatesGroupEncoding {
  byte block_length_short;
  byte num_in_group
};

/* every byte of Quote Updates Group Encoding set to one value */
inline fill_quote_updates_group_encoding(quote_updates_group_encoding_record, quote_updates_group_encoding_value) {
  quote_updates_group_encoding_record.block_length_short = quote_updates_group_encoding_value;
  quote_updates_group_encoding_record.num_in_group = quote_updates_group_encoding_value;
  skip
}

/* each byte of Quote Updates Group Encoding set to where it lies, so a field read out of place says so */
inline ramp_quote_updates_group_encoding(quote_updates_group_encoding_record, quote_updates_group_encoding_base) {
  quote_updates_group_encoding_record.block_length_short = (quote_updates_group_encoding_base + 0 + 1) % 256;
  quote_updates_group_encoding_record.num_in_group = (quote_updates_group_encoding_base + 1 + 1) % 256;
  skip
}

/* Quote Updates Group Encoding to the wire, 2 bytes from where the cursor stands */
inline encode_quote_updates_group_encoding(quote_updates_group_encoding_record) {
  wire[at] = quote_updates_group_encoding_record.block_length_short; at = at + 1;
  wire[at] = quote_updates_group_encoding_record.num_in_group; at = at + 1;
  skip
}

/* Quote Updates Group Encoding off the wire, 2 bytes from where the cursor stands */
inline decode_quote_updates_group_encoding(quote_updates_group_encoding_record) {
  quote_updates_group_encoding_record.block_length_short = wire[at]; at = at + 1;
  quote_updates_group_encoding_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Quote Updates Group Encoding is what was written, byte for byte */
inline equal_quote_updates_group_encoding(quote_updates_group_encoding_read, quote_updates_group_encoding_written) {
  assert(quote_updates_group_encoding_read.block_length_short == quote_updates_group_encoding_written.block_length_short);
  assert(quote_updates_group_encoding_read.num_in_group == quote_updates_group_encoding_written.num_in_group);
  skip
}

/* ---- Mass Cancel Request Message: 27 bytes ----------------------------------- */

/* MassCancelRequestMessage */
typedef MassCancelRequestMessage {
  byte underlying_id_optional[4];
  byte market_participant_id_optional[4];
  byte cl_ord_id[8];
  byte send_time[8];
  byte ack_style_mass_cancel_ack_style;
  byte mpid_filter;
  byte bulk_action
};

int mass_cancel_request_message_at;

/* every byte of Mass Cancel Request Message set to one value */
inline fill_mass_cancel_request_message(mass_cancel_request_message_record, mass_cancel_request_message_value) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> mass_cancel_request_message_record.underlying_id_optional[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> mass_cancel_request_message_record.market_participant_id_optional[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.cl_ord_id[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.send_time[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.ack_style_mass_cancel_ack_style = mass_cancel_request_message_value;
  mass_cancel_request_message_record.mpid_filter = mass_cancel_request_message_value;
  mass_cancel_request_message_record.bulk_action = mass_cancel_request_message_value;
  skip
}

/* each byte of Mass Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_request_message(mass_cancel_request_message_record, mass_cancel_request_message_base) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> mass_cancel_request_message_record.underlying_id_optional[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 0 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> mass_cancel_request_message_record.market_participant_id_optional[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 4 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.cl_ord_id[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 8 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.send_time[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 16 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.ack_style_mass_cancel_ack_style = (mass_cancel_request_message_base + 24 + 1) % 256;
  mass_cancel_request_message_record.mpid_filter = (mass_cancel_request_message_base + 25 + 1) % 256;
  mass_cancel_request_message_record.bulk_action = (mass_cancel_request_message_base + 26 + 1) % 256;
  skip
}

/* Mass Cancel Request Message to the wire, 27 bytes from where the cursor stands */
inline encode_mass_cancel_request_message(mass_cancel_request_message_record) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> wire[at] = mass_cancel_request_message_record.underlying_id_optional[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> wire[at] = mass_cancel_request_message_record.market_participant_id_optional[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> wire[at] = mass_cancel_request_message_record.cl_ord_id[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> wire[at] = mass_cancel_request_message_record.send_time[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_request_message_record.ack_style_mass_cancel_ack_style; at = at + 1;
  wire[at] = mass_cancel_request_message_record.mpid_filter; at = at + 1;
  wire[at] = mass_cancel_request_message_record.bulk_action; at = at + 1;
  skip
}

/* Mass Cancel Request Message off the wire, 27 bytes from where the cursor stands */
inline decode_mass_cancel_request_message(mass_cancel_request_message_record) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> mass_cancel_request_message_record.underlying_id_optional[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> mass_cancel_request_message_record.market_participant_id_optional[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.cl_ord_id[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.send_time[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.ack_style_mass_cancel_ack_style = wire[at]; at = at + 1;
  mass_cancel_request_message_record.mpid_filter = wire[at]; at = at + 1;
  mass_cancel_request_message_record.bulk_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Mass Cancel Request Message is what was written, byte for byte */
inline equal_mass_cancel_request_message(mass_cancel_request_message_read, mass_cancel_request_message_written) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> assert(mass_cancel_request_message_read.underlying_id_optional[mass_cancel_request_message_at] == mass_cancel_request_message_written.underlying_id_optional[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 4 -> assert(mass_cancel_request_message_read.market_participant_id_optional[mass_cancel_request_message_at] == mass_cancel_request_message_written.market_participant_id_optional[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> assert(mass_cancel_request_message_read.cl_ord_id[mass_cancel_request_message_at] == mass_cancel_request_message_written.cl_ord_id[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> assert(mass_cancel_request_message_read.send_time[mass_cancel_request_message_at] == mass_cancel_request_message_written.send_time[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_request_message_read.ack_style_mass_cancel_ack_style == mass_cancel_request_message_written.ack_style_mass_cancel_ack_style);
  assert(mass_cancel_request_message_read.mpid_filter == mass_cancel_request_message_written.mpid_filter);
  assert(mass_cancel_request_message_read.bulk_action == mass_cancel_request_message_written.bulk_action);
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

/* ---- Risk Limit Update Request Message: 36 bytes ----------------------------- */

/* RiskLimitUpdateRequestMessage */
typedef RiskLimitUpdateRequestMessage {
  byte underlying_id_optional[4];
  byte market_participant_id_optional[4];
  byte cl_ord_id[8];
  byte risk_control_optional;
  byte risk_control_status;
  byte time_limit[8];
  byte percentage_limit[4];
  byte count_limit[4];
  byte ioc_attribution;
  byte cust_capacity_weight
};

int risk_limit_update_request_message_at;

/* every byte of Risk Limit Update Request Message set to one value */
inline fill_risk_limit_update_request_message(risk_limit_update_request_message_record, risk_limit_update_request_message_value) {
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.underlying_id_optional[risk_limit_update_request_message_at] = risk_limit_update_request_message_value; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.market_participant_id_optional[risk_limit_update_request_message_at] = risk_limit_update_request_message_value; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 8 -> risk_limit_update_request_message_record.cl_ord_id[risk_limit_update_request_message_at] = risk_limit_update_request_message_value; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_record.risk_control_optional = risk_limit_update_request_message_value;
  risk_limit_update_request_message_record.risk_control_status = risk_limit_update_request_message_value;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 8 -> risk_limit_update_request_message_record.time_limit[risk_limit_update_request_message_at] = risk_limit_update_request_message_value; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.percentage_limit[risk_limit_update_request_message_at] = risk_limit_update_request_message_value; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.count_limit[risk_limit_update_request_message_at] = risk_limit_update_request_message_value; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_record.ioc_attribution = risk_limit_update_request_message_value;
  risk_limit_update_request_message_record.cust_capacity_weight = risk_limit_update_request_message_value;
  skip
}

/* each byte of Risk Limit Update Request Message set to where it lies, so a field read out of place says so */
inline ramp_risk_limit_update_request_message(risk_limit_update_request_message_record, risk_limit_update_request_message_base) {
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.underlying_id_optional[risk_limit_update_request_message_at] = (risk_limit_update_request_message_base + 0 + risk_limit_update_request_message_at + 1) % 256; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.market_participant_id_optional[risk_limit_update_request_message_at] = (risk_limit_update_request_message_base + 4 + risk_limit_update_request_message_at + 1) % 256; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 8 -> risk_limit_update_request_message_record.cl_ord_id[risk_limit_update_request_message_at] = (risk_limit_update_request_message_base + 8 + risk_limit_update_request_message_at + 1) % 256; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_record.risk_control_optional = (risk_limit_update_request_message_base + 16 + 1) % 256;
  risk_limit_update_request_message_record.risk_control_status = (risk_limit_update_request_message_base + 17 + 1) % 256;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 8 -> risk_limit_update_request_message_record.time_limit[risk_limit_update_request_message_at] = (risk_limit_update_request_message_base + 18 + risk_limit_update_request_message_at + 1) % 256; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.percentage_limit[risk_limit_update_request_message_at] = (risk_limit_update_request_message_base + 26 + risk_limit_update_request_message_at + 1) % 256; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.count_limit[risk_limit_update_request_message_at] = (risk_limit_update_request_message_base + 30 + risk_limit_update_request_message_at + 1) % 256; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_record.ioc_attribution = (risk_limit_update_request_message_base + 34 + 1) % 256;
  risk_limit_update_request_message_record.cust_capacity_weight = (risk_limit_update_request_message_base + 35 + 1) % 256;
  skip
}

/* Risk Limit Update Request Message to the wire, 36 bytes from where the cursor stands */
inline encode_risk_limit_update_request_message(risk_limit_update_request_message_record) {
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> wire[at] = risk_limit_update_request_message_record.underlying_id_optional[risk_limit_update_request_message_at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> wire[at] = risk_limit_update_request_message_record.market_participant_id_optional[risk_limit_update_request_message_at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 8 -> wire[at] = risk_limit_update_request_message_record.cl_ord_id[risk_limit_update_request_message_at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  wire[at] = risk_limit_update_request_message_record.risk_control_optional; at = at + 1;
  wire[at] = risk_limit_update_request_message_record.risk_control_status; at = at + 1;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 8 -> wire[at] = risk_limit_update_request_message_record.time_limit[risk_limit_update_request_message_at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> wire[at] = risk_limit_update_request_message_record.percentage_limit[risk_limit_update_request_message_at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> wire[at] = risk_limit_update_request_message_record.count_limit[risk_limit_update_request_message_at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  wire[at] = risk_limit_update_request_message_record.ioc_attribution; at = at + 1;
  wire[at] = risk_limit_update_request_message_record.cust_capacity_weight; at = at + 1;
  skip
}

/* Risk Limit Update Request Message off the wire, 36 bytes from where the cursor stands */
inline decode_risk_limit_update_request_message(risk_limit_update_request_message_record) {
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.underlying_id_optional[risk_limit_update_request_message_at] = wire[at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.market_participant_id_optional[risk_limit_update_request_message_at] = wire[at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 8 -> risk_limit_update_request_message_record.cl_ord_id[risk_limit_update_request_message_at] = wire[at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_record.risk_control_optional = wire[at]; at = at + 1;
  risk_limit_update_request_message_record.risk_control_status = wire[at]; at = at + 1;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 8 -> risk_limit_update_request_message_record.time_limit[risk_limit_update_request_message_at] = wire[at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.percentage_limit[risk_limit_update_request_message_at] = wire[at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> risk_limit_update_request_message_record.count_limit[risk_limit_update_request_message_at] = wire[at]; at = at + 1; risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_record.ioc_attribution = wire[at]; at = at + 1;
  risk_limit_update_request_message_record.cust_capacity_weight = wire[at]; at = at + 1;
  skip
}

/* what was read of Risk Limit Update Request Message is what was written, byte for byte */
inline equal_risk_limit_update_request_message(risk_limit_update_request_message_read, risk_limit_update_request_message_written) {
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> assert(risk_limit_update_request_message_read.underlying_id_optional[risk_limit_update_request_message_at] == risk_limit_update_request_message_written.underlying_id_optional[risk_limit_update_request_message_at]); risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> assert(risk_limit_update_request_message_read.market_participant_id_optional[risk_limit_update_request_message_at] == risk_limit_update_request_message_written.market_participant_id_optional[risk_limit_update_request_message_at]); risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 8 -> assert(risk_limit_update_request_message_read.cl_ord_id[risk_limit_update_request_message_at] == risk_limit_update_request_message_written.cl_ord_id[risk_limit_update_request_message_at]); risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  assert(risk_limit_update_request_message_read.risk_control_optional == risk_limit_update_request_message_written.risk_control_optional);
  assert(risk_limit_update_request_message_read.risk_control_status == risk_limit_update_request_message_written.risk_control_status);
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 8 -> assert(risk_limit_update_request_message_read.time_limit[risk_limit_update_request_message_at] == risk_limit_update_request_message_written.time_limit[risk_limit_update_request_message_at]); risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> assert(risk_limit_update_request_message_read.percentage_limit[risk_limit_update_request_message_at] == risk_limit_update_request_message_written.percentage_limit[risk_limit_update_request_message_at]); risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  risk_limit_update_request_message_at = 0;
  do
  :: risk_limit_update_request_message_at < 4 -> assert(risk_limit_update_request_message_read.count_limit[risk_limit_update_request_message_at] == risk_limit_update_request_message_written.count_limit[risk_limit_update_request_message_at]); risk_limit_update_request_message_at = risk_limit_update_request_message_at + 1
  :: else -> break
  od;
  assert(risk_limit_update_request_message_read.ioc_attribution == risk_limit_update_request_message_written.ioc_attribution);
  assert(risk_limit_update_request_message_read.cust_capacity_weight == risk_limit_update_request_message_written.cust_capacity_weight);
  skip
}

/* ---- Risk Action Request Message: 20 bytes ----------------------------------- */

/* RiskActionRequestMessage */
typedef RiskActionRequestMessage {
  byte underlying_id_optional[4];
  byte market_participant_id_optional[4];
  byte cl_ord_id[8];
  byte risk_control;
  byte risk_action;
  byte custom_group_id_optional[2]
};

int risk_action_request_message_at;

/* every byte of Risk Action Request Message set to one value */
inline fill_risk_action_request_message(risk_action_request_message_record, risk_action_request_message_value) {
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 4 -> risk_action_request_message_record.underlying_id_optional[risk_action_request_message_at] = risk_action_request_message_value; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 4 -> risk_action_request_message_record.market_participant_id_optional[risk_action_request_message_at] = risk_action_request_message_value; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 8 -> risk_action_request_message_record.cl_ord_id[risk_action_request_message_at] = risk_action_request_message_value; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_record.risk_control = risk_action_request_message_value;
  risk_action_request_message_record.risk_action = risk_action_request_message_value;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 2 -> risk_action_request_message_record.custom_group_id_optional[risk_action_request_message_at] = risk_action_request_message_value; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Risk Action Request Message set to where it lies, so a field read out of place says so */
inline ramp_risk_action_request_message(risk_action_request_message_record, risk_action_request_message_base) {
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 4 -> risk_action_request_message_record.underlying_id_optional[risk_action_request_message_at] = (risk_action_request_message_base + 0 + risk_action_request_message_at + 1) % 256; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 4 -> risk_action_request_message_record.market_participant_id_optional[risk_action_request_message_at] = (risk_action_request_message_base + 4 + risk_action_request_message_at + 1) % 256; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 8 -> risk_action_request_message_record.cl_ord_id[risk_action_request_message_at] = (risk_action_request_message_base + 8 + risk_action_request_message_at + 1) % 256; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_record.risk_control = (risk_action_request_message_base + 16 + 1) % 256;
  risk_action_request_message_record.risk_action = (risk_action_request_message_base + 17 + 1) % 256;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 2 -> risk_action_request_message_record.custom_group_id_optional[risk_action_request_message_at] = (risk_action_request_message_base + 18 + risk_action_request_message_at + 1) % 256; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Action Request Message to the wire, 20 bytes from where the cursor stands */
inline encode_risk_action_request_message(risk_action_request_message_record) {
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 4 -> wire[at] = risk_action_request_message_record.underlying_id_optional[risk_action_request_message_at]; at = at + 1; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 4 -> wire[at] = risk_action_request_message_record.market_participant_id_optional[risk_action_request_message_at]; at = at + 1; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 8 -> wire[at] = risk_action_request_message_record.cl_ord_id[risk_action_request_message_at]; at = at + 1; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  wire[at] = risk_action_request_message_record.risk_control; at = at + 1;
  wire[at] = risk_action_request_message_record.risk_action; at = at + 1;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 2 -> wire[at] = risk_action_request_message_record.custom_group_id_optional[risk_action_request_message_at]; at = at + 1; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Risk Action Request Message off the wire, 20 bytes from where the cursor stands */
inline decode_risk_action_request_message(risk_action_request_message_record) {
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 4 -> risk_action_request_message_record.underlying_id_optional[risk_action_request_message_at] = wire[at]; at = at + 1; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 4 -> risk_action_request_message_record.market_participant_id_optional[risk_action_request_message_at] = wire[at]; at = at + 1; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 8 -> risk_action_request_message_record.cl_ord_id[risk_action_request_message_at] = wire[at]; at = at + 1; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_record.risk_control = wire[at]; at = at + 1;
  risk_action_request_message_record.risk_action = wire[at]; at = at + 1;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 2 -> risk_action_request_message_record.custom_group_id_optional[risk_action_request_message_at] = wire[at]; at = at + 1; risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Risk Action Request Message is what was written, byte for byte */
inline equal_risk_action_request_message(risk_action_request_message_read, risk_action_request_message_written) {
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 4 -> assert(risk_action_request_message_read.underlying_id_optional[risk_action_request_message_at] == risk_action_request_message_written.underlying_id_optional[risk_action_request_message_at]); risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 4 -> assert(risk_action_request_message_read.market_participant_id_optional[risk_action_request_message_at] == risk_action_request_message_written.market_participant_id_optional[risk_action_request_message_at]); risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 8 -> assert(risk_action_request_message_read.cl_ord_id[risk_action_request_message_at] == risk_action_request_message_written.cl_ord_id[risk_action_request_message_at]); risk_action_request_message_at = risk_action_request_message_at + 1
  :: else -> break
  od;
  assert(risk_action_request_message_read.risk_control == risk_action_request_message_written.risk_control);
  assert(risk_action_request_message_read.risk_action == risk_action_request_message_written.risk_action);
  risk_action_request_message_at = 0;
  do
  :: risk_action_request_message_at < 2 -> assert(risk_action_request_message_read.custom_group_id_optional[risk_action_request_message_at] == risk_action_request_message_written.custom_group_id_optional[risk_action_request_message_at]); risk_action_request_message_at = risk_action_request_message_at + 1
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

/* New Order Single Message: encoded, read back, and compared */
proctype check_new_order_single_message() {
  NewOrderSingleMessage new_order_single_message_sent;
  NewOrderSingleMessage new_order_single_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_single_message(new_order_single_message_sent, 0)
  :: pattern == 1 -> fill_new_order_single_message(new_order_single_message_sent, 32)
  :: pattern == 2 -> fill_new_order_single_message(new_order_single_message_sent, 255)
  :: else -> ramp_new_order_single_message(new_order_single_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_single_message(new_order_single_message_sent);
    assert(at == 92);
    at = 0;
    decode_new_order_single_message(new_order_single_message_got);
    assert(at == 92);
    equal_new_order_single_message(new_order_single_message_got, new_order_single_message_sent)
  }
}

/* Order Cancel Replace Request Message: encoded, read back, and compared */
proctype check_order_cancel_replace_request_message() {
  OrderCancelReplaceRequestMessage order_cancel_replace_request_message_sent;
  OrderCancelReplaceRequestMessage order_cancel_replace_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 255)
  :: else -> ramp_order_cancel_replace_request_message(order_cancel_replace_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_replace_request_message(order_cancel_replace_request_message_sent);
    assert(at == 100);
    at = 0;
    decode_order_cancel_replace_request_message(order_cancel_replace_request_message_got);
    assert(at == 100);
    equal_order_cancel_replace_request_message(order_cancel_replace_request_message_got, order_cancel_replace_request_message_sent)
  }
}

/* Order Cancel Request Message: encoded, read back, and compared */
proctype check_order_cancel_request_message() {
  OrderCancelRequestMessage order_cancel_request_message_sent;
  OrderCancelRequestMessage order_cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_request_message(order_cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_request_message(order_cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_request_message(order_cancel_request_message_sent, 255)
  :: else -> ramp_order_cancel_request_message(order_cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_request_message(order_cancel_request_message_sent);
    assert(at == 24);
    at = 0;
    decode_order_cancel_request_message(order_cancel_request_message_got);
    assert(at == 24);
    equal_order_cancel_request_message(order_cancel_request_message_got, order_cancel_request_message_sent)
  }
}

/* Quote Updates Group Encoding: encoded, read back, and compared */
proctype check_quote_updates_group_encoding() {
  QuoteUpdatesGroupEncoding quote_updates_group_encoding_sent;
  QuoteUpdatesGroupEncoding quote_updates_group_encoding_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_updates_group_encoding(quote_updates_group_encoding_sent, 0)
  :: pattern == 1 -> fill_quote_updates_group_encoding(quote_updates_group_encoding_sent, 32)
  :: pattern == 2 -> fill_quote_updates_group_encoding(quote_updates_group_encoding_sent, 255)
  :: else -> ramp_quote_updates_group_encoding(quote_updates_group_encoding_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_updates_group_encoding(quote_updates_group_encoding_sent);
    assert(at == 2);
    at = 0;
    decode_quote_updates_group_encoding(quote_updates_group_encoding_got);
    assert(at == 2);
    equal_quote_updates_group_encoding(quote_updates_group_encoding_got, quote_updates_group_encoding_sent)
  }
}

/* Mass Cancel Request Message: encoded, read back, and compared */
proctype check_mass_cancel_request_message() {
  MassCancelRequestMessage mass_cancel_request_message_sent;
  MassCancelRequestMessage mass_cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 255)
  :: else -> ramp_mass_cancel_request_message(mass_cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_request_message(mass_cancel_request_message_sent);
    assert(at == 27);
    at = 0;
    decode_mass_cancel_request_message(mass_cancel_request_message_got);
    assert(at == 27);
    equal_mass_cancel_request_message(mass_cancel_request_message_got, mass_cancel_request_message_sent)
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

/* Risk Limit Update Request Message: encoded, read back, and compared */
proctype check_risk_limit_update_request_message() {
  RiskLimitUpdateRequestMessage risk_limit_update_request_message_sent;
  RiskLimitUpdateRequestMessage risk_limit_update_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_risk_limit_update_request_message(risk_limit_update_request_message_sent, 0)
  :: pattern == 1 -> fill_risk_limit_update_request_message(risk_limit_update_request_message_sent, 32)
  :: pattern == 2 -> fill_risk_limit_update_request_message(risk_limit_update_request_message_sent, 255)
  :: else -> ramp_risk_limit_update_request_message(risk_limit_update_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_risk_limit_update_request_message(risk_limit_update_request_message_sent);
    assert(at == 36);
    at = 0;
    decode_risk_limit_update_request_message(risk_limit_update_request_message_got);
    assert(at == 36);
    equal_risk_limit_update_request_message(risk_limit_update_request_message_got, risk_limit_update_request_message_sent)
  }
}

/* Risk Action Request Message: encoded, read back, and compared */
proctype check_risk_action_request_message() {
  RiskActionRequestMessage risk_action_request_message_sent;
  RiskActionRequestMessage risk_action_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_risk_action_request_message(risk_action_request_message_sent, 0)
  :: pattern == 1 -> fill_risk_action_request_message(risk_action_request_message_sent, 32)
  :: pattern == 2 -> fill_risk_action_request_message(risk_action_request_message_sent, 255)
  :: else -> ramp_risk_action_request_message(risk_action_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_risk_action_request_message(risk_action_request_message_sent);
    assert(at == 20);
    at = 0;
    decode_risk_action_request_message(risk_action_request_message_got);
    assert(at == 20);
    equal_risk_action_request_message(risk_action_request_message_got, risk_action_request_message_sent)
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
  :: run check_new_order_single_message()
  :: run check_order_cancel_replace_request_message()
  :: run check_order_cancel_request_message()
  :: run check_quote_updates_group_encoding()
  :: run check_mass_cancel_request_message()
  :: run check_custom_group_ids_group_encoding()
  :: run check_risk_limit_update_request_message()
  :: run check_risk_action_request_message()
  fi
}
